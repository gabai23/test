drop database if exists testdb555;
create database testdb555;
use testdb555;
create table users(
user_id int primary key auto_increment,
user_name varchar(255),
password varchar(255)
);
insert into users values(1,"taro","123");
insert into users values(2,"jiro","456");
insert into users values(3,"gabai","3478");
create table inquiry(
name varchar(255),
qtype varchar(255),
body varchar(255)
);