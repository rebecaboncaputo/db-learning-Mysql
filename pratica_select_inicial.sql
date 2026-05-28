select * from grupos; 
select * from idols;
select nome_idols from idols;
-- seleciona apenas os nomes dos idols na tabela idols 
select nome_grupo from idols;
-- seleciona apenas os nomes do grupos na tabela idols 
select distinct id_grupos from idols;
--  Traz apenas valores únicos (sem repetidos)"quais grupos diferentes estão cadastrados? ,em vez de "qual o grupo de cada idol?"
select id_grupos from idols;
-- Ele traz todos os registros da coluna, sem exceção.Se você tem 10 idols que pertencem ao grupo ID 1, o resultado vai mostrar o número 1 dez vezes\

