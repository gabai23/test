drop database if exists testdb55;
create database testdb55;
use testdb55;

create table users(
user_id int primary key auto_increment,
user_name varchar(255),
password varchar(255)
);

insert into users values(1,"taro","123");
insert into users values(2,"gabai","456");
insert into users values(3,"onuma","7889");

create table inquiry(
name varchar(255),
qtype varchar(255),
body varchar(255)
);