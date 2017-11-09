///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:27 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_wwdg.c         /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_wwdg.c -e -Oh  /
//                    --debug --code_model small --data_model medium -o       /
//                    E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\Obj\ --dlib_config   /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.0\stm8\LIB\dlstm8smn.h" -D STM8S207 -lB               /
//                    E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\                /
//                    --diag_suppress pa089 -I E:\HWT\HWT_OS\ucos\stm8s\iar\. /
//                    .\..\ucos_ii\ -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\..\uco /
//                    s_ii\iarstm8\ -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\src\   /
//                    -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\fwlib\inc\ --vregs   /
//                    16                                                      /
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_wwdg.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_wwdg

        EXTERN ?b0

        PUBLIC WWDG_GetCounter
        PUBLIC WWDG_Init
        PUBLIC WWDG_SWReset
        PUBLIC WWDG_SetCounter
        PUBLIC WWDG_SetWindowValue

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_wwdg.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8s_wwdg.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the WWDG peripheral.
//    8   ******************************************************************************
//    9   * @attention
//   10   *
//   11   * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
//   12   * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
//   13   * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
//   14   * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
//   15   * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
//   16   * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
//   17   *
//   18   * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
//   19   ******************************************************************************
//   20   */
//   21 
//   22 /* Includes ------------------------------------------------------------------*/
//   23 #include "stm8s_wwdg.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private define ------------------------------------------------------------*/
//   29 #define BIT_MASK          ((uint8_t)0x7F)
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 /* Private functions ---------------------------------------------------------*/
//   34 
//   35 /** @addtogroup WWDG_Public_Functions
//   36   * @{
//   37   */
//   38 
//   39 /**
//   40   * @brief  Initializes the WWDG peripheral.
//   41   *         This function set Window Register = WindowValue, Counter Register
//   42   *         according to Counter and \b ENABLE \b WWDG
//   43   * @param  Counter : WWDG counter value
//   44   * @param  WindowValue : specifies the WWDG Window Register, range is 0x00 to 0x7F.
//   45   * @retval None
//   46   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   47 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
//   48 {
//   49     /* Check the parameters */
//   50     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
//   51     
//   52     WWDG->WR = WWDG_WR_RESET_VALUE;
WWDG_Init:
        MOV       L:0x50d2, #0x7f
//   53     WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
        OR        A, #0xc0
        LD        L:0x50d1, A
//   54     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
        LD        A, S:?b0
        AND       A, #0x7f
        OR        A, #0x40
        LD        L:0x50d2, A
//   55 }
        RET
//   56 
//   57 /**
//   58   * @brief  Refreshes the WWDG peripheral.
//   59   * @param  Counter :  WWDG Counter Value
//   60   *         This parameter must be a number between 0x40 and 0x7F.
//   61   * @retval None
//   62   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   63 void WWDG_SetCounter(uint8_t Counter)
//   64 {
//   65 
//   66     /* Check the parameters */
//   67     assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
//   68 
//   69    /* Write to T[6:0] bits to configure the counter value, no need to do
//   70      a read-modify-write; writing a 0 to WDGA bit does nothing */
//   71   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
WWDG_SetCounter:
        AND       A, #0x7f
        LD        L:0x50d1, A
//   72 
//   73 }
        RET
//   74 
//   75 /**
//   76   * @brief Gets the WWDG Counter Value.
//   77   *        This value could be used to check if WWDG is in the window, where
//   78   *        refresh is allowed.
//   79   * @param  None
//   80   * @retval WWDG Counter Value
//   81   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   82 uint8_t WWDG_GetCounter(void)
//   83 {
//   84     return(WWDG->CR);
WWDG_GetCounter:
        LD        A, L:0x50d1
        RET
//   85 }
//   86 
//   87 /**
//   88   * @brief  Generates immediate WWDG RESET.
//   89   * @param  None
//   90   * @retval None
//   91   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   92 void WWDG_SWReset(void)
//   93 {
//   94     WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
WWDG_SWReset:
        MOV       L:0x50d1, #0x80
//   95 }
        RET
//   96 
//   97 /**
//   98   * @brief  Sets the WWDG window value.
//   99   * @param  WindowValue: specifies the window value to be compared to the
//  100   *         downcounter.
//  101   *         This parameter value must be lower than 0x80.
//  102   * @retval None
//  103   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  104 void WWDG_SetWindowValue(uint8_t WindowValue)
//  105 {
//  106     /* Check the parameters */
//  107     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
//  108     
//  109     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
WWDG_SetWindowValue:
        AND       A, #0x7f
        OR        A, #0x40
        LD        L:0x50d2, A
//  110 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  111 /**
//  112   * @}
//  113   */
//  114   
//  115 /**
//  116   * @}
//  117   */
//  118   
//  119 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 42 bytes in section .near_func.text
// 
// 42 bytes of CODE memory
//
//Errors: none
//Warnings: none
