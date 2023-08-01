-- Apagar banco de dados
drop database dbManicure;

-- Criando o banco de dados
create database dbManicure;

-- Acessando o banco de dados
use dbManicure;

-- Visualizando o banco de dados
show databases;

-- Criando tabelas no banco de dados
create table tbProdutos(
codProd int,
descricao varchar(100),
quantidade decimal(9,2),
dataEntrada date,
valorUnitario decimal(9,2)
);

-- Visualizando as tabelas
show tables;

-- Visualizando a estrutura da tabela
desc tbProdutos;

-- Cadastrando/inserindo registros nas tabelas
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(1,'Alicate de unha',10,'2023/08/01',5.50);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(2,'Esmalte',25,'2023/08/01',15.00);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(3,'Acetona',35,'2023/07/30',3.50);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(4,'Algodão',100,'2023/07/31',2.53);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(5,'Unha postiça',50,'2023/07/25',9.99);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(6,'Unha',50,'2023/08/01',9.99);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(7,'postiça',50,'2023/08/01',9.99);

-- Visualizar os registros inseridos nas tabelas
select * from tbProdutos;

-- Alterando registros das tabelas
update tbProdutos set descricao = 'Palito de unha', valorUnitario = 1.35 where codProd = 6;
update tbProdutos set descricao = 'Máscara de proteção', valorUnitario = 2.23 where codProd = 7;

-- Visualizar os registros alterados
select * from tbProdutos;

-- Apagar registros das tabelas
delete from tbProdutos where codProd = 7;

-- Visualizar os registros excluídos
select * from tbProdutos;
