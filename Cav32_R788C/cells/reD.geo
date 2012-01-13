/*----------------------------------------------------------------

  Geometry file for thalamic reticular neuron

  - 8 compartments
  - 2 dendrites

  Cell from rat nRt, stained by Huguenard & Prince, Stanford [1], and
  traced at the Salk Institute by A. Destexhe.  Starting from a 80 
  compartment cell, the geometry was reduced into a simpler geometry 
  equivalent to dissociated cells.  The full and dissociated cells are 
  depicted in [1]. 

  The dissociated cell was obtained by the following method:

  - the full cell has an input capacitance of 69 pF, whereas 
    dissociated cells have 17.1 pF on average [1].

  - if one assumes that the input capacitance is proportional to the
    area of the cell, then a typical dissociated cell must have an area of:
    14830.5 um2 * 17.1 / 69 = 3675.4 um2

  - this area was obtained from the full geometry by keeping the thickest
    and most proximal dendrites in order to match this area.  The aspect
    of the dissociated cell was consistent with the pictures given in [1]

  In the dissociated cell, the soma, dend1[0,1,2,3] and dend3[0,1,7] were
  kept from the original and renamed soma, dend1[0,1,2,3], and dend2[0,1,2],
  repectively.  The total membrane area is of 3638.7 um2.

  Structure of the reduced compartmental model:


 (dend1)  1--0 1--0 1--0 1--0

 (dend2)       1--0 1--0 1--0

 (soma)                       1--0

  This model is described in [2]

  Alain Destexhe, The Salk Institute, Dec 1994



  [1] Huguenard, JR and Prince, DA. A novel T-type current undelies prolonged
      calcium-dependent burst firing in GABAergic neurons of rat thalamic
      reticular nucleus.  J. Neurosci. 12: 3804-3817, 1992.

  [2] Destexhe, A., Contreras, D., Steriade, M., Sejnowski, T.J. and 
      Huguenard, J.R.  In vivo, in vitro and computational analysis of 
      dendritic calcium currents in thalamic reticular neurons.
      J. Neurosci. 16: 169-185, 1996.

  See also:

  http://www.cnl.salk.edu/~alain
  http://cns.fmed.ulaval.ca

----------------------------------------------------------------*/

					/* make geometry explicit */
primary_branches_cell = 2
branches_cell = 8
nseg_cell = 8
double sections_cell[2]
sections_cell[0] = 4
sections_cell[1] = 3
nsec_cell = 8

strdef name_soma, name_section
name_soma = "soma"
name_section = "dend"
use_axon = 0					/* create sections */
create    soma,\
          dend1[4],\
          dend2[3]



/*----------------------------------------------------------------*/
proc geometry() { local i, j

						/* soma geometry */
    soma {
        nseg = 1
        pt3dclear()
        for j = 1, fscan() {
            pt3dadd(fscan(),fscan(),fscan(),fscan())
        }
    }

	print "soma read"

					/* connect primary neurites */
    soma connect dend1[0] (0), 0.5
    soma connect dend2[0] (0), 0.5


					/* neurite geometry*/
    for i = 0,3 {
        dend1[i] {
            nseg = fscan()
            pt3dclear()
            for j = 1, fscan() {
                pt3dadd(fscan(),fscan(),fscan(),fscan())
            }
        }
    }

	print "dend1 read"

    for i = 0,2 {
        dend2[i] {
            nseg = fscan()
            pt3dclear()
            for j = 1, fscan() {
                pt3dadd(fscan(),fscan(),fscan(),fscan())
            }
        }
    }

	print "dend2 read"

					/* branching topology*/
    for i = 1,3 {
        dend1[fscan()] connect dend1[i] (0), fscan()
    }

    for i = 1,2 {
        dend2[fscan()] connect dend2[i] (0), fscan()
    }

}

geometry()


SOMA COORDINATES AND DIAMETERS:

    33
     -26      1.5     16.5        0
     -26     0.75     17.5      2.5
   -25.5        1       18        5
     -25    0.625       19   8.0039
   -24.5     0.25       19   9.8615
   -23.5    -0.25       19    11.63
   -22.5     -0.5   18.833   12.875
     -22   -0.625    18.75   13.521
   -20.5    -1.25    18.75    16.14
   -18.5    -1.35    18.75   18.263
     -18  -1.4375    18.75   18.675
   -16.5     -1.5   18.625    19.47
     -15    -1.75     18.5   19.906
   -14.5  -1.7917     18.5   19.988
     -13  -1.9167     20.5   19.833
     -12       -2       21   20.025
   -11.5    -1.75    21.75   20.555
     -10     -1.5    20.75    21.29
    -8.5  -1.4375       21   20.519
      -8  -1.4167       21   20.233
      -7     -1.5       21   19.416
      -6    -1.25     20.5   17.755
    -5.5    -1.25   20.167   16.714
    -4.5  -1.4167       20   15.134
      -4     -1.5   19.917   14.354
      -3  -1.3333    19.75    12.18
    -2.5   -1.375    19.75   10.831
      -2    -1.25       20   9.3941
      -2    -1.25       21   8.7321
    -1.5       -2    22.25   5.0249
    -1.5       -1       23   3.6056
    -1.5    -0.25     22.5   1.8028
    -1.5      0.5       22        0


