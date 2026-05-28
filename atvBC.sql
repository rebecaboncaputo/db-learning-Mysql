-- PASSO 3.1	
CREATE VIEW vw_resumo_vendas AS
SELECT 
    c.nome AS nome_cliente,
    c.cidade,
    p.nome AS nome_produto,
    cat.nome AS categoria_produto,
    v.quantidade,
    p.preco AS preco_unitario,
    (v.quantidade * p.preco) AS total_venda
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto
JOIN categorias cat ON p.id_categoria = cat.id_categoria;

-- PASSO 3.2

CREATE VIEW vw_desempenho_produtos AS
SELECT 
    p.nome AS nome_produto,
    cat.nome AS categoria,
    SUM(v.quantidade) AS total_unidades_vendidas,
    SUM(v.quantidade * p.preco) AS receita_total,
    AVG(a.nota) AS nota_media
FROM produtos p
JOIN categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN vendas v ON p.id_produto = v.id_produto
LEFT JOIN avaliacoes a ON p.id_produto = a.id_produto
GROUP BY p.id_produto, p.nome, cat.nome;

-- PASSO 4
DELIMITER //
CREATE PROCEDURE sp_registrar_venda(
    IN p_id_cliente INT,
    IN p_id_produto INT,
    IN p_quantidade INT,
    OUT p_status VARCHAR(100)
)
BEGIN
    DECLARE v_estoque INT;

    SELECT estoque INTO v_estoque FROM produtos WHERE id_produto = p_id_produto;

    IF v_estoque >= p_quantidade THEN
        INSERT INTO vendas (id_cliente, id_produto, quantidade, data_venda)
        VALUES (p_id_cliente, p_id_produto, p_quantidade, CURDATE());

        UPDATE produtos SET estoque = estoque - p_quantidade WHERE id_produto = p_id_produto;
        SET p_status = 'Venda registrada com sucesso';
    ELSE
        SET p_status = 'Estoque insuficiente';
    END IF;
END //
DELIMITER ;

-- PASSO 4.2

DELIMITER //

CREATE PROCEDURE sp_relatorio_cliente(
    IN p_id_cliente INT
)
BEGIN
    -- Realiza o cálculo de gasto total usando JOINs e Agregação [cite: 127, 128]
    SELECT 
        c.nome AS nome_cliente,
        SUM(v.quantidade * p.preco) AS valor_total_gasto
    FROM clientes c
    JOIN vendas v ON c.id_cliente = v.id_cliente
    JOIN produtos p ON v.id_produto = p.id_produto
    WHERE c.id_cliente = p_id_cliente
    GROUP BY c.nome;
END //

DELIMITER ;

-- PASSO 5.1 

WITH ReceitaCategoria AS (
    SELECT cat.nome, SUM(v.quantidade * p.preco) AS receita_cat
    FROM vendas v
    JOIN produtos p ON v.id_produto = p.id_produto
    JOIN categorias cat ON p.id_categoria = cat.id_categoria
    GROUP BY cat.nome
),
ReceitaGeral AS (
    SELECT SUM(receita_cat) AS total_geral FROM ReceitaCategoria
)
SELECT 
    rc.nome AS categoria,
    rc.receita_cat AS receita_total_categoria,
    ROUND((rc.receita_cat / rg.total_geral) * 100, 2) AS percentual_participacao
FROM ReceitaCategoria rc, ReceitaGeral rg;

-- passo 5.2

WITH GastoPorCliente AS (
    SELECT 
        c.nome, 
        c.cidade, 
        SUM(v.quantidade * p.preco) AS total_gasto
    FROM clientes c
    JOIN vendas v ON c.id_cliente = v.id_cliente
    JOIN produtos p ON v.id_produto = p.id_produto
    GROUP BY c.id_cliente, c.nome, c.cidade
),
MediaGeral AS (

    SELECT AVG(total_gasto) AS media_loja FROM GastoPorCliente
)
SELECT 
    g.nome, 
    g.cidade, 
    g.total_gasto
FROM GastoPorCliente g, MediaGeral m
WHERE g.total_gasto > m.media_loja;


-- PASSO 6.1

SELECT DISTINCT c.nome
FROM clientes c
JOIN vendas v ON c.id_cliente = v.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto
JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE cat.nome = 'Eletrônicos'

UNION

SELECT DISTINCT c.nome
FROM clientes c
JOIN vendas v ON c.id_cliente = v.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto
JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE cat.nome = 'Livros'
ORDER BY nome;

-- PASSO 6.2

SELECT DISTINCT c.nome
FROM clientes c
JOIN vendas v ON c.id_cliente = v.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto
JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE cat.nome = 'Eletrônicos'
AND c.id_cliente IN (
    SELECT v2.id_cliente
    FROM vendas v2
    JOIN produtos p2 ON v2.id_produto = p2.id_produto
    JOIN categorias cat2 ON p2.id_categoria = cat2.id_categoria
    WHERE cat2.nome = 'Livros'
);