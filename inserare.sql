INSERT INTO Client VALUES (1,'Popescu','Ion','0744258321','ion.popescu34@gmail.com');
INSERT INTO Client VALUES (2,'Georgescu','Mariana','0751088235','mariangeorgescu12@gmail.com');
INSERT INTO Client VALUES (3,'Axinte','Daniela','0745593834','danielaa24@yahoo.com');
INSERT INTO Client VALUES (4,'Mihail','Alexandru','0761445958','mihailalex6@yahoo.com');
INSERT INTO Client VALUES (5,'Birica','Andrei','0753210045','andrewbir99@gmail.com');

INSERT INTO Adresa VALUES (1, 1, 'Romania', 'str. Iancului, nr. 23, bl. A5 , ap. 22');
INSERT INTO Adresa VALUES (2, 2, 'Romania', 'str. Aviatiei , nr. 41 , bl. G2 , ap. 44');
INSERT INTO Adresa VALUES (3, 3, 'Regatul Unit', 'str. Brick Lane, nr. 5 , bl. B3 , ap.5A');
INSERT INTO Adresa VALUES (4, 4, 'Romania', 'str. Mioritei , nr. 11 , bl. F6 , ap. 10');
INSERT INTO Adresa VALUES (5, 5, 'Romania', 'str. Matei Babes, nr. 9 , bl. D1 , ap. 8');

INSERT INTO Oras VALUES (1, 1, 'Teleorman', 'Alexandria');
INSERT INTO Oras VALUES (2, 2, 'Bucuresti', 'Bucuresti');
INSERT INTO Oras VALUES (3, 3, 'Londra', 'Londra Mare');
INSERT INTO Oras VALUES (4, 4, 'Bucuresti', 'Bucuresti');
INSERT INTO Oras VALUES (5, 5, 'Iasi', 'Iasi');

INSERT INTO Stil VALUES (1, 'Abstract');
INSERT INTO Stil VALUES (2, 'Figurativ');
INSERT INTO Stil VALUES (3, 'Floral');
INSERT INTO Stil VALUES (4, 'Peisaje');
INSERT INTO Stil VALUES (5, 'Nud');

INSERT INTO Artist VALUES (1, 'Carafa', 'Florina', TO_DATE('1980-05-03', 'yyyy-mm-dd'), 'Romania');
INSERT INTO Artist VALUES (2, 'Giacommo', 'Valentini', TO_DATE('1975-11-14', 'yyyy-mm-dd'), 'Italia');
INSERT INTO Artist VALUES (3, 'Hanci', 'Flavius', TO_DATE('1990-08-23', 'yyyy-mm-dd'), 'Romania');
INSERT INTO Artist VALUES (4, 'Vasilescu', 'Ana-Maria', TO_DATE('1993-04-15', 'yyyy-mm-dd'), 'Romania');
INSERT INTO Artist VALUES (5, 'James', 'Robert', TO_DATE('1984-04-22', 'yyyy-mm-dd'), 'Regatul Unit');

INSERT INTO Expozitie VALUES (1, 'National Gallery', TO_DATE('2018-02-13', 'yyyy-mm-dd'), TO_DATE ('2018-02-16', 'yyyy-mm-dd'), 'Regatul Unit', 'Londra');
INSERT INTO Expozitie VALUES (2, 'Museum of Modern Art', TO_DATE('2019-04-15', 'yyyy-mm-dd'), TO_DATE ('2019-04-19', 'yyyy-mm-dd'), 'SUA', 'New York');
INSERT INTO Expozitie VALUES (3, 'Elite Art Gallery', TO_DATE('2020-05-08', 'yyyy-mm-dd'), TO_DATE ('2020-05-13', 'yyyy-mm-dd'), 'Romania', 'Bucuresti');
INSERT INTO Expozitie VALUES (4, 'Pilat Gallery', TO_DATE('2021-06-21', 'yyyy-mm-dd'), TO_DATE ('2021-06-24', 'yyyy-mm-dd'), 'Romania', 'Bucuresti');
INSERT INTO Expozitie VALUES (5, 'Artep Gallery', TO_DATE('2021-04-13', 'yyyy-mm-dd'), TO_DATE ('2021-04-16', 'yyyy-mm-dd'), 'Romania', 'Iasi');

