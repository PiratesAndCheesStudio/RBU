# This script builds the rbu pbos
# Down here comes the config
# Please dont push this to the master!!!!!!

#==============================#
#			CONFIG			   #
#==============================#

ToolPath = "D:/Steam/steamapps/common/Arma 3 Tools"
AddonDir = "P:/Addons/jtog_hunger_buddy/code"
BuildPath = "D:/Steam/steamapps/common/Arma 3/@HungerBuddy/AddOns/"
IncludePath = "P:/Addons/jtog_hunger_buddy/devTools/include.txt"

#==============================#
#			DONT TOUCH		   #
#==============================#
import os, sys, subprocess

def main():
	print("###########################")
	print("###PBO BUILDER STARTS NOW###")
	print("###########################")
	
	for p in os.listdir(AddonDir):
		
		path = os.path.join(AddonDir, p)
		
		#Check if its not a dir
		if not os.path.isdir(path):
			continue
		print("Start Now with {} to build".format(p))
		
		#print("{}/{}".format(AddonDir, p))
		
		try:
			subprocess.check_output([
				"{}/AddonBuilder/AddonBuilder.exe".format(ToolPath),
				"{}/{}".format(AddonDir, p),
				"{}".format(BuildPath),
				"-clear",
				"-include={}".format(IncludePath)
			], stderr=subprocess.STDOUT)
		except:
			print("Failed to make {}".format(p))
		else:
			print("Successfully made {}".format(p))

if __name__ == "__main__":
    sys.exit(main())