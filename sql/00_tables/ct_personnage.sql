/*
Script creating the postgresql table 'personnage'
personnage are characters impersonated by players.
a player can only have one current char alive, but
can have multiple chars throughout the game.

TODO :
Consider adding a field for legacy (ie who's the father)
Consider a char state different from 0 alive 1 dead. May be alive but abandoned by player ?
*/

DROP TABLE personnage CASCADE;
CREATE TABLE personnage
(
  id serial PRIMARY KEY,  -- unique id. pkey option means not null + unique
  nom character varying(50) NOT NULL,  -- name of the character
  datec timestamp without time zone DEFAULT now(), -- date of creation
  classe character varying(50) NOT NULL, -- char class (noble, merchant, etc)
  proprietaire integer NOT NULL REFERENCES joueur (id), -- unique id of the player who owns the char. with foreign key constraint
  pc_cur integer NOT NULL, -- current 'points de commerce pc'
  ph_cur integer NOT NULL, -- current 'points d'honneur ph'
  pp_cur integer NOT NULL, -- current 'points de piété pp'
  pf_cur integer NOT NULL, -- current 'points de florins pf' = money
  pc_tot integer NOT NULL, -- total 'points de commerce pc' ever spent
  ph_tot integer NOT NULL, -- total 'points d'honneur ph' ever spent
  pp_tot integer NOT NULL, -- total 'points de piété pp' ever spent
  pf_tot integer NOT NULL, -- total 'points de florins pf' ever spent
  vivant boolean NOT NULL, -- is he alive ? char are never deleted from the base, they are archived.
  commentaire character varying(400)
)
WITH (
  OIDS=FALSE
);

/*
SQL CODE TAKEN FROM pgAdminIII TABLE CREATION PANEL
NOTE THE AUTOMATICALLY ADDED CONSTRAINTS

-- Table: personnage

-- DROP TABLE personnage;

CREATE TABLE personnage
(
  id serial NOT NULL,
  nom character varying(50) NOT NULL,
  datec timestamp without time zone DEFAULT now(),
  classe character varying(50) NOT NULL,
  proprietaire integer NOT NULL,
  pc_cur integer NOT NULL,
  ph_cur integer NOT NULL,
  pp_cur integer NOT NULL,
  pf_cur integer NOT NULL,
  pc_tot integer NOT NULL,
  ph_tot integer NOT NULL,
  pp_tot integer NOT NULL,
  pf_tot integer NOT NULL,
  vivant boolean NOT NULL,
  commentaire character varying(400),
  CONSTRAINT personnage_pkey PRIMARY KEY (id),
  CONSTRAINT personnage_proprietaire_fkey FOREIGN KEY (proprietaire)
      REFERENCES joueur (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE personnage
  OWNER TO postgres;

*/
