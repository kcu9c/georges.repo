#!/bin/sh
export localRepoRoot="/home"
export userID=$1
export repo=$2
firstRun=1;

# HOW TO:
# 1. copy setup_git.sh to your portablegit64 folder
# 2. double click git-bash.exe
# 3. type (this step is only required once):
#	sh setup_git.sh username repo_name
# 4. Windows explorer will open up to your git repo
# 5. conduct your work like normal, with git-bash.exe
#	minimized.
# 6. when done developing for the day, simply type
#	inside the git-bash.exe windows:
#	git commit -a -m "summery of work completed"
#	git push
#
# ********************************************
# * simple bash shell script that intializes *
# * portable git installation. created by    *
# * george.                                  *
# ********************************************
#
# This program modifies your local hard drive 
# in two ways, first by creating a "Git Projects"
# directory in your "My Documents" folder and
# second by storing a file called .gitscript.config
# in your portable git directory.
#
# However, it does not store any sensitive 
# information. The configuration file only
# contains your username for github.com &
# the name of your repo.

if [ -d "$localRepoRoot" ]
then
	#not first run, grab config
	source ./.gitscript.config
	firstRun=0;
else if [ ! $1 ] || [ ! $2 ]
	then
		echo "NAME: setup_git.sh"
		echo "SYNOPSIS: setup_git.sh user_name repo_name"
		exit
	fi
fi
if [ $firstRun -eq 1 ] 
then
	echo "Initializing git environment localy for future execution."
 	mkdir -p -v "$localRepoRoot"
	if [ ! $? ] 
	then
		echo "Error creating folder structure for local git repo, file a bug report (George on canvas)."
	fi
	echo "Created a folder called \"Git Projects\" within your \"My Documents\" folder."
	echo "It contains our organizations root folder, incase you feel like cloning other repos."
	echo "This is where your repo is stored, for savinging your work."
	#saving configuration for future run
	if [ ! -f ".gitscript.config" ]
	then
		touch ".gitscript.config"
	fi
	if [ ! $? ]
	then
		echo "Error creating config file for git script, file a bug report (George on canvas)."
	fi
	echo "userID=$userID" >> ".gitscript.config"
	echo "repo=$repo" >> ".gitscript.config"
	cd "$localRepoRoot"
	git clone "https://github.com/BytingBucs/$repo" 
else
	if [ $1 == "upload" ]
	then
		cd "$localRepoRoot/$repo"
		git add *
		git add */*
		git add */*/*
		# deep than three folders in? Fuck 'em, they should have learned git
		git commit -a -m "saved work"
		git push
	else
		echo "Pulling the repo of $userID, called $repo, to ensure you have the newest copy."
		cd "$localRepoRoot"
		cd "$repo"
		git pull
		echo "You can type the following to save your work when done."
		echo "sh setup_git.sh upload"
	fi
fi
echo "Any point at which a window pops up or a prompt shows with this window, asking for a username, it is being requested from the git-bash.exe executable and not from this script."

