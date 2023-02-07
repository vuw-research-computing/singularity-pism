# singularity-pism

Forked from https://git.ecdf.ed.ac.uk/uoe-geos/singularity-pism.  Updated to newer version of PISM and newer openmpi.  

Using [singularity](https://sylabs.io/docs/) to build the [parallel ice sheet model (PISM)](https://pism-docs.org/wiki/doku.php).

PISM is modern ice sheet model written C++ using [PETSc](https://www.mcs.anl.gov/petsc/). The cmake build system doesn't find the system provided openmpi implementation. 

This repository provides three singularity container definition files. One for basic OpenMPI, one for PETSc and one for PISM.

To build this locally, run
```
make pism.sif
```

Note that it will build for the local cpu arch.

To run the resulting container on a slurm based HPC create the sbatch script:

pismtest.sh
```
#!/bin/bash
#SBATCH --job-name=PISM-2.0.6
#SBATCH --ntasks=20
#SBATCH --mem=1GB
#SBATCH --time=01:00:00
#SBATCH --partition=gpu


module load foss/2020b
module load Singularity/3.10.2

mpirun -np $SLURM_NTASKS singularity exec /home/software/containers/PISM-2.0.6-ompi-4.0.5.sif /opt/pism/bin/pismv -test G -y 200```

```
