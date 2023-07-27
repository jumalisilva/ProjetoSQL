-- Nome: Julia Maria de Lima Silva

--Apagando o banco de dados
drop database dbClinicaMedica;
-- Criando banco de dados 
create database dbClinicaMedica;
-- Acessando o banco de dados
use dbClinicaMedica;
-- Visualizar o banco de dados
show databases;
-- Criando tabelas
create table tbMedicos(
idMedico int,
nameMedico varchar(45),
telefoneMedico varchar(9)
);
create table tbConsultas(
idConsulta int,
dataConsulta datetime,
medico_idMedico int,
paciente_idPaciente int,
receitaMedica_idReceitaMedica int
);
create table tbPacientes(
idPaciente int,
nomePaciente varchar(45),
telefonePaciente varchar(9),
convenio varchar(45)
);
create table tbReceitasMedicas(
idReceitaMedica int,
descricao varchar(500)
);
-- Visualizar as tabelas
show tables;
-- Visualizar a estrutura da tabela
desc tbMedicos;
desc tbConsultas;
desc tbPacientes;
desc tbReceitasMedicas;