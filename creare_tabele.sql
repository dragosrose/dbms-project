DROP TABLE Artist;
DROP TABLE Stil;
DROP TABLE Expozitie;
DROP TABLE Client;
DROP TABLE Adresa;
DROP TABLE Arta;
DROP TABLE Comanda;
DROP TABLE Arta_Expusa;

CREATE TABLE Artist (
    artist_id INT NOT NULL,
    nume VARCHAR2(30) NOT NULL,
    prenume VARCHAR2(30) NOT NULL,
    data_nastere DATE,
    tara_origine VARCHAR2(20),
    CONSTRAINT artist_pk PRIMARY KEY (artist_id)
    
);

CREATE TABLE Stil (
    stil_id INT NOT NULL,
    nume_stil VARCHAR2(20),
    CONSTRAINT stil_pk PRIMARY KEY (stil_id)
    
);

CREATE TABLE Expozitie (
    expozitie_id INT NOT NULL,
    nume VARCHAR2(30) NOT NULL,
    start_date DATE,
    end_date DATE,
    tara VARCHAR2(20),
    oras VARCHAR2(20),
    CONSTRAINT expozitie_pk PRIMARY KEY (expozitie_id)
    
);

CREATE TABLE Client (
    client_id INT NOT NULL,
    nume VARCHAR2(30) NOT NULL,
    prenume VARCHAR2(30) NOT NULL,
    nr_telefon VARCHAR2(10),
    email VARCHAR2(40),
    CONSTRAINT client_pk PRIMARY KEY (client_id)
);

CREATE TABLE Adresa (
    adresa_id INT NOT NULL,
    client_id INT NOT NULL,
    tara VARCHAR2(20),
    oras VARCHAR2(20),
    adresa VARCHAR2(40),
    CONSTRAINT adresa_pk PRIMARY KEY (adresa_id),
    CONSTRAINT adresa_fk FOREIGN KEY (client_id) REFERENCES Client(client_id)
);

CREATE TABLE Arta(
    art_id INT NOT NULL,
    an INT,
    titlu VARCHAR2(20),
    pret INT,
    descriere VARCHAR2(100),
    artist_id INT NOT NULL,
    stil_id INT NOT NULL,
    CONSTRAINT arta_pk PRIMARY KEY (art_id),
    CONSTRAINT arta_fk1 FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    CONSTRAINT arta_fk2 FOREIGN KEY (stil_id) REFERENCES Stil(stil_id)
);

CREATE TABLE Comanda(
    comanda_id INT NOT NULL,
    data DATE NOT NULL,
    art_id INT NOT NULL,
    client_id INT NOT NULL,
    CONSTRAINT comanda_pk PRIMARY KEY (comanda_id),
    CONSTRAINT comanda_fk1 FOREIGN KEY (art_id) REFERENCES Arta(art_id),
    CONSTRAINT comanda_fk2 FOREIGN KEY (client_id) REFERENCES Client(client_id)
);

CREATE TABLE Arta_Expusa(
    expozitie_id INT NOT NULL,
    art_id INT NOT NULL,
    CONSTRAINT arta_expusa_pk PRIMARY KEY (expozitie_id, art_id),
    CONSTRAINT arta_expusa_fk1 FOREIGN KEY (expozitie_id) REFERENCES Expozitie(expozitie_id),
    CONSTRAINT arta_expusa_fk2 FOREIGN KEY (art_id) REFERENCES Arta(art_id)
);


CREATE TABLE ORAS (
    oras_id INT NOT NULL,
    adresa_id INT NOT NULL,
    nume_oras VARCHAR2(30),
    judet VARCHAR2(30),
    CONSTRAINT oras_pk PRIMARY KEY (oras_id),
    CONSTRAINT oras_fk FOREIGN KEY (adresa_id) REFERENCES Adresa(adresa_id)
);