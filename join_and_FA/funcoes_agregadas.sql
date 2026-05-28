select count(*) as total_funcionarios
from tb_empregado;
-- o count conta quantas linhas existe em uma tabela, entao usamos isso para descobrir quantos funcionarios estao cadrastados = total funcinarios e o nome que damos a funcao, o asterisco (*) significa que estamos contando todas as linhas, sem considerar colunas específicas

select count(*) as num
from tb_cargo where salario = 980;
-- conta quantas pessoas ganham extamentente 980

select count(*) as num
from tb_cargo where salario > 5000;
--  conta quantas pessoas ganham mais de 5000

select count(*) as num 
from tb_cargo where nm_cargo  like '%Administrador%';
-- conta quantas pessoas tem o cargo administrador

select count(distinct fk_departamento) as num
from tb_empregado;
-- conta quantos DEPARTAMENTOS diferentes tem na tabela tb_empregado

select count(distinct sexo) as num
from tb_empregado;
-- conta quantos sexos tem em tb empregado

select sexo, count(*) as sexo
from tb_empregado
group by sexo;
-- mostra uma lista de quantas pessoas existem na classificacao sexo

select fk_departamento, count(*) as departamento
from tb_empregado
group by fk_departamento;



select sum(salario) as total_salario
from tb_cargo;
-- soma todos os salarios de tb cargo

select sum(salario) as num
from tb_cargo where nm_cargo = 'Estagiário';
-- soma o salario de todos que tem o nome de estagiario na tabela cargo

select sum(salario) as num
from tb_cargo where salario <= 3000;
-- soma o salario que sao menores ou iguais que 3000

select sum(salario) as num
from tb_cargo where nm_cargo like "a%";
-- soma o salario dos nomes que comecam com a



select round(avg(salario), 2) as media
from tb_cargo;
-- calcula a media dos salarios em tabela cargos

select avg(salario) as num
from tb_cargo where salario > 5000;
-- calcula a media dos salairos acima de 5000

select avg(salario) as num
from tb_cargo where nm_cargo like 'a%';
-- calcula apenas a media dos cargos que comecam com a

select avg(salario) as num
from tb_cargo where nm_cargo in( 'Programador', 'Analista de Sistemas');
-- calcula a media apenas de 'Programador' e 'Analista de Sistemas'



select max(salario) as teto_salarial
from tb_cargo;
-- mostra o maior salario dos cargos

select max(dt_nascimento) as num
from tb_empregado;
-- mostra a maior data de nascimento

select max(dt_admissao) from tb_empregado;
-- mostra a data de admissao mais recente

select max(salario) 
from tb_cargo where nm_cargo not like '%Advogado%';
-- mostra o maior salario nao contando 'Advogado'

select max(id_departamento) 
from tb_departamento;
-- fala o maior id



select min(salario) as piso_salarial
from tb_cargo;
-- mostra o menor cargo

select min(dt_nascimento) as num
from tb_empregado;
-- fala o funcionario mais velho



select fk_departamento, count(*) as num
from tb_empregado
group by fk_departamento;
-- seleciona os departamentos e conta quantos funcionarios tem em cada um

select nm_cargo, sum(salario)
from tb_cargo
group by nm_cargo;

select avg(salario) as num
from tb_cargo where nm_cargo like '%Administrador%'
group by nm_cargo;








