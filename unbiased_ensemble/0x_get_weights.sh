#!/bin/bash
plumed driver --mf_xtc ../metad.xtc --plumed inputs/reweight.dat --kt 2.494339
[ -e HILLS ] && echo 'ERROR: HILLS file was generated, which may be due to not specifying RESTART=YES in your PLUMED file.'
