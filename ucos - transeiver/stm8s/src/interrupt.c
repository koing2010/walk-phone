/**********************************************************************************

File_name:       Model.c
Revised:        $Date:2014-7-  ; $
Editor:		    Mr.Kong

**********************************************************************************/


/*================================================================================
@ Include files
*/
#include "interrupt.h"



/*================================================================================
@ Global variable
*/



/*================================================================================
@ All functions  as follow
*/


/*********************************************************************************
Function:    TIM1_OVR_UIF_IRQHandler
Description:  TIM1_OVR_UIF_IRQHandler

Input:        None
Output:       None
Return:       None
Others:	      None
*********************************************************************************/
#pragma vector = TIM1_OVR_UIF_vector
__interrupt  void TIM1_OVR_UIF_IRQHandler(void)
{



}
/*********************************************************************************
Function:     UART2_R_OR_IRQHandler
Description:  UART2 have received serial data.

Input:        None
Output:       None
Return:       None
Others:	      None
*********************************************************************************/

//this variables have been defined in main file.

#pragma vector = UART2_R_OR_vector
__interrupt  void UART2_R_OR_IRQHandler(void)
{
   if(UART2_SR_RXNE == 1) //¶ÁÊý¾Ý¼Ä´æÆ÷·Ç¿Õ
   {
     
   }
}

/*********************************************************************************
Function:    TIM2_IRQHandler
Description:  time2 overflow interrupt.

Input:        None
Output:       None
Return:       None
Others:	      None
*********************************************************************************/
//#pragma vector = TIM2_OVR_UIF_vector
//__interrupt void TIM2_IRQHandler(void)
//{
//
// TIM2_SR1 = 0x00;
//
//}
/*@*****************************end of file*************************************@*/
