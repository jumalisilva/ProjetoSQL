-- Nome: Julia Maria de Lima Silva

--Apagando o banco de dados
drop database dbAula;
-- Criando banco de dados
create database dbAula;
-- Acessando o banco de dados
use dbAula;
-- Visualizar o banco de dados
show databases;
-- Criando tabelas
create table tbAtividades(
id int,
atividade varchar(45)
);
create table tbTurmas(
id int,
quantidade_alunos int,
horario_aula datetime,
duracao_aula datetime,
data_inicio date,
data_fim date,
atividade int,
id_instrutor int,
id_monitor int
);
create table tbRegistros(
id_aluno int,
id_turma int,
ausencia int,
id_registro int
);
create table tbAlunos(
matricula int,
data_matricula date,
nome varchar(45),
endereco varchar(45),
telefone varchar(45),
nascimento date,
altura float,
peso float,
id_turma int
);
create table tbInstrutores(
rg int,
nome varchar(45),
nascimento date,
titulacao varchar(45),
telefone varchar(45)
);
create table tbMonitores(
id_aluno int
);
-- Visualizar as tabelas
show tables;
-- Visualizar a estrutura da tabela
desc tbAtividades;
desc tbTurmas;
desc tbRegistros;
desc tbAlunos;
desc tbInstrutores;
desc tbMonitores;