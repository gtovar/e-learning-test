#!/usr/local/bin/python

import os, shutil

def check_dir(path):
    for dir_name in os.listdir(path):
		dir_path = os.path.join(path, dir_name) 
		if(os.path.isdir(dir_path)):
			if (dir_name == ".svn"):
				print "Delete: ", dir_path
				shutil.rmtree(dir_path)
			else:
				check_dir(dir_path)
		elif(os.path.isfile(dir_path)):
			if (dir_name == "Thumbs.db"):
				print "Delete: ", dir_path
				os.remove(dir_path)

check_dir(os.getcwd())