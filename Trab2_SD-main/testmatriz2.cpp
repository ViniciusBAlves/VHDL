#include <iostream>
#include "matrizmultp.hpp"

using namespace std;

int main(int argc, char **argv)
{
	mat_8 in_mat_a[2][2] = {
	         {204,4},
	         {3,174}
	   };
	   mat_8 in_mat_b[2][2] = {
		     {21,212},
	         {73,44}
	   };
	   mat_8 in_mat_c[2][2] = {
			 {2,161},
	         {33,132}
	   };
	   mat_8 in_mat_d[2][2] = {
		     {39,26},
	         {1,9}
	   };
   mat_16 mat_r1[2][2],mat_r2[2][2],mat_p[2][2],mat_f[2][2],mat_f2[2][2],mat_r1_1[2][2],mat_r2_1[2][2],mat_p_1[2][2];
   int err_cnt = 0;
    //EFETUA A MULTIPLICAÇÃO DE MATRIZES
   for(int i = 0; i < ROWS; i++) {
      for(int j = 0; j < COLS; j++) {
         mat_r1[i][j] = 0;
         mat_r2[i][j] = 0;
         for(int k = 0; k < ROWS; k++) {
            mat_r1[i][j] += in_mat_a[i][k] * in_mat_b[k][j];
            mat_r2[i][j] += in_mat_c[i][k] * in_mat_d[k][j];
         }
      }
   }
   for(int i = 0; i < ROWS; i++) {
      for(int j = 0; j < COLS; j++) {
        mat_p[i][j] = mat_r1[i][j] + mat_r2[i][j];
      }
   }
   for(int i = 0; i < ROWS; i++) {
        for(int j = 0; j < COLS; j++) {
        if(mat_p[i][j] < 1050){
                mat_f[i][j] = 0;
            }
            else{
                mat_f[i][j] = mat_p[i][j];
            }
      }
   }
   matrixmul(in_mat_a,in_mat_b,in_mat_c,in_mat_d,mat_r1_1,mat_r2_1,mat_p_1,mat_f2);

   for (int i = 0; i < ROWS; i++) {
      for (int j = 0; j < COLS; j++) {
         if (mat_f[i][j] != mat_f2[i][j]) {
            err_cnt++;
         }

      }
   }
   if (err_cnt){
	   cout << "\n" << endl;
      cout << ">> ERROR: " << err_cnt << " mismatches detected!" << endl;

      cout << "Matrix results:" << endl;
	   for (int i = 0; i < ROWS; i++) {
		   cout << "\n" << endl;
		   for (int j = 0; j < COLS; j++) {
			   cout << mat_f[i][j] << " ";
		   }
	   }
	 cout << "\n" << endl;

   }
   else{
	   cout << "\n" << endl;
      cout << "Test passes!! \n" << endl;
      cout << "Matrix results:" << endl;
   	   for (int i = 0; i < ROWS; i++) {
   		   cout << "\n" << endl;
   		   for (int j = 0; j < COLS; j++) {
   			   cout << mat_f[i][j] << " ";
   		   }
   	   }
   	cout << "\n" << endl;
   }
}
