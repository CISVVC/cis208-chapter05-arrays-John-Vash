/*
 * file: main.c
 * main C program that uses assembly routine in prog.asm
 * to create executable:
 * gcc:   gcc -m32 -o main main.c asm_main.o asm_io.o
 */

#include "cdecl.h"
#include <stdio.h>
int PRE_CDECL asm_main( void ) POST_CDECL;
int PRE_CDECL scalar_mult( const int * a, int arrayLen, int scalar ) POST_CDECL;
void PRE_CDECL print_array( const int * a, int n ) POST_CDECL;
int main()
{
	int array[5] = {1,2,3,4,5};
	int arrayLen = 5;
	int scalar = 10;
    	int ret_status;
   	printf("Array before multiplication:\n");
    	print_array(array, arrayLen);
    	ret_status = scalar_mult(array,arrayLen,scalar);
 	printf("\nArray after multiplication:\n"); 
	print_array(array, arrayLen);
    	return ret_status;
}
