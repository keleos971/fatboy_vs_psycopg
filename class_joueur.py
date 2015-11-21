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
        self.personnage = recordFromDB[2]
        self.date_inscription = recordFromDB[3]
        self.commentaire = recordFromDB[4]

    # Displays the information of a Joueur
    def displayJoueur(self):
        if self.commentaire == '':
            # If commentaire string is empty, no need to display it
            print("Id =", self.id, ", nom =", self.nom, ", perso =", self.personnage, ", date inscription =", self.date_inscription)
        else:
            print("Id =", self.id, ", nom =", self.nom, ", perso =", self.personnage, ", date inscription =", self.date_inscription, ", commentaire =", self.commentaire)

