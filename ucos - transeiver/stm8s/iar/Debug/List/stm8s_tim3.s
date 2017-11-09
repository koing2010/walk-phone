///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:33 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim3.c         /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim3.c -e -Oh  /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_tim3.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_tim3

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?w0

        PUBLIC TIM3_ARRPreloadConfig
        PUBLIC TIM3_CCxCmd
        PUBLIC TIM3_ClearFlag
        PUBLIC TIM3_ClearITPendingBit
        PUBLIC TIM3_Cmd
        PUBLIC TIM3_DeInit
        PUBLIC TIM3_ForcedOC1Config
        PUBLIC TIM3_ForcedOC2Config
        PUBLIC TIM3_GenerateEvent
        PUBLIC TIM3_GetCapture1
        PUBLIC TIM3_GetCapture2
        PUBLIC TIM3_GetCounter
        PUBLIC TIM3_GetFlagStatus
        PUBLIC TIM3_GetITStatus
        PUBLIC TIM3_GetPrescaler
        PUBLIC TIM3_ICInit
        PUBLIC TIM3_ITConfig
        PUBLIC TIM3_OC1Init
        PUBLIC TIM3_OC1PolarityConfig
        PUBLIC TIM3_OC1PreloadConfig
        PUBLIC TIM3_OC2Init
        PUBLIC TIM3_OC2PolarityConfig
        PUBLIC TIM3_OC2PreloadConfig
        PUBLIC TIM3_PWMIConfig
        PUBLIC TIM3_PrescalerConfig
        PUBLIC TIM3_SelectOCxM
        PUBLIC TIM3_SelectOnePulseMode
        PUBLIC TIM3_SetAutoreload
        PUBLIC TIM3_SetCompare1
        PUBLIC TIM3_SetCompare2
        PUBLIC TIM3_SetCounter
        PUBLIC TIM3_SetIC1Prescaler
        PUBLIC TIM3_SetIC2Prescaler
        PUBLIC TIM3_TimeBaseInit
        PUBLIC TIM3_UpdateDisableConfig
        PUBLIC TIM3_UpdateRequestConfig

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim3.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_tim3.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the TIM3 peripheral.
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
//   23 #include "stm8s_tim3.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 static void TI1_Config(uint8_t TIM3_ICPolarity, uint8_t TIM3_ICSelection, uint8_t TIM3_ICFilter);
//   34 static void TI2_Config(uint8_t TIM3_ICPolarity, uint8_t TIM3_ICSelection, uint8_t TIM3_ICFilter);
//   35 /**
//   36   * @addtogroup TIM3_Public_Functions
//   37   * @{
//   38   */
//   39 
//   40 /**
//   41   * @brief  Deinitializes the TIM3 peripheral registers to their default reset values.
//   42   * @param  None
//   43   * @retval None
//   44   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 void TIM3_DeInit(void)
//   46 {
//   47 
//   48     TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
TIM3_DeInit:
        CLR       L:0x5320
//   49     TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
        CLR       L:0x5321
//   50     TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
        CLR       L:0x5323
//   51 
//   52     /* Disable channels */
//   53     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
        CLR       L:0x5327
//   54 
//   55     /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
//   56     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
        CLR       L:0x5327
//   57     TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
        CLR       L:0x5325
//   58     TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
        CLR       L:0x5326
//   59     TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
        CLR       L:0x5328
//   60     TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
        CLR       L:0x5329
//   61     TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
        CLR       L:0x532a
//   62     TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
        MOV       L:0x532b, #0xff
//   63     TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
        MOV       L:0x532c, #0xff
//   64     TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
        CLR       L:0x532d
//   65     TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
        CLR       L:0x532e
//   66     TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
        CLR       L:0x532f
//   67     TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
        CLR       L:0x5330
//   68     TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
        CLR       L:0x5322
//   69 }
        RET
//   70 
//   71 
//   72 /**
//   73   * @brief  Initializes the TIM3 Time Base Unit according to the specified parameters.
//   74   * @param    TIM3_Prescaler specifies the Prescaler from TIM3_Prescaler_TypeDef.
//   75   * @param    TIM3_Period specifies the Period value.
//   76   * @retval None
//   77   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   78 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
//   79                         uint16_t TIM3_Period)
//   80 {
TIM3_TimeBaseInit:
        LDW       Y, X
//   81     /* Set the Prescaler value */
//   82     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
        LD        L:0x532a, A
//   83     /* Set the Autoreload value */
//   84     TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
        CALL      L:?Subroutine9
//   85     TIM3->ARRL = (uint8_t)(TIM3_Period);
//   86 }
??CrossCallReturnLabel_19:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine9:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x532b, A
        LD        A, YL
        LD        L:0x532c, A
        RET
//   87 
//   88 /**
//   89   * @brief  Initializes the TIM3 Channel1 according to the specified parameters.
//   90   * @param   TIM3_OCMode specifies the Output Compare mode  from @ref TIM3_OCMode_TypeDef.
//   91   * @param   TIM3_OutputState specifies the Output State  from @ref TIM3_OutputState_TypeDef.
//   92   * @param   TIM3_Pulse specifies the Pulse width  value.
//   93   * @param   TIM3_OCPolarity specifies the Output Compare Polarity  from @ref TIM3_OCPolarity_TypeDef.
//   94   * @retval None
//   95   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   96 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
//   97                   TIM3_OutputState_TypeDef TIM3_OutputState,
//   98                   uint16_t TIM3_Pulse,
//   99                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
//  100 {
TIM3_OC1Init:
        LD        S:?b2, A
        LDW       Y, X
//  101     /* Check the parameters */
//  102     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
//  103     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
//  104     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
//  105 
//  106     /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , the Output Polarity */
//  107     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
        LD        A, L:0x5327
        AND       A, #0xfc
        LD        L:0x5327, A
//  108     /* Set the Output State &  Set the Output Polarity  */
//  109     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
        LD        A, S:?b1
        AND       A, #0x2
        PUSH      A
        LD        A, S:?b0
        AND       A, #0x1
        LD        S:?b0, A
        POP       A
        CALL      L:?Subroutine6
//  110 
//  111     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  112     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
??CrossCallReturnLabel_13:
        LD        A, L:0x5325
        AND       A, #0x8f
        OR        A, S:?b2
        LD        L:0x5325, A
//  113 
//  114     /* Set the Pulse value */
//  115     TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
        CALL      L:?Subroutine8
//  116     TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
//  117 }
??CrossCallReturnLabel_17:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine8:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x532d, A
        LD        A, YL
        LD        L:0x532e, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine6:
        OR        A, S:?b0
        OR        A, L:0x5327
        LD        L:0x5327, A
        RET
