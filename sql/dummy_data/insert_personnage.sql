/*
This script allows to insert data into postgresql table public.personnage
from a csv file (configured with ; as delimiter) on the server.

The csv file must onle contain the necessary columns in it and never
take the auto-filled columns like id or datec which are auto-filled
during the insertion server-side.
*/

-- delete from personnage; -- you can wipe the table

copy personnage(  --target table
  nom,  -- target columns
  classe,
  proprietaire,
  pc_cur,
  ph_cur,
  pp_cur,
  pf_cur,
  pc_tot,
  ph_tot,
  pp_tot,
  pf_tot,
  vivant,
  commentaire
)
from
  '/home/sighil/git/sql/dummy_data/personnage.csv' -- path to csv on the server
  WITH NULL AS '' -- empty csv cells will be considered as null
  DELIMITER AS ';' -- must match the csv configuration (either space or ;)
  csv -- tells that the input file is csv
  HEADER; -- to ignore the first row of the csv file, with column names
