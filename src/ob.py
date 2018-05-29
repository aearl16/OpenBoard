#!/bin/python
"""Class Docstring"""

################################################################
##                        Open Board                          ##
################################################################
##                                                            ##
## This program will emulate a scrum board that is used every ##
## day on agile software teams. It will take in command       ##
## line arguments and store the messages in a database        ##
## depending on which option is selected. You can also        ##
## view the stored information based off of the options       ##
## entered.                                                   ##
##                                                            ##
## @Author: Aaron Earl                                        ##
## Western Oregon University                                  ##
## CS460-1-2 ==> Senior Sequence                              ##
##                                                            ##
################################################################

import sys, time
from datetime import datetime
from Daemon import Daemon
from dbCommander import dbCommander

class MyDaemon(Daemon):
	def run(self):
		while True:
			time.sleep(1)

#Class variables
arglist = {"--Show", "--Create", "--Add", "--Help", "--ShowAll", "--Delete",\
            "--Edit", "--A", "--D", "--C", "--E", "--S", "--SA", "--H"}

if __name__ == "__main__":
    """Main Docstring"""
    daemon = MyDaemon('/tmp/ob-daemon.pid')
    # For now server data remains hard coded until data 
    # is parsed from a config file
    db = dbCommander()
if len(sys.argv) != 0:
    if('start' == sys.argv[1]):
        daemon.start()
    elif('stop' == sys.argv[1]):
        del db
        daemon.stop()
    elif('restart' == sys.argv[1]):
        daemon.restart()
    elif('--Help' == sys.argv[1]):
        print("Valid Arguments: \n")
        for item in arglist:
            print(item + "\n")
    elif('--Create' == sys.argv[1] or '--C' == sys.argv[1] and '--Board' == sys.argv[2]):
        #Used mysql NOW() for inserting datetime
        db.statementCommit("INSERT INTO ScrumBoard (CreationDate)\
        VALUES(NOW());")
        print("Success!\n")
    elif('--Create' == sys.argv[1] or '--C' == sys.argv[1] and '--Backlog' == sys.argv[2]):
        db.statementCommit("INSERT INTO Backlog (CreationDate)\
        VALUES(NOW());")
        print("Success!\n")
    elif('--Add' == sys.argv[1] or '--A' == sys.argv[1] and 'Backlog' == sys.argv[2]):
        db.statementCommit("UPDATE ScrumBoard SET BacklogID = " + "'" + str(sys.argv[3]) + "'" + "WHERE BoardID = " + "'" + str(sys.argv[4]) + "'" + ";")
        print("Success!\n")
    elif('--ShowAll' == sys.argv[1] or '--SA' == sys.argv[1]):
        if('--Board' == sys.argv[2]):
            outlist = db.queryToList("SELECT * FROM ScrumBoard")
            #Add some space btween the command line and the entry
            print("\n")
            #Print the header
            print("####################################################\n" +
                  "##                 Scrum Boards                   ##\n" +
                  "####################################################\n")
            #Print the items from the board
            for board in outlist:
                print(board)
                print("\n")
        elif('--Backlog' == sys.argv[2]):
            outlist = db.queryToList("SELECT * FROM Backlog;")
            #Add some space btween the command line and the entry
            print("\n")
            #Print the header
            print("####################################################\n" +
                  "##                   Backlogs                     ##\n" +
                  "####################################################\n")
            #Print the items from the board
            for log in outlist:
                print(log)
                print("\n")
        else:
            print("Correct Command Unknown Arguments")
    elif('--Delete' == sys.argv[1] or '--D' == sys.argv[1] and '--Board' == sys.argv[2]):
        userPrompt = input("Are you sure? (y/n): ")
        if(userPrompt == 'y' or userPrompt == 'Y'):
            db.statementCommit("DELETE FROM ScrumBoard WHERE BoardID = " + "'" + str(sys.argv[3]) + "'" + ";")
            print("Success!\n")
        elif(userPrompt == 'n' or userPrompt == 'N'):
            print("Canceled")
        else:
            print("Incorrect Input Exiting")
    else:
        print("Unknown command")
        sys.exit(2)
    sys.exit(0)
else:
    print("usage: %s start|stop|restart" % sys.argv[0])
    sys.exit(2)








