#!/usr/bin/python3.8
import os
import subprocess
import sys
users = ['jenkins','sonarqube']
for x in users:
    try:
        subprocess.run(['useradd', x ])
    except:
        print(f"Failed to add user.")
        sys.exit(1)
print("Users were created, Master!")
