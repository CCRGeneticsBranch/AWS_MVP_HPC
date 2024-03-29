#! /bin/bash


# Define user input
function usage() {
    echo "USAGE: $0  --fastqdir [optional: /path/to/fastq/dir] --resultsdir [optional: /path/to/App/results/dir]"
}

function fail() {
    echo "$@"
    exit 1
}



if [ $# -eq 0 ]; then
    usage
    exit 0
fi



## Default values

FASTQ=/data/khanlab/projects/fastq/*_{R1,R2}.fastq.gz
RESULTS=/data/khanlab/projects/Nextflow_test/results

	

#while [ "$1" != "" ]; do
#    case $1 in
#        --fastqdir )	shift
#			FASTQ=$1
#			;;
#        --resultsdir )	shift
#			RESULTS=$1
#			;;
#        -h | --help )	usage
#			exit
#    esac
#    shift
#done


## export variables

export FASTQ
export RESULTS

echo Fastqdir: $FASTQ
echo Results: $RESULTS

## check if results directory exists

if [ ! -d "$RESULTS" ]; then
    fail "Could not find results folder $RESULTS/"
fi


## load the modules and launch nextflow
module load nextflow singularity

nextflow -log $RESULTS/log/"Nextflow_$(date +"%Y_%m_%d_%I_%M_%p").log" run --reads $FASTQ --resultsdir $RESULTS -profile biowulf main.nf -resume



