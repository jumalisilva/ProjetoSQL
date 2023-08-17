drop database dbCDS;

create database dbCDS;

use dbCDS;

create table tbArtistas(
codArt int not null,
nomeArt varchar(100) not null unique,
primary key(codArt)
);

create table tbGravadoras(
codGrav int not null,
nomeGrav varchar(50) not null unique,
primary key(codGrav)
);

create table tbCategorias (
codCat int not null,
nomeCat varchar(50) not null unique,
primary key(codCat)
);

create table tbEstados(
siglaEst char(2) not null,
nomeEst varchar(50) not null unique,
primary key(siglaEst)
);

create table tbCidades(
codCid int not null,
siglaEst char(2) not null,
nomeCid varchar(50) not null,
primary key(codCid),
foreign key(siglaEst) references tbEstados(siglaEst)
);

create table tbClientes(
codCli int not null,
codCid int not null,
nomeCli varchar(50) not null,
endCli varchar(100) not null,
rendaCli decimal(9,2) not null default 0 check (rendaCli >= 0),
sexoCli char(1) not null default 'F' check (sexoCli in('F', 'M')),
primary key(codCli),
foreign key(codCid) references tbCidades(codCid)
);

create table tbConjuge(
codConj int not null,
codCli int not null,
nomeConj varchar(50) not null,
rendaConj decimal(9,2) not null default 0 check (rendaConj >= 0),
sexoConj char(1) not null default 'F' check (sexoConj in('F', 'M')),
primary key(codConj),
foreign key(codCli) references tbClientes(codCli)
);

create table tbFuncionarios(
codFunc int not null,
nomeFunc varchar(50) not null,
endFunc varchar(100) not null,
salFunc decimal(9,2) not null default 0 check (salFunc >= 0),
sexoFunc char(1) not null default 'F' check (sexoFunc in('F', 'M')),
primary key(codFunc)
);

