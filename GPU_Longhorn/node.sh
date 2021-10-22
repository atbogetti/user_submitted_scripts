#!/bin/bash

set -x
umask g+r
cd $1; shift
source env.sh
export WEST_JOBID=$1; shift
export SLURM_NODENAME=$1; shift
export CUDA_VISIBLE_DEVICES_ALLOCATED=$1; shift
echo "starting WEST client processes on: "; hostname
echo "current directory is $PWD"
echo "environment is: "
env | sort

#########################################################

# Launch the client process on the GPU
echo "CUDA_VISIBLE_DEVICES = " $CUDA_VISIBLE_DEVICES
$SCRATCH/conda_local/envs/westpa-2.0-restruct/bin/w_run "$@" &> west-$SLURM_NODENAME-node.log

echo "Shutting down.  Hopefully this was on purpose?"
