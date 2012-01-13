/*----------------------------------------------------------------
  Geometry file for thalamic reticular neuron

  - 1 compartment (soma)

  Length and diameters:
  ---------------------

	Soma :		L=64.86	um	diam=70 um2	S=14263 um2

	   Reconstructed RE cell was of 13302.9 um2

  For more details, see:

  Destexhe, A., Contreras, D., Steriade, M., Sejnowski, T.J. and Huguenard,
  J.R.  In vivo, in vitro and computational analysis of dendritic calcium
  currents in thalamic reticular neurons.  J. Neurosci. 16: 169-185, 1996.

  See also:

  http://www.cnl.salk.edu/~alain
  http://cns.fmed.ulaval.ca

----------------------------------------------------------------*/

print "----------------------------------------------"
print "Simplified reticular cell with 1 compartment"
print "----------------------------------------------"



/* create compartments (sections) */

create soma[1]

soma {
  nseg = 1
  diam = 70
  L = 64.86
}

