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
    elif('--ShowAll' == sys.argv[1] or '--SA' == sys.argv[1] and '--Board' == sys.argv[2]):
        outlist = db.queryToList("SELECT * FROM ScrumBoard")
        for board in outlist:
            print(board)
            print("\n")
    else:
        print("Unknown command")
        sys.exit(2)
    sys.exit(0)
else:
    print("usage: %s start|stop|restart" % sys.argv[0])
    sys.exit(2)








