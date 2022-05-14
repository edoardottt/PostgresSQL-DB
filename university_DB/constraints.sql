begin transaction;

-- DISGIUNZIONE TRA STUDENTE E DOCENTE

CREATE FUNCTION V_PERSONA_isa_disj() RETURNS trigger AS 
$V_PERSONA_isa_disj$
declare isError boolean =  false; -- variabile locale
begin 
case  --TG_TABLE_NAME: nome tabella relativa all'operazione
	when TG_TABLE_NAME ilike 'Studente' then 
		isError = exists (select * from Docente d where d.cf = new.cf );
	when TG_TABLE_NAME ilike 'Docente' then
		isError = exists (select * from Studente s where s.cf = new.cf);
	else raise exception 'La funzione non può essere invocata sulla funzione
	%',TG_TABLE_NAME;
end case;
	if (isError) then raise exception 'Vincolo V.personaNotStudenteAndDocente 
	violato da Persona.id = %',new.cf;
	end if;
return new;
end;
$V_PERSONA_isa_disj$ language plpgsql;

CREATE TRIGGER V_PERSONA_isa_disj_trigger_Studente
before insert or update on Studente
for each row execute procedure V_PERSONA_isa_disj();

CREATE TRIGGER V_PERSONA_isa_disj_trigger_Docente
before insert or update on Docente
for each row execute procedure V_PERSONA_isa_disj();

-- ------------------------------------------------------------------------------------------

-- STUDENTE SUPERA SOLO I CORSI DELLA PROPRIA FACOLTÀ

CREATE FUNCTION V_STUDENTE_supera() RETURNS trigger AS
$V_STUDENTE_supera$
declare isError boolean = false;
begin 
case 
	when TG_TABLE_NAME ILIKE 'superato' then
		isError = not exists (select * from Corso,Studente where new.corso = corso.cod and studente.matricola = new.studente and studente.facolta = corso.facolta);
	else raise exception 'La funzione non può essere invocata sulla funzione %',TG_TABLE_NAME;
end case;
	if (isError) then raise exception 'Vincolo V.studenteSuperaCorso violato da superato.matricola = %',new.studente;
	end if;
return new;
end;
$V_STUDENTE_supera$ language plpgsql;

CREATE TRIGGER V_STUDENTE_supera_trigger
before insert or update on superato
for each row execute procedure V_STUDENTE_supera();

-- -----------------------------------------------------------------------------------------

-- DATA NASCITA STUDENTE > ISCRIZIONE UNIVERSITÀ

CREATE FUNCTION V_STUDENTE_iscritto() RETURNS trigger AS
$V_STUDENTE_iscritto$
declare isError boolean = false;
begin
case
	when TG_TABLE_NAME ilike 'Studente' then
		isError = exists (select * from Persona where Persona.cf = new.cf AND new.annoIscrizione < persona.datadinascita);
	else raise exception 'La funzione non può essere invocata sulla funzione %',TG_TABLE_NAME;
end case;
	if (isError) then raise exception 'Vincolo V.studenteiscritto violato da studente.annoIscrizione = %',new.cf;
	end if;
return new;
end;
$V_STUDENTE_iscritto$ language plpgsql;


CREATE TRIGGER V_STUDENTE_ISCRITTO_trigger
before insert or update on Studente
for each row execute procedure V_STUDENTE_iscritto();

-- ---------------------------------------------------------------------------------------

-- COMPLETEZZA TRA STUDENTE E DOCENTE

CREATE FUNCTION V_PERSONA_completeness() RETURNS trigger AS
$V_PERSONA_completeness$
declare isError boolean = false;
begin
case
	when TG_TABLE_NAME ilike 'Persona' then
		isError = not exists ( select cf from Studente where new.cf = studente.cf union distinct select cf from Docente where new.cf = docente.cf);
	else raise exception 'La funzione non può essere invocata sulla funzione %', TG_TABLE_NAME;
end case;
	if (isError) then raise exception 'Vincolo V.Persona.completezza violato da Persona.cf = %',new.cf;
	end if;
return new;
end;
$V_PERSONA_completeness$ language plpgsql;


CREATE TRIGGER V_PERSONA_COMPLETENESS_trigger
after insert or update on Persona
for each row execute procedure V_PERSONA_completeness();

-- ----------------------------------------------------------------------------------------

-- ELIMINAZIONE CONSEGUENTE IN PERSONA DA CANCELLAZIONE STUDENTE

CREATE FUNCTION V_STUDENTE_delete() RETURNS trigger AS
$V_STUDENTE_delete$
declare isError boolean = false;
begin
case
	when TG_TABLE_NAME ilike 'Studente' then
		isError = exists ( select * from Persona where old.cf=persona.cf);
	else raise exception 'La funzione non può essere invocata sulla funzione %',TG_TABLE_NAME;
end case;
	if (isError) then delete  from Persona where persona.cf=old.cf;
	end if;
	if (isError) then delete  from nata where nata.cf=old.cf;
	end if;
	if (isError) then delete  from superato where superato.studente=old.matricola;
	end if;
	if (isError) then delete from email where email.cf=old.cf;
	end if;
return old;
end;
$V_STUDENTE_delete$ language plpgsql;


CREATE TRIGGER V_STUDENTE_delete_trigger
after delete on Studente
for each row execute procedure V_STUDENTE_delete();

-- ----------------------------------------------------------------------------------------

-- ELIMINAZIONE CONSEGUENTE IN PERSONA DA CANCELLAZIONE DOCENTE

CREATE FUNCTION V_DOCENTE_delete() RETURNS trigger AS
$V_DOCENTE_delete$
declare isError boolean = false;
begin
case
	when TG_TABLE_NAME ilike 'Docente' then
		isError = exists (select * from Persona where old.cf=persona.cf);
	else raise exception 'La funzione non può essere invocata sulla funzione %',TG_TABLE_NAME;
end case;
	if (isError) then delete  from Persona where persona.cf=old.cf;
	end if;
	if (isError) then delete  from nata where nata.cf=old.cf;
	end if;
	if (isError) then delete from email where email.cf=old.cf;
	end if;
return old;
end;
$V_DOCENTE_delete$ language plpgsql;


CREATE TRIGGER V_DOCENTE_delete_trigger
after delete on Docente
for each row execute procedure V_DOCENTE_delete();


commit work;
