#!/bin/python
"""Class Docstring"""

################################################################
##                        Open Board                          ##
################################################################
##                                                            ##
## This program will emulate a scrum board that is used day   ##
## on agile software teams. It will take in command line      ##
## arguments and store the messages in a database depending   ##
## on which option is selected. You can also view the         ##
## stored information based off of the options entered.       ##
##                                                            ##
## @Author: Aaron Earl                                        ##
## Western Oregon University                                  ##
## CS460-1-2 ==> Senior Sequence                              ##
##                                                            ##
################################################################

import sys, time
from Daemon import Daemon

class MyDaemon(Daemon):
	def run(self):
		while True:
			time.sleep(1)

#Class variables
arglist = {"--Show", "--Create", "--Add", "--Help", "--ShowAll", "--Delete",\
            "--Edit", "--A", "--D", "--C", "--E", "--S", "--SA", "--H"}
"""
def main():
    args = sys.argv[1:] #Get all incoming arguments

    for i in range(len(args)):
        if(args[i] in arglist):
            print("Hello World!")
        else:
            print("Valid Arguments: \n")
            for item in arglist:
                print(item + "\n")
"""


if __name__ == "__main__":
    """Main Docstring"""
    daemon = MyDaemon('/tmp/daemon-example.pid')
if len(sys.argv) == 2:
    if('start' == sys.argv[1]):
        daemon.start()
    elif('stop' == sys.argv[1]):
        daemon.stop()
    elif('restart' == sys.argv[1]):
        daemon.restart()
    elif('--Help' == sys.argv[1]):
        print("Response")
    else:
        print("Unknown command")
        sys.exit(2)
    sys.exit(0)
else:
    print("usage: %s start|stop|restart" % sys.argv[0])
    sys.exit(2)








