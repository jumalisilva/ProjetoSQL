drop database dbLivraria;

create database dbLivraria;

use dbLivraria;

create table tbGenero(
idGenero int not null unique,
descricao varchar(100) not null,
primary key(idGenero)
);

create table tbAutor(
idAutor int not null unique,
nome varchar(100) not null,
email varchar(100) not null unique,
primary key(idAutor)
);

create table tbCliente(
idCliente int not null unique,
nome varchar(100) not null,
telefone varchar(45) not null unique,
primary key(idCliente)
);

create table tbLivro(
idLivro int not null unique,
idGenero int not null unique,
titulo varchar(100),
preco decimal(9,2) not null default 0 check (preco > 0),
estoque int not null check (estoque >= 0),
primary key(idLivro),
foreign key(idGenero) references tbGenero(idGenero)
);

create table tbVenda(
idVenda int not null,
idCliente int not null unique,
data date not null,
total decimal(9,2) not null default 0 check (total >= 0),
primary key(idVenda),
foreign key(idCliente) references tbCliente(idCliente)
);

create table tbEscreve(
idLivro int not null unique,
idAutor int not null unique,
foreign key(idLivro) references tbLivro(idLivro),
foreign key(idAutor) references tbAutor(idAutor)
);

create table tbItensDaVenda(
idVenda int not null,
idLivro int not null unique,
qtd int not null check (qtd >= 1),
subtotal varchar(45) not null,
foreign key(idVenda) references tbVenda(idVenda),
foreign key(idLivro) references tbLivro(idLivro)
);

desc tbGenero;
desc tbAutor;
desc tbCliente;
desc tbLivro;
desc tbVenda;
desc tbEscreve;
desc tbItensDaVenda;

insert into tbGenero(idGenero,descricao)values(1,'Terror');
insert into tbGenero(idGenero,descricao)values(2,'Romance');
insert into tbGenero(idGenero,descricao)values(3,'Aventura');
insert into tbGenero(idGenero,descricao)values(4,'Drama');
insert into tbGenero(idGenero,descricao)values(5,'Religioso');
insert into tbGenero(idGenero,descricao)values(6,'Bibliografias');
insert into tbGenero(idGenero,descricao)values(7,'Auto-ajuda');
insert into tbGenero(idGenero,descricao)values(8,'Educação');
insert into tbGenero(idGenero,descricao)values(9,'Ficção');
insert into tbGenero(idGenero,descricao)values(10,'Suspense');

select * from tbGenero order by idGenero asc;

insert into tbAutor(idAutor,nome,email)values(1,'Stephen King','king@gmail.com.br');
insert into tbAutor(idAutor,nome,email)values(2,'Paula Pimenta','pimenta@gmail.com.br');
insert into tbAutor(idAutor,nome,email)values(3,'JK Rowling','rowling@outlook.com.br');
insert into tbAutor(idAutor,nome,email)values(4,'Agatha Christie','agatha@gmail.com.br');
insert into tbAutor(idAutor,nome,email)values(5,'Machado de Assis','machado@hotmail.com.br');
insert into tbAutor(idAutor,nome,email)values(6,'Clarice Lispector','lispector@gmail.com.br');
insert into tbAutor(idAutor,nome,email)values(7,'George Martin','george@hotmail.com.br');
insert into tbAutor(idAutor,nome,email)values(8,'Paulo Freire','freire@gmail.com.br');
insert into tbAutor(idAutor,nome,email)values(9,'Carla Madeira','madeira@gmail.com.br');
insert into tbAutor(idAutor,nome,email)values(10,'Jorge Amado','amado@gmail.com.br');

select * from tbAutor order by idAutor asc;

