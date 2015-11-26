/*
Just a simple view prompting who owns which character
*/

create or replace view proprietaire_personnage as
  (
    select
      joueur.nom "nom_joueur",
      personnage.nom "nom_personnage"
    from
      joueur join personnage on joueur.id = personnage.proprietaire
    where personnage.vivant = true
  );
