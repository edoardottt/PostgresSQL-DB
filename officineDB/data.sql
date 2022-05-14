begin transaction;

set constraints all deferred;

INSERT INTO Dipendente(codDip,nome,cognome,indirizzo,stipendio)
VALUES
('0000000000000001',	'Mario',	'Rossi',	'via dei castagni 1',	'30000'),
('0000000000000002',	'Maria',	'Rossi',	'via dei castagni 2',	'29000'),
('0000000000000003',	'Andrea',	'Verdi',	'via dei palazzi 1',	'31000'),
('0000000000000004',	'Paolo',	'Rossi',	'via del moro 7',	'33000'),
('0000000000000005',	'Mario',	'Bianchi',	'via delle pezze 1',	'34000'),
('0000000000000006',	'Fabio',	'Gialli',		'via delle pezze 4',	'28000'),
('0000000000000007',	'Andrea',	'Rossi',	'via del risorgimento 5',	'30000'),
('0000000000000008',	'Maria',	'Pasini',	'via del consorzio 55',	'29000'),
('0000000000000009',	'Alessandro',	'Rossi','via dei castagni 1',	'30000'),
('0000000000000010',	'Marco',	'Ferrari',	'via dei castagni 1',	'30500'),
('0000000000000011',	'Matteo',	'Arcangeli','via delle pezze 11',	'32000'),
('0000000000000013',	'Ajeje',	'Brazorf',	'via principale 1',	'20000'),
('0000000000000014',	'Giovanni',	'Storti','via dei cirri 1',	'30000'),
('0000000000000015',	'Cataldo',	'Baglio',	'via dei casali 10',	'30000');

INSERT INTO Dirigente(codDir,nome,cognome,indirizzo,stipendio)
VALUES
('1000000000000001',	'Mario',	'Gialli',	'via dei castagni 5',	'40000'),
('1000000000000002',	'Maria',	'Mari',	'via dei castagni 2',	'49000'),
('1000000000000003',	'Andrea',	'Arcangeli',	'via dei palazzi 11',	'41000'),
('1000000000000004',	'Paolo',	'Rossi',	'via del moro 67',	'43000'),
('1000000000000005',	'Mario',	'Baglio',	'via delle pezze 19','44000'),
('1000000000000006',	'Tony',	'Gialli',		'via delle pezze 99','48000'),
('1000000000000007',	'Andrea',	'Gabrielli',	'via del risorgimento 5','40000'),
('1000000000000008',	'Maria',	'Pasini',	'via del consorzio 55',	'49000'),
('1000000000000009',	'Alessandro',	'Rossi',	'via dei castagni 1',	'40000'),
('1000000000000010',	'Marco',	'Ferrari',	'via dei castagni 1',	'40500'),
('1000000000000011',	'Matteo',	'Arcangeli',	'via delle pezze 11',	'42000'),
('1000000000000012',	'Gianluca',	'Mancini',	'via dei tamarri 61',	'40000'),
('1000000000000013',	'Ajeje',	'Brazorf',	'via principale 41',	'40000'),
('1000000000000014',	'Giovanni',	'Storti',	'via dei cirri 12',	'40000'),
('1000000000000015',	'Edoardo',	'Poltroni',	'via dei casali 1',	'300000');

INSERT INTO Proprietario(codPro,nome,cognome,indirizzo)
VALUES
('2000000000000001',	'Mario',	'Polli',	'via dei castagni 5'),
('2000000000000002',	'Maria',	'Mari',	'via dei castagni 2'),
('2000000000000003',	'Paola',	'Arcangeli',	'via dei palazzi 11'),
('2000000000000004',	'Matteo',	'Rossi',	'via del moro 67'),
('2000000000000005',	'Mario',	'Baglio',	'via delle pezze 19'),
('2000000000000006',	'Tony',	'Gialli',		'via delle pezze 99'),
('2000000000000007',	'Andrea',	'Manfredi',	'via del risorgimento 5'),
('2000000000000008',	'Luca',	'Pasini',	'via del consorzio 55'),
('2000000000000009',	'Alessandro',	'Rossi',	'via dei castagni 1'),
('2000000000000010',	'Marco',	'Antiochia',	'via dei castagni  1'),
('2000000000000011',	'Matteo',	'Arcangeli',	'via delle pezze 11'),
('2000000000000012',	'Fabio',	'Mancini',	'via dei marri 61'),
('2000000000000013',	'Ajeje',	'Brazorf',	'via principale 41'),
('2000000000000014',	'Giovanni',	'Storti',	'via dei cirri 12');

