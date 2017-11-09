///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:37 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_exti.c         /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_exti.c -e -Oh  /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_exti.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_exti

        EXTERN ?b0
        EXTERN ?sll8_a_a_6
        EXTERN ?srl8_a_a_6

        PUBLIC EXTI_DeInit
        PUBLIC EXTI_GetExtIntSensitivity
        PUBLIC EXTI_GetTLISensitivity
        PUBLIC EXTI_SetExtIntSensitivity
        PUBLIC EXTI_SetTLISensitivity

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_exti.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_exti.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the EXTI peripheral.
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
//   23 #include "stm8s_exti.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 /* Private functions ---------------------------------------------------------*/
//   34 
//   35 /* Public functions ----------------------------------------------------------*/
//   36 
//   37 /**
//   38   * @addtogroup EXTI_Public_Functions
//   39   * @{
//   40   */
//   41 
//   42 /**
//   43   * @brief  Deinitializes the external interrupt control registers to their default reset value.
//   44   * @param  None
//   45   * @retval None
//   46   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   47 void EXTI_DeInit(void)
//   48 {
//   49     EXTI->CR1 = EXTI_CR1_RESET_VALUE;
EXTI_DeInit:
        CLR       L:0x50a0
//   50     EXTI->CR2 = EXTI_CR2_RESET_VALUE;
        CLR       L:0x50a1
//   51 }
        RET
//   52 
//   53 /**
//   54   * @brief  Set the external interrupt sensitivity of the selected port.
//   55   * @warning
//   56   * - The modification of external interrupt sensitivity is only possible when the interrupts are disabled.
//   57   * - The normal behavior is to disable the interrupts before calling this function, and re-enable them after.
//   58   * @param   Port The port number to access.
//   59   * @param   SensitivityValue The external interrupt sensitivity value to set.
//   60   * @retval None
//   61   * @par Required preconditions:
//   62   * Global interrupts must be disabled before calling this function.
//   63   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   64 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
//   65 {
//   66 
//   67     /* Check function parameters */
//   68     assert_param(IS_EXTI_PORT_OK(Port));
//   69     assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
//   70 
//   71     /* Set external interrupt sensitivity */
//   72     switch (Port)
EXTI_SetExtIntSensitivity:
        TNZ       A
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_1
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_2
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_3
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_4
        RET
//   73     {
//   74     case EXTI_PORT_GPIOA:
//   75         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
??EXTI_SetExtIntSensitivity_0:
        LD        A, L:0x50a0
        AND       A, #0xfc
        CALL      L:?Subroutine0
//   76         EXTI->CR1 |= (uint8_t)(SensitivityValue);
??CrossCallReturnLabel_0:
        JRA       L:??EXTI_SetExtIntSensitivity_5
//   77         break;
//   78     case EXTI_PORT_GPIOB:
//   79         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
??EXTI_SetExtIntSensitivity_1:
        LD        A, L:0x50a0
        AND       A, #0xf3
        CALL      L:?Subroutine0
//   80         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
??CrossCallReturnLabel_1:
        SLL       A
        SLL       A
        JRA       L:??EXTI_SetExtIntSensitivity_5
//   81         break;
//   82     case EXTI_PORT_GPIOC:
//   83         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
??EXTI_SetExtIntSensitivity_2:
        LD        A, L:0x50a0
        AND       A, #0xcf
        CALL      L:?Subroutine0
//   84         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
??CrossCallReturnLabel_2:
        SWAP      A
        AND       A, #0xf0
??EXTI_SetExtIntSensitivity_5:
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//   85         break;
        RET
//   86     case EXTI_PORT_GPIOD:
//   87         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
??EXTI_SetExtIntSensitivity_3:
        LD        A, L:0x50a0
        AND       A, #0x3f
        CALL      L:?Subroutine0
//   88         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
??CrossCallReturnLabel_3:
        CALL      L:?sll8_a_a_6
        JRA       L:??EXTI_SetExtIntSensitivity_5
//   89         break;
//   90     case EXTI_PORT_GPIOE:
//   91         EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
??EXTI_SetExtIntSensitivity_4:
        LD        A, L:0x50a1
        AND       A, #0xfc
        LD        L:0x50a1, A
