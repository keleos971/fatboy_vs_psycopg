-- sql_ctJOUEUR.sql
-- created : 2015 11 19
-- modified :
-- test SQL & PGPLSQL script for the creation of public.joueur
-- and sequence for unique serial key


-- sequence joueur_id increments at every insert into table joueur
-- used by id field in create table joueur
drop sequence joueur_id;
create sequence joueur_id;

-- table joueur
drop table joueur;
create table public.joueur(
        id integer PRIMARY KEY DEFAULT nextval('joueur_id'),        -- unique id
        nom varchar(50) NOT NULL,       -- player's real name (only last name)
        personnage varchar(50) NOT NULL,        -- player's current character name
        date_inscription timestamp default current_timestamp,
        commentaire varchar(400));