create table tbDependentes(
codDep int not null,
codFunc int not null,
nomeDep varchar(100) not null,
sexoDep char(1) not null default 'F' check (sexoDep in('F', 'M')),
primary key(codDep),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos(
codTit int not null,
codCat int not null,
codGrav int not null,
nomeCD varchar(50) not null unique,
valCD decimal(9,2) not null check (valCD > 0),
qtdEstq int not null check (qtdEstq >= 0),
primary key(codTit),
foreign key(codCat) references tbCategorias(codCat),
foreign key(codGrav) references tbGravadoras(codGrav)
);

create table tbPedidos(
numPed int not null,
codCli int not null,
codFunc int not null,
dataPed datetime not null,
valPed decimal(9,2) not null default 0 check (valPed >= 0),
primary key(numPed),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos_Pedido(
numPed int not null,
codTit int not null,
qtdCD int not null check (qtdCD >= 1),
valCD decimal(9,2) not null check (valCD > 0),
foreign key(numPed) references tbPedidos(numPed),
foreign key(codTit) references tbTitulos(codTit)
);

create table tbTitulos_Artista(
codTit int not null,
codArt int not null,
foreign key(codTit) references tbTitulos(codTit),
foreign key(codArt) references tbArtistas(codArt)
);

desc tbArtistas;
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbCidades;
desc tbClientes;
desc tbConjuge;
desc tbFuncionarios;
desc tbDependentes;
desc tbTitulos;
desc tbPedidos;
desc tbTitulos_Pedido;
desc tbTitulos_Artista;

insert into tbArtistas(codArt,nomeArt)values(1,'Marisa Monte');
insert into tbArtistas(codArt,nomeArt)values(2,'Gilberto Gil');
insert into tbArtistas(codArt,nomeArt)values(3,'Caetano Veloso');
insert into tbArtistas(codArt,nomeArt)values(4,'Milton Nascimento');
insert into tbArtistas(codArt,nomeArt)values(5,'Legião Urbana');
insert into tbArtistas(codArt,nomeArt)values(6,'The Beatles');
insert into tbArtistas(codArt,nomeArt)values(7,'Rita Lee');

insert into tbGravadoras(codGrav,nomeGrav)values(1,'Polygram');
insert into tbGravadoras(codGrav,nomeGrav)values(2,'Emi');
insert into tbGravadoras(codGrav,nomeGrav)values(3,'Som Livre');
insert into tbGravadoras(codGrav,nomeGrav)values(4,'Som Music');
insert into tbCategorias(codCat,nomeCat)values(1,'MPB');
insert into tbCategorias(codCat,nomeCat)values(2,'Trilha Sonora');
insert into tbCategorias(codCat,nomeCat)values(3,'Rock Internacional');
insert into tbCategorias(codCat,nomeCat)values(4,'Rock Nacional');

insert into tbEstados(siglaEst,nomeEst)values('SP','São Paulo');
insert into tbEstados(siglaEst,nomeEst)values('MG','Minas Gerais');
insert into tbEstados(siglaEst,nomeEst)values('RJ','Rio de Janeiro');
insert into tbEstados(siglaEst,nomeEst)values('ES','Cachoeira do Itapemirim');

insert into tbCidades(codCid,siglaEst,nomeCid)values(1,'SP','São Paulo');
insert into tbCidades(codCid,siglaEst,nomeCid)values(2,'SP','Sorocaba');
insert into tbCidades(codCid,siglaEst,nomeCid)values(3,'SP','Jundiaí');
insert into tbCidades(codCid,siglaEst,nomeCid)values(4,'SP','Americana');
insert into tbCidades(codCid,siglaEst,nomeCid)values(5,'SP','Araraquara');
insert into tbCidades(codCid,siglaEst,nomeCid)values(6,'MG','Ouro Preto');
insert into tbCidades(codCid,siglaEst,nomeCid)values(7,'ES','Cachoeira do Itapemirim');

insert into tbClientes(codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(1,1,'José Nogueira','Rua A',1500.00,'M');
insert into tbClientes(codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(2,1,'Ângelo Pereira','Rua B',2000.00,'M');
insert into tbClientes(codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(3,1,'Além Mar Paranhos','Rua C',1500.00,'M');
insert into tbClientes(codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(4,1,'Catarina Souza','Rua D',892.00,'F');
insert into tbClientes(codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(5,1,'Vagner Costa','Rua E',950.00,'M');
insert into tbClientes(codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(6,2,'Antenor da Costa','Rua F',1582.00,'M');
insert into tbClientes(codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(7,2,'Maria Amélia de Souza','Rua G',1152.00,'F');
insert into tbClientes(codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(8,2,'Paulo Roberto Silva','Rua H',3250.00,'M');
insert into tbClientes(codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(9,3,'Fátima Souza','Rua I',1632.00,'F');
insert into tbClientes(codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(10,3,'Joel da Rocha','Rua J',2000.00,'M');

insert into tbConjuge(codConj,codCli,nomeConj,rendaConj,sexoConj)values(1,1,'Carla Nogueira',2500.00,'F');
insert into tbConjuge(codConj,codCli,nomeConj,rendaConj,sexoConj)values(2,2,'Emilia Pereira',5500.00,'F');
insert into tbConjuge(codConj,codCli,nomeConj,rendaConj,sexoConj)values(3,6,'Altiva da Costa',3000.00,'F');
insert into tbConjuge(codConj,codCli,nomeConj,rendaConj,sexoConj)values(4,7,'Carlos de Souza',3250.00,'M');

insert into tbFuncionarios(codFunc,nomeFunc,endFunc,salFunc,sexoFunc)values(1,'Vânia Gabriela Pereira','Rua A',2500.00,'F');
insert into tbFuncionarios(codFunc,nomeFunc,endFunc,salFunc,sexoFunc)values(2,'Norberto Pereira da Silva','Rua B',300.00,'M');
insert into tbFuncionarios(codFunc,nomeFunc,endFunc,salFunc,sexoFunc)values(3,'Olavo Linhares','Rua C',580.00,'M');
insert into tbFuncionarios(codFunc,nomeFunc,endFunc,salFunc,sexoFunc)values(4,'Paulo da Silva','Rua D',3000.00,'F');
insert into tbFuncionarios(codFunc,nomeFunc,endFunc,salFunc,sexoFunc)values(5,'Rolando Rocha','Rua E',2000.00,'M');
insert into tbFuncionarios(codFunc,nomeFunc,endFunc,salFunc,sexoFunc)values(7,'Paula Vieira','Rua G',2000.00,'F');

insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep)values(1,1,'Ana Pereira','F');
insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep)values(2,1,'Roberto Pereira','M');
insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep)values(3,1,'Celso Pereira','M');
insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep)values(4,3,'Brisa Linhares','F');
insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep)values(5,3,'Mari Sol Linhares','F');
insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep)values(6,4,'Sonia da Silva','F');

insert into tbTitulos(codTit,codCat,codGrav,nomeCD,valCD,qtdEstq)values(1,1,1,'Tribalistas',30.00,1500);
insert into tbTitulos(codTit,codCat,codGrav,nomeCD,valCD,qtdEstq)values(2,1,2,'Tropicália',50.00,500);
insert into tbTitulos(codTit,codCat,codGrav,nomeCD,valCD,qtdEstq)values(3,1,1,'Aquele Abraço',50.00,600);
insert into tbTitulos(codTit,codCat,codGrav,nomeCD,valCD,qtdEstq)values(4,1,2,'Refazenda',60.00,1000);
insert into tbTitulos(codTit,codCat,codGrav,nomeCD,valCD,qtdEstq)values(5,1,3,'Totalmente Demais',50.00,2000);
insert into tbTitulos(codTit,codCat,codGrav,nomeCD,valCD,qtdEstq)values(6,1,3,'Travessia',55.00,500);
insert into tbTitulos(codTit,codCat,codGrav,nomeCD,valCD,qtdEstq)values(7,1,2,'Courage',30.00,200);
insert into tbTitulos(codTit,codCat,codGrav,nomeCD,valCD,qtdEstq)values(8,4,3,'Legião Urbana',20.00,100);
insert into tbTitulos(codTit,codCat,codGrav,nomeCD,valCD,qtdEstq)values(9,3,2,'The Beatles',30.00,300);
insert into tbTitulos(codTit,codCat,codGrav,nomeCD,valCD,qtdEstq)values(10,4,1,'Rita Lee',30.00,500);

insert into tbPedidos(numPed,codCli,codFunc,dataPed,valPed)values(1,1,2,'02/05/02',1500.00);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valPed)values(2,3,4,'02/05/02',50.00);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valPed)values(3,4,7,'02/05/02',100.00);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valPed)values(4,1,4,'02/05/02',200.00);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valPed)values(5,7,5,'02/02/03',300.00);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valPed)values(6,4,4,'02/03/03',100.00);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valPed)values(7,5,5,'02/03/03',50.00);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valPed)values(8,8,2,'02/03/03',50.00);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valPed)values(9,2,2,'02/03/03',2000.00);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valPed)values(10,7,1,'02/03/03',3000.00);

