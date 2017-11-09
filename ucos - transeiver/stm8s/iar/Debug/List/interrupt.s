///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  10:42:46 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\stm8s\src\interrupt.c                        /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\src\interrupt.c" -e -On --no_cse       /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o "E:\RDA1846s\walkphone           /
//                    program\ucos - transeiver\stm8s\iar\Debug\Obj\"         /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench 6.5\stm8\LIB\dlstm8smn.h"    /
//                    -D STM8S207 -lB "E:\RDA1846s\walkphone program\ucos -   /
//                    transeiver\stm8s\iar\Debug\List\" --diag_suppress       /
//                    pa089 -I "E:\RDA1846s\walkphone program\ucos -          /
//                    transeiver\stm8s\iar\..\..\ucos_ii\" -I                 /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\iar\..\..\ucos_ii\iarstm8\" -I         /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\iar\..\src\" -I                        /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\iar\..\fwlib\inc\" --vregs 16          /
//    List file    =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\stm8s\iar\Debug\List\interrupt.s             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME interrupt

        PUBLIC TIM1_OVR_UIF_IRQHandler
        PUBLIC UART2_R_OR_IRQHandler
        PUBLIC _A_UART2_SR
        PUBLIC _interrupt_13
        PUBLIC _interrupt_23

// E:\RDA1846s\walkphone program\ucos - transeiver\stm8s\src\interrupt.c
//    1 /**********************************************************************************
//    2 
//    3 File_name:       Model.c
//    4 Revised:        $Date:2014-7-  ; $
//    5 Editor:		    Mr.Kong
//    6 
//    7 **********************************************************************************/
//    8 
//    9 
//   10 /*================================================================================
//   11 @ Include files
//   12 */
//   13 #include "interrupt.h"

        ASEGN `.near.noinit`:DATA:NOROOT,05240H
        SECTION_GROUP _A_UART2_SR
// union <unnamed> volatile _A_UART2_SR
_A_UART2_SR:
        DS8 1
//   14 
//   15 
//   16 
//   17 /*================================================================================
//   18 @ Global variable
//   19 */
//   20 
//   21 
//   22 
//   23 /*================================================================================
//   24 @ All functions  as follow
//   25 */
//   26 
//   27 
//   28 /*********************************************************************************
//   29 Function:    TIM1_OVR_UIF_IRQHandler
//   30 Description:  TIM1_OVR_UIF_IRQHandler
//   31 
//   32 Input:        None
//   33 Output:       None
//   34 Return:       None
//   35 Others:	      None
//   36 *********************************************************************************/
//   37 #pragma vector = TIM1_OVR_UIF_vector

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   38 __interrupt  void TIM1_OVR_UIF_IRQHandler(void)
//   39 {
//   40 
//   41 
//   42 
//   43 }
TIM1_OVR_UIF_IRQHandler:
_interrupt_13:
        IRET
//   44 /*********************************************************************************
//   45 Function:     UART2_R_OR_IRQHandler
//   46 Description:  UART2 have received serial data.
//   47 
//   48 Input:        None
//   49 Output:       None
//   50 Return:       None
//   51 Others:	      None
//   52 *********************************************************************************/
//   53 
//   54 //this variables have been defined in main file.
//   55 
//   56 #pragma vector = UART2_R_OR_vector

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   57 __interrupt  void UART2_R_OR_IRQHandler(void)
//   58 {
//   59    if(UART2_SR_RXNE == 1) //¶ÁÊý¾Ý¼Ä´æÆ÷·Ç¿Õ
UART2_R_OR_IRQHandler:
_interrupt_23:
        LD        A, L:0x5240
//   60    {
//   61      
//   62    }
//   63 }
        IRET
        REQUIRE _A_UART2_SR

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   64 
//   65 /*********************************************************************************
//   66 Function:    TIM2_IRQHandler
//   67 Description:  time2 overflow interrupt.
//   68 
//   69 Input:        None
//   70 Output:       None
//   71 Return:       None
//   72 Others:	      None
//   73 *********************************************************************************/
//   74 //#pragma vector = TIM2_OVR_UIF_vector
//   75 //__interrupt void TIM2_IRQHandler(void)
//   76 //{
//   77 //
//   78 // TIM2_SR1 = 0x00;
//   79 //
//   80 //}
//   81 /*@*****************************end of file*************************************@*/
// 
// 1 byte  in section .near.noinit    (abs)
// 5 bytes in section .near_func.text
// 
// 5 bytes of CODE memory
// 0 bytes of DATA memory (+ 1 byte shared)
//
//Errors: none
//Warnings: none
