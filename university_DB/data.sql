begin transaction;

set constraints all deferred;


INSERT INTO Persona(datadinascita, cf, nome, cognome) VALUES
('1997-02-01',   'aaaaaaaaaaaaaaaa',   'Alessia',  'Braccialetti'),
('1995-04-05',   'bbbbbbbbbbbbbbbb',    'Orazio',   'Orsato'),
('1960-12-12',   'cccccccccccccccc',    'Harry',  'Quebert'),
('1969-11-10', 'dddddddddddddddd',   'Max',     'Renati'),
('1964-08-11',   'eeeeeeeeeeeeeeee',    'Franco',  'Poligono'),
('1971-10-10', 'ffffffffffffffff',   'Ermenegildo','Racciante');

INSERT INTO Facolta(cod, nome, tipo) VALUES
('1',   'Lingue',   'Letteraria'),
('2',   'Ingegneria',   'Scientifica');

INSERT INTO Corso(cod, nome, orelezione, facolta) VALUES
('1',   'Analisi',   '5',   '2'),
('2' ,   'Programmazione',   '3',   '2'),
('3',   'Traduzione consecutiva',   '5',   '1'),
('4',   'Interpretariato',   '4',   '1');

INSERT INTO Studente(matricola, cf, facolta, annoiscrizione) VALUES
('123456789',   'aaaaaaaaaaaaaaaa',   '1', '12-07-2015'),
('234567891',   'bbbbbbbbbbbbbbbb',   '2', '13-08-2015');

INSERT INTO Docente(cf, corso) VALUES
('cccccccccccccccc',  '4'),
('dddddddddddddddd',   '1'),
('eeeeeeeeeeeeeeee',   '3'),
('ffffffffffffffff',   '2');

INSERT INTO Regione(nome) VALUES
('Lazio'),
('Umbria');

INSERT INTO Citta(nome, regione) VALUES
('Roma', 'Lazio'),
('Viterbo', 'Lazio'),
('San Liberato', 'Umbria');

INSERT INTO Email(emailvalue, cf) VALUES
('laverita@gmail.com', 'cccccccccccccccc'),
('helloworld@gmail.com', 'ffffffffffffffff'),
('mrenati@gmail.com', 'dddddddddddddddd'),
('fpoli@gmail.com',  'eeeeeeeeeeeeeeee'),
('oorsato@gmail.com', 'bbbbbbbbbbbbbbbb');

INSERT INTO Nata(cf, citta, regione) VALUES
('cccccccccccccccc', 'Roma', 'Lazio'),
('ffffffffffffffff',  'San Liberato', 'Umbria'),
('dddddddddddddddd', 'Viterbo', 'Lazio'),
('eeeeeeeeeeeeeeee',  'Roma', 'Lazio'),
('bbbbbbbbbbbbbbbb', 'Viterbo', 'Lazio'),
('aaaaaaaaaaaaaaaa',  'Roma', 'Lazio');

INSERT INTO Superato(studente,corso,voto) VALUES 
('123456789', '3',  '29'),
('234567891',  '1',  '18'),
('234567891',  '2',  '32');

commit;