insert into tbTitulos_Artista(codTit,codArt)values(1,1);
insert into tbTitulos_Artista(codTit,codArt)values(2,2);
insert into tbTitulos_Artista(codTit,codArt)values(3,2);
insert into tbTitulos_Artista(codTit,codArt)values(4,2);
insert into tbTitulos_Artista(codTit,codArt)values(5,3);
insert into tbTitulos_Artista(codTit,codArt)values(6,4);
insert into tbTitulos_Artista(codTit,codArt)values(7,4);
insert into tbTitulos_Artista(codTit,codArt)values(8,5);
insert into tbTitulos_Artista(codTit,codArt)values(9,6);
insert into tbTitulos_Artista(codTit,codArt)values(10,7);

insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(1,1,2,30.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(1,2,3,20.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(2,1,1,50.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(2,2,3,30.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(3,1,2,40.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(4,2,3,20.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(5,1,2,25.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(6,2,3,30.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(6,3,1,35.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(7,4,2,55.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(8,1,4,60.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(9,2,3,15.00);
insert into tbTitulos_Pedido(numPed,codTit,qtdCD,valCD)values(10,7,2,15.00);

select * from tbArtistas order by codArt asc;
select * from tbGravadoras order by codGrav asc;
select * from tbCategorias order by codCat asc;
select * from tbEstados;
select * from tbCidades order by codCid asc;
select * from tbClientes order by codCli asc;
select * from tbConjuge order by codCli asc;
select * from tbFuncionarios order by codFunc asc;
select * from tbDependentes order by codDep asc;
select * from tbTitulos order by codTit asc;
select * from tbPedidos order by numPed asc;
select * from tbTitulos_Artista order by codTit asc;
select * from tbTitulos_Pedido order by numPed asc;