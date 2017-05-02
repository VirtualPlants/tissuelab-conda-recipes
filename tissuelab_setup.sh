#!/bin/bash
echo "log file of tissuelab setup" > tissuelab_setup_log.txt
echo "errors file of tissuelab setup" > tissuelab_setup_errors.txt
condaCheck=`which conda 2>&1 | grep 'no conda'`
echo $condaCheck
echo "checking if conda is already installed" >> tissuelab_setup_log.txt
if [ -z $condaCheck ] 
then
	echo "conda is already installed" >> tissuelab_setup_log.txt

else
	echo "conda is not installed" >> tissuelab_setup_log.txt
	echo "start installing conda" >> tissuelab_setup_log.txt
	
	os=`uname -s`
	if [ $os == "Linux" ]
	then
	
		echo "Linux os detected" >> tissuelab_setup_log.txt 

		wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh

		echo "conda will now install tissuelab."
		echo "please follow instructions on the screen by PRESSING ENTER or TYPING YES when requested by the console ..."
		sleep 5s


		bash Miniconda-latest-Linux-x86_64.sh

	elif [ $os == "Darwin" ]
	then
		echo "Mac os detected" >> tissuelab_setup_log.txt         

		wget https://repo.continuum.io/miniconda/Miniconda-latest-MacOSX-x86_64.sh
	
                echo "conda will now install tissuelab."
                echo "please follow instructions on the screen by PRESSING ENTER or TYPING YES when requested by the console ..."
                sleep 5s

		bash Miniconda-latest-MacOSX-x86_64.sh

	fi
	
	CONDA_ROOT=`conda info --root`
	source ${CONDA_ROOT}/bin/activate root
	echo "end installing conda" >> tissuelab_setup_log.txt
	source ~/.bashrc
fi
	
echo "installing tissuelab" >> tissuelab_setup_log.txt
echo "downloading tissuelab.yml" >> tissuelab_setup_log.txt
wget https://raw.githubusercontent.com/VirtualPlants/tissuelab-conda-recipes/master/tissuelab.yml 2>> tissuelab_setup_errors.txt >>tissuelab_setup_log.txt
conda env create -f tissuelab.yml 2>> tissuelab_setup_errors.txt
echo "activating tissuelab" >> tissuelab_setup_log.txt
source activate tissuelab
echo "launching tissuelab" >> tissuelab_setup_log.txt
oalab &
exit(0)
