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

CREATE TABLE "piatto" (
  "id" integer PRIMARY KEY unique not null,
  "nome" varchar,
  "costo" decimal,
  "descrizione" varchar
);

CREATE TABLE "allergene" (
  "nome" varchar PRIMARY KEY unique not null
);

CREATE TABLE "piatto_allergene" (
  "id_piatto" integer,
  "nome_allergene" varchar
);

CREATE TABLE "tavolo" (
  "numero" integer PRIMARY KEY unique not null
);

CREATE TABLE "ordinazione" (
  "id_piatto" integer,
  "numero_tavolo" varchar,
  "data_ordine" timestamp
);

