///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:36 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_awu.c          /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_awu.c -e -Oh   /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_awu.s     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_awu

        EXTERN ?b0
        EXTERN ?b3
        EXTERN ?mul16_x_x_w0
        EXTERN ?srl8_a_a_5
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2

        PUBLIC APR_Array
        PUBLIC AWU_Cmd
        PUBLIC AWU_DeInit
        PUBLIC AWU_GetFlagStatus
        PUBLIC AWU_IdleModeEnable
        PUBLIC AWU_Init
        PUBLIC AWU_LSICalibrationConfig
        PUBLIC TBR_Array

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_awu.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_awu.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the AWU peripheral.  
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
//   23 #include "stm8s_awu.h"
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
//   35 /* See also AWU_Timebase_TypeDef structure in stm8s_awu.h file :
//   36                           N   2   5   1   2   4   8   1   3   6   1   2   5   1   2   1   3
//   37                           O   5   0   m   m   m   m   6   2   4   2   5   1   s   s   2   0
//   38                           I   0   0   s   s   s   s   m   m   m   8   6   2           s   s
//   39                           T   u   u                   s   s   s   m   m   m
//   40                               s   s                               s   s   s
//   41 */
//   42 /** Contains the different values to write in the APR register (used by AWU_Init function) */

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   43 CONST uint8_t APR_Array[17] =
APR_Array:
        DC8 0, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 61, 23, 23, 62
//   44     {
//   45         0, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 61, 23, 23, 62
//   46     };
//   47 
//   48 /** Contains the different values to write in the TBR register (used by AWU_Init function) */

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   49 CONST uint8_t TBR_Array[17] =
TBR_Array:
        DC8 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12, 14, 15, 15
//   50     {
//   51         0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 12, 14, 15, 15
//   52     };
//   53 
//   54 /* Public functions ----------------------------------------------------------*/
//   55 
//   56 /**
//   57   * @addtogroup AWU_Public_Functions
//   58   * @{
//   59   */
//   60 
//   61 /**
//   62   * @brief  Deinitializes the AWU peripheral registers to their default reset
//   63   * values.
//   64   * @param  None
//   65   * @retval None
//   66   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   67 void AWU_DeInit(void)
//   68 {
//   69     AWU->CSR = AWU_CSR_RESET_VALUE;
AWU_DeInit:
        CLR       L:0x50f0
//   70     AWU->APR = AWU_APR_RESET_VALUE;
        MOV       L:0x50f1, #0x3f
//   71     AWU->TBR = AWU_TBR_RESET_VALUE;
        CLR       L:0x50f2
//   72 }
        RET
//   73 
//   74 /**
//   75   * @brief  Initializes the AWU peripheral according to the specified parameters.
//   76   * @param   AWU_TimeBase : Time base selection (interval between AWU interrupts).
//   77   * can be one of the values of @ref AWU_Timebase_TypeDef.
//   78   * @retval None
//   79   * @par Required preconditions:
//   80   * The LS RC calibration must be performed before calling this function.
//   81   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   82 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
//   83 {
AWU_Init:
        LD        S:?b0, A
//   84 
//   85     /* Check parameter */
//   86     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
//   87 
//   88     /* Enable the AWU peripheral */
//   89     AWU->CSR |= AWU_CSR_AWUEN;
        BSET      L:0x50f0, #0x4
//   90 
//   91     /* Set the TimeBase */
//   92     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
        LD        A, L:0x50f2
        AND       A, #0xf0
        LD        L:0x50f2, A
//   93     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        LD        A, L:0x50f2
        OR        A, (L:TBR_Array,X)
        LD        L:0x50f2, A
//   94 
//   95     /* Set the APR divider */
//   96     AWU->APR &= (uint8_t)(~AWU_APR_APR);
        LD        A, L:0x50f1
        AND       A, #0xc0
        LD        L:0x50f1, A
//   97     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
        LD        A, L:0x50f1
        OR        A, (L:APR_Array,X)
        LD        L:0x50f1, A
//   98 
//   99 }
        RET
