#include "matrizmultp.hpp"

void matrixmul(
      mat_8 mA[ROWS][COLS],
      mat_8 mB[ROWS][COLS],
      mat_8 mC[ROWS][COLS],
      mat_8 mD[ROWS][COLS],
      mat_16 mR1[ROWS][COLS],
      mat_16 mR2[ROWS][COLS],
      mat_16 mP[ROWS][COLS],
      mat_16 mF[ROWS][COLS])
{
  // Iterate over the rows of the A matrix
   Row: for(int i = 0; i < ROWS; i++) {
      // Iterate over the columns of the B matrix
      Col: for(int j = 0; j < COLS; j++) {
         mR1[i][j] = 0;
         mR2[i][j] = 0;
         // Do the inner product of a row of A and col of B
         Product: for(int k = 0; k < ROWS; k++) {
            mR1[i][j] += mA[i][k] * mB[k][j];
            mR2[i][j] += mC[i][k] * mD[k][j];
         }
      }
   }
   Row1: for(int i = 0; i < ROWS; i++) {
      // Iterate over the columns of the B matrix
      Col1: for(int j = 0; j < COLS; j++) {
        mP[i][j] = mR1[i][j] + mR2[i][j];
      }
   }
   Row2: for(int i = 0; i < ROWS; i++) {
      // Iterate over the columns of the B matrix
      Col2: for(int j = 0; j < COLS; j++) {
        if(mP[i][j] < 1050){
                mF[i][j] = 0;
            }
            else{
                mF[i][j] = mP[i][j];
            }
      }
   }

}
