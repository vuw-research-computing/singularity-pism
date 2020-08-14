# singularity-pism

Using [singularity](https://sylabs.io/docs/) to build the [parallel ice sheet model (PISM)](https://pism-docs.org/wiki/doku.php) on Scientific Linux 7.

PISM is modern ice sheet model written C++ using [PETSc](https://www.mcs.anl.gov/petsc/). The cmake build system doesn't find the system provided openmpi implementation. 

This repository provides three singularity container definition files. One for basic OpenMPI, one for PETSc and one for PISM.

You can run the container using
```
mpirun -n 4 singularity exec --bind /scratch pism.sif /opt/pism/bin/pismv -test G -y 200
```

This runs PSIM using 4 MPI processes. The `--bind /scratch` option exposes the `/scratch` directory to the container. Other directories can be exposed using the same approach.