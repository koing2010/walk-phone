///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:31 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_rst.c          /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_rst.c -e -Oh   /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_rst.s     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_rst

        PUBLIC RST_ClearFlag
        PUBLIC RST_GetFlagStatus

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_rst.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_rst.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the RST peripheral.
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
//   23 
//   24 #include "stm8s_rst.h"
//   25 
//   26 /** @addtogroup STM8S_StdPeriph_Driver
//   27   * @{
//   28   */
//   29 /* Private typedef -----------------------------------------------------------*/
//   30 /* Private define ------------------------------------------------------------*/
//   31 /* Private macro -------------------------------------------------------------*/
//   32 /* Private variables ---------------------------------------------------------*/
//   33 /* Private function prototypes -----------------------------------------------*/
//   34 /* Private Constants ---------------------------------------------------------*/
//   35 /* Public functions ----------------------------------------------------------*/
//   36 /**
//   37   * @addtogroup RST_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 
//   42 /**
//   43   * @brief   Checks whether the specified RST flag is set or not.
//   44   * @param   RST_Flag : specify the reset flag to check.
//   45   *          This parameter can be a value of @ref RST_FLAG_TypeDef.
//   46   * @retval  FlagStatus: status of the given RST flag.
//   47   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   48 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
//   49 {
//   50     /* Check the parameters */
//   51     assert_param(IS_RST_FLAG_OK(RST_Flag));
//   52 
//   53     /* Get flag status */
//   54 
//   55     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
RST_GetFlagStatus:
        BCP       A, L:0x50b3
        JREQ      L:??RST_GetFlagStatus_0
        LD        A, #0x1
        RET
??RST_GetFlagStatus_0:
        CLR       A
        RET
//   56 }
//   57 
//   58 /**
//   59   * @brief  Clears the specified RST flag.
//   60   * @param  RST_Flag : specify the reset flag to clear.
//   61   *         This parameter can be a value of @ref RST_FLAG_TypeDef.
//   62   * @retval None
//   63   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   64 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
//   65 {
//   66     /* Check the parameters */
//   67     assert_param(IS_RST_FLAG_OK(RST_Flag));
//   68 
//   69     RST->SR = (uint8_t)RST_Flag;
RST_ClearFlag:
        LD        L:0x50b3, A
//   70 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   71 
//   72 /**
//   73   * @}
//   74   */
//   75   
//   76 /**
//   77   * @}
//   78   */
//   79   
//   80 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 14 bytes in section .near_func.text
// 
// 14 bytes of CODE memory
//
//Errors: none
//Warnings: none