NEURITE COORDINATES AND DIAMETERS:

    1 2
      -3        7       -6        7
    -5.5        6       -6        7

    1 13
    -5.5        6       -6        7
    -5.5      3.5       -6      6.4
      -6      1.5       -6      5.5
      -7     -0.5     -6.5      5.3
      -8       -2       -7      4.5
      -9     -3.5     -7.5      4.3
     -10     -5.5       -7      4.3
     -11     -7.5     -6.5      4.3
     -12       -9       -6      4.3
     -13      -11     -6.5      4.3
   -14.5    -12.5       -7      4.3
   -16.5      -14       -8        4
   -18.5    -15.5     -8.5      4.6

    1 9
   -18.5    -15.5     -8.5      4.6
   -20.5    -15.5      -11      3.5
     -23      -16      -13      3.5
     -24      -17      -16      3.5
     -24      -18    -20.5      3.5
   -22.5      -19    -25.5      3.5
   -22.5    -20.5    -29.5      3.5
   -23.5      -21    -32.5      3.5
     -25      -22    -35.5      3.5

    1 38
     -25      -22    -35.5      3.5
     -25    -23.5    -33.5      2.9
   -25.5      -25    -32.5      2.9
     -26      -27      -33      2.9
   -27.5    -28.5      -33      2.9
   -28.5      -30    -34.5      2.9
     -30    -31.5      -35      2.9
   -30.5      -33      -36        2
     -31      -34    -36.5        2
   -31.5    -35.5    -37.5      1.6
     -32      -37      -37      1.6
   -32.5    -38.5      -37        2
   -32.5      -40      -37      2.2
   -32.5    -41.5    -37.5      2.2
   -32.5      -43    -37.5      2.2
   -32.5    -44.5    -36.5      2.2
   -32.5      -46      -36        2
     -33    -47.5    -35.5      1.6
     -33      -49      -35      2.2
     -33    -50.5      -35      2.2
   -33.5      -52    -35.5      2.2
   -33.5      -54      -36      2.2
   -33.5    -55.5      -35      2.2
   -33.5    -57.5    -34.5      2.2
   -33.5      -59      -34      1.7
     -33    -60.5      -34        2
   -32.5    -62.5      -34      2.2
     -31    -64.5      -34      2.2
   -29.5      -66      -34      2.2
     -28      -68      -34      2.2
     -27      -69      -34      2.2
     -26    -70.5      -34      2.2
     -25      -72      -34      2.2
     -24    -73.5    -34.5      1.7
     -23      -75      -35      1.7
     -22    -76.5    -35.5      1.7
   -21.5    -78.5    -35.5      2.4
   -21.5      -80    -35.5      3.7

    1 19
   -25.5       -1     19.5      4.5
   -27.5       -1     19.5      3.2
     -30       -1     19.5      3.2
     -32       -1     19.5      2.7
   -34.5     -0.5     19.5      2.7
   -36.5     -0.5     19.5      2.7
   -38.5     -0.5     18.5      2.4
     -40     -0.5     17.5      2.4
     -42       -1     16.5      2.4
   -43.5       -1       16      3.2
     -45       -1     15.5        3
   -46.5     -1.5       15      2.5
     -48     -1.5       14      2.5
   -49.5     -1.5     13.5      2.5
   -51.5     -1.5       13      2.5
     -53     -1.5     12.5      2.2
   -54.5     -1.5       13      2.2
   -55.5       -2       15      2.2
     -57     -2.5     17.5      2.2

    1 35
     -57     -2.5     17.5      2.2
   -58.5     -2.5       14      1.7
     -60       -3     12.5      1.7
   -61.5     -3.5       13      1.7
     -63       -4     13.5      1.7
   -64.5       -4       14      1.7
     -66     -4.5       14      1.7
     -68     -4.5       14      1.7
   -69.5     -4.5       14      1.7
     -71     -4.5       14      1.7
     -72       -5     13.5      1.7
   -73.5       -5       13      1.7
   -74.5     -5.5     12.5      1.7
     -76       -6       12      1.7
     -77     -6.5     11.5      1.7
   -78.5     -6.5     10.5      1.7
     -80       -7     10.5      1.7
   -81.5       -7     10.5      1.7
     -83       -7       10      1.7
     -85       -7        9      1.7
   -86.5       -7        8      1.7
   -88.5       -7        8      1.7
   -90.5       -7      8.5      2.2
     -92       -7      9.5      1.7
     -94       -7      9.5      1.7
     -96       -7        9      1.7
     -98     -6.5        8      1.7
    -100     -6.5        8      1.7
  -101.5       -6        8      1.7
  -103.5     -6.5        9      1.7
    -105       -7        9      1.6
  -106.5       -8      9.5      1.6
    -108     -8.5     11.5      1.6
  -109.5     -9.5     15.5      1.6
    -111    -10.5       21      1.6

    1 17
    -111    -10.5       21      1.6
    -110    -11.5     23.5      1.6
  -108.5    -12.5     26.5      1.1
  -107.5    -13.5       28      1.1
    -107      -15       31      1.1
  -107.5      -16       35      1.1
    -108    -16.5     38.5      1.1
  -107.5    -17.5     41.5      1.1
    -106      -19       42      1.1
  -104.5      -20     43.5      1.1
  -103.5    -20.5     44.5      1.1
    -103    -20.5     47.5      1.1
    -102    -20.5     51.5      1.1
  -101.5      -22       54      1.1
    -101    -23.5     54.5      0.6
    -101      -25       55      0.6
    -101      -26       57      0.6


CONNECTIONS:

        0    1
        1    1
        2    1

        0    1
        1    1

/*----------------------------------------------------------------*/
proc geometry() { 

	/* NULL geometry procedure: keeps the user from
	calling the geometry procedure in isolation. */

    printf("\nYou must re-read the entire geometry\n")
    printf("file to execute geometry().\n\n")
}

