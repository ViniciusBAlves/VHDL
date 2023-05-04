#ifndef __MATRIXMUL_H__
#define __MATRIXMUL_H__

#include <cmath>
using namespace std;



#define COLS 2
#define ROWS 2

typedef unsigned char mat_8; //8bits
typedef unsigned short mat_16; //16bits

// Prototype of top level function for C-synthesis
void matrixmul(
      mat_8 mA[ROWS][COLS],
      mat_8 mB[ROWS][COLS],
      mat_8 mC[ROWS][COLS],
      mat_8 mD[ROWS][COLS],
      mat_16 mR1[ROWS][COLS],
      mat_16 mR2[ROWS][COLS],
      mat_16 mP[ROWS][COLS],
      mat_16 mF[ROWS][COLS]);

#endif