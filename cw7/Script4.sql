--1
create or replace function fibonacci(fib int)
   returns int
   language plpgsql
   as
$$
declare zm1 int default 0;
declare zm2 int default 1;
declare zm3 int;
begin
	if fib = 1 then
	return zm1;
	elseif fib = 2 or fib = 3 then
	return zm2;
	else
		while fib>2 loop
			zm3=zm1+zm2;
			zm1=zm2;
			zm2=zm3;
			fib=fib-1;
		end loop;
		return zm3;
	end if;
end;
$$;

create or replace procedure procedura1(n int) language plpgsql as
$$
declare x int default 1;
begin 
	while n>0 loop
		raise notice '%', fibonacci(x);
		x=x+1;
		n=n-1;
	end loop;
end;
$$;

call procedura1(6)



--2
create or replace function ftrigger1()
	returns trigger
	language plpgsql
	as 
$$
begin 
	new.lastname = upper(new.lastname);
	return new;
end;
$$

create or replace trigger triger1 
before insert
on person
for each row
execute procedure ftrigger1();

insert into businessentity values (1);
insert into person ("firstname", "lastname", "businessentityid", "persontype") values ('maciek', 'maciek', 1, 'VC');



--3
create or replace function ftaxratemonitoring()
	returns trigger 
	language plpgsql
	as 
$$
declare zm1 int;
declare zm2 int;
declare zm3 int;
begin
	zm1=new.taxrate;
	zm2=old.taxrate;
	zm3=zm2*0.3;
	if abs(zm1-zm2)>zm3 then
		raise exception "niedozwolona zmiana taxrate";
	end if;
	return new;
end
$$;

create or replace trigger taxratemonitoring
before update
on salestaxrate
for each row 
execute procedure ftaxratemonitoring();


insert into salestaxrate ("stateprovinceid","taxtype", "taxrate", "name") values (1, 1, 100, 'maciek');
update salestaxrate set taxrate = 200 where stateprovinceid = 1;

