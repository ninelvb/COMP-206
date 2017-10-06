#!/bin/bash

#checking if no arguments are given as input
if [ $# -ne 1 ]; then
               echo "Insufficient arguments."
               exit 1
fi

#checking if more than 1 argument is given as input
if [ $# > 1 ]; then
               echo "Your project name must be a single word."
               exit 1
fi

name = $1

#changing directory to home directory
if ![$HOME == $PWD]; then
               cd $HOME
               echo "You are in your home directory!"
fi

#check if subdirectory project exists then move to it
if [-d 'project']; then
               cd project
#if not create and change to project
else
               mkdir project
               cd project
fi

#check if subdirectory cs206 exists then move to it
if [-d 'cs206']; then
               cd cs206
#if not create and change to cs206
else
               mkdir cs206
               cd cs206
fi

#if subdirectory $name exists, exit
if [-d $name]; then
               echo "This project name has already been used."
#else create the subdirectory $name and inside other subdirectories
else
               mkdir $name
               cd $name
               mkdir archive backup docs assets database source
fi

#changing to source subdirectory
cd source

#within source, creating backup.sh file to copy all .c and .h files to backup
cat > backup.sh << endbackup
               #!/bin/bash
               cp *.c ../backup/
               cp *.h ../backup/
endbackup

#end of file creation
echo "Your project directories have been created."
