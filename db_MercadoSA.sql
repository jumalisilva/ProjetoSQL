drop database dbMercadoSA;

create database dbMercadoSA;

use dbMercadoSA;

create table tbFuncionario(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf char(14) not null unique,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default 'F' check(sexo in('F','M')),
primary key(codFunc));