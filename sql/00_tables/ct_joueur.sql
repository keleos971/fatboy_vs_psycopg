/*
Table: joueur
Lists all the active players in the game.
personnage.proprietaire DEPENDS on joueur.id
*/

DROP TABLE IF EXISTS joueur CASCADE;
CREATE TABLE joueur
(
  id serial NOT NULL PRIMARY KEY,
  nom character varying(50) NOT NULL, -- only aliases ! (bc legal reasons)
  datec timestamp without time zone DEFAULT now(), -- creation date
  mail character varying(30), -- contact email
  commentaire character varying(400)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE joueur
  OWNER TO postgres;


/*
SQL CODE TAKEN FROM pgAdminIII TABLE CREATION PANEL
NOTE THE AUTOMATICALLY ADDED CONSTRAINTS

-- Table: joueur

-- DROP TABLE joueur;

CREATE TABLE joueur
(
  id serial NOT NULL,
  nom character varying(50) NOT NULL,
  datec timestamp without time zone DEFAULT now(),
  commentaire character varying(400),
  CONSTRAINT joueur_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE joueur
  OWNER TO postgres;

*/
