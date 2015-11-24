#!/usr/bin/python

# The following class represent a player
class Joueur:
    # This constructor takes as a parameter the record
    # as returned by the postgresSQL database
    # Note: if the record from the DB changes, 
    # this constructor will need to be adapted
    def __init__( self, recordFromDB ):
        self.id = recordFromDB[0]
        self.nom = recordFromDB[1]
        self.datec = recordFromDB[2]
        self.commentaire = recordFromDB[3]

    # Displays the information of a Joueur
    def displayJoueur(self):
            print(
                "Id = ", self.id,
                ", nom = ",self.nom,
                ", date inscription =", self.datec,
                ", commentaire = ", self.commentaire)