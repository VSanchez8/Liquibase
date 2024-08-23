-- liquibase formatted sql
-- changeset victorsanchez:1
create table test1 (
    id int primary key,
    name varchar(255)
);
-- rollback drop table test1;
-- changeset victorsanchez:2
insert into test1(id, name) values (1, 'name 1');
-- changeset victorsanchez:3
insert into test1(id, name) values (2, 'name 2');

create sequence seq_test;cls