INSERT INTO Arta VALUES (1, 2020, 'Love story', 2000, null, 1, 1);
INSERT INTO Arta VALUES (2, 2016, 'Incatusare', 3500, null, 2, 1);
INSERT INTO Arta VALUES (3, 2018, 'The Rust', 50000, 'The Rust este o lucrare inspirata din natura si imperfectiunea ei.', 3, 2);
INSERT INTO Arta VALUES (4, 2014, 'Fetita cu coronita', 30000, 'Fetita cu coronita , ulei panza', 4, 2);
INSERT INTO Arta VALUES (5, 2017, 'Freedom', 4000, null, 5, 3);
INSERT INTO Arta VALUES (6, 2021, 'Floral Bliss', 2450, 'Lucrarea este pictata pe panza cu sasiu, cu sistem de prindere vertical', 1, 3);
INSERT INTO Arta VALUES (7, 2021, 'Linistea Naturii', 3250, 'Pictura din panza de bumbac pe sasiu de lemn cu sistem de prindere, culori acrilice clasice, vernis.', 2, 4);
INSERT INTO Arta VALUES (8, 2019, 'Amintiri in Verde', 20000, null, 3, 4);  
INSERT INTO Arta VALUES (9, 2020, 'Genesis', 30000, 'Adam si Eva.', 4, 5);
INSERT INTO Arta VALUES (10,2020, 'Melting lovers', 25000, null, 5, 5); 
INSERT INTO Arta VALUES (11,2021, 'Elena', 4500, null, 1, 5);
INSERT INTO Arta VALUES (12,2021, 'Mintea Libera', 3750, null, 2, 4);
INSERT INTO Arta VALUES (13,2019, 'Parfum', 13500, null, 3, 3);
INSERT INTO Arta VALUES (14,2020, 'Natalie', 10000, null, 4, 2);
INSERT INTO Arta VALUES (15,2019, 'Fascinatie', 9000, 'Pictura vine intinsa pe sasiu profesional din lemn, cu pene de intindere.', 5, 1);

INSERT INTO Comanda VALUES (1, TO_DATE('2021-06-21', 'yyyy-mm-dd'), 1, 3);
INSERT INTO Comanda VALUES (2, TO_DATE('2017-03-14', 'yyyy-mm-dd'), 2, 4);
INSERT INTO Comanda VALUES (3, TO_DATE('2019-06-11', 'yyyy-mm-dd'), 3, 2);
INSERT INTO Comanda VALUES (4, TO_DATE('2019-11-30', 'yyyy-mm-dd'), 4, 3);
INSERT INTO Comanda VALUES (5, TO_DATE('2017-11-30', 'yyyy-mm-dd'), 5, 3);
INSERT INTO Comanda VALUES (6, TO_DATE('2021-08-05', 'yyyy-mm-dd'), 6, 5);
INSERT INTO Comanda VALUES (7, TO_DATE('2021-09-24', 'yyyy-mm-dd'), 7, 1);
INSERT INTO Comanda VALUES (8, TO_DATE('2020-01-20', 'yyyy-mm-dd'), 8, 2);
INSERT INTO Comanda VALUES (9, TO_DATE('2021-01-05', 'yyyy-mm-dd'), 9, 4);
INSERT INTO Comanda VALUES (10, TO_DATE('2020-05-13', 'yyyy-mm-dd'), 10, 1);

INSERT INTO Arta_Expusa VALUES (1, 3);
INSERT INTO Arta_Expusa VALUES (1, 4);
INSERT INTO Arta_Expusa VALUES (2, 8);
INSERT INTO Arta_Expusa VALUES (2, 15);
INSERT INTO Arta_Expusa VALUES (3, 9);
INSERT INTO Arta_Expusa VALUES (3, 10);
INSERT INTO Arta_Expusa VALUES (4, 11);
INSERT INTO Arta_Expusa VALUES (4, 12);
INSERT INTO Arta_Expusa VALUES (5, 6);
INSERT INTO Arta_Expusa VALUES (5, 7);
