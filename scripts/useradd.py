#!/usr/bin/python3.8
import os
import subprocess
import sys
users = ['jenkins','sonarqube']
try:
    subprocess.run(['useradd', '-u 1004',  'jenkins' ])
    subprocess.run(['useradd', '-u 1005',  'sonarqube' ])
except:
    print(f"Failed to add user.")
    sys.exit(1)
print("Users were created, Master!")
