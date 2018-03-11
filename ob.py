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

import sys

#Class variables
arglist = {"--Show", "--Create", "--Add", "--Help", "--ShowAll", "--Delete",\
            "--Edit", "--A", "--D", "--C", "--E", "--S", "--SA", "--H"}

def main():
    """Main Docstring"""

    args = sys.argv[1:] #Get all incoming arguments

    for i in range(len(args)):
        if(args[i] in arglist):
            print("Hello World!")
        else:
            print("Valid Arguments: \n")
            for item in arglist:
                print(item + "\n")


if __name__ == "__main__":
    """Call to main"""
    main()








