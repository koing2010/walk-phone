///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:24 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_iwdg.c         /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_iwdg.c -e -Oh  /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_iwdg.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_iwdg

        PUBLIC IWDG_Enable
        PUBLIC IWDG_ReloadCounter
        PUBLIC IWDG_SetPrescaler
        PUBLIC IWDG_SetReload
        PUBLIC IWDG_WriteAccessCmd

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_iwdg.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8s_iwdg.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the IWDG peripheral.
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
//   23 #include "stm8s_iwdg.h"
//   24 
//   25 /* Private define ------------------------------------------------------------*/
//   26 /* Private macro -------------------------------------------------------------*/
//   27 /* Private variables ---------------------------------------------------------*/
//   28 /* Private function prototypes -----------------------------------------------*/
//   29 /* Private functions ---------------------------------------------------------*/
//   30 /* Public functions ----------------------------------------------------------*/
//   31 
//   32 /** @addtogroup IWDG_Public_Functions
//   33   * @{
//   34   */
//   35 
//   36 /**
//   37   * @brief  Enables or disables write access to Prescaler and Reload registers.
//   38   * @param  IWDG_WriteAccess : New state of write access to Prescaler and Reload
//   39   *         registers.  This parameter can be a value of @ref IWDG_WriteAccess_TypeDef.
//   40   * @retval None
//   41   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   42 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
//   43 {
//   44     /* Check the parameters */
//   45     assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
//   46 
//   47     IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
IWDG_WriteAccessCmd:
        LD        L:0x50e0, A
//   48 }
        RET
//   49 
//   50 /**
//   51   * @brief  Sets IWDG Prescaler value.
//   52   * @note   Write access should be enabled
//   53   * @param  IWDG_Prescaler : Specifies the IWDG Prescaler value.
//   54   *         This parameter can be a value of @ref IWDG_Prescaler_TypeDef.
//   55   * @retval None
//   56   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   57 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
//   58 {
//   59     /* Check the parameters */
//   60     assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
//   61 
//   62     IWDG->PR = (uint8_t)IWDG_Prescaler;
IWDG_SetPrescaler:
        LD        L:0x50e1, A
//   63 }
        RET
//   64 
//   65 /**
//   66   * @brief  Sets IWDG Reload value.
//   67   * @note   Write access should be enabled
//   68   * @param  IWDG_Reload : Reload register value.
//   69   *         This parameter must be a number between 0 and 0xFF.
//   70   * @retval None
//   71   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   72 void IWDG_SetReload(uint8_t IWDG_Reload)
//   73 {
//   74     IWDG->RLR = IWDG_Reload;
IWDG_SetReload:
        LD        L:0x50e2, A
//   75 }
        RET
//   76 
//   77 /**
//   78   * @brief  Reloads IWDG counter
//   79   * @note   Write access should be enabled
//   80   * @param  None
//   81   * @retval None
//   82   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   83 void IWDG_ReloadCounter(void)
//   84 {
//   85     IWDG->KR = IWDG_KEY_REFRESH;
IWDG_ReloadCounter:
        MOV       L:0x50e0, #0xaa
//   86 }
        RET
//   87 
//   88 /**
//   89   * @brief  Enables IWDG.
//   90   * @param  None
//   91   * @retval None
//   92   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   93 void IWDG_Enable(void)
//   94 {
//   95     IWDG->KR = IWDG_KEY_ENABLE;
IWDG_Enable:
        MOV       L:0x50e0, #0xcc
//   96 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   97 
//   98 /**
//   99   * @}
//  100   */
//  101   
//  102 /**
//  103   * @}
//  104   */
//  105   
//  106 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 22 bytes in section .near_func.text
// 
// 22 bytes of CODE memory
//
//Errors: none
//Warnings: none
