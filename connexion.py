# Created 2015 16 11 
# Last modified 2015 19 11
# connexion.py
# voxclam.indes@gmail.com
#
# this simple script is a test to pull table contents from fatboy,
# a postgresql database.
#
# sources used :
# https://wiki.postgresql.org/wiki/Using_psycopg2_with_PostgreSQL
# ----------------------------------------------------------------

#!/usr/bin/python
import psycopg2
import sys
import pprint
 
def main():
	
	userLogin=input("userLogin : ")
	userPass=input("userPass : ")
	conn_string = "host='localhost' dbname='fatboy_dev' user='%s' password='%s'" %(userLogin,userPass)
	# print the connection string we will use to connect
	print ("Connecting to database")
 
	# get a connection, if a connect cannot be made an exception will be raised here
	conn = psycopg2.connect(conn_string)
 
	# conn.cursor will return a cursor object, you can use this cursor to perform queries
	cursor = conn.cursor()
 
	# execute our Query
	cursor.execute("select * from joueur")
 
	# retrieve the records from the database
	records = cursor.fetchall()
 
	# print out the records using pretty print
	# note that the NAMES of the columns are not shown, instead just indexes.
	# for most people this isn't very useful so we'll show you how to return
	# columns as a dictionary (hash) in the next example.
	pprint.pprint(records)
 
if __name__ == "__main__":
	main()