insert into tbCliente(idCliente,nome,telefone)values(1,'Ana Rodrigues','(11)97512-8930');
insert into tbCliente(idCliente,nome,telefone)values(2,'Paulo Sérgio','(11)9851-3759');
insert into tbCliente(idCliente,nome,telefone)values(3,'Laura Marinho','(21)92345-0987');
insert into tbCliente(idCliente,nome,telefone)values(4,'Carla Perez','(11)92215-7865');
insert into tbCliente(idCliente,nome,telefone)values(5,'Rodrigo de Souza','(61)97680-4452');
insert into tbCliente(idCliente,nome,telefone)values(6,'Amanda Santos','(79)97197-2349');
insert into tbCliente(idCliente,nome,telefone)values(7,'Thabata Silva','(68)93097-6541');
insert into tbCliente(idCliente,nome,telefone)values(8,'Fábio Correa','(11)92189-0873');
insert into tbCliente(idCliente,nome,telefone)values(9,'Camila Pitanga','(92)95527-1397');
insert into tbCliente(idCliente,nome,telefone)values(10,'Julio Verne','(11)92118-6458');

select * from tbCliente where nome like '%c%';

insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(100,1,'O Cemitério',33.92,100);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(200,2,'Fazendo meu filme: volume 1',26.09,120);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(300,3,'Harry Potter e a Pedra Filosofal',50.00,150);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(400,4,'Memórias póstumas de Brás Cubas',37.90,100);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(500,5,'Capitães da areia',36.83,450);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(600,6,'A hora da estrela',24.99,45);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(700,7,'Tudo é rio',41.99,30);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(800,8,'Educação e Mudança',49.90,94);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(900,9,'Game of Thrones',80.00,87);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(1000,10,'Morte no Nilo',49.90,43);

select * from tbLivro order by idGenero desc;

insert into tbVenda(idVenda,idCliente,data,total)values(10,5,'2023/08/22',32.92);
insert into tbVenda(idVenda,idCliente,data,total)values(7,10,'2023/08/22',50.00);
insert into tbVenda(idVenda,idCliente,data,total)values(4,8,'2023/08/15',80.00);
insert into tbVenda(idVenda,idCliente,data,total)values(6,3,'2023/07/10',82.90);
insert into tbVenda(idVenda,idCliente,data,total)values(5,1,'2023/08/09',49.90);
insert into tbVenda(idVenda,idCliente,data,total)values(1,2,'2023/06/12',37.90);
insert into tbVenda(idVenda,idCliente,data,total)values(3,9,'2023/08/19',41.58);
insert into tbVenda(idVenda,idCliente,data,total)values(8,4,'12/07/2023',24.99);
insert into tbVenda(idVenda,idCliente,data,total)values(9,6,'2023/06/03',69.90);
insert into tbVenda(idVenda,idCliente,data,total)values(2,7,'2023/08/22',49.90);

select * from tbVenda order by idVenda asc limit 5;

insert into tbEscreve(idLivro,idAutor)values(1000,4);
insert into tbEscreve(idLivro,idAutor)values(700,9);
insert into tbEscreve(idLivro,idAutor)values(200,2);
insert into tbEscreve(idLivro,idAutor)values(600,6);
insert into tbEscreve(idLivro,idAutor)values(100,1);
insert into tbEscreve(idLivro,idAutor)values(500,10);
insert into tbEscreve(idLivro,idAutor)values(300,3);
insert into tbEscreve(idLivro,idAutor)values(400,5);
insert into tbEscreve(idLivro,idAutor)values(900,7);
insert into tbEscreve(idLivro,idAutor)values(800,8);

select * from tbEscreve order by idLivro;

insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(5,800,1,49.90);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(2,300,5,250.00);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(8,900,3,270.00);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(10,600,2,49.98);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(1,200,4,104.36);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(3,400,1,36.83);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(7,500,1,36.83);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(4,100,1,49.90);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(6,1000,1,33.92);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(9,700,2,83.98);

select distinct subtotal from tbItensDaVenda;

update tbItensDaVenda set subtotal = subtotal * 0.90 where subtotal > 200.00;

select * from tbItensDaVenda order by idVenda asc;