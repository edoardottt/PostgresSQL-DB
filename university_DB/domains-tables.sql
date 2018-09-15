begin transaction;

--Creazione dei domini

create domain Matricola as varchar(9);

create type tipoFacoltà as  
  enum('Scientifica','Letteraria');
  
create domain oreLezione as integer check (value >0  AND value<6);

create domain Cf as varchar(16);

create domain StringaM as varchar(100);

create domain Voto as integer check(value>17 AND value<33);

--Creazione schema relazionale

create table Persona(
		datadinascita date not null,
		cf Cf not null,
		nome StringaM not null,
		cognome StringaM,
		primary key (cf)
);

create table Facolta(
		cod integer not null,
		nome StringaM not null,
		tipo tipoFacoltà,
		primary key(cod)
);

create table Corso(
		cod integer not null,
		nome StringaM not null,
		orelezione oreLezione not null,
		facolta integer not null,
		primary key(cod),
		foreign key(facolta) references Facolta(cod)
);



create table Studente(
		matricola Matricola not null,
		cf Cf not null,
		facolta integer not null,
		annoiscrizione date not null,
		primary key (cf),
		unique(matricola),
		foreign key (cf) references Persona(cf) deferrable,
		foreign key (facolta) references Facolta(cod)
);

create table Docente(
		cf Cf not null,
		corso integer not null,
		primary key (cf),
		foreign key (cf) references Persona(cf) deferrable,
		foreign key (corso) references Corso(cod)
);

create table Regione(
	nome StringaM not null,
	primary key(nome)
);


create table Citta(
	nome StringaM not null,
	regione StringaM not null,
	primary key (nome, regione),
	foreign key (regione) references Regione(nome)
);


create table Email(
	emailvalue StringaM not null,
	cf Cf not null,
	primary key (emailvalue),
	foreign key (cf) references Persona(cf) deferrable
);


create table nata(
	cf Cf not null,
	citta StringaM not null,
	regione  StringaM not null,
	primary key(cf),
	foreign key (cf) references Persona(cf) deferrable,
	foreign key(citta,regione) references Citta(nome,regione)
);

create table superato(
	studente Matricola not null,
	corso integer not null,
	voto Voto not null,
	primary key (studente, corso),
	foreign key (studente) references Studente(matricola) deferrable,
	foreign key (corso) references Corso(cod)
);
 
 
ALTER TABLE Persona
ADD CONSTRAINT nataaa
foreign key(cf) references nata(cf) deferrable;


commit;


