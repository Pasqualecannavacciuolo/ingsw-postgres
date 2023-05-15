CREATE TABLE public.personale (
	id int4 NOT NULL,
	ruolo varchar NULL,
	nome_utente varchar NULL,
	"password" varchar NULL,
	modificato_da timestamp NULL,
	modificato_il timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	nome varchar NULL,
	cognome varchar NULL,
	email varchar NULL,
	primo_accesso int4 NULL DEFAULT 1,
	CONSTRAINT personale_pkey PRIMARY KEY (id)
);

CREATE TABLE public.piatto (
	id int4 NOT NULL,
	nome varchar NULL,
	costo numeric NULL,
	descrizione varchar NULL,
	CONSTRAINT piatto_pkey PRIMARY KEY (id)
);

CREATE TABLE public.allergene (
	nome varchar NOT NULL,
	CONSTRAINT allergene_pkey PRIMARY KEY (nome)
);

CREATE TABLE public.piatto_allergene (
	id_piatto int4 NULL,
	nome_allergene varchar NULL,
	CONSTRAINT piatto_allergene_fk FOREIGN KEY (id_piatto) REFERENCES public.piatto(id),
	CONSTRAINT piatto_allergene_fk_1 FOREIGN KEY (nome_allergene) REFERENCES public.allergene(nome)
);

CREATE TABLE public.tavolo (
	numero int4 NOT NULL,
	CONSTRAINT tavolo_pkey PRIMARY KEY (numero)
);

CREATE TABLE public.ordinazione (
	id_piatto int4 NULL,
	numero_tavolo int4 NULL,
	data_ordine timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT ordinazione_fk FOREIGN KEY (id_piatto) REFERENCES public.piatto(id),
	CONSTRAINT "ordinazione_fk-1" FOREIGN KEY (numero_tavolo) REFERENCES public.tavolo(numero)
);