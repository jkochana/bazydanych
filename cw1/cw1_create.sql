-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-03-09 21:07:37.897

-- tables
-- Table: Artykuly
CREATE TABLE Artykuly (
    IDZamowienia varchar(4)  NOT NULL,
    IDPudelka varchar(4)  NOT NULL,
    Sztuk int  NULL
);

-- Table: Czekoladki
CREATE TABLE Czekoladki (
    IdCzekoladki varchar(3)  NOT NULL,
    Nazwa varchar(30)  NOT NULL,
    RodzajCzekolady varchar(15)  NULL,
    RodzajOrzechow varchar(15)  NULL,
    RodzajNadzienia varchar(15)  NULL,
    Opis varchar(255)  NOT NULL,
    Koszt money  NOT NULL,
    Masa int  NOT NULL,
    CONSTRAINT Czekoladki_pk PRIMARY KEY (IdCzekoladki)
);

-- Table: Klienci
CREATE TABLE Klienci (
    IDKlienta varchar(6)  NOT NULL,
    Nazwa varchar(80)  NULL,
    Ulica varchar(80)  NULL,
    Miejscowosc varchar(80)  NULL,
    Kod varchar(255)  NULL,
    Telefon varchar(255)  NULL,
    CONSTRAINT Klienci_pk PRIMARY KEY (IDKlienta)
);

-- Table: Pudelka
CREATE TABLE Pudelka (
    IDPudelka varchar(4)  NOT NULL,
    Nazwa varchar(255)  NULL,
    Opis varchar(255)  NULL,
    Cena money  NULL,
    Stan varchar(255)  NULL,
    CONSTRAINT Pudelka_pk PRIMARY KEY (IDPudelka)
);

-- Table: Zamowienia
CREATE TABLE Zamowienia (
    IDZamowienia varchar(4)  NOT NULL,
    IDKlienta varchar(6)  NOT NULL,
    DataRealizacji date  NULL,
    CONSTRAINT Zamowienia_pk PRIMARY KEY (IDZamowienia)
);

-- Table: Zawartosc
CREATE TABLE Zawartosc (
    IDPudelka varchar(4)  NOT NULL,
    IdCzekoladki varchar(3)  NOT NULL,
    Sztuk int  NULL
);

-- foreign keys
-- Reference: Artykuly_Pudelka (table: Artykuly)
ALTER TABLE Artykuly ADD CONSTRAINT Artykuly_Pudelka
    FOREIGN KEY (IDPudelka)
    REFERENCES Pudelka (IDPudelka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Artykuly_Zamowienia (table: Artykuly)
ALTER TABLE Artykuly ADD CONSTRAINT Artykuly_Zamowienia
    FOREIGN KEY (IDZamowienia)
    REFERENCES Zamowienia (IDZamowienia)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zamowienia_Klienci (table: Zamowienia)
ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Klienci
    FOREIGN KEY (IDKlienta)
    REFERENCES Klienci (IDKlienta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawartosc_Czekoladki (table: Zawartosc)
ALTER TABLE Zawartosc ADD CONSTRAINT Zawartosc_Czekoladki
    FOREIGN KEY (IdCzekoladki)
    REFERENCES Czekoladki (IdCzekoladki)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawartosc_Pudelka (table: Zawartosc)
ALTER TABLE Zawartosc ADD CONSTRAINT Zawartosc_Pudelka
    FOREIGN KEY (IDPudelka)
    REFERENCES Pudelka (IDPudelka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

