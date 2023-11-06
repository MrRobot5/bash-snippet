

-----------------
-- 高性能MySQL --
-----------------

flush status;

show status like 'Handler%';

show session status like 'Sort%';

show session status like 'Created%';

SELECT  report.pk FROM optimize_material_report report order by report.`status`;

show processlist;

explain 
select a.* from optimize_material_recommend a 
left join optimize_material_recommend_reason b on a.pk = b.recommend_id 
where b.reason = 'x'
and a.ad_id in (12, 23)
order by a.insert_time desc


create table char_test (char_col char(10));

insert into char_test(char_col) values('string1'), (' string1'), ('string1 ');

select concat("'", char_col, "'") from char_test

alter table char_test change column char_col char_col varchar(10);


create table enum_test (e enum('fish', 'dog', 'apple'));
insert into enum_test(e) values('fish1'), ('fish1'), ('apple1');

explain
select a.domain, count(b.value) as vc from domain_dictionary a 
join domain_value b using(domain)
group by a.domain
order by vc desc;

create table bittest(a bit(8)) ;
insert into bittest(a) values(b'00111001');
select a, a + 0 from bittest;


create table acl(perms set('CAN_READ', 'CAN_WRITE', 'CAN_DELETE') NOT NULL);
insert into acl(perms) values('CAN_DELETE,CAN_WRITE');
select perms from acl where find_in_set('CAN_WRITE', perms);


select crc32('http://www.mysql.com2');

create table pseudohash(
	id int unsigned not null auto_increment,
	url varchar(255) not null,
	url_crc int unsigned not null default 0,
	primary key(id)
	
)

-- create trigger
delimiter |
create trigger pseudohash_crc_ins 
before insert on pseudohash for each row 
begin
	set NEW.url_crc = crc32(NEW.url);
end;
|
delimiter |
create trigger pseudohash_crc_upd 
before update on pseudohash for each row 
begin
	set NEW.url_crc = crc32(NEW.url);
end;
|

-- 测试trigger 生成crc32
insert into pseudohash(url) values('http://www.cnblogs.com/hitwtx/archive/2011/07/25/2116014.html');
update pseudohash set url = 'http://dev.mysql.com/doc/refman/5.5/en/create-trigger.html' where id = 1;

-- 相同crc32 的情况
insert into pseudohash(url) values('codding'), ('gnu');


explain select * from pseudohash where id = 1;

-- 只访问id列的查询使用索引
explain select id from pseudohash order by id desc;
-- Using filesort
explain select id from pseudohash order by url desc;

-- 测试覆盖索引 Extra
explain 
select a.* from optimize_material_recommend a 
where a.recommend_erp like '%admin%'
and a.ad_id in (1206, 0)

explain 
select a.* from optimize_material_recommend a 
join (
explain
	select b.pk from optimize_material_recommend b
	where b.recommend_erp like '%admin%'
	and b.ad_id in (1206, 0)
) as c on (c.pk = a.pk)


start transaction;
select id,url from pseudohash where id < 3 and id <> 1 for update;

commit;

explain
select id,url from pseudohash where id in (1, 2);

-- 索引和表维护
optimize table recommend_ad_keyword;
analyze table recommend_ad_keyword;
check table recommend_ad_keyword;
show index from recommend_ad_keyword;


-- mysql 事务隔离级别验证
-- https://blog.csdn.net/u012807459/article/details/52174601

set autocommit = 0;

select @@tx_isolation;

set tx_isolation = 'serializable';

start transaction;

update dc_op_app set name = 'video' where id = 4

commit;

