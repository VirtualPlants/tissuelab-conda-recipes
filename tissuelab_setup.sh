#!/bin/bash
echo "log file of tissuelab setup" > tissuelab_setup_log.txt
echo "errors file of tissuelab setup" > tissuelab_setup_errors.txt
condaCheck=`which conda`
os=`uname -s`

if [ $os == "Linux" ]
then
        echo "Linux os detected" >> tissuelab_setup_log.txt

	if [ -n "$condaCheck" ]
	then
        	echo "conda is already installed" >> tissuelab_setup_log.txt

	else
        	echo "conda is not installed" >> tissuelab_setup_log.txt
        	echo "start installing conda" >> tissuelab_setup_log.txt



                wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh

                echo "conda will now install tissuelab."
                echo "please follow instructions on the screen by PRESSING ENTER or TYPING YES when requested by the console ..."
                sleep 3s


                bash Miniconda-latest-Linux-x86_64.sh
                CONDA_ROOT=`conda info --root`
                source ${CONDA_ROOT}/bin/activate root

	fi

elif [ "$os" == "Darwin" ]
then

                echo "Mac os detected" >> tissuelab_setup_log.txt


	if [ -n "$condaCheck" ]
	then
        	echo "conda is already installed" >> tissuelab_setup_log.txt

	else
        	echo "conda is not installed" >> tissuelab_setup_log.txt
        	echo "start installing conda" >> tissuelab_setup_log.txt



                wget https://repo.continuum.io/miniconda/Miniconda2-4.3.11-MacOSX-x86_64.sh

                echo "conda will now install tissuelab."
                echo "please follow instructions on the screen by PRESSING ENTER or TYPING YES when requested by the console ..."
                sleep 3s

                bash Miniconda2-4.3.11-MacOSX-x86_64.sh

                CONDA_ROOT=`conda info --root`
                source ${CONDA_ROOT}/bin/activate root


	fi

        
fi
	
echo "installing tissuelab" >> tissuelab_setup_log.txt
echo "downloading tissuelab.yml" >> tissuelab_setup_log.txt
rm tissuelab.yml --force
wget https://raw.githubusercontent.com/VirtualPlants/tissuelab-conda-recipes/master/tissuelab.yml 2>> tissuelab_setup_errors.txt >>tissuelab_setup_log.txt
conda env create -f tissuelab.yml 2>> tissuelab_setup_errors.txt

#echo "activating tissuelab" >> tissuelab_setup_log.txt
#source activate tissuelab

	


