/************************************************************************************

File_name:       interrupt.h
Description:    the header file of  Model_c .

************************************************************************************/
#ifndef     __INTERRUPT_H__
#define     __INTERRUPT_H__

/*==================================================================================
@ Include files
*/
#include "iostm8s105k4.h"
//#include ".c"

/*==================================================================================
@ Typedefs
*/


/*==================================================================================
@ Constants and defines
*/
__interrupt  void UART1_R_OR_IRQHandler(void);
__interrupt  void TIM2_IRQHandler(void) ;
__interrupt  void TIM4_OVR_UIF_IRQHandler(void);





#endif
/*@*****************************end of file**************************************@*/


