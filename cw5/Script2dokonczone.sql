create schema ksiegowosc;


create table pracownicy ("id_pracownika" serial primary key not null, 
"imie" varchar(50) not null, "nazwisko" varchar(50) not null, "adres" varchar(100), "telefon" varchar(20));
create table godziny ("id_godziny" serial primary key not null, "data" date not null, 
"liczba_godzin" integer not null, "id_pracownika" integer not null); 
create table pensja ("id_pensji" serial primary key not null, "stanowisko" varchar(50) not null, 
"kwota" money, "id_premii" integer not null); 
create table premia ("id_premii" serial primary key not null, "rodzaj" varchar(50) not null, "kwota" money);
create table wynagrodzenie ("id_wynagrodzenia" serial primary key not null, "data" date not null, 
"id_pracownika" integer not null, "id_godziny" integer not null, "id_pensji" integer not null,
"id_premii" integer not null);

alter table godziny add foreign key (id_pracownika) references pracownicy (id_pracownika);
alter table pensja add foreign key (id_premii) references premia (id_premii);
alter table wynagrodzenie  add foreign key (id_pracownika) references pracownicy (id_pracownika);
alter table wynagrodzenie  add foreign key (id_godziny) references godziny (id_godziny);
alter table wynagrodzenie  add foreign key (id_pensji) references pensja (id_pensji);
alter table wynagrodzenie  add foreign key (id_premii) references premia (id_premii);

comment on table pracownicy is 'tabela zawierajaca dane pracownikow';
comment on table godziny is 'tabela zawierajaca godziny i daty powiazane z tabela pracownicy';
comment on table pensja is 'tabela zawierajace dane na temat stanowiska i kwoty pensji, powiazana z tabela premia';
comment on table premia is 'tabela zawierajaca dane premii';
comment on table wynagrodzenie is 'tabela zawierajaca date, powiazana z tabelami pracownicy, godziny, pensja i premia';


insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Mariusz', 'Grabek', 'Kraków ul. Prosta 1', '111111111');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Marcin', 'Wołek', 'Kraków ul. Prosta 2', '222222222');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Karolina', 'Ceglarek', 'Kraków ul. Prosta 3', '333333333');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Jan', 'Malanowski', 'Kraków ul. Prosta 4', '444444444');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Szymon', 'Szadkowski', 'Kraków ul. Prosta 5', '555555555');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Agata', 'Bartosiewicz', 'Kraków ul. Prosta 6', '666666666');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Jakub', 'Krasoń', 'Kraków ul. Prosta 7', '777777777');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Anna', 'Kołacz', 'Kraków ul. Prosta 8', '888888888');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Bartosz', 'Paszek', 'Kraków ul. Prosta 9', '999999999');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Michał', 'Bryś', 'Kraków ul. Prosta 10', '000000000');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-01-20', '5', '1');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-02-21', '6', '2');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-03-22', '7', '3');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-04-23', '8', '4');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-05-24', '9', '5');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-06-25', '10', '6');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-07-26', '11', '7');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-08-27', '12', '8');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-09-28', '13', '9');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-10-29', '14', '10');
insert into premia (rodzaj, kwota) values ('indywidualna', '200');
insert into premia (rodzaj, kwota) values ('indywidualna', '210');
insert into premia (rodzaj, kwota) values ('indywidualna', '220');
insert into premia (rodzaj, kwota) values ('motywacyjna', '230');
insert into premia (rodzaj, kwota) values ('regulaminowa', '240');
insert into premia (rodzaj, kwota) values ('indywidualna', '250');
insert into premia (rodzaj, kwota) values ('indywidualna', '260');
insert into premia (rodzaj, kwota) values ('indywidualna', '270');
insert into premia (rodzaj, kwota) values ('motywacyjna', '280');
insert into premia (rodzaj, kwota) values ('indywidualna', '290');
insert into pensja (stanowisko, kwota, id_premii) values ('ADVANCED GRAPHIC & MOTION WARLOCK', '10000', 1);
insert into pensja (stanowisko, kwota, id_premii) values ('PR RABBI', '9900', 2);
insert into pensja (stanowisko, kwota, id_premii) values ('SOCIAL SELLING WARRIOR', '9800', 3);
insert into pensja (stanowisko, kwota, id_premii) values ('SEM MASTER', '9700', 4);
insert into pensja (stanowisko, kwota, id_premii) values ('CREATIVE ROCKSTAR', '9600', 5);
insert into pensja (stanowisko, kwota, id_premii) values ('JUNIOR TRELLO MASTER', '9500', 6);
insert into pensja (stanowisko, kwota, id_premii) values ('GROWTH MANAGER', '9400', 7);
insert into pensja (stanowisko, kwota, id_premii) values ('JUNIOR WORDPRESS COACH', '9300', 8);
insert into pensja (stanowisko, kwota, id_premii) values ('MARKETING DEVELOPER', '9200', 9);
insert into pensja (stanowisko, kwota, id_premii) values ('CONTENT MARKETING CLERIC', '9100', 10);
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-01-20', '1', '1', '1', '1');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-02-21', '2', '2', '2', '2');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-03-22', '3', '3', '3', '3');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-04-23', '4', '4', '4', '4');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-05-24', '5', '5', '5', '5');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-06-25', '6', '6', '6', '6');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-07-26', '7', '7', '7', '7');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-08-27', '8', '8', '8', '8');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-09-28', '9', '9', '9', '9');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-10-29', '10', '10', '10', '10');