INSERT INTO Officina(nome,codO,indirizzo,nDip)
VALUES
('macchine&co','1','via dei castagni 5','25'),
('prontomachine','2','via dei beduini 5','35'),
('prontocar','3','via dei saltimbanchi 5','80'),
('macchine','4','via Garibaldi 5','45'),
('cocar','5','via dei calti 5','100'),
('Supermacchine','6','via dei castagni 5','235'),
('riparationman','7','via del piave 5','29'),
('miacar','8','via dei rossi 3','20');

INSERT INTO dirige(dirigente,officina)
VALUES
('1000000000000015','6'),
('1000000000000013','4'),
('1000000000000001','2'),
('1000000000000003','3'),
('1000000000000005','1'),
('1000000000000006','5'),
('1000000000000007','7'),
('1000000000000008','8');

INSERT INTO lavora(dipendente,officina)
VALUES
('0000000000000001','1'),
('0000000000000002','1'),
('0000000000000003','2'),
('0000000000000004','3'),
('0000000000000005','3'),
('0000000000000006','3'),
('0000000000000007','6'),
('0000000000000008','4'),
('0000000000000009','6'),
('0000000000000010','6'),
('0000000000000011','6'),
('0000000000000012','7'),
('0000000000000013','4'),
('0000000000000014','8'),
('0000000000000015','5');

INSERT INTO ValoreTel(tel)
VALUES
('0000'),
('0001'),
('0010'),
('0011'),
('0100'),
('0101'),
('0110'),
('0111'),
('1000'),
('1001'),
('1010'),
('1011'),
('1100'),
('1101'),
('1110'),
('1111');

INSERT INTO TelefonoDIP(persona,telefono)
VALUES
('0000000000000001','0000'),
('0000000000000002','0001'),
('0000000000000003','1001'),
('0000000000000004','1101');

INSERT INTO TelefonoDIR(persona,telefono)
VALUES
('1000000000000001','0010'),
('1000000000000015','0011'),
('1000000000000002','1000'),
('1000000000000003','1011');

INSERT INTO TelefonoPRO(persona,telefono)
VALUES
('2000000000000002','0100'),
('2000000000000003','0111'),
('2000000000000011','0110'),
('2000000000000014','0101');

INSERT INTO effettuaRip(riparazione,officina)
VALUES
('000','1'),
('001','2'),
('010','3'),
('011','5'),
('100','6'),
('101','6'),
('110','3'),
('111','2');

INSERT INTO Riparazione(codR,veicolo,dataAcc)
VALUES
('000','AA067AA','2018-12-01'),
('001','HA239AB','2018-12-03'),
('010','BU007AC','2018-12-04'),
('011','YC450AD','2018-12-03'),
('100','HB560AF','2018-12-03'),
('101','NF080AG','2018-11-03'),
('110','RH024AH','2018-12-03'),
('111','AU000AI','2018-09-03');

INSERT INTO Veicolo(targa,tipo,modello,annoImm,proprietario)
VALUES
('AA067AA','auto','y','2018-11-03','2000000000000012'),
('HA239AB','moto','e','2018-10-09','2000000000000011'),
('BU007AC','furgone','x','2018-10-30','2000000000000010'),
('YC450AD','auto','x','2018-02-25','2000000000000001'),
('HB560AF','auto','e','2018-05-03','2000000000000003'),
('NF080AG','moto','x','2018-12-08','2000000000000002'),
('RH024AH','auto','y','2017-11-04','2000000000000006'),
('AU000AI','auto','x','2016-12-03','2000000000000009');

INSERT INTO Terminate (codTer,riconsegna)
VALUES
('000','2018-12-05');


commit;