//  118 
//  119 
//  120 /**
//  121   * @brief  Initializes the TIM3 Channel2 according to the specified parameters.
//  122   * @param   TIM3_OCMode specifies the Output Compare mode  from @ref TIM3_OCMode_TypeDef.
//  123   * @param   TIM3_OutputState specifies the Output State  from @ref TIM3_OutputState_TypeDef.
//  124   * @param   TIM3_Pulse specifies the Pulse width  value.
//  125   * @param   TIM3_OCPolarity specifies the Output Compare Polarity  from @ref TIM3_OCPolarity_TypeDef.
//  126   * @retval None
//  127   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  128 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
//  129                   TIM3_OutputState_TypeDef TIM3_OutputState,
//  130                   uint16_t TIM3_Pulse,
//  131                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
//  132 {
TIM3_OC2Init:
        LD        S:?b2, A
        LDW       Y, X
//  133     /* Check the parameters */
//  134     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
//  135     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
//  136     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
//  137 
//  138 
//  139     /* Disable the Channel 1: Reset the CCE Bit, Set the Output State, the Output Polarity */
//  140     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
        LD        A, L:0x5327
        AND       A, #0xcf
        LD        L:0x5327, A
//  141     /* Set the Output State & Set the Output Polarity */
//  142     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
        LD        A, S:?b1
        AND       A, #0x20
        PUSH      A
        LD        A, S:?b0
        AND       A, #0x10
        LD        S:?b0, A
        POP       A
        CALL      L:?Subroutine6
//  143 
//  144 
//  145     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  146     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
??CrossCallReturnLabel_12:
        LD        A, L:0x5326
        AND       A, #0x8f
        OR        A, S:?b2
        LD        L:0x5326, A
//  147 
//  148 
//  149     /* Set the Pulse value */
//  150     TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
        CALL      L:?Subroutine7
//  151     TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
//  152 }
??CrossCallReturnLabel_15:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine7:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x532f, A
        LD        A, YL
        LD        L:0x5330, A
        RET
//  153 
//  154 /**
//  155   * @brief  Initializes the TIM3 peripheral according to the specified parameters.
//  156   * @param    TIM3_Channel specifies the Input Capture Channel from @ref TIM3_Channel_TypeDef.
//  157   * @param   TIM3_ICPolarity specifies the Input Capture Polarity from @ref TIM3_ICPolarity_TypeDef.
//  158   * @param   TIM3_ICSelection specifies the Input Capture Selection from @ref TIM3_ICSelection_TypeDef.
//  159   * @param   TIM3_ICPrescaler specifies the Input Capture Prescaler from @ref TIM3_ICPSC_TypeDef.
//  160   * @param   TIM3_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
//  161   * @retval None
//  162   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  163 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
//  164                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
//  165                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
//  166                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
//  167                  uint8_t TIM3_ICFilter)
//  168 {
TIM3_ICInit:
        MOV       S:?b4, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b5, S:?b2
        MOV       S:?b1, S:?b3
//  169     /* Check the parameters */
//  170     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
//  171     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
//  172     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
//  173     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
//  174     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
//  175 
//  176     if (TIM3_Channel != TIM3_CHANNEL_2)
        CP        A, #0x1
        JREQ      L:??TIM3_ICInit_0
//  177     {
//  178         /* TI1 Configuration */
//  179         TI1_Config((uint8_t)TIM3_ICPolarity,
//  180                    (uint8_t)TIM3_ICSelection,
//  181                    (uint8_t)TIM3_ICFilter);
        LD        A, S:?b4
        CALL      L:?Subroutine11
??CrossCallReturnLabel_23:
        OR        A, S:?b5
        LD        L:0x5325, A
//  182 
//  183         /* Set the Input Capture Prescaler value */
//  184         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
//  185     }
        RET
//  186     else
//  187     {
//  188         /* TI2 Configuration */
//  189         TI2_Config((uint8_t)TIM3_ICPolarity,
//  190                    (uint8_t)TIM3_ICSelection,
//  191                    (uint8_t)TIM3_ICFilter);
??TIM3_ICInit_0:
        LD        A, S:?b4
        CALL      L:?Subroutine12
??CrossCallReturnLabel_25:
        OR        A, S:?b5
        LD        L:0x5326, A
//  192 
//  193         /* Set the Input Capture Prescaler value */
//  194         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
//  195     }
//  196 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine12:
        CALL      L:TI2_Config
        LD        A, L:0x5326
        AND       A, #0xf3
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine11:
        CALL      L:TI1_Config
        LD        A, L:0x5325
        AND       A, #0xf3
        RET
//  197 /**
//  198   * @brief  Configures the TIM3 peripheral in PWM Input Mode according to the specified parameters.
//  199   * @param    TIM3_Channel specifies the Input Capture Channel from @ref TIM3_Channel_TypeDef.
//  200   * @param   TIM3_ICPolarity specifies the Input Capture Polarity from @ref TIM3_ICPolarity_TypeDef.
//  201   * @param   TIM3_ICSelection specifies the Input Capture Selection from @ref TIM3_ICSelection_TypeDef.
//  202   * @param   TIM3_ICPrescaler specifies the Input Capture Prescaler from @ref TIM3_ICPSC_TypeDef.
//  203   * @param   TIM3_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
//  204   * @retval None
//  205   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  206 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
//  207                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
//  208                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
//  209                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
//  210                      uint8_t TIM3_ICFilter)
//  211 {
TIM3_PWMIConfig:
        PUSH      S:?b8
        LD        S:?b6, A
        MOV       S:?b7, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b8, S:?b2
//  212     uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
//  213     uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
//  214 
//  215     /* Check the parameters */
//  216     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
//  217     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
//  218     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
//  219     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
//  220 
//  221     /* Select the Opposite Input Polarity */
//  222     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
        LD        A, S:?b7
        CP        A, #0x44
        JREQ      L:??TIM3_PWMIConfig_0
//  223     {
//  224         icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
        MOV       S:?b5, #0x44
        JRA       L:??TIM3_PWMIConfig_1
//  225     }
//  226     else
//  227     {
//  228         icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
??TIM3_PWMIConfig_0:
        CLR       S:?b5
//  229     }
//  230 
//  231     /* Select the Opposite Input */
//  232     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
??TIM3_PWMIConfig_1:
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM3_PWMIConfig_2
//  233     {
//  234         icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
        MOV       S:?b4, #0x2
        JRA       L:??TIM3_PWMIConfig_3
//  235     }
//  236     else
//  237     {
//  238         icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
??TIM3_PWMIConfig_2:
        MOV       S:?b4, #0x1
