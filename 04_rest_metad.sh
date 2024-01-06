#!/bin/bash 
#$ -S /bin/bash
#$ -cwd
#$ -l h_rt=24:00:00
#$ -l q_node=1
##$ -g hp230064
#$ -N restart_metad
#$ -o metad_out
set -eu 
. /etc/profile.d/modules.sh
module load cuda/11.2.146
module load python/3.8.3
module load gcc/8.3.0
module load cmake/3.21.3
module load openmpi intel-mpi/21.8.0
export CC=`which gcc`
export CXX=`which g++`
. ~/.bashrc

#export PATH=/gs/hs1/hp230064/siida/software/gro-plumed/build/bin:$PATH
#export LD_LIBRARY_PATH=/gs/hs1/hp230064/siida/software/gro-plumed/build/lib:$LD_LIBRARY_PATH
export PATH=/gs/hs1/hp230064/siida/software/gromacs-2022.5-plumed-2.8.3/build/bin:$PATH
export LD_LIBRARY_PATH=/gs/hs1/hp230064/siida/software/gromacs-2022.5-plumed-2.8.3/build/lib:$LD_LIBRARY_PATH

GMX=gmx_mpi 

${GMX} convert-tpr -s metad.tpr -until 300000 -o metad.tpr
${GMX} mdrun -deffnm metad -s metad.tpr -cpi metad.cpt -plumed inputs/rest_metad.dat
