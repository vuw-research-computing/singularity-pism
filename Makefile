
pism.sif:	petsc.sif
petsc.sif:	openmpi.sif


%.sif:	%.def
	sudo singularity build $@ $<