select pracownicy.id_pracownika, pracownicy.nazwisko from pracownicy; 

select pracownicy.id_pracownika, pensja.kwota from pracownicy inner join wynagrodzenie on 
pracownicy.id_pracownika = wynagrodzenie.id_pracownika inner join pensja on 
wynagrodzenie.id_pensji = pensja.id_pensji where pensja.kwota > '1000';

select pracownicy.id_pracownika, pensja.kwota as pensja, premia.kwota as premia from pracownicy inner join
wynagrodzenie on pracownicy.id_pracownika = wynagrodzenie.id_pracownika inner join pensja on
wynagrodzenie.id_pensji = pensja.id_pensji inner join premia on premia.id_premii = pensja.id_premii 
where pensja.kwota > '2000' and premia.kwota is null;

select * from pracownicy where pracownicy.imie like 'J%';

select * from pracownicy where pracownicy.imie like 'N%' and pracownicy.imie like '%a';

select pracownicy.imie, pracownicy.nazwisko, (godziny.liczba_godzin-160) as nadgodziny from pracownicy inner join
godziny on godziny.id_pracownika = pracownicy.id_pracownika where godziny.liczba_godzin > '160';

select pracownicy.imie, pracownicy.nazwisko, pensja.kwota from pracownicy inner join wynagrodzenie on 
pracownicy.id_pracownika = wynagrodzenie.id_pracownika inner join pensja on 
wynagrodzenie.id_pensji = pensja.id_pensji where pensja.kwota between '1500' and '3000';

select pracownicy.imie, pracownicy.nazwisko, (godziny.liczba_godzin-160) as nadgodziny from pracownicy inner join
godziny on pracownicy.id_pracownika = godziny.id_pracownika inner join wynagrodzenie on 
godziny.id_godziny  = wynagrodzenie.id_godziny inner join pensja on wynagrodzenie.id_pensji = pensja.id_pensji inner join 
premia on premia.id_premii = pensja.id_premii where premia.kwota is null and godziny.liczba_godzin > '160';

select pensja.kwota, pracownicy.* from pracownicy inner join wynagrodzenie on 
pracownicy.id_pracownika = wynagrodzenie.id_pracownika inner join pensja on wynagrodzenie.id_pensji = pensja.id_pensji 
order by pensja.kwota;

select pensja.kwota as pensja, premia.kwota as premia, pracownicy.* from pracownicy inner join
wynagrodzenie on pracownicy.id_pracownika = wynagrodzenie.id_pracownika inner join pensja on
wynagrodzenie.id_pensji = pensja.id_pensji inner join premia on premia.id_premii = pensja.id_premii 
order by pensja.kwota, premia.kwota desc;

--od K

select pensja.stanowisko, count(pracownicy.id_pracownika) from pensja inner join wynagrodzenie on 
pensja.id_pensji = wynagrodzenie.id_pensji inner join pracownicy on wynagrodzenie.id_pracownika = pracownicy.id_pracownika 
group by pensja.stanowisko;

select avg(pensja.kwota::numeric), min(pensja.kwota), max(pensja.kwota) from pensja where pensja.stanowisko = 'PR RABBI';

select sum(pensja.kwota+premia.kwota) from pensja inner join premia on pensja.id_premii = premia.id_premii;

select pensja.stanowisko, sum(pensja.kwota+premia.kwota) from pensja inner join premia on 
pensja.id_premii = premia.id_premii group by pensja.stanowisko;

select pensja.stanowisko, count(premia.id_premii) from pensja inner join premia on 
pensja.id_premii = premia.id_premii group by pensja.stanowisko; 

delete from pracownicy using wynagrodzenie, pensja where pracownicy.id_pracownika = wynagrodzenie.id_pracownika and 
wynagrodzenie.id_pensji = pensja.id_pensji and pensja.kwota < '1200';







