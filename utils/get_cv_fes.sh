#!/bin/bash 
set -eu 
#plumed sum_hills --hills HILLS --mintozero
#plumed sum_hills --hills HILLS --stride 100 --mintozero
## stride 1000 : calculate a fes at every 100 Gaussian deposited.
##     ex. if Gaussian is deposited at every 500 steps, `--stride 100` generates FE surfaces at every 5*10^4 steps (1fs*5*10^4 = 0.05 ns)
#mv fes*.dat outputs

plumed sum_hills --hills HILLS --idw alphapsi --kt 2.494339 --mintozero --stride 5000 --outfile fes_psi
plumed sum_hills --hills HILLS --idw alphaphi --kt 2.494339 --mintozero --stride 5000 --outfile fes_phi

