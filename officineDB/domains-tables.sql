begin transaction;

-- Creazione dei domini

create domain PosInteger as integer check (value >=0);

create type tipoV as 
enum('furgone','auto','moto','camion');

create domain stringa as varchar(100);

create domain Vtarga as varchar(8);

create domain cf as varchar(16);

-- Creazione dello schema relazionale

create table Dipendente (
codDip cf not null,
nome stringa not null,
cognome stringa not null,
indirizzo stringa not null,
stipendio PosInteger not null,
primary key (codDip)
);

create table Dirigente (
codDir cf not null,
nome stringa not null,
cognome stringa not null,
indirizzo stringa not null,
stipendio PosInteger not null,
primary key (codDir)
);

create table Proprietario (
codPro cf not null,
nome stringa not null,
cognome stringa not null,
indirizzo stringa not null,
primary key (codPro)
);

create table Officina (
nome stringa not null,
codO PosInteger not null,
indirizzo stringa not null,
nDip PosInteger not null,
primary key (codO)
);

create table Riparazione (
codR PosInteger not null,
veicolo Vtarga not null,
dataAcc date not null,
primary key (codR)
);

create table Terminate (
codTer PosInteger not null,
riconsegna date not null,
primary key (codTer),
foreign key (codTer) references Riparazione(codR) deferrable
);

create table Veicolo (
targa Vtarga not null,
tipo tipoV not null,
modello stringa not null,
annoImm date not null,
proprietario cf not null,
primary key (targa),
foreign key (proprietario) references Proprietario(codPro) deferrable
);

create table ValoreTel (
tel stringa not null,
primary key (tel)
);

create table telefonoDIP (
persona cf not null,
telefono stringa not null,
primary key (telefono),
foreign key (persona) references Dipendente(codDip) deferrable,
foreign key (telefono) references ValoreTel(tel) deferrable
);

create table telefonoDIR (
persona cf not null,
telefono stringa not null,
primary key (telefono),
foreign key (persona) references Dirigente(codDir) deferrable,
foreign key (telefono) references ValoreTel(tel) deferrable
);

create table telefonoPRO (
persona cf not null,
telefono stringa not null,
primary key (telefono),
foreign key (persona) references Proprietario(codPro) deferrable,
foreign key (telefono) references ValoreTel(tel) deferrable
);

create table effettuaRip (
riparazione PosInteger not null,
officina PosInteger not null,
primary key (riparazione),
foreign key (riparazione) references Riparazione(codR) deferrable,
foreign key (officina) references Officina(codO) deferrable
);

alter table Riparazione
add foreign key (codR) references effettuaRip(riparazione) deferrable;
alter table Riparazione
add foreign key (veicolo) references Veicolo(targa) deferrable;

create table lavora (
dipendente cf not null,
officina PosInteger not null,
primary key (dipendente),
foreign key (dipendente) references Dipendente(codDip) deferrable,
foreign key (officina) references Officina(codO) deferrable
);

alter table Dipendente
add foreign key (codDip) references lavora(dipendente) deferrable;

create table dirige (
dirigente cf not null,
officina PosInteger not null,
primary key (officina),
foreign key (dirigente) references Dirigente(codDir) deferrable,
foreign key (officina) references Officina(codO) deferrable
);

alter table Officina
add foreign key (codO) references dirige(officina) deferrable;


commit;