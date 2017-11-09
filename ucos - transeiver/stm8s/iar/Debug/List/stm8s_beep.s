///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:36 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_beep.c         /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_beep.c -e -Oh  /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_beep.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_beep

        EXTERN ?b0
        EXTERN ?b3
        EXTERN ?mul16_x_x_w0
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2

        PUBLIC BEEP_Cmd
        PUBLIC BEEP_DeInit
        PUBLIC BEEP_Init
        PUBLIC BEEP_LSICalibrationConfig

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_beep.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_beep.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the BEEP peripheral.
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
//   23 #include "stm8s_beep.h"
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
//   38   * @addtogroup BEEP_Public_Functions
//   39   * @{
//   40   */
//   41 
//   42 /**
//   43   * @brief  Deinitializes the BEEP peripheral registers to their default reset
//   44   * values.
//   45   * @param  None
//   46   * @retval None
//   47   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   48 void BEEP_DeInit(void)
//   49 {
//   50     BEEP->CSR = BEEP_CSR_RESET_VALUE;
BEEP_DeInit:
        MOV       L:0x50f3, #0x1f
//   51 }
        RET
//   52 
//   53 /**
//   54   * @brief  Initializes the BEEP function according to the specified parameters.
//   55   * @param   BEEP_Frequency Frequency selection.
//   56   * can be one of the values of @ref BEEP_Frequency_TypeDef.
//   57   * @retval None
//   58   * @par Required preconditions:
//   59   * The LS RC calibration must be performed before calling this function.
//   60   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   61 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
//   62 {
BEEP_Init:
        LD        S:?b0, A
//   63 
//   64     /* Check parameter */
//   65     assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
//   66 
//   67     /* Set a default calibration value if no calibration is done */
//   68     if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
        LD        A, L:0x50f3
        AND       A, #0x1f
        CP        A, #0x1f
        JRNE      L:??BEEP_Init_0
//   69     {
//   70         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
        CALL      L:?Subroutine0
//   71         BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
??CrossCallReturnLabel_1:
        LD        A, L:0x50f3
        OR        A, #0xb
        LD        L:0x50f3, A
//   72     }
//   73 
//   74     /* Select the output frequency */
//   75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
??BEEP_Init_0:
        LD        A, L:0x50f3
        AND       A, #0x3f
        LD        L:0x50f3, A
//   76     BEEP->CSR |= (uint8_t)(BEEP_Frequency);
        LD        A, S:?b0
        OR        A, L:0x50f3
        LD        L:0x50f3, A
//   77 
//   78 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LD        A, L:0x50f3
        AND       A, #0xe0
        LD        L:0x50f3, A
        RET
//   79 
//   80 /**
//   81   * @brief  Enable or disable the BEEP function.
//   82   * @param   NewState Indicates the new state of the BEEP function.
//   83   * @retval None
//   84   * @par Required preconditions:
//   85   * Initialisation of BEEP and LS RC calibration must be done before.
//   86   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   87 void BEEP_Cmd(FunctionalState NewState)
//   88 {
//   89     if (NewState != DISABLE)
BEEP_Cmd:
        TNZ       A
        JREQ      L:??BEEP_Cmd_0
//   90     {
//   91         /* Enable the BEEP peripheral */
//   92         BEEP->CSR |= BEEP_CSR_BEEPEN;
        BSET      L:0x50f3, #0x5
        RET
//   93     }
//   94     else
//   95     {
//   96         /* Disable the BEEP peripheral */
//   97         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
??BEEP_Cmd_0:
        BRES      L:0x50f3, #0x5
//   98     }
//   99 }
        RET
//  100 
//  101 /**
//  102   * @brief  Update CSR register with the measured LSI frequency.
//  103   * @par Note on the APR calculation:
//  104   * A is the integer part of LSIFreqkHz/4 and x the decimal part.
//  105   * x <= A/(1+2A) is equivalent to A >= x(1+2A) and also to 4A >= 4x(1+2A) [F1]
//  106   * but we know that A + x = LSIFreqkHz/4 ==> 4x = LSIFreqkHz-4A
//  107   * so [F1] can be written :
//  108   * 4A >= (LSIFreqkHz-4A)(1+2A)
//  109   * @param   LSIFreqHz Low Speed RC frequency measured by timer (in Hz).
//  110   * @retval None
//  111   * @par Required preconditions:
//  112   * - BEEP must be disabled to avoid unwanted interrupts.
//  113   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  114 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
//  115 {
//  116 
//  117     uint16_t lsifreqkhz;
//  118     uint16_t A;
//  119 
//  120     /* Check parameter */
//  121     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
//  122 
//  123     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
BEEP_LSICalibrationConfig:
        CALL      L:?udiv32_l0_l0_dl
        DATA
        DC32      0x3e8
        CODE
        LDW       Y, S:?w1
//  124 
//  125     /* Calculation of BEEPER calibration value */
//  126 
//  127     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
        CALL      L:?Subroutine0
//  128 
//  129     A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
??CrossCallReturnLabel_0:
        LDW       X, Y
        SRLW      X
        SRLW      X
        SRLW      X
        LDW       S:?w1, X
//  130 
//  131     if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
        SLLW      X
        SLLW      X
        SLLW      X
        LDW       S:?w2, X
        LDW       X, S:?w1
        SLLW      X
        INCW      X
        LDW       S:?w0, X
        SUBW      Y, S:?w2
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       S:?w0, X
        LDW       X, S:?w2
        CPW       X, S:?w0
        LD        A, S:?b3
        JRC       L:??BEEP_LSICalibrationConfig_0
//  132     {
//  133         BEEP->CSR |= (uint8_t)(A - 2U);
        ADD       A, #0xfe
        JRA       L:??BEEP_LSICalibrationConfig_1
//  134     }
//  135     else
//  136     {
//  137         BEEP->CSR |= (uint8_t)(A - 1U);
??BEEP_LSICalibrationConfig_0:
        DEC       A
??BEEP_LSICalibrationConfig_1:
        OR        A, L:0x50f3
        LD        L:0x50f3, A
//  138     }
//  139 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  140 
//  141 /**
//  142   * @}
//  143   */
//  144   
//  145 /**
//  146   * @}
//  147   */
//  148   
//  149 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 126 bytes in section .near_func.text
// 
// 126 bytes of CODE memory
//
//Errors: none
//Warnings: none
