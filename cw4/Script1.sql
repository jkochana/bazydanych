create table pracownicy ("id_pracownika" serial primary key not null, 
"imie" varchar(50) not null, "nazwisko" varchar(50) not null, "adres" varchar(100), "telefon" varchar(20));
create table godziny ("id_godziny" serial primary key not null, "data" date not null, 
"liczba_godzin" integer not null, "id_pracownika" integer not null); 
create table pensje ("id_pensji" serial primary key not null, "stanowisko" varchar(50) not null, 
"kwota" money, "id_premii" integer not null); 
create table premie ("id_premii" serial primary key not null, "rodzaj" varchar(50) not null, "kwota" money); 

alter table godziny add foreign key (id_pracownika) references pracownicy (id_pracownika);
alter table pensje add foreign key (id_premii) references premie (id_premii);

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

insert into premie (rodzaj, kwota) values ('indywidualna', '200');
insert into premie (rodzaj, kwota) values ('indywidualna', '210');
insert into premie (rodzaj, kwota) values ('indywidualna', '220');
insert into premie (rodzaj, kwota) values ('motywacyjna', '230');
insert into premie (rodzaj, kwota) values ('regulaminowa', '240');
insert into premie (rodzaj, kwota) values ('indywidualna', '250');
insert into premie (rodzaj, kwota) values ('indywidualna', '260');
insert into premie (rodzaj, kwota) values ('indywidualna', '270');
insert into premie (rodzaj, kwota) values ('motywacyjna', '280');
insert into premie (rodzaj, kwota) values ('indywidualna', '290');

insert into pensje (stanowisko, kwota, id_premii) values ('ADVANCED GRAPHIC & MOTION WARLOCK', '10000', 1);
insert into pensje (stanowisko, kwota, id_premii) values ('PR RABBI', '9900', 2);
insert into pensje (stanowisko, kwota, id_premii) values ('SOCIAL SELLING WARRIOR', '9800', 3);
insert into pensje (stanowisko, kwota, id_premii) values ('SEM MASTER', '9700', 4);
insert into pensje (stanowisko, kwota, id_premii) values ('CREATIVE ROCKSTAR', '9600', 5);
insert into pensje (stanowisko, kwota, id_premii) values ('JUNIOR TRELLO MASTER', '9500', 6);
insert into pensje (stanowisko, kwota, id_premii) values ('GROWTH MANAGER', '9400', 7);
insert into pensje (stanowisko, kwota, id_premii) values ('JUNIOR WORDPRESS COACH', '9300', 8);
insert into pensje (stanowisko, kwota, id_premii) values ('MARKETING DEVELOPER', '9200', 9);
insert into pensje (stanowisko, kwota, id_premii) values ('CONTENT MARKETING CLERIC', '9100', 10);

select pracownicy.nazwisko, pracownicy.adres from pracownicy; 

select date_part('day', godziny."data") as dzien, date_part('month', godziny."data") as miesiac from godziny;

alter table pensje rename column kwota to kwota_brutto; 
alter table pensje add column kwota_netto money;
update pensje set kwota_netto = kwota_brutto*0.8;



