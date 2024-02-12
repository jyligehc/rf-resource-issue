"""
Created on 4.6.2013

@author: aa013031

This module can be used to run Robot Framework from Eclipse environment
"""
import sys

from robot.run import run_cli

if __name__ == "__main__":
    run_cli(sys.argv[1:])
