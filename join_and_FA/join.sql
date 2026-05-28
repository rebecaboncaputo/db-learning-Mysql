select e.nome, c.nm_cargo
from tb_empregado as e
inner join tb_cargo as c on e.fk_cargo = c.id_cargo ;
-- mostra o nome e o cargo

select d.nm_departamento, e.nome
from tb_empregado as e
inner join tb_departamento as d on d.id_departamento = e.fk_departamento;
-- mostra o nome do empregado e o seu departamento

select Empregadores.nome_empregador , Empregados.nome_empregado
from empregados 
inner join empregadores on Empregadores.id_empregador = Empregados.id_empregador ;

select a.nome_empregador, b.nome_empregado, c.valor_salario
from empregadores as a
inner join empregados as b
inner join FolhaPagamentos as c
on a.id_empregador = b.id_empregador = c.id_empregado;

select Empregadores.nome_empregador , Empregados.nome_empregado
from empregadores 
left join empregados on Empregadores.id_empregador = Empregados.id_empregador ;
-- preserva o que esta na esquerda

select Empregadores.nome_empregador , Empregados.nome_empregado
from  empregados
right join empregadores on Empregadores.id_empregador = Empregados.id_empregador ;
-- preserva o que esta na direito