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

insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(1,1,'O Cemitério',33.92,100);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(2,3,'Harry Potter e a Pedra Filosofal',50.00,150);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(3,9,'Game of Thrones',80.00,87);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(4,7,'Tudo é rio',41.99,30);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(5,10,'Morte no Nilo',49.90,43);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(6,4,'Memórias póstumas de Brás Cubas',37.90,100);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(7,2,'Fazendo meu filme: volume 1',26.09,120);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(8,6,'A hora da estrela',24.99,45);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(9,5,'Capitães da areia',36.83,450);
insert into tbLivro(idLivro,idGenero,titulo,preco,estoque)values(10,8,'Educação e Mudança',49.90,94);

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

insert into tbEscreve(idLivro,idAutor)values(10,8);
insert into tbEscreve(idLivro,idAutor)values(7,2);
insert into tbEscreve(idLivro,idAutor)values(2,3);
insert into tbEscreve(idLivro,idAutor)values(6,5);
insert into tbEscreve(idLivro,idAutor)values(1,1);
insert into tbEscreve(idLivro,idAutor)values(5,4);
insert into tbEscreve(idLivro,idAutor)values(3,7);
insert into tbEscreve(idLivro,idAutor)values(4,9);
insert into tbEscreve(idLivro,idAutor)values(9,10);
insert into tbEscreve(idLivro,idAutor)values(8,6);

select * from tbEscreve order by idLivro;

insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(5,8,1,49.90);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(2,3,5,400.00);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(8,9,1,36.83);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(10,6,1,32.90);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(1,2,1,50.00);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(3,4,1,41.99);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(7,5,1,49.90);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(4,10,1,49.90);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(6,1,1,33.92);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(9,7,1,26.09);

select distinct subtotal from tbItensDaVenda;

update tbGenero set descricao = 'Mangá' where idGenero = 6;
update tbGenero set descricao = 'HQ' where idGenero =7;
update tbGenero set descricao = 'Comédia' where idGenero = 8;
update tbGenero set descricao = 'Fatos reais' where idGenero = 9;
update tbGenero set descricao = 'Ficção Científica' where idGenero = 10;

select * from tbGenero order by idGenero asc;

update tbAutor set nome = 'Jeph Loeb', email = 'loeb@hotmail.com.br' where idAutor = 1;
update tbAutor set nome = 'Akimi Yoshida', email = 'akimi@gmail.com.br' where idAutor = 2;
update tbAutor set nome = 'Beth OLeary', email = 'beth@hotmail.com.br' where idAutor = 3;
update tbAutor set nome = 'Anthony Hinton', email = 'hinton@outlook.com.br' where idAutor = 4;
update tbAutor set nome = 'James Dashner', email = 'james@gmail.com.br' where idAutor = 5;

select * from tbAutor order by idAutor asc;

update tbCliente set nome = 'Marcelo Barbosa', telefone = '(95)98753-1598' where idCliente = 2;
update tbCliente set nome = 'Mariana Alves', telefone = '(48)90971-1533' where idCliente = 4;
update tbCliente set nome = 'Bianca Andrade', telefone = '(51)92596-1290' where idCliente = 6;
update tbCliente set nome = 'Solange Lopes', telefone = '(27)93407-4327' where idCliente = 8;
update tbCliente set nome = 'Pedro Bial', telefone = '(11)96783-3579' where idCliente = 10;

select * from tbCliente where nome like '%a%';

update tbLivro set titulo = 'Banana Fish', preco = 28.99 where idGenero = 5;
update tbLivro set titulo = 'Batman', preco = 98.97 where idGenero = 6;
update tbLivro set titulo = 'A troca', preco = 36.99 where idGenero = 7;
update tbLivro set titulo = 'O sol ainda brilha', preco = 31.99 where idGenero = 8;
update tbLivro set titulo = 'Maze Runner: correr ou morrer', preco = 47.92 where idGenero = 9;

select * from tbLivro;

update tbVenda set data = '2018/04/12' where idVenda = 2;
update tbVenda set data = '2021/09/14' where idVenda = 7;
update tbVenda set data = '2023/05/15' where idVenda = 1;
update tbVenda set data = '2022/06/01' where idVenda = 3;
update tbVenda set data = '2023/08/22' where idVenda = 5;

select * from tbVenda;

update tbEscreve set idAutor = 1 where idLivro = 9;
update tbEscreve set idAutor = 2 where idLivro = 5;
update tbEscreve set idAutor = 3 where idLivro = 7;
update tbEscreve set idAutor = 4 where idLivro = 8;
update tbEscreve set idAutor = 5 where idLivro = 9;

select * from tbEscreve;