//  100 
//  101 /**
//  102   * @brief  Enable or disable the AWU peripheral.
//  103   * @param   NewState Indicates the new state of the AWU peripheral.
//  104   * @retval None
//  105   * @par Required preconditions:
//  106   * Initialisation of AWU and LS RC calibration must be done before.
//  107   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  108 void AWU_Cmd(FunctionalState NewState)
//  109 {
//  110     if (NewState != DISABLE)
AWU_Cmd:
        TNZ       A
        JREQ      L:??AWU_Cmd_0
//  111     {
//  112         /* Enable the AWU peripheral */
//  113         AWU->CSR |= AWU_CSR_AWUEN;
        BSET      L:0x50f0, #0x4
        RET
//  114     }
//  115     else
//  116     {
//  117         /* Disable the AWU peripheral */
//  118         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
??AWU_Cmd_0:
        BRES      L:0x50f0, #0x4
//  119     }
//  120 }
        RET
//  121 
//  122 /**
//  123   * @brief  Update APR register with the measured LSI frequency.
//  124   * @par Note on the APR calculation:
//  125   * A is the integer part of lsifreqkhz/4 and x the decimal part.
//  126   * x <= A/(1+2A) is equivalent to A >= x(1+2A) and also to 4A >= 4x(1+2A) [F1]
//  127   * but we know that A + x = lsifreqkhz/4 ==> 4x = lsifreqkhz-4A
//  128   * so [F1] can be written :
//  129   * 4A >= (lsifreqkhz-4A)(1+2A)
//  130   * @param   LSIFreqHz Low Speed RC frequency measured by timer (in Hz).
//  131   * @retval None
//  132   * @par Required preconditions:
//  133   * - AWU must be disabled to avoid unwanted interrupts.
//  134   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  135 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
//  136 {
//  137 
//  138     uint16_t lsifreqkhz = 0x0;
//  139     uint16_t A = 0x0;
//  140 
//  141     /* Check parameter */
//  142     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
//  143 
//  144     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
AWU_LSICalibrationConfig:
        CALL      L:?udiv32_l0_l0_dl
        DATA
        DC32      0x3e8
        CODE
        LDW       Y, S:?w1
//  145 
//  146     /* Calculation of AWU calibration value */
//  147 
//  148     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
        LDW       X, Y
        SRLW      X
        SRLW      X
        LDW       S:?w1, X
//  149 
//  150     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
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
        JRC       L:??AWU_LSICalibrationConfig_0
//  151     {
//  152         AWU->APR = (uint8_t)(A - 2U);
        ADD       A, #0xfe
        JRA       L:??AWU_LSICalibrationConfig_1
//  153     }
//  154     else
//  155     {
//  156         AWU->APR = (uint8_t)(A - 1U);
??AWU_LSICalibrationConfig_0:
        DEC       A
??AWU_LSICalibrationConfig_1:
        LD        L:0x50f1, A
//  157     }
//  158 }
        RET
//  159 
//  160 /**
//  161   * @brief  Configures AWU in Idle mode to reduce power consumption.
//  162   * @param  None
//  163   * @retval None
//  164   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  165 void AWU_IdleModeEnable(void)
//  166 {
//  167     /* Disable AWU peripheral */
//  168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
AWU_IdleModeEnable:
        BRES      L:0x50f0, #0x4
//  169 
//  170     /* No AWU timebase */
//  171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
        MOV       L:0x50f2, #0xf0
//  172 }
        RET
//  173 
//  174 /**
//  175   * @brief  Returns status of the AWU peripheral flag.
//  176   * @param  None
//  177   * @retval FlagStatus : Status of the AWU flag.
//  178   * This parameter can be any of the @ref FlagStatus enumeration.
//  179   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  180 FlagStatus AWU_GetFlagStatus(void)
//  181 {
//  182     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
AWU_GetFlagStatus:
        LD        A, L:0x50f0
        CALL      L:?srl8_a_a_5
        AND       A, #0x1
        RET
//  183 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  184 
//  185 
//  186 /**
//  187   * @}
//  188   */
//  189   
//  190 /**
//  191   * @}
//  192   */
//  193   
//  194 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
//  34 bytes in section .near.rodata
// 142 bytes in section .near_func.text
// 
// 142 bytes of CODE  memory
//  34 bytes of CONST memory
//
//Errors: none
//Warnings: none