//  239     }
//  240 
//  241     if (TIM3_Channel != TIM3_CHANNEL_2)
??TIM3_PWMIConfig_3:
        LD        A, S:?b6
        CP        A, #0x1
        MOV       S:?b1, S:?b3
        JREQ      L:??TIM3_PWMIConfig_4
//  242     {
//  243         /* TI1 Configuration */
//  244         TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
//  245                    (uint8_t)TIM3_ICFilter);
        LD        A, S:?b7
        CALL      L:?Subroutine4
//  246 
//  247         /* Set the Input Capture Prescaler value */
//  248         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
//  249 
//  250         /* TI2 Configuration */
//  251         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
??CrossCallReturnLabel_8:
        CALL      L:?Subroutine10
//  252 
//  253         /* Set the Input Capture Prescaler value */
//  254         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
//  255     }
??CrossCallReturnLabel_20:
        CALL      L:?Subroutine2
??CrossCallReturnLabel_4:
        JRA       L:??CrossCallReturnLabel_9
//  256     else
//  257     {
//  258         /* TI2 Configuration */
//  259         TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
//  260                    (uint8_t)TIM3_ICFilter);
??TIM3_PWMIConfig_4:
        LD        A, S:?b7
        CALL      L:?Subroutine2
//  261 
//  262         /* Set the Input Capture Prescaler value */
//  263         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
//  264 
//  265         /* TI1 Configuration */
//  266         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
??CrossCallReturnLabel_5:
        CALL      L:?Subroutine10
//  267 
//  268         /* Set the Input Capture Prescaler value */
//  269         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
//  270     }
??CrossCallReturnLabel_21:
        CALL      L:?Subroutine4
//  271 }
??CrossCallReturnLabel_9:
        POP       S:?b8
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine10:
        MOV       S:?b1, S:?b3
        MOV       S:?b0, S:?b4
        LD        A, S:?b5
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine4:
        CALL      L:?Subroutine11
??CrossCallReturnLabel_22:
        OR        A, S:?b8
        LD        L:0x5325, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        CALL      L:?Subroutine12
??CrossCallReturnLabel_24:
        OR        A, S:?b8
        LD        L:0x5326, A
        RET
//  272 
//  273 
//  274 /**
//  275   * @brief  Enables or disables the TIM3 peripheral.
//  276   * @param   NewState new state of the TIM3 peripheral. This parameter can
//  277   * be ENABLE or DISABLE.
//  278   * @retval None
//  279   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  280 void TIM3_Cmd(FunctionalState NewState)
//  281 {
//  282     /* Check the parameters */
//  283     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  284 
//  285     /* set or Reset the CEN Bit */
//  286     if (NewState != DISABLE)
TIM3_Cmd:
        TNZ       A
        JREQ      L:??TIM3_Cmd_0
//  287     {
//  288         TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
        BSET      L:0x5320, #0x0
        RET
//  289     }
//  290     else
//  291     {
//  292         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
??TIM3_Cmd_0:
        BRES      L:0x5320, #0x0
//  293     }
//  294 }
        RET
//  295 
//  296 
//  297 /**
//  298   * @brief  Enables or disables the specified TIM3 interrupts.
//  299   * @param   NewState new state of the TIM3 peripheral.
//  300   * This parameter can be: ENABLE or DISABLE.
//  301   * @param   TIM3_IT specifies the TIM3 interrupts sources to be enabled or disabled.
//  302   * This parameter can be any combination of the following values:
//  303   *                       - TIM3_IT_UPDATE: TIM3 update Interrupt source
//  304   *                       - TIM3_IT_CC1: TIM3 Capture Compare 1 Interrupt source
//  305   *                       - TIM3_IT_CC2: TIM3 Capture Compare 2 Interrupt source
//  306   *                       - TIM3_IT_CC3: TIM3 Capture Compare 3 Interrupt source
//  307   * @param   NewState new state of the TIM3 peripheral.  * @retval None
//  308   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  309 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
//  310 {
//  311     /* Check the parameters */
//  312     assert_param(IS_TIM3_IT_OK(TIM3_IT));
//  313     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  314 
//  315     if (NewState != DISABLE)
TIM3_ITConfig:
        TNZ       S:?b0
        JREQ      L:??TIM3_ITConfig_0
//  316     {
//  317         /* Enable the Interrupt sources */
//  318         TIM3->IER |= (uint8_t)TIM3_IT;
        OR        A, L:0x5321
        JRA       L:??TIM3_ITConfig_1
//  319     }
//  320     else
//  321     {
//  322         /* Disable the Interrupt sources */
//  323         TIM3->IER &= (uint8_t)(~TIM3_IT);
??TIM3_ITConfig_0:
        CPL       A
        AND       A, L:0x5321
??TIM3_ITConfig_1:
        LD        L:0x5321, A
//  324     }
//  325 }
        RET
//  326 
//  327 
//  328 /**
//  329   * @brief  Enables or Disables the TIM3 Update event.
//  330   * @param   NewState new state of the TIM3 peripheral Preload register. This parameter can
//  331   * be ENABLE or DISABLE.
//  332   * @retval None
//  333   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  334 void TIM3_UpdateDisableConfig(FunctionalState NewState)
//  335 {
//  336     /* Check the parameters */
//  337     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  338 
//  339     /* Set or Reset the UDIS Bit */
//  340     if (NewState != DISABLE)
TIM3_UpdateDisableConfig:
        TNZ       A
        JREQ      L:??TIM3_UpdateDisableConfig_0
//  341     {
//  342         TIM3->CR1 |= TIM3_CR1_UDIS;
        BSET      L:0x5320, #0x1
        RET
//  343     }
//  344     else
//  345     {
//  346         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
??TIM3_UpdateDisableConfig_0:
        BRES      L:0x5320, #0x1
//  347     }
//  348 }
        RET
//  349 
//  350 /**
//  351   * @brief  Selects the TIM3 Update Request Interrupt source.
//  352   * @param   TIM3_UpdateSource specifies the Update source.
//  353   * This parameter can be one of the following values
//  354   *                       - TIM3_UPDATESOURCE_REGULAR
//  355   *                       - TIM3_UPDATESOURCE_GLOBAL
//  356   * @retval None
//  357   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  358 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
//  359 {
//  360     /* Check the parameters */
//  361     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
//  362 
//  363     /* Set or Reset the URS Bit */
//  364     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
TIM3_UpdateRequestConfig:
        TNZ       A
        JREQ      L:??TIM3_UpdateRequestConfig_0
//  365     {
//  366         TIM3->CR1 |= TIM3_CR1_URS;
        BSET      L:0x5320, #0x2
        RET
//  367     }
//  368     else
//  369     {
//  370         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
??TIM3_UpdateRequestConfig_0:
        BRES      L:0x5320, #0x2
