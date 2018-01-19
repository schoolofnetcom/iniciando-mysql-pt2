DROP SCHEMA IF EXISTS bookstore; create database bookstore; use bookstore; create table consumers (   consumer_id int unsigned NOT 
NULL auto_increment,  first_name varchar(255) NOT NULL,  Last_name varchar(255) NOT NULL,  gender char(10) NOT NULL,  age int NOT 
NULL,  date_cadastro timestamp NOT NULL  DEFAULT NOW(),  city varchar(255) NOT NULL  DEFAULT 'Blumenau',  email varchar(255) NOT 
NULL,  UNIQUE (consumer_id, email),  CONSTRAINT Age_Person  CHECK (Age>=18),  primary key (consumer_id)  );   create table orders (   
order_id int unsigned NOT NULL auto_increment,  consumer_id int unsigned NOT NULL,  order_date timestamp NOT NULL  DEFAULT NOW(),  
order_value varchar(255) NOT NULL,  foreign key (consumer_id)  references consumers (consumer_id),  primary key (order_id)  );    
create table book_category (   bookcategory_id int unsigned NOT NULL auto_increment,  category_type varchar(255) NOT NULL,  
description varchar(255) NOT NULL,  UNIQUE (bookcategory_id, category_type),  primary key (bookcategory_id)  ); create table authors 
(   author_id int unsigned NOT NULL auto_increment,  first_name varchar(255) NOT NULL,  Last_name varchar(255) NOT NULL,  gender 
char(10) NOT NULL,  date_of_birth date NOT NULL,  email varchar(255) NOT NULL,  UNIQUE (author_id, email),  primary key (author_id)  
); create table books (  book_id int unsigned NOT NULL auto_increment,  title varchar(255) NOT NULL,  date_publish date,  
date_acquisition date,  book_comments varchar(255),  price  decimal(10,2) NOT NULL,  author_id int unsigned NOT NULL,  
bookcategory_id int unsigned NOT NULL,  primary key (book_id),  foreign key (author_id)  references authors (author_id),  foreign key 
(bookcategory_id)  references book_category (bookcategory_id)  );    create table order_items (   item_id int unsigned NOT NULL 
auto_increment,  order_id int unsigned NOT NULL,  book_id int unsigned NOT NULL,  item_price decimal(10,2) NOT NULL,  item_comment 
varchar(255),  foreign key (order_id)  references orders (order_id),  foreign key (book_id)  references books (book_id),  primary key 
(item_id)  );   insert into consumers (consumer_id, first_name, last_name, gender, age, city, email)  values (1,'Jackson', 'Lima', 
'Masculino', 26, 'Blumenau', 'jackson.lima91@outlook.com'),  (2, 'Guilherme', 'Pompermayer', 'Masculino', 31, 'Bento Gonçalves', 
'gui.pomper@outlook.com'),  (3, 'Wesley', 'Williams', 'Masculino', 32, 'São Paulo', 'wesley@gmail.com');   insert into orders 
(consumer_id, order_id, order_value)  values (1, 1, 'Interesse em Viagem da Terra e outros livros'),  (2, 2, 'Interesse em Geração 
de Valor'),  (3, 3, 'Interesse em A venda desafiadora');   insert into book_category (bookcategory_id, category_type, description)  
values (1,'Ficção científica', 'Interesse em Viagem da Terra e outros livros'),  (2, 'Motivacional', 'Interesse em Geração de 
Valor'),  (3, 'Vendas', 'Interesse em A venda desafiadora');   insert into authors (author_id, first_name, Last_name, gender, 
date_of_birth, email)  values (1, 'Machado', 'De Assis', 'Masculino', '1945-11-20', 'machado@gmail.com'),  (2, 'Steven', 
'Spielbierg', 'Masculino', '1975-10-11', 'spielberg@gmail.com'),  (3, 'Flavio', 'Augusto', 'Masculino', '1973-12-6', 
'flavio@gmail.com');   insert into books (book_id, bookcategory_id, author_id, title, date_publish, date_acquisition, book_comments, 
price)  values (1, 1, 1, 'Viagem ao Centro da terra','1990-8-15', '1998-10-15','Livro de Ficção científica', '10.50'),   (2, 2, 2, 
'Geração de valor', '1998-10-15','1998-10-15','Livro de Ficção científica', '28.50'),  (3, 3, 3,'A venda 
desafiador','2002-10-15','2002-10-15','Livro de Ficção científica', '19.50');   insert into order_items (item_id, order_id, 
book_id, item_price,item_comment)  values (1, 1, 1, '10.50', 'Livro para material escolar'),  (2, 2, 2, '28.50', 'Livro 
motivacional'),  (3, 3, 3, '10.50', 'Livro de negócios'); 
