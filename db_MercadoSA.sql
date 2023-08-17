drop database dbMercadoSA;

create database dbMercadoSA;

use dbMercadoSA;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar (100) not null,
email varchar (100),
CPF char (14) not null unique, 
salario decimal (9,2) default 0 check (salario >= 0),
sexo char (1) default 'F'check (sexo in( 'F', 'M')),
primary key(codFunc)
);

create table tbClientes(
codCliente int not null auto_increment,
nome varchar (100) not null,
email varchar (100),
telefone char (10),
primary key (codCliente)
);

create table tbFornecedores(
codForn int not null auto_increment,
nomeForn varchar (100) not null,
emailForn varchar (100),
cnpjForn char (18) not null unique,
primary key (codForn)
);

create table tbUsuarios(
codUser int not null auto_increment,
nome varchar (50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key(codUser),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProduto int not null auto_increment,
descricaoProd varchar (100), 
dataEntrada date,
horaEntrada time,
quantidade decimal (9,2),
valorUnit decimal (9,2),
codForn int not null,
primary key (codProduto), 
foreign key (codForn) references tbFornecedores (codForn)
);

create table tbVendas(
codVenda int not null auto_increment,
codUser int not null,
codCliente int not null,
codProduto int not null,
dataVenda date,
horarioDaVenda time,
quantidadeVenda decimal (9,2),
valorTotal decimal (9,2),
primary key (codVenda),
foreign key (codUser) references tbUsuarios (codUser),
foreign key (codCliente) references tbClientes (codCliente),
foreign key (codProduto) references tbProdutos (codProduto)
);

desc tbFuncionarios;
desc tbClientes;
desc tbFornecedores;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

-- inserir registros nas tabelas
insert into tbFuncionarios(nome,email,CPF,salario,sexo)values('Fernanda Souza','souzafe13@gmail.com','316.785.498-78',150000.00,'F');
insert into tbClientes(nome,email,telefone)values('Renata Souza Borges','fiscal@borgesesouzacontabil.com.br','3452-2014');
insert into tbFornecedores(nomeForn,emailForn,cnpjForn)values('Fazenda Bang Bang','fazendabangbagn@fazendabangbang.com.br','01.001.001-0001-01');
insert into tbUsuarios(nome,senha,codFunc)values('Fernanda.Souza','1234',1);
insert into tbProdutos(descricaoProd,dataEntrada,horaEntrada, quantidade,valorUnit,codForn)values('banana','2023/08/10','16:53:53',10,5.50,1);
insert into tbProdutos(descricaoProd,dataEntrada,horaEntrada, quantidade,valorUnit,codForn)values('morango','2023/08/09','09:10:59',100,20.99,1);
insert into tbProdutos(descricaoProd,dataEntrada,horaEntrada, quantidade,valorUnit,codForn)values('bicicleta','2023/08/01','07:30:59',3,599.99,1);
insert into tbVendas(codUser,codCliente,codProduto,dataVenda,quantidadeVenda,valorTotal)values(1,1,2,'2023/08/10',10,50.00);

select * from tbFuncionarios;
select * from tbClientes;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;