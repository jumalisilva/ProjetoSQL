-- Apagar o banco de dados
drop database dbLoterica;

-- Criando o banco de dados
create database dbLoterica;

-- Acessando o banco de dados
use dbLoterica;

-- Visualizando o banco de dados
show databases;

-- Criando tabelas no banco de dados
create table tbJogos(
codigo int,
nome varchar(30),
valor decimal(9,2),
data date 
);

-- Visualizando as tabelas
show tables;

-- Visualizando a estrutura da tabela
desc tbJogos;

-- Cadastrando/inserindo registros nas tabelas
insert into tbJogos(codigo,nome,valor,data)values(1,'Mega-Sena',5.00,'2023/08/03');
insert into tbJogos(codigo,nome,valor,data)values(2,'Lotofácil',3.00,'2023/08/01');
insert into tbJogos(codigo,nome,valor,data)values(3,'Quina',2.50,'2023/08/01');
insert into tbJogos(codigo,nome,valor,data)values(4,'Lotomania',3.00,'2023/08/02');
insert into tbJogos(codigo,nome,valor,data)values(5,'Timemania',3.50,'2023/08/01');
insert into tbJogos(codigo,nome,valor,data)values(6,'Dupla Sena',10.00,'2023/08/01');
insert into tbJogos(codigo,nome,valor,data)values(7,'Federal',5.50,'2023/08/01');
insert into tbJogos(codigo,nome,valor,data)values(8,'Loteca',2.50,'2023/08/05');
insert into tbJogos(codigo,nome,valor,data)values(9,'Dia de sorte',3.30,'2023/08/01');
insert into tbJogos(codigo,nome,valor,data)values(10,'Super sete',4.00,'2023/08/02');

-- Visualizar os registros inseridos na tabela
select * from tbJogos;

-- Alterando registros das tabelas
update tbJogos set valor = 7.00 where codigo = 6;
update tbJogos set valor = 4.40 where codigo = 10;

-- Visualizar os registros alterados
select * from tbJogos;

-- Apagar registros das tabelas
delete from tbJogos where codigo = 2;
delete from tbJogos where codigo = 4;
delete from tbJogos where codigo = 8;

-- Visualizando os registros excluídos
select * from tbJogos;