//  371     }
//  372 }
        RET
//  373 
//  374 
//  375 /**
//  376   * @brief  Selects the TIM3’s One Pulse Mode.
//  377   * @param   TIM3_OPMode specifies the OPM Mode to be used.
//  378   * This parameter can be one of the following values
//  379   *                    - TIM3_OPMODE_SINGLE
//  380   *                    - TIM3_OPMODE_REPETITIVE
//  381   * @retval None
//  382   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
//  384 {
//  385     /* Check the parameters */
//  386     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
//  387 
//  388     /* Set or Reset the OPM Bit */
//  389     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
TIM3_SelectOnePulseMode:
        TNZ       A
        JREQ      L:??TIM3_SelectOnePulseMode_0
//  390     {
//  391         TIM3->CR1 |= TIM3_CR1_OPM;
        BSET      L:0x5320, #0x3
        RET
//  392     }
//  393     else
//  394     {
//  395         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
??TIM3_SelectOnePulseMode_0:
        BRES      L:0x5320, #0x3
//  396     }
//  397 
//  398 }
        RET
//  399 
//  400 
//  401 /**
//  402   * @brief  Configures the TIM3 Prescaler.
//  403   * @param   Prescaler specifies the Prescaler Register value
//  404   * This parameter can be one of the following values
//  405   *                       -  TIM3_PRESCALER_1
//  406   *                       -  TIM3_PRESCALER_2
//  407   *                       -  TIM3_PRESCALER_4
//  408   *                       -  TIM3_PRESCALER_8
//  409   *                       -  TIM3_PRESCALER_16
//  410   *                       -  TIM3_PRESCALER_32
//  411   *                       -  TIM3_PRESCALER_64
//  412   *                       -  TIM3_PRESCALER_128
//  413   *                       -  TIM3_PRESCALER_256
//  414   *                       -  TIM3_PRESCALER_512
//  415   *                       -  TIM3_PRESCALER_1024
//  416   *                       -  TIM3_PRESCALER_2048
//  417   *                       -  TIM3_PRESCALER_4096
//  418   *                       -  TIM3_PRESCALER_8192
//  419   *                       -  TIM3_PRESCALER_16384
//  420   *                       -  TIM3_PRESCALER_32768
//  421   * @param   TIM3_PSCReloadMode specifies the TIM3 Prescaler Reload mode.
//  422   * This parameter can be one of the following values
//  423   *                       - TIM3_PSCRELOADMODE_IMMEDIATE: The Prescaler is loaded
//  424   *                         immediatly.
//  425   *                       - TIM3_PSCRELOADMODE_UPDATE: The Prescaler is loaded at
//  426   *                         the update event.
//  427   * @retval None
//  428   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  429 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
//  430                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
//  431 {
//  432     /* Check the parameters */
//  433     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
//  434     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
//  435 
//  436     /* Set the Prescaler value */
//  437     TIM3->PSCR = (uint8_t)Prescaler;
TIM3_PrescalerConfig:
        LD        L:0x532a, A
//  438 
//  439     /* Set or reset the UG Bit */
//  440     TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
        LD        A, S:?b0
        LD        L:0x5324, A
//  441 }
        RET
//  442 
//  443 /**
//  444   * @brief  Forces the TIM3 Channel1 output waveform to active or inactive level.
//  445   * @param   TIM3_ForcedAction specifies the forced Action to be set to the output waveform.
//  446   * This parameter can be one of the following values:
//  447   *                       - TIM3_FORCEDACTION_ACTIVE: Force active level on OC1REF
//  448   *                       - TIM3_FORCEDACTION_INACTIVE: Force inactive level on
//  449   *                         OC1REF.
//  450   * @retval None
//  451   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  452 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
//  453 {
TIM3_ForcedOC1Config:
        LD        S:?b0, A
//  454     /* Check the parameters */
//  455     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
//  456 
//  457     /* Reset the OCM Bits & Configure the Forced output Mode */
//  458     TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
        CALL      L:?Subroutine5
//  459 }
??CrossCallReturnLabel_11:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine5:
        LD        A, L:0x5325
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5325, A
        RET
//  460 
//  461 /**
//  462   * @brief  Forces the TIM3 Channel2 output waveform to active or inactive level.
//  463   * @param   TIM3_ForcedAction specifies the forced Action to be set to the output waveform.
//  464   * This parameter can be one of the following values:
//  465   *                       - TIM3_FORCEDACTION_ACTIVE: Force active level on OC2REF
//  466   *                       - TIM3_FORCEDACTION_INACTIVE: Force inactive level on
//  467   *                         OC2REF.
//  468   * @retval None
//  469   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  470 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
//  471 {
TIM3_ForcedOC2Config:
        LD        S:?b0, A
//  472     /* Check the parameters */
//  473     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
//  474 
//  475     /* Reset the OCM Bits & Configure the Forced output Mode */
//  476     TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
        CALL      L:?Subroutine3
//  477 }
??CrossCallReturnLabel_7:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine3:
        LD        A, L:0x5326
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5326, A
        RET
//  478 
//  479 
//  480 /**
//  481   * @brief  Enables or disables TIM3 peripheral Preload register on ARR.
//  482   * @param   NewState new state of the TIM3 peripheral Preload register.
//  483   * This parameter can be ENABLE or DISABLE.
//  484   * @retval None
//  485   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  486 void TIM3_ARRPreloadConfig(FunctionalState NewState)
//  487 {
//  488     /* Check the parameters */
//  489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  490 
//  491     /* Set or Reset the ARPE Bit */
//  492     if (NewState != DISABLE)
TIM3_ARRPreloadConfig:
        TNZ       A
        JREQ      L:??TIM3_ARRPreloadConfig_0
//  493     {
//  494         TIM3->CR1 |= TIM3_CR1_ARPE;
        BSET      L:0x5320, #0x7
        RET
//  495     }
//  496     else
//  497     {
//  498         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
??TIM3_ARRPreloadConfig_0:
        BRES      L:0x5320, #0x7
//  499     }
//  500 }
        RET
//  501 
//  502 
//  503 /**
//  504   * @brief  Enables or disables the TIM3 peripheral Preload Register on CCR1.
//  505   * @param   NewState new state of the Capture Compare Preload register.
//  506   * This parameter can be ENABLE or DISABLE.
//  507   * @retval None
//  508   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  509 void TIM3_OC1PreloadConfig(FunctionalState NewState)
//  510 {
//  511     /* Check the parameters */
//  512     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  513 
//  514     /* Set or Reset the OC1PE Bit */
//  515     if (NewState != DISABLE)
TIM3_OC1PreloadConfig:
        TNZ       A
        JREQ      L:??TIM3_OC1PreloadConfig_0
