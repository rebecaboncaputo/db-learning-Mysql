create database sm_entertainment;
use sm_entertainment;

create table grupos
(
	id int not null primary key,
    nome_grupo VARCHAR(40) NOT NULL,
    ano VARCHAR(40) NOT NULL
);

insert into grupos(id, nome, ano) values
(1, "aespa", "2020"),
(2, "red velvet", "2014"),
(3, "Girls' Generation", "2007"),
(4, "f(x)", "2009");

select * from grupos;

create table idols
(
	id int not null primary key,
    nome_idols VARCHAR(60) NOT NULL,
    nome_grupo VARCHAR(40) NOT NULL,
    id_grupos int default null,
    foreign key (id_grupos) references grupos(id)
    );
    
    insert into idols(id, nome_idols, nome_grupo, id_grupos) values
    (11,"Giselle","aespa",1),
    (12,"Karina","aespa",1),
    (13,"Winter","aespa",1),
    (14,"NingNing","aespa",1);
    
     insert into idols(id, nome_idols, nome_grupo, id_grupos) values
    (15,"Irene","red velvet",2),
    (16,"Joy","red velvet",2),
    (17,"Yeri","red velvet",2),
    (18,"Wendy","red velvet",2),
    (19,"Seulgi","red velvet",2);
    
     insert into idols(id, nome_idols, nome_grupo, id_grupos) values
    (20,"Taeyeon","Girls' Generation",3),
    (21,"Sunny","Girls' Generation",3),
    (22,"Tiffany","Girls' Generation",3),
    (23,"Hyoyeon","Girls' Generation",3),
    (24,"Yuri","Girls' Generation",3),
	(25,"Sooyoung","Girls' Generation",3),
	(26,"Yoona","Girls' Generation",3),
    (27," Seohyun","Girls' Generation",3),
    (28,"Jessica","Girls' Generation",3);
    
	insert into idols(id, nome_idols, nome_grupo, id_grupos) values
    (29,"Sulli","f(x)",4),
    (30,"Amber","f(x)",4),
    (31,"Luna","f(x)",4),
    (32,"Krystal","f(x)",4),
    (33,"Victoria","f(x)",4);
	
    