//   92         EXTI->CR2 |= (uint8_t)(SensitivityValue);
        LD        A, S:?b0
        OR        A, L:0x50a1
        LD        L:0x50a1, A
//   93         break;
//   94     default:
//   95         break;
//   96     }
//   97 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LD        L:0x50a0, A
        LD        A, S:?b0
        RET
//   98 
//   99 /**
//  100   * @brief  Set the TLI interrupt sensitivity.
//  101   * @param   SensitivityValue The TLI interrupt sensitivity value.
//  102   * @retval None
//  103   * @par Required preconditions:
//  104   * Global interrupts must be disabled before calling this function.
//  105   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  106 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
//  107 {
//  108     /* Check function parameters */
//  109     assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
//  110 
//  111     /* Set TLI interrupt sensitivity */
//  112     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
EXTI_SetTLISensitivity:
        BRES      L:0x50a1, #0x2
//  113     EXTI->CR2 |= (uint8_t)(SensitivityValue);
        OR        A, L:0x50a1
        LD        L:0x50a1, A
//  114 }
        RET
//  115 
//  116 /**
//  117   * @brief  Get the external interrupt sensitivity of the selected port.
//  118   * @param   Port The port number to access.
//  119   * @retval EXTI_Sensitivity_TypeDef The external interrupt sensitivity of the selected port.
//  120   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  121 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
//  122 {
//  123     uint8_t value = 0;
EXTI_GetExtIntSensitivity:
        CLR       S:?b0
//  124 
//  125     /* Check function parameters */
//  126     assert_param(IS_EXTI_PORT_OK(Port));
//  127 
//  128     switch (Port)
        TNZ       A
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_1
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_2
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_3
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_4
        JRA       L:??EXTI_GetExtIntSensitivity_5
//  129     {
//  130     case EXTI_PORT_GPIOA:
//  131         value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
??EXTI_GetExtIntSensitivity_0:
        LD        A, L:0x50a0
        JRA       L:??EXTI_GetExtIntSensitivity_6
//  132         break;
//  133     case EXTI_PORT_GPIOB:
//  134         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
??EXTI_GetExtIntSensitivity_1:
        LD        A, L:0x50a0
        SRL       A
        SRL       A
        JRA       L:??EXTI_GetExtIntSensitivity_6
//  135         break;
//  136     case EXTI_PORT_GPIOC:
//  137         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
??EXTI_GetExtIntSensitivity_2:
        LD        A, L:0x50a0
        SWAP      A
        AND       A, #0xf
        JRA       L:??EXTI_GetExtIntSensitivity_6
//  138         break;
//  139     case EXTI_PORT_GPIOD:
//  140         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
??EXTI_GetExtIntSensitivity_3:
        LD        A, L:0x50a0
        CALL      L:?srl8_a_a_6
        JRA       L:??EXTI_GetExtIntSensitivity_7
//  141         break;
//  142     case EXTI_PORT_GPIOE:
//  143         value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
??EXTI_GetExtIntSensitivity_4:
        LD        A, L:0x50a1
??EXTI_GetExtIntSensitivity_6:
        AND       A, #0x3
??EXTI_GetExtIntSensitivity_7:
        LD        S:?b0, A
//  144         break;
//  145     default:
//  146         break;
//  147     }
//  148 
//  149     return((EXTI_Sensitivity_TypeDef)value);
??EXTI_GetExtIntSensitivity_5:
        LD        A, S:?b0
        RET
//  150 }
//  151 
//  152 /**
//  153   * @brief  Get the TLI interrupt sensitivity.
//  154   * @param  None
//  155   * @retval EXTI_TLISensitivity_TypeDef The TLI interrupt sensitivity read.
//  156   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  157 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
//  158 {
//  159 
//  160     uint8_t value = 0;
//  161 
//  162     /* Get TLI interrupt sensitivity */
//  163     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
EXTI_GetTLISensitivity:
        LD        A, L:0x50a1
//  164 
//  165     return((EXTI_TLISensitivity_TypeDef)value);
        AND       A, #0x4
        RET
//  166 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  167 
//  168 /**
//  169   * @}
//  170   */
//  171   
//  172 /**
//  173   * @}
//  174   */
//  175   
//  176 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 175 bytes in section .near_func.text
// 
// 175 bytes of CODE memory
//
//Errors: none
//Warnings: none