//  516     {
//  517         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
        BSET      L:0x5325, #0x3
        RET
//  518     }
//  519     else
//  520     {
//  521         TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
??TIM3_OC1PreloadConfig_0:
        BRES      L:0x5325, #0x3
//  522     }
//  523 }
        RET
//  524 
//  525 
//  526 /**
//  527   * @brief  Enables or disables the TIM3 peripheral Preload Register on CCR2.
//  528   * @param   NewState new state of the Capture Compare Preload register.
//  529   * This parameter can be ENABLE or DISABLE.
//  530   * @retval None
//  531   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  532 void TIM3_OC2PreloadConfig(FunctionalState NewState)
//  533 {
//  534     /* Check the parameters */
//  535     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  536 
//  537     /* Set or Reset the OC2PE Bit */
//  538     if (NewState != DISABLE)
TIM3_OC2PreloadConfig:
        TNZ       A
        JREQ      L:??TIM3_OC2PreloadConfig_0
//  539     {
//  540         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
        BSET      L:0x5326, #0x3
        RET
//  541     }
//  542     else
//  543     {
//  544         TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
??TIM3_OC2PreloadConfig_0:
        BRES      L:0x5326, #0x3
//  545     }
//  546 }
        RET
//  547 
//  548 /**
//  549   * @brief  Configures the TIM3 event to be generated by software.
//  550   * @param   TIM3_EventSource specifies the event source.
//  551   * This parameter can be one of the following values:
//  552   *                       - TIM3_EVENTSOURCE_UPDATE: TIM3 update Event source
//  553   *                       - TIM3_EVENTSOURCE_CC1: TIM3 Capture Compare 1 Event source
//  554   *                       - TIM3_EVENTSOURCE_CC2: TIM3 Capture Compare 2 Event source
//  555   * @retval None
//  556   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  557 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
//  558 {
//  559     /* Check the parameters */
//  560     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
//  561 
//  562     /* Set the event sources */
//  563     TIM3->EGR = (uint8_t)TIM3_EventSource;
TIM3_GenerateEvent:
        LD        L:0x5324, A
//  564 }
        RET
//  565 
//  566 
//  567 /**
//  568   * @brief  Configures the TIM3 Channel 1 polarity.
//  569   * @param   TIM3_OCPolarity specifies the OC1 Polarity.
//  570   * This parameter can be one of the following values:
//  571   *                       - TIM3_OCPOLARITY_LOW: Output Compare active low
//  572   *                       - TIM3_OCPOLARITY_HIGH: Output Compare active high
//  573   * @retval None
//  574   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  575 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
//  576 {
//  577     /* Check the parameters */
//  578     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
//  579 
//  580     /* Set or Reset the CC1P Bit */
//  581     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
TIM3_OC1PolarityConfig:
        TNZ       A
        JREQ      L:??TIM3_OC1PolarityConfig_0
//  582     {
//  583         TIM3->CCER1 |= TIM3_CCER1_CC1P;
        BSET      L:0x5327, #0x1
        RET
//  584     }
//  585     else
//  586     {
//  587         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
??TIM3_OC1PolarityConfig_0:
        BRES      L:0x5327, #0x1
//  588     }
//  589 }
        RET
//  590 
//  591 
//  592 /**
//  593   * @brief  Configures the TIM3 Channel 2 polarity.
//  594   * @param   TIM3_OCPolarity specifies the OC2 Polarity.
//  595   * This parameter can be one of the following values:
//  596   *                       - TIM3_OCPOLARITY_LOW: Output Compare active low
//  597   *                       - TIM3_OCPOLARITY_HIGH: Output Compare active high
//  598   * @retval None
//  599   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  600 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
//  601 {
//  602     /* Check the parameters */
//  603     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
//  604 
//  605     /* Set or Reset the CC2P Bit */
//  606     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
TIM3_OC2PolarityConfig:
        TNZ       A
        JREQ      L:??TIM3_OC2PolarityConfig_0
//  607     {
//  608         TIM3->CCER1 |= TIM3_CCER1_CC2P;
        BSET      L:0x5327, #0x5
        RET
//  609     }
//  610     else
//  611     {
//  612         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
??TIM3_OC2PolarityConfig_0:
        BRES      L:0x5327, #0x5
//  613     }
//  614 }
        RET
//  615 
//  616 
//  617 /**
//  618   * @brief  Enables or disables the TIM3 Capture Compare Channel x.
//  619   * @param   TIM3_Channel specifies the TIM3 Channel.
//  620   * This parameter can be one of the following values:
//  621   *                       - TIM3_CHANNEL_1: TIM3 Channel1
//  622   *                       - TIM3_CHANNEL_2: TIM3 Channel2
//  623   * @param   NewState specifies the TIM3 Channel CCxE bit new state.
//  624   * This parameter can be: ENABLE or DISABLE.
//  625   * @retval None
//  626   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  627 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
//  628 {
//  629     /* Check the parameters */
//  630     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
//  631     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  632 
//  633     if (TIM3_Channel == TIM3_CHANNEL_1)
TIM3_CCxCmd:
        TNZ       A
        JRNE      L:??TIM3_CCxCmd_0
//  634     {
//  635         /* Set or Reset the CC1E Bit */
//  636         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??TIM3_CCxCmd_1
//  637         {
//  638             TIM3->CCER1 |= TIM3_CCER1_CC1E;
        BSET      L:0x5327, #0x0
        RET
//  639         }
//  640         else
//  641         {
//  642             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
??TIM3_CCxCmd_1:
        BRES      L:0x5327, #0x0
        RET
//  643         }
//  644 
//  645     }
//  646     else
//  647     {
//  648         /* Set or Reset the CC2E Bit */
//  649         if (NewState != DISABLE)
??TIM3_CCxCmd_0:
        TNZ       S:?b0
        JREQ      L:??TIM3_CCxCmd_2
//  650         {
//  651             TIM3->CCER1 |= TIM3_CCER1_CC2E;
        BSET      L:0x5327, #0x4
        RET
//  652         }
//  653         else
//  654         {
//  655             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
??TIM3_CCxCmd_2:
        BRES      L:0x5327, #0x4
//  656         }
//  657     }
//  658 
//  659 }
        RET
