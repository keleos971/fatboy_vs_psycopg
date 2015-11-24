/*
To insert data into the table joueur, modifiy the file
joueur.csv and run this script through pgadmin.
WARNING : existing data will be overwritten by default
to prevent this you must comment out the line 'delete from joueur;'
*/

delete from joueur;

copy joueur
  (nom,
  commentaire)
from
  '/home/voxclam/git/fatboy_vs_psycopg/joueur.csv' -- POINT TO THE CSV FILE IN YOUR LOCAL ENVIRONMENT HERE (full path)
  with csv delimiter ';' HEADER;
