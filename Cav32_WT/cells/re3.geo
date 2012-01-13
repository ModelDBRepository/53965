/*----------------------------------------------------------------
  Geometry file for thalamic reticular neuron

  - 3 compartments
  - 1 soma, 1 proximal dendrite, 1 distal dendrite

  Obtained from merging the cell from rat nRt, stained by Huguenard & Prince, 
  Stanford.  The cell was traced in the Salk Institute by A. Destexhe.
  Starting from a 800 compartment cell, the geometry was reduced
  into an equivalent geometry of 10 compartments, by the method
  of Bush & Sejnowski (J Neurosci Methods 46: 159-166, 1993).  
  In a second step, the 10-compartment geometry was merged into 3 compartments
  using the same method.

  Structure of the reduced compartmental model:


	1--0 1--0   1--0
	 (dend1)   (soma)

  Length and diameters:
  ---------------------

	Soma :		L=34.546	diam=14.075	S=1527.55
	dend1[0] : 	L=103.24	diam=5.56	S=1803.32
	dend1[1] : 	L=190.69	diam=3.06	S=3636.475

	=> total dendritic surface = 5439.794 um2
	   The reconstructed cell was 13302.9 um2

	=> reduction factor for dendrites is 2.445

  Input resistance:
  -----------------

	dendritic correction		Ri (Mohms)

		1			400
		2.445			214
		3			180
		3.5			158
		4			143



  For more details, see:

  Destexhe, A., Contreras, D., Steriade, M., Sejnowski, T.J. and Huguenard,
  J.R.  In vivo, in vitro and computational analysis of dendritic calcium
  currents in thalamic reticular neurons.  J. Neurosci. 16: 169-185, 1996.

  See also:

  http://www.cnl.salk.edu/~alain
  http://cns.fmed.ulaval.ca

----------------------------------------------------------------*/

print "----------------------------------------------"
print "Simplified reticular cell with 3 compartments"
print "----------------------------------------------"



/* create compartments (sections) */

create soma[1], \
       dend1[2]

/* connect compartments */

soma connect dend1[0](0),1
dend1[0] connect dend1[1](0),1



/* setup 3d geometry : */

soma {			/* define soma first */
  nseg = 1
  pt3dclear()
  pt3dadd(0, 0, 0, 14.0754)	 	/* x,y,z,diam */
  pt3dadd(0, 34.546, 0, 14.0754)
}



dend1[0] {			/* beginning dendrites */
  nseg = 1
  pt3dclear()
  pt3dadd(0, 34.546, 0, 5.56)
  pt3dadd(0, 137.786, 0, 5.56)
}

dend1[1] {			/* beginning dendrites */
  nseg = 1
  pt3dclear()
  pt3dadd(0, 137.786, 0, 3.06)
  pt3dadd(0, 328.476, 0, 3.06)
}