//  660 
//  661 /**
//  662   * @brief  Selects the TIM3 Output Compare Mode. This function disables the
//  663   * selected channel before changing the Output Compare Mode. User has to
//  664   * enable this channel using TIM3_CCxCmd and TIM3_CCxNCmd functions.
//  665   * @param   TIM3_Channel specifies the TIM3 Channel.
//  666   * This parameter can be one of the following values:
//  667   *                       - TIM3_CHANNEL_1: TIM3 Channel1
//  668   *                       - TIM3_CHANNEL_2: TIM3 Channel2
//  669   * @param   TIM3_OCMode specifies the TIM3 Output Compare Mode.
//  670   * This paramter can be one of the following values:
//  671   *                       - TIM3_OCMODE_TIMING
//  672   *                       - TIM3_OCMODE_ACTIVE
//  673   *                       - TIM3_OCMODE_TOGGLE
//  674   *                       - TIM3_OCMODE_PWM1
//  675   *                       - TIM3_OCMODE_PWM2
//  676   *                       - TIM3_FORCEDACTION_ACTIVE
//  677   *                       - TIM3_FORCEDACTION_INACTIVE
//  678   * @retval None
//  679   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  680 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
//  681 {
//  682     /* Check the parameters */
//  683     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
//  684     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
//  685 
//  686     if (TIM3_Channel == TIM3_CHANNEL_1)
TIM3_SelectOCxM:
        TNZ       A
        JRNE      L:??TIM3_SelectOCxM_0
//  687     {
//  688         /* Disable the Channel 1: Reset the CCE Bit */
//  689         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
        BRES      L:0x5327, #0x0
//  690 
//  691         /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  692         TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
        CALL      L:?Subroutine5
//  693     }
??CrossCallReturnLabel_10:
        RET
//  694     else
//  695     {
//  696         /* Disable the Channel 2: Reset the CCE Bit */
//  697         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
??TIM3_SelectOCxM_0:
        BRES      L:0x5327, #0x4
//  698 
//  699         /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  700         TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
        CALL      L:?Subroutine3
//  701     }
//  702 }
??CrossCallReturnLabel_6:
        RET
//  703 
//  704 
//  705 /**
//  706   * @brief  Sets the TIM3 Counter Register value.
//  707   * @param   Counter specifies the Counter register new value.
//  708   * This parameter is between 0x0000 and 0xFFFF.
//  709   * @retval None
//  710   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  711 void TIM3_SetCounter(uint16_t Counter)
//  712 {
TIM3_SetCounter:
        LDW       Y, X
//  713     /* Set the Counter Register value */
//  714     TIM3->CNTRH = (uint8_t)(Counter >> 8);
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5328, A
//  715     TIM3->CNTRL = (uint8_t)(Counter);
        LD        A, YL
        LD        L:0x5329, A
//  716 
//  717 }
        RET
//  718 
//  719 
//  720 /**
//  721   * @brief  Sets the TIM3 Autoreload Register value.
//  722   * @param   Autoreload specifies the Autoreload register new value.
//  723   * This parameter is between 0x0000 and 0xFFFF.
//  724   * @retval None
//  725   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  726 void TIM3_SetAutoreload(uint16_t Autoreload)
//  727 {
TIM3_SetAutoreload:
        LDW       Y, X
//  728     /* Set the Autoreload Register value */
//  729     TIM3->ARRH = (uint8_t)(Autoreload >> 8);
        CALL      L:?Subroutine9
//  730     TIM3->ARRL = (uint8_t)(Autoreload);
//  731 }
??CrossCallReturnLabel_18:
        RET
//  732 
//  733 
//  734 /**
//  735   * @brief  Sets the TIM3 Capture Compare1 Register value.
//  736   * @param   Compare1 specifies the Capture Compare1 register new value.
//  737   * This parameter is between 0x0000 and 0xFFFF.
//  738   * @retval None
//  739   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  740 void TIM3_SetCompare1(uint16_t Compare1)
//  741 {
TIM3_SetCompare1:
        LDW       Y, X
//  742     /* Set the Capture Compare1 Register value */
//  743     TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
        CALL      L:?Subroutine8
//  744     TIM3->CCR1L = (uint8_t)(Compare1);
//  745 }
??CrossCallReturnLabel_16:
        RET
//  746 
//  747 
//  748 /**
//  749   * @brief  Sets the TIM3 Capture Compare2 Register value.
//  750   * @param   Compare2 specifies the Capture Compare2 register new value.
//  751   * This parameter is between 0x0000 and 0xFFFF.
//  752   * @retval None
//  753   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  754 void TIM3_SetCompare2(uint16_t Compare2)
//  755 {
TIM3_SetCompare2:
        LDW       Y, X
//  756     /* Set the Capture Compare2 Register value */
//  757     TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
        CALL      L:?Subroutine7
//  758     TIM3->CCR2L = (uint8_t)(Compare2);
//  759 }
??CrossCallReturnLabel_14:
        RET
//  760 
//  761 
//  762 /**
//  763   * @brief  Sets the TIM3 Input Capture 1 prescaler.
//  764   * @param   TIM3_IC1Prescaler specifies the Input Capture prescaler new value
//  765   * This parameter can be one of the following values:
//  766   *                       - TIM3_ICPSC_DIV1: no prescaler
//  767   *                       - TIM3_ICPSC_DIV2: capture is done once every 2 events
//  768   *                       - TIM3_ICPSC_DIV4: capture is done once every 4 events
//  769   *                       - TIM3_ICPSC_DIV8: capture is done once every 8 events
//  770   * @retval None
//  771   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  772 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
//  773 {
TIM3_SetIC1Prescaler:
        LD        S:?b0, A
//  774     /* Check the parameters */
//  775     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
//  776 
//  777     /* Reset the IC1PSC Bits & Set the IC1PSC value */
//  778     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
        LD        A, L:0x5325
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5325, A
//  779 }
        RET
//  780 
//  781 /**
//  782   * @brief  Sets the TIM3 Input Capture 2 prescaler.
//  783   * @param   TIM3_IC2Prescaler specifies the Input Capture prescaler new value
//  784   * This parameter can be one of the following values:
//  785   *                       - TIM3_ICPSC_DIV1: no prescaler
//  786   *                       - TIM3_ICPSC_DIV2: capture is done once every 2 events
//  787   *                       - TIM3_ICPSC_DIV4: capture is done once every 4 events
//  788   *                       - TIM3_ICPSC_DIV8: capture is done once every 8 events
//  789   * @retval None
//  790   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  791 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
//  792 {
TIM3_SetIC2Prescaler:
        LD        S:?b0, A
//  793     /* Check the parameters */
//  794     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
//  795 
//  796     /* Reset the IC1PSC Bits & Set the IC1PSC value */
//  797     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
        LD        A, L:0x5326
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5326, A
//  798 }
        RET
