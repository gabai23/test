set names utf8;
set foreign_key_checks=0;
drop database if exists logindb2;
create database logindb2;
use logindb2;

create table user(
id int,
user_name varchar(255),
password varchar(255)
);

insert into user values
(1,"taro","123"),
(2,"gabai","123"),
(3,"kei","123"),
(4,"kokosu","123");