//  799 /**
//  800   * @brief  Gets the TIM3 Input Capture 1 value.
//  801   * @param  None
//  802   * @retval Capture Compare 1 Register value.
//  803   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  804 uint16_t TIM3_GetCapture1(void)
//  805 {
//  806     /* Get the Capture 1 Register value */
//  807     uint16_t tmpccr1 = 0;
//  808     uint8_t tmpccr1l=0, tmpccr1h=0;
//  809 
//  810     tmpccr1h = TIM3->CCR1H;
TIM3_GetCapture1:
        LD        A, L:0x532d
        LD        S:?b1, A
//  811     tmpccr1l = TIM3->CCR1L;
        LD        A, L:0x532e
        CALL      L:?Subroutine0
//  812 
//  813     tmpccr1 = (uint16_t)(tmpccr1l);
//  814     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
//  815     /* Get the Capture 1 Register value */
//  816     return (uint16_t)tmpccr1;
??CrossCallReturnLabel_1:
        RET
//  817 }

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LD        S:?b0, A
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        CLR       A
        RLWA      X, A
        CLRW      Y
        LD        A, S:?b0
        EXG       A, YL
        LDW       S:?w0, X
        LDW       X, Y
        RLWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
//  818 
//  819 /**
//  820   * @brief  Gets the TIM3 Input Capture 2 value.
//  821   * @param  None
//  822   * @retval Capture Compare 2 Register value.
//  823   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  824 uint16_t TIM3_GetCapture2(void)
//  825 {
//  826     /* Get the Capture 2 Register value */
//  827     uint16_t tmpccr2 = 0;
//  828     uint8_t tmpccr2l=0, tmpccr2h=0;
//  829 
//  830     tmpccr2h = TIM3->CCR2H;
TIM3_GetCapture2:
        LD        A, L:0x532f
        LD        S:?b1, A
//  831     tmpccr2l = TIM3->CCR2L;
        LD        A, L:0x5330
        CALL      L:?Subroutine0
//  832 
//  833     tmpccr2 = (uint16_t)(tmpccr2l);
//  834     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
//  835     /* Get the Capture 2 Register value */
//  836     return (uint16_t)tmpccr2;
??CrossCallReturnLabel_0:
        RET
//  837 }
//  838 
//  839 /**
//  840   * @brief  Gets the TIM3 Counter value.
//  841   * @param  None
//  842   * @retval Counter Register value.
//  843   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  844 uint16_t TIM3_GetCounter(void)
//  845 {
//  846    uint16_t tmpcntr = 0;
//  847   
//  848    tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
TIM3_GetCounter:
        LD        A, L:0x5328
//  849    /* Get the Counter Register value */
//  850     return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LD        A, L:0x5329
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
        RET
//  851 }
//  852 
//  853 
//  854 /**
//  855   * @brief  Gets the TIM3 Prescaler value.
//  856   * @param  None
//  857   * @retval Prescaler Register configuration value @ref TIM3_Prescaler_TypeDef.
//  858   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  859 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
//  860 {
//  861     /* Get the Prescaler Register value */
//  862     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
TIM3_GetPrescaler:
        LD        A, L:0x532a
        RET
//  863 }
//  864 
//  865 
//  866 /**
//  867   * @brief  Checks whether the specified TIM3 flag is set or not.
//  868   * @param   TIM3_FLAG specifies the flag to check.
//  869   * This parameter can be one of the following values:
//  870   *                       - TIM3_FLAG_UPDATE: TIM3 update Flag
//  871   *                       - TIM3_FLAG_CC1: TIM3 Capture Compare 1 Flag
//  872   *                       - TIM3_FLAG_CC2: TIM3 Capture Compare 2 Flag
//  873   *                       - TIM3_FLAG_CC1OF: TIM3 Capture Compare 1 over capture Flag
//  874   *                       - TIM3_FLAG_CC2OF: TIM3 Capture Compare 2 over capture Flag
//  875   * @retval FlagStatus The new state of TIM3_FLAG (SET or RESET).
//  876   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  877 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
//  878 {
TIM3_GetFlagStatus:
        LDW       Y, X
//  879    FlagStatus bitstatus = RESET;
//  880    uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
//  881 
//  882     /* Check the parameters */
//  883     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
//  884 
//  885     tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
        LD        A, L:0x5322
        LD        S:?b1, A
//  886     tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
//  887 
//  888     if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
        CLR       A
        RRWA      X, A
        LD        A, XL
        AND       A, L:0x5323
        PUSH      A
        LD        A, YL
        AND       A, S:?b1
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        JREQ      L:??TIM3_GetFlagStatus_0
//  889     {
//  890         bitstatus = SET;
        LD        A, #0x1
        RET
//  891     }
//  892     else
//  893     {
//  894         bitstatus = RESET;
??TIM3_GetFlagStatus_0:
        CLR       A
//  895     }
//  896     return (FlagStatus)bitstatus;
        RET
//  897 }
//  898 
//  899 
//  900 /**
//  901   * @brief  Clears the TIM3’s pending flags.
//  902   * @param   TIM3_FLAG specifies the flag to clear.
//  903   * This parameter can be one of the following values:
//  904   *                       - TIM3_FLAG_UPDATE: TIM3 update Flag
//  905   *                       - TIM3_FLAG_CC1: TIM3 Capture Compare 1 Flag
//  906   *                       - TIM3_FLAG_CC2: TIM3 Capture Compare 2 Flag
//  907   *                       - TIM3_FLAG_CC1OF: TIM3 Capture Compare 1 over capture Flag
//  908   *                       - TIM3_FLAG_CC2OF: TIM3 Capture Compare 2 over capture Flag
//  909   * @retval None.
//  910   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  911 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
//  912 {
//  913     /* Check the parameters */
//  914     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
//  915 
//  916     /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
//  917     TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
TIM3_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x5322, A
//  918     TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
        CLR       A
        RRWA      X, A
        LD        A, XL
        CPL       A
        LD        L:0x5323, A
//  919 }
        RET
//  920 
//  921 
//  922 /**
//  923   * @brief  Checks whether the TIM3 interrupt has occurred or not.
//  924   * @param   TIM3_IT specifies the TIM3 interrupt source to check.
//  925   * This parameter can be one of the following values:
//  926   *                       - TIM3_IT_UPDATE: TIM3 update Interrupt source
//  927   *                       - TIM3_IT_CC1: TIM3 Capture Compare 1 Interrupt source
//  928   *                       - TIM3_IT_CC2: TIM3 Capture Compare 2 Interrupt source
//  929   * @retval ITStatus The new state of the TIM3_IT(SET or RESET).
//  930   */
//  931 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  932 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
//  933 {
TIM3_GetITStatus:
        LD        S:?b0, A
//  934     ITStatus bitstatus = RESET;
//  935     uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
//  936 
//  937     /* Check the parameters */
//  938     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
//  939 
//  940     TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
        LD        A, L:0x5322
        LD        S:?b2, A
//  941 
//  942     TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
        LD        A, S:?b0
        AND       A, L:0x5321
        LD        S:?b1, A
//  943 
//  944     if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
        LD        A, S:?b0
        BCP       A, S:?b2
        JREQ      L:??TIM3_GetITStatus_0
        TNZ       S:?b1
        JREQ      L:??TIM3_GetITStatus_0
//  945     {
//  946         bitstatus = SET;
        LD        A, #0x1
        RET
//  947     }
//  948     else
//  949     {
//  950         bitstatus = RESET;
??TIM3_GetITStatus_0:
        CLR       A
//  951     }
//  952     return (ITStatus)(bitstatus);
        RET
//  953 }
//  954 
//  955 
//  956 /**
//  957   * @brief  Clears the TIM3's interrupt pending bits.
//  958   * @param   TIM3_IT specifies the pending bit to clear.
//  959   * This parameter can be one of the following values:
//  960   *                       - TIM3_IT_UPDATE: TIM3 update Interrupt source
//  961   *                       - TIM3_IT_CC1: TIM3 Capture Compare 1 Interrupt source
//  962   *                       - TIM3_IT_CC2: TIM3 Capture Compare 2 Interrupt source
//  963   * @retval None.
//  964   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  965 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
//  966 {
//  967     /* Check the parameters */
//  968     assert_param(IS_TIM3_IT_OK(TIM3_IT));
//  969 
//  970     /* Clear the IT pending Bit */
//  971     TIM3->SR1 = (uint8_t)(~TIM3_IT);
TIM3_ClearITPendingBit:
        CPL       A
        LD        L:0x5322, A
//  972 }
        RET
//  973 
//  974 
//  975 /**
//  976   * @brief  Configure the TI1 as Input.
//  977   * @param   TIM3_ICPolarity  The Input Polarity.
//  978   * This parameter can be one of the following values:
//  979   *                       - TIM3_ICPOLARITY_FALLING
//  980   *                       - TIM3_ICPOLARITY_RISING
//  981   * @param   TIM3_ICSelection specifies the input to be used.
//  982   * This parameter can be one of the following values:
//  983   *                       - TIM3_ICSELECTION_DIRECTTI: TIM3 Input 1 is selected to
//  984   *                         be connected to IC1.
//  985   *                       - TIM3_ICSELECTION_INDIRECTTI: TIM3 Input 1 is selected to
//  986   *                         be connected to IC2.
//  987   * @param   TIM3_ICFilter Specifies the Input Capture Filter.
//  988   * This parameter must be a value between 0x00 and 0x0F.
//  989   * @retval None
//  990   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  991 static void TI1_Config(uint8_t TIM3_ICPolarity,
//  992                        uint8_t TIM3_ICSelection,
//  993                        uint8_t TIM3_ICFilter)
//  994 {
TI1_Config:
        LD        S:?b2, A
//  995     /* Disable the Channel 1: Reset the CCE Bit */
//  996     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
        BRES      L:0x5327, #0x0
//  997 
//  998     /* Select the Input and set the filter */
//  999     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
        LD        A, L:0x5325
        CALL      L:?Subroutine1
??CrossCallReturnLabel_3:
        LD        L:0x5325, A
// 1000 
// 1001     /* Select the Polarity */
// 1002     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI1_Config_0
// 1003     {
// 1004         TIM3->CCER1 |= TIM3_CCER1_CC1P;
        BSET      L:0x5327, #0x1
        JRA       L:??TI1_Config_1
// 1005     }
// 1006     else
// 1007     {
// 1008         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
??TI1_Config_0:
        BRES      L:0x5327, #0x1
// 1009     }
// 1010     /* Set the CCE Bit */
// 1011     TIM3->CCER1 |= TIM3_CCER1_CC1E;
??TI1_Config_1:
        BSET      L:0x5327, #0x0
// 1012 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        AND       A, #0xc
        OR        A, S:?b0
        LD        S:?b0, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        RET
// 1013 
// 1014 
// 1015 /**
// 1016   * @brief  Configure the TI2 as Input.
// 1017   * @param   TIM3_ICPolarity  The Input Polarity.
// 1018   * This parameter can be one of the following values:
// 1019   *                       - TIM3_ICPOLARITY_FALLING
// 1020   *                       - TIM3_ICPOLARITY_RISING
// 1021   * @param   TIM3_ICSelection specifies the input to be used.
// 1022   * This parameter can be one of the following values:
// 1023   *                       - TIM3_ICSELECTION_DIRECTTI: TIM3 Input 2 is selected to
// 1024   *                         be connected to IC2.
// 1025   *                       - TIM3_ICSELECTION_INDIRECTTI: TIM3 Input 2 is selected to
// 1026   *                         be connected to IC1.
// 1027   * @param   TIM3_ICFilter Specifies the Input Capture Filter.
// 1028   * This parameter must be a value between 0x00 and 0x0F.
// 1029   * @retval None
// 1030   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1031 static void TI2_Config(uint8_t TIM3_ICPolarity,
// 1032                        uint8_t TIM3_ICSelection,
// 1033                        uint8_t TIM3_ICFilter)
// 1034 {
TI2_Config:
        LD        S:?b2, A
// 1035     /* Disable the Channel 2: Reset the CCE Bit */
// 1036     TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
        BRES      L:0x5327, #0x4
// 1037 
// 1038     /* Select the Input and set the filter */
// 1039     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
// 1040                   TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
// 1041                   ((uint8_t)( TIM3_ICFilter << 4))));
        LD        A, L:0x5326
        CALL      L:?Subroutine1
??CrossCallReturnLabel_2:
        LD        L:0x5326, A
// 1042 
// 1043     /* Select the Polarity */
// 1044     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI2_Config_0
// 1045     {
// 1046         TIM3->CCER1 |= TIM3_CCER1_CC2P;
        BSET      L:0x5327, #0x5
        JRA       L:??TI2_Config_1
// 1047     }
// 1048     else
// 1049     {
// 1050         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
??TI2_Config_0:
        BRES      L:0x5327, #0x5
// 1051     }
// 1052 
// 1053     /* Set the CCE Bit */
// 1054     TIM3->CCER1 |= TIM3_CCER1_CC2E;
??TI2_Config_1:
        BSET      L:0x5327, #0x4
// 1055 
// 1056 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 1057 /**
// 1058   * @}
// 1059   */
// 1060   
// 1061   /**
// 1062   * @}
// 1063   */
// 1064   
// 1065 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 889 bytes in section .near_func.text
// 
// 889 bytes of CODE memory
//
//Errors: none
//Warnings: none
