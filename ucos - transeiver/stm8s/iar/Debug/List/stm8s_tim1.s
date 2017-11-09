///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:25 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim1.c         /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim1.c -e -Oh  /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_tim1.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_tim1

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
        EXTERN ?w1

        PUBLIC TIM1_ARRPreloadConfig
        PUBLIC TIM1_BDTRConfig
        PUBLIC TIM1_CCPreloadControl
        PUBLIC TIM1_CCxCmd
        PUBLIC TIM1_CCxNCmd
        PUBLIC TIM1_ClearFlag
        PUBLIC TIM1_ClearITPendingBit
        PUBLIC TIM1_Cmd
        PUBLIC TIM1_CounterModeConfig
        PUBLIC TIM1_CtrlPWMOutputs
        PUBLIC TIM1_DeInit
        PUBLIC TIM1_ETRClockMode1Config
        PUBLIC TIM1_ETRClockMode2Config
        PUBLIC TIM1_ETRConfig
        PUBLIC TIM1_EncoderInterfaceConfig
        PUBLIC TIM1_ForcedOC1Config
        PUBLIC TIM1_ForcedOC2Config
        PUBLIC TIM1_ForcedOC3Config
        PUBLIC TIM1_ForcedOC4Config
        PUBLIC TIM1_GenerateEvent
        PUBLIC TIM1_GetCapture1
        PUBLIC TIM1_GetCapture2
        PUBLIC TIM1_GetCapture3
        PUBLIC TIM1_GetCapture4
        PUBLIC TIM1_GetCounter
        PUBLIC TIM1_GetFlagStatus
        PUBLIC TIM1_GetITStatus
        PUBLIC TIM1_GetPrescaler
        PUBLIC TIM1_ICInit
        PUBLIC TIM1_ITConfig
        PUBLIC TIM1_InternalClockConfig
        PUBLIC TIM1_OC1FastConfig
        PUBLIC TIM1_OC1Init
        PUBLIC TIM1_OC1NPolarityConfig
        PUBLIC TIM1_OC1PolarityConfig
        PUBLIC TIM1_OC1PreloadConfig
        PUBLIC TIM1_OC2FastConfig
        PUBLIC TIM1_OC2Init
        PUBLIC TIM1_OC2NPolarityConfig
        PUBLIC TIM1_OC2PolarityConfig
        PUBLIC TIM1_OC2PreloadConfig
        PUBLIC TIM1_OC3FastConfig
        PUBLIC TIM1_OC3Init
        PUBLIC TIM1_OC3NPolarityConfig
        PUBLIC TIM1_OC3PolarityConfig
        PUBLIC TIM1_OC3PreloadConfig
        PUBLIC TIM1_OC4FastConfig
        PUBLIC TIM1_OC4Init
        PUBLIC TIM1_OC4PolarityConfig
        PUBLIC TIM1_OC4PreloadConfig
        PUBLIC TIM1_PWMIConfig
        PUBLIC TIM1_PrescalerConfig
        PUBLIC TIM1_SelectCOM
        PUBLIC TIM1_SelectHallSensor
        PUBLIC TIM1_SelectInputTrigger
        PUBLIC TIM1_SelectMasterSlaveMode
        PUBLIC TIM1_SelectOCxM
        PUBLIC TIM1_SelectOnePulseMode
        PUBLIC TIM1_SelectOutputTrigger
        PUBLIC TIM1_SelectSlaveMode
        PUBLIC TIM1_SetAutoreload
        PUBLIC TIM1_SetCompare1
        PUBLIC TIM1_SetCompare2
        PUBLIC TIM1_SetCompare3
        PUBLIC TIM1_SetCompare4
        PUBLIC TIM1_SetCounter
        PUBLIC TIM1_SetIC1Prescaler
        PUBLIC TIM1_SetIC2Prescaler
        PUBLIC TIM1_SetIC3Prescaler
        PUBLIC TIM1_SetIC4Prescaler
        PUBLIC TIM1_TIxExternalClockConfig
        PUBLIC TIM1_TimeBaseInit
        PUBLIC TIM1_UpdateDisableConfig
        PUBLIC TIM1_UpdateRequestConfig

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim1.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_tim1.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the TIM1 peripheral.
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
//   23 #include "stm8s_tim1.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   34                        uint8_t TIM1_ICFilter);
//   35 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   36                        uint8_t TIM1_ICFilter);
//   37 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   38                        uint8_t TIM1_ICFilter);
//   39 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   40                        uint8_t TIM1_ICFilter);
//   41 
//   42 /**
//   43   * @addtogroup TIM1_Public_Functions
//   44   * @{
//   45   */
//   46 
//   47 /**
//   48   * @brief  Deinitializes the TIM1 peripheral registers to their default reset values.
//   49   * @param  None
//   50   * @retval None
//   51   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   52 void TIM1_DeInit(void)
//   53 {
//   54     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
TIM1_DeInit:
        CLR       L:0x5250
//   55     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
        CLR       L:0x5251
//   56     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
        CLR       L:0x5252
//   57     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
        CLR       L:0x5253
//   58     TIM1->IER  = TIM1_IER_RESET_VALUE;
        CLR       L:0x5254
//   59     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
        CLR       L:0x5256
//   60     /* Disable channels */
//   61     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
        CALL      L:?Subroutine19
//   62     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
//   63     /* Configure channels as inputs: it is necessary if lock level is equal to 2 or 3 */
//   64     TIM1->CCMR1 = 0x01;
??CrossCallReturnLabel_44:
        MOV       L:0x5258, #0x1
//   65     TIM1->CCMR2 = 0x01;
        MOV       L:0x5259, #0x1
//   66     TIM1->CCMR3 = 0x01;
        MOV       L:0x525a, #0x1
//   67     TIM1->CCMR4 = 0x01;
        MOV       L:0x525b, #0x1
//   68     /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
//   69     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
        CALL      L:?Subroutine19
//   70     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
//   71     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
??CrossCallReturnLabel_45:
        CLR       L:0x5258
//   72     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
        CLR       L:0x5259
//   73     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
        CLR       L:0x525a
//   74     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
        CLR       L:0x525b
//   75     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
        CLR       L:0x525e
//   76     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
        CLR       L:0x525f
//   77     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
        CLR       L:0x5260
//   78     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
        CLR       L:0x5261
//   79     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
        MOV       L:0x5262, #0xff
//   80     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
        MOV       L:0x5263, #0xff
//   81     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
        CLR       L:0x5265
//   82     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
        CLR       L:0x5266
//   83     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
        CLR       L:0x5267
//   84     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
        CLR       L:0x5268
//   85     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
        CLR       L:0x5269
//   86     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
        CLR       L:0x526a
//   87     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
        CLR       L:0x526b
//   88     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
        CLR       L:0x526c
//   89     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
        CLR       L:0x526f
//   90     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
        MOV       L:0x5257, #0x1
//   91     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
        CLR       L:0x526e
//   92     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
        CLR       L:0x526d
//   93     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
        CLR       L:0x5264
//   94     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
        CLR       L:0x5255
//   95 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine19:
        CLR       L:0x525c
        CLR       L:0x525d
        RET
//   96 
//   97 /**
//   98   * @brief  Initializes the TIM1 Time Base Unit according to the specified parameters.
//   99   * @param  TIM1_Prescaler specifies the Prescaler value.
//  100   * @param  TIM1_CounterMode specifies the counter mode  from @ref TIM1_CounterMode_TypeDef .
//  101   * @param  TIM1_Period specifies the Period value.
//  102   * @param  TIM1_RepetitionCounter specifies the Repetition counter value
//  103   * @retval None
//  104   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine12:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5262, A
        LD        A, YL
        LD        L:0x5263, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  105 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
//  106                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
//  107                        uint16_t TIM1_Period,
//  108                        uint8_t TIM1_RepetitionCounter)
//  109 {
TIM1_TimeBaseInit:
        LDW       S:?w1, X
        LD        S:?b1, A
//  110 
//  111     /* Check parameters */
//  112     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
//  113 
//  114     /* Set the Autoreload value */
//  115     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
        LDW       X, Y
        CALL      L:?Subroutine12
//  116     TIM1->ARRL = (uint8_t)(TIM1_Period);
//  117 
//  118     /* Set the Prescaler value */
//  119     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
??CrossCallReturnLabel_30:
        LDW       X, S:?w1
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5260, A
//  120     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
        LD        A, S:?b3
        LD        L:0x5261, A
//  121 
//  122     /* Select the Counter Mode */
//  123     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
//  124                            | (uint8_t)(TIM1_CounterMode));
        LD        A, L:0x5250
        AND       A, #0x8f
        OR        A, S:?b1
        LD        L:0x5250, A
//  125 
//  126     /* Set the Repetition Counter value */
//  127     TIM1->RCR = TIM1_RepetitionCounter;
        LD        A, S:?b0
        LD        L:0x5264, A
//  128 
//  129 }
        RET
//  130 
//  131 /**
//  132   * @brief  Initializes the TIM1 Channel1 according to the specified parameters.
//  133   * @param  TIM1_OCMode specifies the Output Compare mode from 
//  134   *         @ref TIM1_OCMode_TypeDef.
//  135   * @param  TIM1_OutputState specifies the Output State from 
//  136   *         @ref TIM1_OutputState_TypeDef.
//  137   * @param  TIM1_OutputNState specifies the Complementary Output State 
//  138   *         from @ref TIM1_OutputNState_TypeDef.
//  139   * @param  TIM1_Pulse specifies the Pulse width value.
//  140   * @param  TIM1_OCPolarity specifies the Output Compare Polarity from 
//  141   *         @ref TIM1_OCPolarity_TypeDef.
//  142   * @param  TIM1_OCNPolarity specifies the Complementary Output Compare Polarity
//  143   *         from @ref TIM1_OCNPolarity_TypeDef.
//  144   * @param  TIM1_OCIdleState specifies the Output Compare Idle State from 
//  145   *         @ref TIM1_OCIdleState_TypeDef.
//  146   * @param  TIM1_OCNIdleState specifies the Complementary Output Compare Idle 
//  147   *         State from @ref TIM1_OCIdleState_TypeDef.
//  148   * @retval None
//  149   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine15:
        OR        A, S:?b1
        OR        A, L:0x526f
        LD        L:0x526f, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  150 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  151                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  152                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
//  153                   uint16_t TIM1_Pulse,
//  154                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  155                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
//  156                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
//  157                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
//  158 {
TIM1_OC1Init:
        LD        S:?b6, A
        LDW       Y, X
//  159     /* Check the parameters */
//  160     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
//  161     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
//  162     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
//  163     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
//  164     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
//  165     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
//  166     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
//  167 
//  168     /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , 
//  169        the Output N State, the Output Polarity & the Output N Polarity*/
//  170     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
//  171                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
        LD        A, L:0x525c
        AND       A, #0xf0
        LD        L:0x525c, A
//  172     /* Set the Output State & Set the Output N State & Set the Output Polarity &
//  173        Set the Output N Polarity */
//  174   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
//  175                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
//  176                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
//  177                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
        CALL      L:?Subroutine3
??CrossCallReturnLabel_12:
        OR        A, L:0x525c
        LD        L:0x525c, A
//  178 
//  179     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  180     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
//  181                             (uint8_t)TIM1_OCMode);
        LD        A, L:0x5258
        AND       A, #0x8f
        OR        A, S:?b6
        LD        L:0x5258, A
//  182 
//  183     /* Reset the Output Idle state & the Output N Idle state bits */
//  184     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
        LD        A, L:0x526f
        AND       A, #0xfc
        LD        L:0x526f, A
//  185     /* Set the Output Idle state & the Output N Idle state configuration */
//  186     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
//  187                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
        LD        A, S:?b5
        AND       A, #0x2
        PUSH      A
        LD        A, S:?b4
        AND       A, #0x1
        LD        S:?b1, A
        POP       A
        CALL      L:?Subroutine15
//  188 
//  189     /* Set the Pulse value */
//  190     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
??CrossCallReturnLabel_37:
        CALL      L:?Subroutine11
//  191     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
//  192 }
??CrossCallReturnLabel_28:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine11:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5265, A
        LD        A, YL
        LD        L:0x5266, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine3:
        LD        A, S:?b1
        AND       A, #0x4
        PUSH      A
        LD        A, S:?b0
        AND       A, #0x1
        LD        S:?b0, A
        POP       A
        OR        A, S:?b0
        LD        S:?b0, A
        LD        A, S:?b2
        AND       A, #0x2
        OR        A, S:?b0
        LD        S:?b0, A
        LD        A, S:?b3
        AND       A, #0x8
        OR        A, S:?b0
        RET
//  193 
//  194 /**
//  195   * @brief  Initializes the TIM1 Channel2 according to the specified parameters.
//  196   * @param  TIM1_OCMode specifies the Output Compare mode from
//  197   *         @ref TIM1_OCMode_TypeDef.
//  198   * @param  TIM1_OutputState specifies the Output State from 
//  199   *         @ref TIM1_OutputState_TypeDef.
//  200   * @param  TIM1_OutputNState specifies the Complementary Output State from 
//  201   *         @ref TIM1_OutputNState_TypeDef.
//  202   * @param  TIM1_Pulse specifies the Pulse width value.
//  203   * @param  TIM1_OCPolarity specifies the Output Compare Polarity from 
//  204   *         @ref TIM1_OCPolarity_TypeDef.
//  205   * @param  TIM1_OCNPolarity specifies the Complementary Output Compare Polarity
//  206   *         from @ref TIM1_OCNPolarity_TypeDef.
//  207   * @param  TIM1_OCIdleState specifies the Output Compare Idle State from 
//  208   *         @ref TIM1_OCIdleState_TypeDef.
//  209   * @param  TIM1_OCNIdleState specifies the Complementary Output Compare Idle 
//  210   *         State from @ref TIM1_OCIdleState_TypeDef.
//  211   * @retval None
//  212   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  213 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  214                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  215                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
//  216                   uint16_t TIM1_Pulse,
//  217                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  218                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
//  219                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
//  220                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
//  221 {
TIM1_OC2Init:
        LD        S:?b6, A
        LDW       Y, X
//  222     /* Check the parameters */
//  223     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
//  224     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
//  225     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
//  226     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
//  227     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
//  228     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
//  229     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
//  230 
//  231     /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , 
//  232        the Output N State, the Output Polarity & the Output N Polarity*/
//  233     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
//  234                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
        LD        A, L:0x525c
        AND       A, #0xf
        LD        L:0x525c, A
//  235 
//  236     /* Set the Output State & Set the Output N State & Set the Output Polarity &
//  237        Set the Output N Polarity */
//  238     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
//  239                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
//  240                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
//  241                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
        LD        A, S:?b1
        AND       A, #0x40
        CALL      L:?Subroutine16
??CrossCallReturnLabel_39:
        LD        S:?b0, A
        LD        A, S:?b2
        AND       A, #0x20
        OR        A, S:?b0
        LD        S:?b0, A
        LD        A, S:?b3
        AND       A, #0x80
        OR        A, S:?b0
        OR        A, L:0x525c
        LD        L:0x525c, A
//  242 
//  243     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  244     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
//  245                              (uint8_t)TIM1_OCMode);
        LD        A, L:0x5259
        AND       A, #0x8f
        OR        A, S:?b6
        LD        L:0x5259, A
//  246 
//  247     /* Reset the Output Idle state & the Output N Idle state bits */
//  248     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
        LD        A, L:0x526f
        AND       A, #0xf3
        LD        L:0x526f, A
//  249     /* Set the Output Idle state & the Output N Idle state configuration */
//  250     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
//  251                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
        LD        A, S:?b5
        AND       A, #0x8
        PUSH      A
        LD        A, S:?b4
        AND       A, #0x4
        LD        S:?b1, A
        POP       A
        CALL      L:?Subroutine15
//  252 
//  253     /* Set the Pulse value */
//  254     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
??CrossCallReturnLabel_36:
        CALL      L:?Subroutine10
//  255     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
//  256 
//  257 }
??CrossCallReturnLabel_26:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine16:
        PUSH      A
        LD        A, S:?b0
        AND       A, #0x10
        LD        S:?b0, A
        POP       A
        OR        A, S:?b0
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine10:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5267, A
        LD        A, YL
        LD        L:0x5268, A
        RET
//  258 
//  259 /**
//  260   * @brief  Initializes the TIM1 Channel3 according to the specified parameters.
//  261   * @param  TIM1_OCMode specifies the Output Compare mode  from 
//  262   *         @ref TIM1_OCMode_TypeDef.
//  263   * @param  TIM1_OutputState specifies the Output State  
//  264   *         from @ref TIM1_OutputState_TypeDef.
//  265   * @param  TIM1_OutputNState specifies the Complementary Output State
//  266   *         from @ref TIM1_OutputNState_TypeDef.
//  267   * @param  TIM1_Pulse specifies the Pulse width value.
//  268   * @param  TIM1_OCPolarity specifies the Output Compare Polarity  from 
//  269   *         @ref TIM1_OCPolarity_TypeDef.
//  270   * @param  TIM1_OCNPolarity specifies the Complementary  Output Compare 
//  271   *         Polarity from @ref TIM1_OCNPolarity_TypeDef.
//  272   * @param  TIM1_OCIdleState specifies the Output Compare Idle State
//  273   *         from @ref TIM1_OCIdleState_TypeDef.
//  274   * @param  TIM1_OCNIdleState specifies the Complementary Output Compare 
//  275   *         Idle State  from @ref TIM1_OCIdleState_TypeDef.
//  276   * @retval None
//  277   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  278 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  279                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  280                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
//  281                   uint16_t TIM1_Pulse,
//  282                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  283                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
//  284                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
//  285                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
//  286 {
TIM1_OC3Init:
        LD        S:?b6, A
        LDW       Y, X
//  287     /* Check the parameters */
//  288     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
//  289     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
//  290     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
//  291     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
//  292     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
//  293     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
//  294     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
//  295 
//  296     /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , 
//  297        the Output N State, the Output Polarity & the Output N Polarity*/
//  298     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
//  299                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
        LD        A, L:0x525d
        AND       A, #0xf0
        LD        L:0x525d, A
//  300     /* Set the Output State & Set the Output N State & Set the Output Polarity &
//  301        Set the Output N Polarity */
//  302     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
//  303                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
//  304                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
//  305                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
        CALL      L:?Subroutine3
??CrossCallReturnLabel_11:
        OR        A, L:0x525d
        LD        L:0x525d, A
//  306 
//  307     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  308     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
//  309                              (uint8_t)TIM1_OCMode);
        LD        A, L:0x525a
        AND       A, #0x8f
        OR        A, S:?b6
        LD        L:0x525a, A
//  310 
//  311     /* Reset the Output Idle state & the Output N Idle state bits */
//  312     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
        LD        A, L:0x526f
        AND       A, #0xcf
        LD        L:0x526f, A
//  313     /* Set the Output Idle state & the Output N Idle state configuration */
//  314     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
//  315                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
        LD        A, S:?b5
        AND       A, #0x20
        PUSH      A
        LD        A, S:?b4
        AND       A, #0x10
        LD        S:?b1, A
        POP       A
        CALL      L:?Subroutine15
//  316 
//  317     /* Set the Pulse value */
//  318     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
??CrossCallReturnLabel_35:
        CALL      L:?Subroutine9
//  319     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
//  320 
//  321 }
??CrossCallReturnLabel_24:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine9:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5269, A
        LD        A, YL
        LD        L:0x526a, A
        RET
//  322 
//  323 /**
//  324   * @brief  Initializes the TIM1 Channel4 according to the specified parameters.
//  325   * @param  TIM1_OCMode specifies the Output Compare mode  from 
//  326   *         @ref TIM1_OCMode_TypeDef.
//  327   * @param  TIM1_OutputState specifies the Output State
//  328   *         from @ref TIM1_OutputState_TypeDef.
//  329   * @param  TIM1_Pulse specifies the Pulse width  value.
//  330   * @param  TIM1_OCPolarity specifies the Output Compare Polarity
//  331   *         from @ref TIM1_OCPolarity_TypeDef.
//  332   * @param  TIM1_OCIdleState specifies the Output Compare Idle State
//  333   *         from @ref TIM1_OCIdleState_TypeDef.
//  334   * @retval None
//  335   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  336 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  337                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  338                   uint16_t TIM1_Pulse,
//  339                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  340                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
//  341 {
TIM1_OC4Init:
        LD        S:?b3, A
        LDW       Y, X
//  342     /* Check the parameters */
//  343     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
//  344     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
//  345     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
//  346     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
//  347 
//  348     /* Disable the Channel 4: Reset the CCE Bit */
//  349     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
        LD        A, L:0x525d
        AND       A, #0xcf
        LD        L:0x525d, A
//  350     /* Set the Output State  &  the Output Polarity */
//  351     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
//  352                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
        LD        A, S:?b1
        AND       A, #0x20
        CALL      L:?Subroutine16
??CrossCallReturnLabel_38:
        OR        A, L:0x525d
        LD        L:0x525d, A
//  353 
//  354     /* Reset the Output Compare Bit  and Set the Output Compare Mode */
//  355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
//  356                             TIM1_OCMode);
        LD        A, L:0x525b
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x525b, A
//  357 
//  358     /* Set the Output Idle state */
//  359     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
        TNZ       S:?b2
        JREQ      L:??TIM1_OC4Init_0
//  360     {
//  361         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
        LD        A, L:0x526f
        OR        A, #0xdf
        LD        L:0x526f, A
        JRA       L:??TIM1_OC4Init_1
//  362     }
//  363     else
//  364     {
//  365         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
??TIM1_OC4Init_0:
        BRES      L:0x526f, #0x6
//  366     }
//  367 
//  368     /* Set the Pulse value */
//  369     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
??TIM1_OC4Init_1:
        CALL      L:?Subroutine8
//  370     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
//  371 
//  372 }
??CrossCallReturnLabel_22:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine8:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x526b, A
        LD        A, YL
        LD        L:0x526c, A
        RET
//  373 
//  374 /**
//  375   * @brief  Configures the Break feature, dead time, Lock level, the OSSI,
//  376   *         and the AOE(automatic output enable).
//  377   * @param  TIM1_OSSIState specifies the OSSIS State from @ref TIM1_OSSIState_TypeDef.
//  378   * @param  TIM1_LockLevel specifies the lock level from @ref TIM1_LockLevel_TypeDef.
//  379   * @param  TIM1_DeadTime specifies the dead time value.
//  380   * @param  TIM1_Break specifies the Break state @ref TIM1_BreakState_TypeDef.
//  381   * @param  TIM1_BreakPolarity specifies the Break polarity from 
//  382   *         @ref TIM1_BreakPolarity_TypeDef.
//  383   * @param  TIM1_AutomaticOutput specifies the Automatic Output configuration 
//  384   *         from @ref TIM1_AutomaticOutput_TypeDef.
//  385   * @retval None
//  386   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  387 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
//  388                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
//  389                      uint8_t TIM1_DeadTime,
//  390                      TIM1_BreakState_TypeDef TIM1_Break,
//  391                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
//  392                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
//  393 {
TIM1_BDTRConfig:
        LD        S:?b5, A
//  394     /* Check the parameters */
//  395     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
//  396     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
//  397     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
//  398     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
//  399     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
//  400 
//  401     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
        LD        A, S:?b1
        LD        L:0x526e, A
//  402     /* Set the Lock level, the Break enable Bit and the Polarity, the OSSI State,
//  403               the dead time value  and the Automatic Output Enable Bit */
//  404 
//  405     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
//  406                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
//  407                             (uint8_t)TIM1_AutomaticOutput));
        LD        A, S:?b0
        OR        A, S:?b5
        OR        A, S:?b2
        OR        A, S:?b3
        OR        A, S:?b4
        LD        L:0x526d, A
//  408 
//  409 }
        RET
//  410 
//  411 /**
//  412   * @brief  Initializes the TIM1 peripheral according to the specified parameters.
//  413   * @param  TIM1_Channel specifies the input capture channel from TIM1_Channel_TypeDef.
//  414   * @param  TIM1_ICPolarity specifies the Input capture polarity from  
//  415   *         TIM1_ICPolarity_TypeDef .
//  416   * @param  TIM1_ICSelection specifies the Input capture source selection from 
//  417   *         TIM1_ICSelection_TypeDef.
//  418   * @param  TIM1_ICPrescaler specifies the Input capture Prescaler from
//  419   *         TIM1_ICPSC_TypeDef.
//  420   * @param  TIM1_ICFilter specifies the Input capture filter value.
//  421   * @retval None
//  422   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
//  424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
//  425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
//  426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
//  427                  uint8_t TIM1_ICFilter)
//  428 {
TIM1_ICInit:
        MOV       S:?b4, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b5, S:?b2
        MOV       S:?b1, S:?b3
//  429 
//  430     /* Check the parameters */
//  431     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
//  432     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
//  433     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
//  434     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
//  435     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
//  436 
//  437     if (TIM1_Channel == TIM1_CHANNEL_1)
        TNZ       A
        JRNE      L:??TIM1_ICInit_0
//  438     {
//  439         /* TI1 Configuration */
//  440         TI1_Config((uint8_t)TIM1_ICPolarity,
//  441                    (uint8_t)TIM1_ICSelection,
//  442                    (uint8_t)TIM1_ICFilter);
        LD        A, S:?b4
        CALL      L:?Subroutine22
??CrossCallReturnLabel_56:
        OR        A, S:?b5
        LD        L:0x5258, A
//  443         /* Set the Input Capture Prescaler value */
//  444         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
//  445     }
        RET
//  446     else if (TIM1_Channel == TIM1_CHANNEL_2)
??TIM1_ICInit_0:
        CP        A, #0x1
        JRNE      L:??TIM1_ICInit_1
//  447     {
//  448         /* TI2 Configuration */
//  449         TI2_Config((uint8_t)TIM1_ICPolarity,
//  450                    (uint8_t)TIM1_ICSelection,
//  451                    (uint8_t)TIM1_ICFilter);
        LD        A, S:?b4
        CALL      L:?Subroutine21
??CrossCallReturnLabel_54:
        OR        A, S:?b5
        LD        L:0x5259, A
//  452         /* Set the Input Capture Prescaler value */
//  453         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
//  454     }
        RET
//  455     else if (TIM1_Channel == TIM1_CHANNEL_3)
??TIM1_ICInit_1:
        CP        A, #0x2
        JRNE      L:??TIM1_ICInit_2
//  456     {
//  457         /* TI3 Configuration */
//  458         TI3_Config((uint8_t)TIM1_ICPolarity,
//  459                    (uint8_t)TIM1_ICSelection,
//  460                    (uint8_t)TIM1_ICFilter);
        LD        A, S:?b4
        CALL      L:TI3_Config
//  461         /* Set the Input Capture Prescaler value */
//  462         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
        LD        A, L:0x525a
        AND       A, #0xf3
        OR        A, S:?b5
        LD        L:0x525a, A
//  463     }
        RET
//  464     else
//  465     {
//  466         /* TI4 Configuration */
//  467         TI4_Config((uint8_t)TIM1_ICPolarity,
//  468                    (uint8_t)TIM1_ICSelection,
//  469                    (uint8_t)TIM1_ICFilter);
??TIM1_ICInit_2:
        LD        A, S:?b4
        CALL      L:TI4_Config
//  470         /* Set the Input Capture Prescaler value */
//  471         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
        LD        A, L:0x525b
        AND       A, #0xf3
        OR        A, S:?b5
        LD        L:0x525b, A
//  472     }
//  473 
//  474 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine22:
        CALL      L:TI1_Config
        LD        A, L:0x5258
        AND       A, #0xf3
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine21:
        CALL      L:TI2_Config
        LD        A, L:0x5259
        AND       A, #0xf3
        RET
//  475 
//  476 /**
//  477   * @brief  Configures the TIM1 peripheral in PWM Input Mode according to the 
//  478   *         specified parameters.
//  479   * @param  TIM1_Channel specifies the input capture channel from 
//  480   *         @ref TIM1_Channel_TypeDef.
//  481   * @param  TIM1_ICPolarity specifies the Input capture polarity from  
//  482   *         @ref TIM1_ICPolarity_TypeDef .
//  483   * @param  TIM1_ICSelection specifies the Input capture source selection  from
//  484   *         @ref TIM1_ICSelection_TypeDef.
//  485   * @param  TIM1_ICPrescaler specifies the Input capture Prescaler from  
//  486   *         @ref TIM1_ICPSC_TypeDef.
//  487   * @param  TIM1_ICFilter specifies the Input capture filter value.
//  488   * @retval None
//  489   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  490 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
//  491                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
//  492                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
//  493                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
//  494                      uint8_t TIM1_ICFilter)
//  495 {
TIM1_PWMIConfig:
        PUSH      S:?b8
        LD        S:?b6, A
        MOV       S:?b7, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b8, S:?b2
//  496     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
//  497     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
//  498 
//  499     /* Check the parameters */
//  500     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
//  501     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
//  502     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
//  503     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
//  504 
//  505     /* Select the Opposite Input Polarity */
//  506     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
        LD        A, S:?b7
        CP        A, #0x1
        JREQ      L:??TIM1_PWMIConfig_0
//  507     {
//  508         icpolarity = TIM1_ICPOLARITY_FALLING;
        MOV       S:?b5, #0x1
        JRA       L:??TIM1_PWMIConfig_1
//  509     }
//  510     else
//  511     {
//  512         icpolarity = TIM1_ICPOLARITY_RISING;
??TIM1_PWMIConfig_0:
        CLR       S:?b5
//  513     }
//  514 
//  515     /* Select the Opposite Input */
//  516     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
??TIM1_PWMIConfig_1:
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM1_PWMIConfig_2
//  517     {
//  518         icselection = TIM1_ICSELECTION_INDIRECTTI;
        MOV       S:?b4, #0x2
        JRA       L:??TIM1_PWMIConfig_3
//  519     }
//  520     else
//  521     {
//  522         icselection = TIM1_ICSELECTION_DIRECTTI;
??TIM1_PWMIConfig_2:
        MOV       S:?b4, #0x1
//  523     }
//  524 
//  525     if (TIM1_Channel == TIM1_CHANNEL_1)
??TIM1_PWMIConfig_3:
        TNZ       S:?b6
        MOV       S:?b1, S:?b3
        JRNE      L:??TIM1_PWMIConfig_4
//  526     {
//  527         /* TI1 Configuration */
//  528         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
//  529                    (uint8_t)TIM1_ICFilter);
        LD        A, S:?b7
        CALL      L:?Subroutine13
//  530 
//  531         /* Set the Input Capture Prescaler value */
//  532         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
//  533 
//  534         /* TI2 Configuration */
//  535         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
??CrossCallReturnLabel_31:
        CALL      L:?Subroutine18
//  536 
//  537         /* Set the Input Capture Prescaler value */
//  538         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
//  539     }
??CrossCallReturnLabel_42:
        CALL      L:?Subroutine6
??CrossCallReturnLabel_17:
        JRA       L:??CrossCallReturnLabel_32
//  540     else
//  541     {
//  542         /* TI2 Configuration */
//  543         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
//  544                    (uint8_t)TIM1_ICFilter);
??TIM1_PWMIConfig_4:
        LD        A, S:?b7
        CALL      L:?Subroutine6
//  545 
//  546         /* Set the Input Capture Prescaler value */
//  547         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
//  548 
//  549         /* TI1 Configuration */
//  550         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
??CrossCallReturnLabel_18:
        CALL      L:?Subroutine18
//  551 
//  552         /* Set the Input Capture Prescaler value */
//  553         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
//  554     }
??CrossCallReturnLabel_43:
        CALL      L:?Subroutine13
//  555 }
??CrossCallReturnLabel_32:
        POP       S:?b8
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine18:
        MOV       S:?b1, S:?b3
        MOV       S:?b0, S:?b4
        LD        A, S:?b5
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine13:
        CALL      L:?Subroutine22
??CrossCallReturnLabel_55:
        OR        A, S:?b8
        LD        L:0x5258, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine6:
        CALL      L:?Subroutine21
??CrossCallReturnLabel_53:
        OR        A, S:?b8
        LD        L:0x5259, A
        RET
//  556 
//  557 /**
//  558   * @brief  Enables or disables the TIM1 peripheral.
//  559   * @param  NewState new state of the TIM1 peripheral.
//  560 	*         This parameter can be ENABLE or DISABLE.
//  561   * @retval None
//  562   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  563 void TIM1_Cmd(FunctionalState NewState)
//  564 {
//  565     /* Check the parameters */
//  566     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  567 
//  568     /* set or Reset the CEN Bit */
//  569     if (NewState != DISABLE)
TIM1_Cmd:
        TNZ       A
        JREQ      L:??TIM1_Cmd_0
//  570     {
//  571         TIM1->CR1 |= TIM1_CR1_CEN;
        BSET      L:0x5250, #0x0
        RET
//  572     }
//  573     else
//  574     {
//  575         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
??TIM1_Cmd_0:
        BRES      L:0x5250, #0x0
//  576     }
//  577 }
        RET
//  578 
//  579 /**
//  580   * @brief  Enables or disables the TIM1 peripheral Main Outputs.
//  581   * @param  NewState new state of the TIM1 peripheral.
//  582 	*         This parameter can be ENABLE or DISABLE.
//  583   * @retval None
//  584   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  585 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
//  586 {
//  587     /* Check the parameters */
//  588     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  589 
//  590     /* Set or Reset the MOE Bit */
//  591 
//  592     if (NewState != DISABLE)
TIM1_CtrlPWMOutputs:
        TNZ       A
        JREQ      L:??TIM1_CtrlPWMOutputs_0
//  593     {
//  594         TIM1->BKR |= TIM1_BKR_MOE;
        BSET      L:0x526d, #0x7
        RET
//  595     }
//  596     else
//  597     {
//  598         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
??TIM1_CtrlPWMOutputs_0:
        BRES      L:0x526d, #0x7
//  599     }
//  600 }
        RET
//  601 
//  602 /**
//  603   * @brief  Enables or disables the specified TIM1 interrupts.
//  604   * @param  NewState new state of the TIM1 peripheral.
//  605   *         This parameter can be: ENABLE or DISABLE.
//  606   * @param  TIM1_IT specifies the TIM1 interrupts sources to be enabled or disabled.
//  607   *         This parameter can be any combination of the following values:
//  608   *           - TIM1_IT_UPDATE: TIM1 update Interrupt source
//  609   *           - TIM1_IT_CC1: TIM1 Capture Compare 1 Interrupt source
//  610   *           - TIM1_IT_CC2: TIM1 Capture Compare 2 Interrupt source
//  611   *           - TIM1_IT_CC3: TIM1 Capture Compare 3 Interrupt source
//  612   *           - TIM1_IT_CC4: TIM1 Capture Compare 4 Interrupt source
//  613   *           - TIM1_IT_CCUpdate: TIM1 Capture Compare Update Interrupt source
//  614   *           - TIM1_IT_TRIGGER: TIM1 Trigger Interrupt source
//  615   *           - TIM1_IT_BREAK: TIM1 Break Interrupt source
//  616   * @param  NewState new state of the TIM1 peripheral.
//  617   * @retval None
//  618   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  619 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
//  620 {
//  621     /* Check the parameters */
//  622     assert_param(IS_TIM1_IT_OK(TIM1_IT));
//  623     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  624 
//  625     if (NewState != DISABLE)
TIM1_ITConfig:
        TNZ       S:?b0
        JREQ      L:??TIM1_ITConfig_0
//  626     {
//  627         /* Enable the Interrupt sources */
//  628         TIM1->IER |= (uint8_t)TIM1_IT;
        OR        A, L:0x5254
        JRA       L:??TIM1_ITConfig_1
//  629     }
//  630     else
//  631     {
//  632         /* Disable the Interrupt sources */
//  633         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
??TIM1_ITConfig_0:
        CPL       A
        AND       A, L:0x5254
??TIM1_ITConfig_1:
        LD        L:0x5254, A
//  634     }
//  635 }
        RET
//  636 
//  637 /**
//  638   * @brief  Configures the TIM1 internal Clock.
//  639   * @param  None
//  640   * @retval None
//  641   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  642 void TIM1_InternalClockConfig(void)
//  643 {
//  644     /* Disable slave mode to clock the prescaler directly with the internal clock */
//  645     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
TIM1_InternalClockConfig:
        LD        A, L:0x5252
        AND       A, #0xf8
        LD        L:0x5252, A
//  646 }
        RET
//  647 
//  648 /**
//  649   * @brief  Configures the TIM1 External clock Mode1.
//  650   * @param  TIM1_ExtTRGPrescaler specifies the external Trigger Prescaler.
//  651   *         This parameter can be one of the following values:
//  652   *                       - TIM1_EXTTRGPSC_OFF
//  653   *                       - TIM1_EXTTRGPSC_DIV2
//  654   *                       - TIM1_EXTTRGPSC_DIV4
//  655   *                       - TIM1_EXTTRGPSC_DIV8.
//  656   * @param  TIM1_ExtTRGPolarity specifies the external Trigger Polarity.
//  657   *         This parameter can be one of the following values:
//  658   *                       - TIM1_EXTTRGPOLARITY_INVERTED
//  659   *                       - TIM1_EXTTRGPOLARITY_NONINVERTED
//  660   * @param  ExtTRGFilter specifies the External Trigger Filter.
//  661   *         This parameter must be a value between 0x00 and 0x0F
//  662   * @retval None
//  663   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5253
        LD        L:0x5253, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  664 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
//  665                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
//  666                               uint8_t ExtTRGFilter)
//  667 {
TIM1_ETRClockMode1Config:
        CALL      L:?Subroutine2
//  668     /* Check the parameters */
//  669     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
//  670     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
//  671 
//  672     /* Configure the ETR Clock source */
//  673     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
//  674 
//  675     /* Select the External clock mode1 & Select the Trigger selection : ETRF */
//  676     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
//  677                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
??CrossCallReturnLabel_10:
        LD        A, L:0x5252
        OR        A, #0x77
        LD        L:0x5252, A
//  678 }
        RET
//  679 
//  680 /**
//  681   * @brief  Configures the TIM1 External clock Mode2.
//  682   * @param  TIM1_ExtTRGPrescaler specifies the external Trigger Prescaler.
//  683   *         This parameter can be one of the following values:
//  684   *                       - TIM1_EXTTRGPSC_OFF
//  685   *                       - TIM1_EXTTRGPSC_DIV2
//  686   *                       - TIM1_EXTTRGPSC_DIV4
//  687   *                       - TIM1_EXTTRGPSC_DIV8.
//  688   * @param  TIM1_ExtTRGPolarity specifies the external Trigger Polarity.
//  689   *         This parameter can be one of the following values:
//  690   *                       - TIM1_EXTTRGPOLARITY_INVERTED
//  691   *                       - TIM1_EXTTRGPOLARITY_NONINVERTED
//  692   * @param  ExtTRGFilter specifies the External Trigger Filter.
//  693   *         This parameter must be a value between 0x00 and 0x0F
//  694   * @retval None
//  695   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  696 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
//  697                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
//  698                               uint8_t ExtTRGFilter)
//  699 {
TIM1_ETRClockMode2Config:
        CALL      L:?Subroutine2
//  700     /* Check the parameters */
//  701     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
//  702     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
//  703 
//  704     /* Configure the ETR Clock source */
//  705     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
//  706 
//  707     /* Enable the External clock mode2 */
//  708     TIM1->ETR |= TIM1_ETR_ECE;
??CrossCallReturnLabel_9:
        BSET      L:0x5253, #0x6
//  709 }
        RET
//  710 
//  711 /**
//  712   * @brief  Configures the TIM1 External Trigger.
//  713   * @param  TIM1_ExtTRGPrescaler specifies the external Trigger Prescaler.
//  714   *         This parameter can be one of the following values:
//  715   *                       - TIM1_EXTTRGPSC_OFF
//  716   *                       - TIM1_EXTTRGPSC_DIV2
//  717   *                       - TIM1_EXTTRGPSC_DIV4
//  718   *                       - TIM1_EXTTRGPSC_DIV8.
//  719   * @param  TIM1_ExtTRGPolarity specifies the external Trigger Polarity.
//  720   *         This parameter can be one of the following values:
//  721   *                       - TIM1_EXTTRGPOLARITY_INVERTED
//  722   *                       - TIM1_EXTTRGPOLARITY_NONINVERTED
//  723   * @param  ExtTRGFilter specifies the External Trigger Filter.
//  724   *         This parameter must be a value between 0x00 and 0x0F
//  725   * @retval None
//  726   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  727 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
//  728                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
//  729                     uint8_t ExtTRGFilter)
//  730 {
TIM1_ETRConfig:
        CALL      L:?Subroutine2
//  731     /* Check the parameters */
//  732     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
//  733     /* Set the Prescaler, the Filter value and the Polarity */
//  734     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
//  735                       (uint8_t)ExtTRGFilter );
//  736 }
??CrossCallReturnLabel_8:
        RET
//  737 
//  738 /**
//  739   * @brief  Configures the TIM1 Trigger as External Clock.
//  740   * @param  TIM1_TIxExternalCLKSource specifies Trigger source.
//  741   *         This parameter can be one of the following values:
//  742   *                     - TIM1_TIXEXTERNALCLK1SOURCE_TI1: TI1 Edge Detector
//  743   *                     - TIM1_TIXEXTERNALCLK1SOURCE_TI2: Filtered TIM1 Input 1
//  744   *                     - TIM1_TIXEXTERNALCLK1SOURCE_TI1ED: Filtered TIM1 Input 2
//  745   * @param  TIM1_ICPolarity specifies the TIx Polarity.
//  746   *         This parameter can be:
//  747   *                     - TIM1_ICPOLARITY_RISING
//  748   *                     - TIM1_ICPOLARITY_FALLING
//  749   * @param  ICFilter specifies the filter value.
//  750   *         This parameter must be a value between 0x00 and 0x0F
//  751   * @retval None
//  752   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  753 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
//  754                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
//  755                                  uint8_t ICFilter)
//  756 {
TIM1_TIxExternalClockConfig:
        LD        S:?b3, A
        MOV       S:?b2, S:?b0
//  757     /* Check the parameters */
//  758     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
//  759     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
//  760     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
//  761 
//  762     /* Configure the TIM1 Input Clock Source */
//  763     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
        CP        A, #0x60
        MOV       S:?b0, #0x1
        JRNE      L:??TIM1_TIxExternalClockConfig_0
//  764     {
//  765         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
        LD        A, S:?b2
        CALL      L:TI2_Config
        JRA       L:??TIM1_TIxExternalClockConfig_1
//  766     }
//  767     else
//  768     {
//  769         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
??TIM1_TIxExternalClockConfig_0:
        LD        A, S:?b2
        CALL      L:TI1_Config
//  770     }
//  771 
//  772     /* Select the Trigger source */
//  773     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
??TIM1_TIxExternalClockConfig_1:
        LD        A, L:0x5252
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x5252, A
//  774 
//  775     /* Select the External clock mode1 */
//  776     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
        LD        A, L:0x5252
        OR        A, #0x7
        LD        L:0x5252, A
//  777 }
        RET
//  778 
//  779 /**
//  780   * @brief  Selects the TIM1 Input Trigger source.
//  781   * @param   TIM1_InputTriggerSource specifies Input Trigger source.
//  782   * This parameter can be one of the following values:
//  783   *                       - TIM1_TS_TI1F_ED: TI1 Edge Detector
//  784   *                       - TIM1_TS_TI1FP1: Filtered Timer Input 1
//  785   *                       - TIM1_TS_TI2FP2: Filtered Timer Input 2
//  786   *                       - TIM1_TS_ETRF: External Trigger input
//  787   * @retval None
//  788   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine20:
        AND       A, #0x8f
        OR        A, S:?b0
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  789 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
//  790 {
TIM1_SelectInputTrigger:
        LD        S:?b0, A
//  791     /* Check the parameters */
//  792     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
//  793 
//  794     /* Select the Tgigger Source */
//  795     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
        LD        A, L:0x5252
        CALL      L:?Subroutine20
??CrossCallReturnLabel_48:
        LD        L:0x5252, A
//  796 }
        RET
//  797 
//  798 
//  799 /**
//  800   * @brief  Enables or Disables the TIM1 Update event.
//  801   * @param   NewState new state of the TIM1 peripheral Preload register. This parameter can
//  802   * be ENABLE or DISABLE.
//  803   * @retval None
//  804   */
//  805 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  806 void TIM1_UpdateDisableConfig(FunctionalState NewState)
//  807 {
//  808     /* Check the parameters */
//  809     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  810 
//  811     /* Set or Reset the UDIS Bit */
//  812     if (NewState != DISABLE)
TIM1_UpdateDisableConfig:
        TNZ       A
        JREQ      L:??TIM1_UpdateDisableConfig_0
//  813     {
//  814         TIM1->CR1 |= TIM1_CR1_UDIS;
        BSET      L:0x5250, #0x1
        RET
//  815     }
//  816     else
//  817     {
//  818         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
??TIM1_UpdateDisableConfig_0:
        BRES      L:0x5250, #0x1
//  819     }
//  820 }
        RET
//  821 
//  822 /**
//  823   * @brief  Selects the TIM1 Update Request Interrupt source.
//  824   * @param   TIM1_UpdateSource specifies the Update source.
//  825   * This parameter can be one of the following values
//  826   *                       - TIM1_UPDATESOURCE_REGULAR
//  827   *                       - TIM1_UPDATESOURCE_GLOBAL
//  828   * @retval None
//  829   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  830 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
//  831 {
//  832     /* Check the parameters */
//  833     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
//  834 
//  835     /* Set or Reset the URS Bit */
//  836     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
TIM1_UpdateRequestConfig:
        TNZ       A
        JREQ      L:??TIM1_UpdateRequestConfig_0
//  837     {
//  838         TIM1->CR1 |= TIM1_CR1_URS;
        BSET      L:0x5250, #0x2
        RET
//  839     }
//  840     else
//  841     {
//  842         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
??TIM1_UpdateRequestConfig_0:
        BRES      L:0x5250, #0x2
//  843     }
//  844 }
        RET
//  845 
//  846 
//  847 /**
//  848   * @brief  Enables or Disables the TIM1’s Hall sensor interface.
//  849   * @param   NewState new state of the TIM1 Hall sensor interface.This parameter can
//  850   * be ENABLE or DISABLE.
//  851   * @retval None
//  852   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  853 void TIM1_SelectHallSensor(FunctionalState NewState)
//  854 {
//  855     /* Check the parameters */
//  856     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  857 
//  858     /* Set or Reset the TI1S Bit */
//  859     if (NewState != DISABLE)
TIM1_SelectHallSensor:
        TNZ       A
        JREQ      L:??TIM1_SelectHallSensor_0
//  860     {
//  861         TIM1->CR2 |= TIM1_CR2_TI1S;
        BSET      L:0x5251, #0x7
        RET
//  862     }
//  863     else
//  864     {
//  865         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
??TIM1_SelectHallSensor_0:
        BRES      L:0x5251, #0x7
//  866     }
//  867 }
        RET
//  868 
//  869 
//  870 /**
//  871   * @brief  Selects the TIM1’s One Pulse Mode.
//  872   * @param   TIM1_OPMode specifies the OPM Mode to be used.
//  873   * This parameter can be one of the following values
//  874   *                    - TIM1_OPMODE_SINGLE
//  875   *                    - TIM1_OPMODE_REPETITIVE
//  876   * @retval None
//  877   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  878 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
//  879 {
//  880     /* Check the parameters */
//  881     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
//  882 
//  883     /* Set or Reset the OPM Bit */
//  884     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
TIM1_SelectOnePulseMode:
        TNZ       A
        JREQ      L:??TIM1_SelectOnePulseMode_0
//  885     {
//  886         TIM1->CR1 |= TIM1_CR1_OPM;
        BSET      L:0x5250, #0x3
        RET
//  887     }
//  888     else
//  889     {
//  890         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
??TIM1_SelectOnePulseMode_0:
        BRES      L:0x5250, #0x3
//  891     }
//  892 
//  893 }
        RET
//  894 
//  895 
//  896 /**
//  897   * @brief  Selects the TIM1 Trigger Output Mode.
//  898   * @param   TIM1_TRGOSource specifies the Trigger Output source.
//  899   * This parameter can be one of the following values
//  900   *                       - TIM1_TRGOSOURCE_RESET
//  901   *                       - TIM1_TRGOSOURCE_ENABLE
//  902   *                       - TIM1_TRGOSOURCE_UPDATE
//  903   *                       - TIM1_TRGOSource_OC1
//  904   *                       - TIM1_TRGOSOURCE_OC1REF
//  905   *                       - TIM1_TRGOSOURCE_OC2REF
//  906   *                       - TIM1_TRGOSOURCE_OC3REF
//  907   * @retval None
//  908   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  909 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
//  910 {
TIM1_SelectOutputTrigger:
        LD        S:?b0, A
//  911     /* Check the parameters */
//  912     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
//  913     
//  914     /* Reset the MMS Bits & Select the TRGO source */
//  915     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
//  916                           (uint8_t) TIM1_TRGOSource);
        LD        A, L:0x5251
        CALL      L:?Subroutine20
??CrossCallReturnLabel_47:
        LD        L:0x5251, A
//  917 }
        RET
//  918 
//  919 /**
//  920   * @brief  Selects the TIM1 Slave Mode.
//  921   * @param   TIM1_SlaveMode specifies the TIM1 Slave Mode.
//  922   * This parameter can be one of the following values
//  923   *                       - TIM1_SLAVEMODE_RESET
//  924   *                       - TIM1_SLAVEMODE_GATED
//  925   *                       - TIM1_SLAVEMODE_TRIGGER
//  926   *                       - TIM1_SLAVEMODE_EXTERNAL1
//  927   * @retval None
//  928   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  929 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
//  930 {
TIM1_SelectSlaveMode:
        LD        S:?b0, A
//  931 
//  932     /* Check the parameters */
//  933     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
//  934 
//  935     /* Reset the SMS Bits */ /* Select the Slave Mode */
//  936     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
//  937                            (uint8_t)TIM1_SlaveMode);
        LD        A, L:0x5252
        AND       A, #0xf8
        OR        A, S:?b0
        LD        L:0x5252, A
//  938 
//  939 }
        RET
//  940 
//  941 /**
//  942   * @brief  Sets or Resets the TIM1 Master/Slave Mode.
//  943   * @param   NewState new state of the synchronization between TIM1 and its slaves
//  944   *  (through TRGO). This parameter can be ENABLE or DISABLE.
//  945   * @retval None
//  946   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  947 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
//  948 {
//  949     /* Check the parameters */
//  950     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  951 
//  952     /* Set or Reset the MSM Bit */
//  953     if (NewState != DISABLE)
TIM1_SelectMasterSlaveMode:
        TNZ       A
        JREQ      L:??TIM1_SelectMasterSlaveMode_0
//  954     {
//  955         TIM1->SMCR |= TIM1_SMCR_MSM;
        BSET      L:0x5252, #0x7
        RET
//  956     }
//  957     else
//  958     {
//  959         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
??TIM1_SelectMasterSlaveMode_0:
        BRES      L:0x5252, #0x7
//  960     }
//  961 }
        RET
//  962 
//  963 /**
//  964   * @brief  Configures the TIM1 Encoder Interface.
//  965   * @param   TIM1_EncoderMode specifies the TIM1 Encoder Mode.
//  966   * This parameter can be one of the following values
//  967   * - TIM1_ENCODERMODE_TI1: Counter counts on TI1FP1 edge
//  968 	* depending on TI2FP2 level.
//  969   * - TIM1_ENCODERMODE_TI2: Counter counts on TI2FP2 edge
//  970   *	depending on TI1FP1 level.
//  971   * - TIM1_ENCODERMODE_TI12: Counter counts on both TI1FP1 and
//  972   * TI2FP2 edges depending on the level of the other input.
//  973   * @param   TIM1_IC1Polarity specifies the IC1 Polarity.
//  974   * This parameter can be one of the following values
//  975   *                       - TIM1_ICPOLARITY_FALLING
//  976   *                       - TIM1_ICPOLARITY_RISING
//  977   * @param   TIM1_IC2Polarity specifies the IC2 Polarity.
//  978   * This parameter can be one of the following values
//  979   *                       - TIM1_ICPOLARITY_FALLING
//  980   *                       - TIM1_ICPOLARITY_RISING
//  981   * @retval None
//  982   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  983 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
//  984                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
//  985                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
//  986 {
TIM1_EncoderInterfaceConfig:
        LD        S:?b2, A
//  987 
//  988 
//  989     /* Check the parameters */
//  990     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
//  991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
//  992     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
//  993 
//  994     /* Set the TI1 and the TI2 Polarities */
//  995     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
        TNZ       S:?b0
        JREQ      L:??TIM1_EncoderInterfaceConfig_0
//  996     {
//  997         TIM1->CCER1 |= TIM1_CCER1_CC1P;
        BSET      L:0x525c, #0x1
        JRA       L:??TIM1_EncoderInterfaceConfig_1
//  998     }
//  999     else
// 1000     {
// 1001         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
??TIM1_EncoderInterfaceConfig_0:
        BRES      L:0x525c, #0x1
// 1002     }
// 1003 
// 1004     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
??TIM1_EncoderInterfaceConfig_1:
        TNZ       S:?b1
        JREQ      L:??TIM1_EncoderInterfaceConfig_2
// 1005     {
// 1006         TIM1->CCER1 |= TIM1_CCER1_CC2P;
        BSET      L:0x525c, #0x5
        JRA       L:??TIM1_EncoderInterfaceConfig_3
// 1007     }
// 1008     else
// 1009     {
// 1010         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
??TIM1_EncoderInterfaceConfig_2:
        BRES      L:0x525c, #0x5
// 1011     }
// 1012     /* Set the encoder Mode */
// 1013     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
// 1014                            | (uint8_t) TIM1_EncoderMode);
??TIM1_EncoderInterfaceConfig_3:
        LD        A, L:0x5252
        AND       A, #0xf0
        OR        A, S:?b2
        LD        L:0x5252, A
// 1015 
// 1016     /* Select the Capture Compare 1 and the Capture Compare 2 as input */
// 1017     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
// 1018                             | (uint8_t) CCMR_TIxDirect_Set);
        LD        A, L:0x5258
        AND       A, #0xfc
        OR        A, #0x1
        LD        L:0x5258, A
// 1019     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
// 1020                             | (uint8_t) CCMR_TIxDirect_Set);
        LD        A, L:0x5259
        AND       A, #0xfc
        OR        A, #0x1
        LD        L:0x5259, A
// 1021 
// 1022 }
        RET
// 1023 
// 1024 /**
// 1025   * @brief  Configures the TIM1 Prescaler.
// 1026   * @param   Prescaler specifies the Prescaler Register value
// 1027   * This parameter must be a value between 0x0000 and 0xFFFF
// 1028   * @param   TIM1_PSCReloadMode specifies the TIM1 Prescaler Reload mode.
// 1029   * This parameter can be one of the following values
// 1030   * - TIM1_PSCRELOADMODE_IMMEDIATE: The Prescaler is loaded immediately.
// 1031   * - TIM1_PSCRELOADMODE_UPDATE: The Prescaler is loaded at the update event.
// 1032   * @retval None
// 1033   */
// 1034 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1035 void TIM1_PrescalerConfig(uint16_t Prescaler,
// 1036                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
// 1037 {
TIM1_PrescalerConfig:
        LDW       Y, X
        LD        S:?b0, A
// 1038     /* Check the parameters */
// 1039     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
// 1040 
// 1041     /* Set the Prescaler value */
// 1042     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5260, A
// 1043     TIM1->PSCRL = (uint8_t)(Prescaler);
        LD        A, YL
        LD        L:0x5261, A
// 1044 
// 1045     /* Set or reset the UG Bit */
// 1046     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
        LD        A, S:?b0
        LD        L:0x5257, A
// 1047 
// 1048 }
        RET
// 1049 
// 1050 /**
// 1051   * @brief  Specifies the TIM1 Counter Mode to be used.
// 1052   * @param   TIM1_CounterMode specifies the Counter Mode to be used
// 1053   * This parameter can be one of the following values:
// 1054   * - TIM1_COUNTERMODE_UP: TIM1 Up Counting Mode
// 1055   * - TIM1_COUNTERMODE_DOWN: TIM1 Down Counting Mode
// 1056   * - TIM1_COUNTERMODE_CENTERALIGNED1: TIM1 Center Aligned Mode1
// 1057   * - TIM1_CounterMode_CenterAligned2: TIM1 Center Aligned Mode2
// 1058   * - TIM1_COUNTERMODE_CENTERALIGNED3: TIM1 Center Aligned Mode3
// 1059   * @retval None
// 1060   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1061 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
// 1062 {
TIM1_CounterModeConfig:
        LD        S:?b0, A
// 1063     /* Check the parameters */
// 1064     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
// 1065 
// 1066 
// 1067     /* Reset the CMS and DIR Bits & Set the Counter Mode */
// 1068     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
// 1069                           | (uint8_t)TIM1_CounterMode);
        LD        A, L:0x5250
        CALL      L:?Subroutine20
??CrossCallReturnLabel_46:
        LD        L:0x5250, A
// 1070 }
        RET
// 1071 
// 1072 
// 1073 /**
// 1074   * @brief  Forces the TIM1 Channel1 output waveform to active or inactive level.
// 1075   * @param   TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1076   * This parameter can be one of the following values:
// 1077   * - TIM1_FORCEDACTION_ACTIVE: Force active level on OC1REF
// 1078   * - TIM1_FORCEDACTION_INACTIVE: Force inactive level on OC1REF.
// 1079   * @retval None
// 1080   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1081 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1082 {
TIM1_ForcedOC1Config:
        LD        S:?b0, A
// 1083     /* Check the parameters */
// 1084     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
// 1085 
// 1086     /* Reset the OCM Bits & Configure the Forced output Mode */
// 1087     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
// 1088                              (uint8_t)TIM1_ForcedAction);
        CALL      L:?Subroutine14
// 1089 }
??CrossCallReturnLabel_34:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine14:
        LD        A, L:0x5258
        CALL      L:?Subroutine20
??CrossCallReturnLabel_52:
        LD        L:0x5258, A
        RET
// 1090 
// 1091 
// 1092 /**
// 1093   * @brief  Forces the TIM1 Channel2 output waveform to active or inactive level.
// 1094   * @param   TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1095   * This parameter can be one of the following values:
// 1096   * - TIM1_FORCEDACTION_ACTIVE: Force active level on OC2REF
// 1097   * - TIM1_FORCEDACTION_INACTIVE: Force inactive level on OC2REF.
// 1098   * @retval None
// 1099   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1100 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1101 {
TIM1_ForcedOC2Config:
        LD        S:?b0, A
// 1102     /* Check the parameters */
// 1103     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
// 1104 
// 1105     /* Reset the OCM Bits & Configure the Forced output Mode */
// 1106     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
// 1107                               | (uint8_t)TIM1_ForcedAction);
        CALL      L:?Subroutine7
// 1108 }
??CrossCallReturnLabel_20:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine7:
        LD        A, L:0x5259
        CALL      L:?Subroutine20
??CrossCallReturnLabel_51:
        LD        L:0x5259, A
        RET
// 1109 
// 1110 
// 1111 /**
// 1112   * @brief  Forces the TIM1 Channel3 output waveform to active or inactive level.
// 1113   * @param   TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1114   * This parameter can be one of the following values:
// 1115   *                       - TIM1_FORCEDACTION_ACTIVE: Force active level on OC3REF
// 1116   *                       - TIM1_FORCEDACTION_INACTIVE: Force inactive level on
// 1117   *                         OC3REF.
// 1118   * @retval None
// 1119   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1120 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1121 {
TIM1_ForcedOC3Config:
        LD        S:?b0, A
// 1122     /* Check the parameters */
// 1123     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
// 1124 
// 1125     /* Reset the OCM Bits */ /* Configure The Forced output Mode */
// 1126     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
// 1127                               | (uint8_t)TIM1_ForcedAction);
        CALL      L:?Subroutine5
// 1128 }
??CrossCallReturnLabel_16:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine5:
        LD        A, L:0x525a
        CALL      L:?Subroutine20
??CrossCallReturnLabel_50:
        LD        L:0x525a, A
        RET
// 1129 
// 1130 
// 1131 /**
// 1132   * @brief  Forces the TIM1 Channel4 output waveform to active or inactive level.
// 1133   * @param   TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1134   * This parameter can be one of the following values:
// 1135   *                       - TIM1_FORCEDACTION_ACTIVE: Force active level on OC4REF
// 1136   *                       - TIM1_FORCEDACTION_INACTIVE: Force inactive level on
// 1137   *                         OC4REF.
// 1138   * @retval None
// 1139   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1140 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1141 {
TIM1_ForcedOC4Config:
        LD        S:?b0, A
// 1142     /* Check the parameters */
// 1143     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
// 1144 
// 1145     /* Reset the OCM Bits & Configure the Forced output Mode */
// 1146     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
// 1147                               | (uint8_t)TIM1_ForcedAction);
        CALL      L:?Subroutine4
// 1148 }
??CrossCallReturnLabel_14:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine4:
        LD        A, L:0x525b
        CALL      L:?Subroutine20
??CrossCallReturnLabel_49:
        LD        L:0x525b, A
        RET
// 1149 
// 1150 
// 1151 /**
// 1152   * @brief  Enables or disables TIM1 peripheral Preload register on ARR.
// 1153   * @param   NewState new state of the TIM1 peripheral Preload register.
// 1154   * This parameter can be ENABLE or DISABLE.
// 1155   * @retval None
// 1156   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1157 void TIM1_ARRPreloadConfig(FunctionalState NewState)
// 1158 {
// 1159     /* Check the parameters */
// 1160     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1161 
// 1162     /* Set or Reset the ARPE Bit */
// 1163     if (NewState != DISABLE)
TIM1_ARRPreloadConfig:
        TNZ       A
        JREQ      L:??TIM1_ARRPreloadConfig_0
// 1164     {
// 1165         TIM1->CR1 |= TIM1_CR1_ARPE;
        BSET      L:0x5250, #0x7
        RET
// 1166     }
// 1167     else
// 1168     {
// 1169         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
??TIM1_ARRPreloadConfig_0:
        BRES      L:0x5250, #0x7
// 1170     }
// 1171 }
        RET
// 1172 
// 1173 
// 1174 /**
// 1175   * @brief  Selects the TIM1 peripheral Commutation event.
// 1176   * @param   NewState new state of the Commutation event.
// 1177   * This parameter can be ENABLE or DISABLE.
// 1178   * @retval None
// 1179   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1180 void TIM1_SelectCOM(FunctionalState NewState)
// 1181 {
// 1182     /* Check the parameters */
// 1183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1184 
// 1185     /* Set or Reset the COMS Bit */
// 1186     if (NewState != DISABLE)
TIM1_SelectCOM:
        TNZ       A
        JREQ      L:??TIM1_SelectCOM_0
// 1187     {
// 1188         TIM1->CR2 |= TIM1_CR2_COMS;
        BSET      L:0x5251, #0x2
        RET
// 1189     }
// 1190     else
// 1191     {
// 1192         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
??TIM1_SelectCOM_0:
        BRES      L:0x5251, #0x2
// 1193     }
// 1194 }
        RET
// 1195 
// 1196 /**
// 1197   * @brief  Sets or Resets the TIM1 peripheral Capture Compare Preload Control bit.
// 1198   * @param   NewState new state of the Capture Compare Preload Control bit.
// 1199   * This parameter can be ENABLE or DISABLE.
// 1200   * @retval None
// 1201   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1202 void TIM1_CCPreloadControl(FunctionalState NewState)
// 1203 {
// 1204     /* Check the parameters */
// 1205     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1206 
// 1207     /* Set or Reset the CCPC Bit */
// 1208     if (NewState != DISABLE)
TIM1_CCPreloadControl:
        TNZ       A
        JREQ      L:??TIM1_CCPreloadControl_0
// 1209     {
// 1210         TIM1->CR2 |= TIM1_CR2_CCPC;
        BSET      L:0x5251, #0x0
        RET
// 1211     }
// 1212     else
// 1213     {
// 1214         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
??TIM1_CCPreloadControl_0:
        BRES      L:0x5251, #0x0
// 1215     }
// 1216 }
        RET
// 1217 
// 1218 
// 1219 /**
// 1220   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR1.
// 1221   * @param   NewState new state of the Capture Compare Preload register.
// 1222   * This parameter can be ENABLE or DISABLE.
// 1223   * @retval None
// 1224   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1225 void TIM1_OC1PreloadConfig(FunctionalState NewState)
// 1226 {
// 1227     /* Check the parameters */
// 1228     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1229 
// 1230     /* Set or Reset the OC1PE Bit */
// 1231     if (NewState != DISABLE)
TIM1_OC1PreloadConfig:
        TNZ       A
        JREQ      L:??TIM1_OC1PreloadConfig_0
// 1232     {
// 1233         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
        BSET      L:0x5258, #0x3
        RET
// 1234     }
// 1235     else
// 1236     {
// 1237         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC1PreloadConfig_0:
        BRES      L:0x5258, #0x3
// 1238     }
// 1239 }
        RET
// 1240 
// 1241 
// 1242 /**
// 1243   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR2.
// 1244   * @param   NewState new state of the Capture Compare Preload register.
// 1245   * This parameter can be ENABLE or DISABLE.
// 1246   * @retval None
// 1247   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1248 void TIM1_OC2PreloadConfig(FunctionalState NewState)
// 1249 {
// 1250     /* Check the parameters */
// 1251     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1252 
// 1253     /* Set or Reset the OC2PE Bit */
// 1254     if (NewState != DISABLE)
TIM1_OC2PreloadConfig:
        TNZ       A
        JREQ      L:??TIM1_OC2PreloadConfig_0
// 1255     {
// 1256         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
        BSET      L:0x5259, #0x3
        RET
// 1257     }
// 1258     else
// 1259     {
// 1260         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC2PreloadConfig_0:
        BRES      L:0x5259, #0x3
// 1261     }
// 1262 }
        RET
// 1263 
// 1264 
// 1265 /**
// 1266   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR3.
// 1267   * @param   NewState new state of the Capture Compare Preload register.
// 1268   * This parameter can be ENABLE or DISABLE.
// 1269   * @retval None
// 1270   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1271 void TIM1_OC3PreloadConfig(FunctionalState NewState)
// 1272 {
// 1273     /* Check the parameters */
// 1274     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1275 
// 1276     /* Set or Reset the OC3PE Bit */
// 1277     if (NewState != DISABLE)
TIM1_OC3PreloadConfig:
        TNZ       A
        JREQ      L:??TIM1_OC3PreloadConfig_0
// 1278     {
// 1279         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
        BSET      L:0x525a, #0x3
        RET
// 1280     }
// 1281     else
// 1282     {
// 1283         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC3PreloadConfig_0:
        BRES      L:0x525a, #0x3
// 1284     }
// 1285 }
        RET
// 1286 
// 1287 
// 1288 /**
// 1289   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR4.
// 1290   * @param   NewState new state of the Capture Compare Preload register.
// 1291   * This parameter can be ENABLE or DISABLE.
// 1292   * @retval None
// 1293   */
// 1294 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1295 void TIM1_OC4PreloadConfig(FunctionalState NewState)
// 1296 {
// 1297     /* Check the parameters */
// 1298     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1299 
// 1300     /* Set or Reset the OC4PE Bit */
// 1301     if (NewState != DISABLE)
TIM1_OC4PreloadConfig:
        TNZ       A
        JREQ      L:??TIM1_OC4PreloadConfig_0
// 1302     {
// 1303         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
        BSET      L:0x525b, #0x3
        RET
// 1304     }
// 1305     else
// 1306     {
// 1307         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC4PreloadConfig_0:
        BRES      L:0x525b, #0x3
// 1308     }
// 1309 }
        RET
// 1310 
// 1311 /**
// 1312   * @brief  Configures the TIM1 Capture Compare 1 Fast feature.
// 1313   * @param   NewState new state of the Output Compare Fast Enable bit.
// 1314   * This parameter can be ENABLE or DISABLE.
// 1315   * @retval None
// 1316   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1317 void TIM1_OC1FastConfig(FunctionalState NewState)
// 1318 {
// 1319     /* Check the parameters */
// 1320     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1321 
// 1322     /* Set or Reset the OC1FE Bit */
// 1323     if (NewState != DISABLE)
TIM1_OC1FastConfig:
        TNZ       A
        JREQ      L:??TIM1_OC1FastConfig_0
// 1324     {
// 1325         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
        BSET      L:0x5258, #0x2
        RET
// 1326     }
// 1327     else
// 1328     {
// 1329         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC1FastConfig_0:
        BRES      L:0x5258, #0x2
// 1330     }
// 1331 }
        RET
// 1332 
// 1333 
// 1334 /**
// 1335   * @brief  Configures the TIM1 Capture Compare 2 Fast feature.
// 1336   * @param   NewState new state of the Output Compare Fast Enable bit.
// 1337   * This parameter can be ENABLE or DISABLE.
// 1338   * @retval None
// 1339   */
// 1340 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1341 void TIM1_OC2FastConfig(FunctionalState NewState)
// 1342 {
// 1343     /* Check the parameters */
// 1344     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1345 
// 1346     /* Set or Reset the OC2FE Bit */
// 1347     if (NewState != DISABLE)
TIM1_OC2FastConfig:
        TNZ       A
        JREQ      L:??TIM1_OC2FastConfig_0
// 1348     {
// 1349         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
        BSET      L:0x5259, #0x2
        RET
// 1350     }
// 1351     else
// 1352     {
// 1353         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC2FastConfig_0:
        BRES      L:0x5259, #0x2
// 1354     }
// 1355 }
        RET
// 1356 
// 1357 
// 1358 /**
// 1359   * @brief  Configures the TIM1 Capture Compare 3 Fast feature.
// 1360   * @param   NewState new state of the Output Compare Fast Enable bit.
// 1361   * This parameter can be ENABLE or DISABLE.
// 1362   * @retval None
// 1363   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1364 void TIM1_OC3FastConfig(FunctionalState NewState)
// 1365 {
// 1366     /* Check the parameters */
// 1367     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1368 
// 1369     /* Set or Reset the OC3FE Bit */
// 1370     if (NewState != DISABLE)
TIM1_OC3FastConfig:
        TNZ       A
        JREQ      L:??TIM1_OC3FastConfig_0
// 1371     {
// 1372         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
        BSET      L:0x525a, #0x2
        RET
// 1373     }
// 1374     else
// 1375     {
// 1376         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC3FastConfig_0:
        BRES      L:0x525a, #0x2
// 1377     }
// 1378 }
        RET
// 1379 
// 1380 
// 1381 /**
// 1382   * @brief  Configures the TIM1 Capture Compare 4 Fast feature.
// 1383   * @param   NewState new state of the Output Compare Fast Enable bit.
// 1384   * This parameter can be ENABLE or DISABLE.
// 1385   * @retval None
// 1386   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1387 void TIM1_OC4FastConfig(FunctionalState NewState)
// 1388 {
// 1389     /* Check the parameters */
// 1390     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1391 
// 1392     /* Set or Reset the OC4FE Bit */
// 1393     if (NewState != DISABLE)
TIM1_OC4FastConfig:
        TNZ       A
        JREQ      L:??TIM1_OC4FastConfig_0
// 1394     {
// 1395         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
        BSET      L:0x525b, #0x2
        RET
// 1396     }
// 1397     else
// 1398     {
// 1399         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC4FastConfig_0:
        BRES      L:0x525b, #0x2
// 1400     }
// 1401 }
        RET
// 1402 
// 1403 
// 1404 /**
// 1405   * @brief  Configures the TIM1 event to be generated by software.
// 1406   * @param   TIM1_EventSource specifies the event source.
// 1407   * This parameter can be one of the following values:
// 1408   *                       - TIM1_EVENTSOURCE_UPDATE: TIM1 update Event source
// 1409   *                       - TIM1_EVENTSOURCE_CC1: TIM1 Capture Compare 1 Event source
// 1410   *                       - TIM1_EVENTSOURCE_CC2: TIM1 Capture Compare 2 Event source
// 1411   *                       - TIM1_EVENTSOURCE_CC3: TIM1 Capture Compare 3 Event source
// 1412   *                       - TIM1_EVENTSOURCE_CC4: TIM1 Capture Compare 4 Event source
// 1413   *                       - TIM1_EVENTSOURCE_COM: TIM1 COM Event source
// 1414   *                       - TIM1_EVENTSOURCE_TRIGGER: TIM1 Trigger Event source
// 1415   *                       - TIM1_EventSourceBreak: TIM1 Break Event source
// 1416   * @retval None
// 1417   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1418 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
// 1419 {
// 1420     /* Check the parameters */
// 1421     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
// 1422 
// 1423     /* Set the event sources */
// 1424     TIM1->EGR = (uint8_t)TIM1_EventSource;
TIM1_GenerateEvent:
        LD        L:0x5257, A
// 1425 }
        RET
// 1426 
// 1427 
// 1428 /**
// 1429   * @brief  Configures the TIM1 Channel 1 polarity.
// 1430   * @param   TIM1_OCPolarity specifies the OC1 Polarity.
// 1431   * This parameter can be one of the following values:
// 1432   *                       - TIM1_OCPOLARITY_LOW: Output Compare active low
// 1433   *                       - TIM1_OCPOLARITY_HIGH: Output Compare active high
// 1434   * @retval None
// 1435   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1436 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1437 {
// 1438     /* Check the parameters */
// 1439     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
// 1440 
// 1441     /* Set or Reset the CC1P Bit */
// 1442     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
TIM1_OC1PolarityConfig:
        TNZ       A
        JREQ      L:??TIM1_OC1PolarityConfig_0
// 1443     {
// 1444         TIM1->CCER1 |= TIM1_CCER1_CC1P;
        BSET      L:0x525c, #0x1
        RET
// 1445     }
// 1446     else
// 1447     {
// 1448         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
??TIM1_OC1PolarityConfig_0:
        BRES      L:0x525c, #0x1
// 1449     }
// 1450 }
        RET
// 1451 
// 1452 
// 1453 /**
// 1454   * @brief  Configures the TIM1 Channel 1N polarity.
// 1455   * @param   TIM1_OCNPolarity specifies the OC1N Polarity.
// 1456   * This parameter can be one of the following values:
// 1457   *                       - TIM1_OCNPOLARITY_LOW: Output Compare active low
// 1458   *                       - TIM1_OCNPOLARITY_HIGH: Output Compare active high
// 1459   * @retval None
// 1460   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1461 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
// 1462 {
// 1463     /* Check the parameters */
// 1464     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
// 1465 
// 1466     /* Set or Reset the CC3P Bit */
// 1467     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
TIM1_OC1NPolarityConfig:
        TNZ       A
        JREQ      L:??TIM1_OC1NPolarityConfig_0
// 1468     {
// 1469         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
        BSET      L:0x525c, #0x3
        RET
// 1470     }
// 1471     else
// 1472     {
// 1473         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
??TIM1_OC1NPolarityConfig_0:
        BRES      L:0x525c, #0x3
// 1474     }
// 1475 }
        RET
// 1476 
// 1477 
// 1478 /**
// 1479   * @brief  Configures the TIM1 Channel 2 polarity.
// 1480   * @param   TIM1_OCPolarity specifies the OC2 Polarity.
// 1481   * This parameter can be one of the following values:
// 1482   *                       - TIM1_OCPOLARITY_LOW: Output Compare active low
// 1483   *                       - TIM1_OCPOLARITY_HIGH: Output Compare active high
// 1484   * @retval None
// 1485   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1486 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1487 {
// 1488     /* Check the parameters */
// 1489     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
// 1490 
// 1491     /* Set or Reset the CC2P Bit */
// 1492     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
TIM1_OC2PolarityConfig:
        TNZ       A
        JREQ      L:??TIM1_OC2PolarityConfig_0
// 1493     {
// 1494         TIM1->CCER1 |= TIM1_CCER1_CC2P;
        BSET      L:0x525c, #0x5
        RET
// 1495     }
// 1496     else
// 1497     {
// 1498         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
??TIM1_OC2PolarityConfig_0:
        BRES      L:0x525c, #0x5
// 1499     }
// 1500 }
        RET
// 1501 
// 1502 /**
// 1503   * @brief  Configures the TIM1 Channel 2N polarity.
// 1504   * @param   TIM1_OCNPolarity specifies the OC2N Polarity.
// 1505   * This parameter can be one of the following values:
// 1506   *                       - TIM1_OCNPOLARITY_LOW: Output Compare active low
// 1507   *                       - TIM1_OCNPOLARITY_HIGH: Output Compare active high
// 1508   * @retval None
// 1509   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1510 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
// 1511 {
// 1512     /* Check the parameters */
// 1513     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
// 1514 
// 1515     /* Set or Reset the CC3P Bit */
// 1516     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
TIM1_OC2NPolarityConfig:
        TNZ       A
        JREQ      L:??TIM1_OC2NPolarityConfig_0
// 1517     {
// 1518         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
        BSET      L:0x525c, #0x7
        RET
// 1519     }
// 1520     else
// 1521     {
// 1522         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
??TIM1_OC2NPolarityConfig_0:
        BRES      L:0x525c, #0x7
// 1523     }
// 1524 }
        RET
// 1525 
// 1526 
// 1527 /**
// 1528   * @brief  Configures the TIM1 Channel 3 polarity.
// 1529   * @param   TIM1_OCPolarity specifies the OC3 Polarity.
// 1530   * This parameter can be one of the following values:
// 1531   *                       - TIM1_OCPOLARITY_LOW: Output Compare active low
// 1532   *                       - TIM1_OCPOLARITY_HIGH: Output Compare active high
// 1533   * @retval None
// 1534   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1535 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1536 {
// 1537     /* Check the parameters */
// 1538     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
// 1539 
// 1540     /* Set or Reset the CC3P Bit */
// 1541     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
TIM1_OC3PolarityConfig:
        TNZ       A
        JREQ      L:??TIM1_OC3PolarityConfig_0
// 1542     {
// 1543         TIM1->CCER2 |= TIM1_CCER2_CC3P;
        BSET      L:0x525d, #0x1
        RET
// 1544     }
// 1545     else
// 1546     {
// 1547         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
??TIM1_OC3PolarityConfig_0:
        BRES      L:0x525d, #0x1
// 1548     }
// 1549 }
        RET
// 1550 
// 1551 
// 1552 /**
// 1553   * @brief  Configures the TIM1 Channel 3N polarity.
// 1554   * @param   TIM1_OCNPolarity specifies the OC3N Polarity.
// 1555   * This parameter can be one of the following values:
// 1556   *                       - TIM1_OCNPOLARITY_LOW: Output Compare active low
// 1557   *                       - TIM1_OCNPOLARITY_HIGH: Output Compare active high
// 1558   * @retval None
// 1559   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1560 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
// 1561 {
// 1562     /* Check the parameters */
// 1563     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
// 1564 
// 1565     /* Set or Reset the CC3P Bit */
// 1566     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
TIM1_OC3NPolarityConfig:
        TNZ       A
        JREQ      L:??TIM1_OC3NPolarityConfig_0
// 1567     {
// 1568         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
        BSET      L:0x525d, #0x3
        RET
// 1569     }
// 1570     else
// 1571     {
// 1572         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
??TIM1_OC3NPolarityConfig_0:
        BRES      L:0x525d, #0x3
// 1573     }
// 1574 }
        RET
// 1575 
// 1576 /**
// 1577   * @brief  Configures the TIM1 Channel 4 polarity.
// 1578   * @param   TIM1_OCPolarity specifies the OC4 Polarity.
// 1579   * This parameter can be one of the following values:
// 1580   *                       - TIM1_OCPOLARITY_LOW: Output Compare active low
// 1581   *                       - TIM1_OCPOLARITY_HIGH: Output Compare active high
// 1582   * @retval None
// 1583   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1584 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1585 {
// 1586     /* Check the parameters */
// 1587     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
// 1588 
// 1589     /* Set or Reset the CC4P Bit */
// 1590     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
TIM1_OC4PolarityConfig:
        TNZ       A
        JREQ      L:??TIM1_OC4PolarityConfig_0
// 1591     {
// 1592         TIM1->CCER2 |= TIM1_CCER2_CC4P;
        BSET      L:0x525d, #0x5
        RET
// 1593     }
// 1594     else
// 1595     {
// 1596         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
??TIM1_OC4PolarityConfig_0:
        BRES      L:0x525d, #0x5
// 1597     }
// 1598 }
        RET
// 1599 
// 1600 
// 1601 /**
// 1602   * @brief  Enables or disables the TIM1 Capture Compare Channel x (x=1,..,4).
// 1603   * @param   TIM1_Channel specifies the TIM1 Channel.
// 1604   * This parameter can be one of the following values:
// 1605   *                       - TIM1_CHANNEL_1: TIM1 Channel1
// 1606   *                       - TIM1_CHANNEL_2: TIM1 Channel2
// 1607   *                       - TIM1_CHANNEL_3: TIM1 Channel3
// 1608   *                       - TIM1_CHANNEL_4: TIM1 Channel4
// 1609   * @param   NewState specifies the TIM1 Channel CCxE bit new state.
// 1610   * This parameter can be: ENABLE or DISABLE.
// 1611   * @retval None
// 1612   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1613 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
// 1614 {
// 1615     /* Check the parameters */
// 1616     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
// 1617     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1618 
// 1619     if (TIM1_Channel == TIM1_CHANNEL_1)
TIM1_CCxCmd:
        TNZ       A
        JRNE      L:??TIM1_CCxCmd_0
// 1620     {
// 1621         /* Set or Reset the CC1E Bit */
// 1622         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??TIM1_CCxCmd_1
// 1623         {
// 1624             TIM1->CCER1 |= TIM1_CCER1_CC1E;
        BSET      L:0x525c, #0x0
        RET
// 1625         }
// 1626         else
// 1627         {
// 1628             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
??TIM1_CCxCmd_1:
        BRES      L:0x525c, #0x0
        RET
// 1629         }
// 1630 
// 1631     }
// 1632     else if (TIM1_Channel == TIM1_CHANNEL_2)
??TIM1_CCxCmd_0:
        CP        A, #0x1
        JRNE      L:??TIM1_CCxCmd_2
// 1633     {
// 1634         /* Set or Reset the CC2E Bit */
// 1635         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??TIM1_CCxCmd_3
// 1636         {
// 1637             TIM1->CCER1 |= TIM1_CCER1_CC2E;
        BSET      L:0x525c, #0x4
        RET
// 1638         }
// 1639         else
// 1640         {
// 1641             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
??TIM1_CCxCmd_3:
        BRES      L:0x525c, #0x4
        RET
// 1642         }
// 1643     }
// 1644     else if (TIM1_Channel == TIM1_CHANNEL_3)
??TIM1_CCxCmd_2:
        CP        A, #0x2
        JRNE      L:??TIM1_CCxCmd_4
// 1645     {
// 1646         /* Set or Reset the CC3E Bit */
// 1647         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??TIM1_CCxCmd_5
// 1648         {
// 1649             TIM1->CCER2 |= TIM1_CCER2_CC3E;
        BSET      L:0x525d, #0x0
        RET
// 1650         }
// 1651         else
// 1652         {
// 1653             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
??TIM1_CCxCmd_5:
        BRES      L:0x525d, #0x0
        RET
// 1654         }
// 1655     }
// 1656     else
// 1657     {
// 1658         /* Set or Reset the CC4E Bit */
// 1659         if (NewState != DISABLE)
??TIM1_CCxCmd_4:
        TNZ       S:?b0
        JREQ      L:??TIM1_CCxCmd_6
// 1660         {
// 1661             TIM1->CCER2 |= TIM1_CCER2_CC4E;
        BSET      L:0x525d, #0x4
        RET
// 1662         }
// 1663         else
// 1664         {
// 1665             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
??TIM1_CCxCmd_6:
        BRES      L:0x525d, #0x4
// 1666         }
// 1667     }
// 1668 }
        RET
// 1669 
// 1670 /**
// 1671   * @brief  Enables or disables the TIM1 Capture Compare Channel xN (xN=1,..,3).
// 1672   * @param   TIM1_Channel specifies the TIM1 Channel.
// 1673   * This parameter can be one of the following values:
// 1674   *                       - TIM1_CHANNEL_1: TIM1 Channel1
// 1675   *                       - TIM1_CHANNEL_2: TIM1 Channel2
// 1676   *                       - TIM1_CHANNEL_3: TIM1 Channel3
// 1677   * @param   NewState specifies the TIM1 Channel CCxNE bit new state.
// 1678   * This parameter can be: ENABLE or DISABLE.
// 1679   * @retval None
// 1680   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1681 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
// 1682 {
// 1683     /* Check the parameters */
// 1684     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
// 1685     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
// 1686 
// 1687     if (TIM1_Channel == TIM1_CHANNEL_1)
TIM1_CCxNCmd:
        TNZ       A
        JRNE      L:??TIM1_CCxNCmd_0
// 1688     {
// 1689         /* Set or Reset the CC1NE Bit */
// 1690         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??TIM1_CCxNCmd_1
// 1691         {
// 1692             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
        BSET      L:0x525c, #0x2
        RET
// 1693         }
// 1694         else
// 1695         {
// 1696             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
??TIM1_CCxNCmd_1:
        BRES      L:0x525c, #0x2
        RET
// 1697         }
// 1698     }
// 1699     else if (TIM1_Channel == TIM1_CHANNEL_2)
??TIM1_CCxNCmd_0:
        CP        A, #0x1
        JRNE      L:??TIM1_CCxNCmd_2
// 1700     {
// 1701         /* Set or Reset the CC2NE Bit */
// 1702         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??TIM1_CCxNCmd_3
// 1703         {
// 1704             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
        BSET      L:0x525c, #0x6
        RET
// 1705         }
// 1706         else
// 1707         {
// 1708             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
??TIM1_CCxNCmd_3:
        BRES      L:0x525c, #0x6
        RET
// 1709         }
// 1710     }
// 1711     else
// 1712     {
// 1713         /* Set or Reset the CC3NE Bit */
// 1714         if (NewState != DISABLE)
??TIM1_CCxNCmd_2:
        TNZ       S:?b0
        JREQ      L:??TIM1_CCxNCmd_4
// 1715         {
// 1716             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
        BSET      L:0x525d, #0x2
        RET
// 1717         }
// 1718         else
// 1719         {
// 1720             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
??TIM1_CCxNCmd_4:
        BRES      L:0x525d, #0x2
// 1721         }
// 1722     }
// 1723 }
        RET
// 1724 
// 1725 
// 1726 /**
// 1727   * @brief  Selects the TIM1 Output Compare Mode. This function disables the
// 1728   * selected channel before changing the Output Compare Mode. User has to
// 1729   * enable this channel using TIM1_CCxCmd and TIM1_CCxNCmd functions.
// 1730   * @param   TIM1_Channel specifies the TIM1 Channel.
// 1731   * This parameter can be one of the following values:
// 1732   *                       - TIM1_CHANNEL_1: TIM1 Channel1
// 1733   *                       - TIM1_CHANNEL_2: TIM1 Channel2
// 1734   *                       - TIM1_CHANNEL_3: TIM1 Channel3
// 1735   *                       - TIM1_CHANNEL_4: TIM1 Channel4
// 1736   * @param   TIM1_OCMode specifies the TIM1 Output Compare Mode.
// 1737   * This paramter can be one of the following values:
// 1738   *                       - TIM1_OCMODE_TIMING
// 1739   *                       - TIM1_OCMODE_ACTIVE
// 1740   *                       - TIM1_OCMODE_TOGGLE
// 1741   *                       - TIM1_OCMODE_PWM1
// 1742   *                       - TIM1_OCMODE_PWM2
// 1743   *                       - TIM1_FORCEDACTION_ACTIVE
// 1744   *                       - TIM1_FORCEDACTION_INACTIVE
// 1745   * @retval None
// 1746   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1747 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
// 1748 {
// 1749     /* Check the parameters */
// 1750     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
// 1751     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
// 1752 
// 1753     if (TIM1_Channel == TIM1_CHANNEL_1)
TIM1_SelectOCxM:
        TNZ       A
        JRNE      L:??TIM1_SelectOCxM_0
// 1754     {
// 1755         /* Disable the Channel 1: Reset the CCE Bit */
// 1756         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
        BRES      L:0x525c, #0x0
// 1757 
// 1758         /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1759         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
// 1760                                 | (uint8_t)TIM1_OCMode);
        CALL      L:?Subroutine14
// 1761     }
??CrossCallReturnLabel_33:
        RET
// 1762     else if (TIM1_Channel == TIM1_CHANNEL_2)
??TIM1_SelectOCxM_0:
        CP        A, #0x1
        JRNE      L:??TIM1_SelectOCxM_1
// 1763     {
// 1764         /* Disable the Channel 2: Reset the CCE Bit */
// 1765         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
        BRES      L:0x525c, #0x4
// 1766 
// 1767         /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1768         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
// 1769                                 | (uint8_t)TIM1_OCMode);
        CALL      L:?Subroutine7
// 1770     }
??CrossCallReturnLabel_19:
        RET
// 1771     else if (TIM1_Channel == TIM1_CHANNEL_3)
??TIM1_SelectOCxM_1:
        CP        A, #0x2
        JRNE      L:??TIM1_SelectOCxM_2
// 1772     {
// 1773         /* Disable the Channel 3: Reset the CCE Bit */
// 1774         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
        BRES      L:0x525d, #0x0
// 1775 
// 1776         /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1777         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
// 1778                                 | (uint8_t)TIM1_OCMode);
        CALL      L:?Subroutine5
// 1779     }
??CrossCallReturnLabel_15:
        RET
// 1780     else
// 1781     {
// 1782         /* Disable the Channel 4: Reset the CCE Bit */
// 1783         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
??TIM1_SelectOCxM_2:
        BRES      L:0x525d, #0x4
// 1784 
// 1785         /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1786         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
// 1787                                 | (uint8_t)TIM1_OCMode);
        CALL      L:?Subroutine4
// 1788     }
// 1789 }
??CrossCallReturnLabel_13:
        RET
// 1790 
// 1791 
// 1792 /**
// 1793   * @brief  Sets the TIM1 Counter Register value.
// 1794   * @param   Counter specifies the Counter register new value.
// 1795   * This parameter is between 0x0000 and 0xFFFF.
// 1796   * @retval None
// 1797   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1798 void TIM1_SetCounter(uint16_t Counter)
// 1799 {
TIM1_SetCounter:
        LDW       Y, X
// 1800     /* Set the Counter Register value */
// 1801     TIM1->CNTRH = (uint8_t)(Counter >> 8);
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x525e, A
// 1802     TIM1->CNTRL = (uint8_t)(Counter);
        LD        A, YL
        LD        L:0x525f, A
// 1803 
// 1804 }
        RET
// 1805 
// 1806 
// 1807 /**
// 1808   * @brief  Sets the TIM1 Autoreload Register value.
// 1809   * @param   Autoreload specifies the Autoreload register new value.
// 1810   * This parameter is between 0x0000 and 0xFFFF.
// 1811   * @retval None
// 1812   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1813 void TIM1_SetAutoreload(uint16_t Autoreload)
// 1814 {
TIM1_SetAutoreload:
        LDW       Y, X
// 1815 
// 1816     /* Set the Autoreload Register value */
// 1817     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
        CALL      L:?Subroutine12
// 1818     TIM1->ARRL = (uint8_t)(Autoreload);
// 1819 
// 1820 }
??CrossCallReturnLabel_29:
        RET
// 1821 
// 1822 
// 1823 /**
// 1824   * @brief  Sets the TIM1 Capture Compare1 Register value.
// 1825   * @param   Compare1 specifies the Capture Compare1 register new value.
// 1826   * This parameter is between 0x0000 and 0xFFFF.
// 1827   * @retval None
// 1828   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1829 void TIM1_SetCompare1(uint16_t Compare1)
// 1830 {
TIM1_SetCompare1:
        LDW       Y, X
// 1831     /* Set the Capture Compare1 Register value */
// 1832     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
        CALL      L:?Subroutine11
// 1833     TIM1->CCR1L = (uint8_t)(Compare1);
// 1834 
// 1835 }
??CrossCallReturnLabel_27:
        RET
// 1836 
// 1837 
// 1838 /**
// 1839   * @brief  Sets the TIM1 Capture Compare2 Register value.
// 1840   * @param   Compare2 specifies the Capture Compare2 register new value.
// 1841   * This parameter is between 0x0000 and 0xFFFF.
// 1842   * @retval None
// 1843   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1844 void TIM1_SetCompare2(uint16_t Compare2)
// 1845 {
TIM1_SetCompare2:
        LDW       Y, X
// 1846     /* Set the Capture Compare2 Register value */
// 1847     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
        CALL      L:?Subroutine10
// 1848     TIM1->CCR2L = (uint8_t)(Compare2);
// 1849 
// 1850 }
??CrossCallReturnLabel_25:
        RET
// 1851 
// 1852 
// 1853 /**
// 1854   * @brief  Sets the TIM1 Capture Compare3 Register value.
// 1855   * @param   Compare3 specifies the Capture Compare3 register new value.
// 1856   * This parameter is between 0x0000 and 0xFFFF.
// 1857   * @retval None
// 1858   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1859 void TIM1_SetCompare3(uint16_t Compare3)
// 1860 {
TIM1_SetCompare3:
        LDW       Y, X
// 1861     /* Set the Capture Compare3 Register value */
// 1862     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
        CALL      L:?Subroutine9
// 1863     TIM1->CCR3L = (uint8_t)(Compare3);
// 1864 
// 1865 }
??CrossCallReturnLabel_23:
        RET
// 1866 
// 1867 
// 1868 /**
// 1869   * @brief  Sets the TIM1 Capture Compare4 Register value.
// 1870   * @param   Compare4 specifies the Capture Compare4 register new value.
// 1871   * This parameter is between 0x0000 and 0xFFFF.
// 1872   * @retval None
// 1873   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1874 void TIM1_SetCompare4(uint16_t Compare4)
// 1875 {
TIM1_SetCompare4:
        LDW       Y, X
// 1876     /* Set the Capture Compare4 Register value */
// 1877     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
        CALL      L:?Subroutine8
// 1878     TIM1->CCR4L = (uint8_t)(Compare4);
// 1879 }
??CrossCallReturnLabel_21:
        RET
// 1880 
// 1881 
// 1882 /**
// 1883   * @brief  Sets the TIM1 Input Capture 1 prescaler.
// 1884   * @param   TIM1_IC1Prescaler specifies the Input Capture prescaler new value
// 1885   * This parameter can be one of the following values:
// 1886   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1887   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1888   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1889   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1890   * @retval None
// 1891   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1892 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
// 1893 {
TIM1_SetIC1Prescaler:
        LD        S:?b0, A
// 1894     /* Check the parameters */
// 1895     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
// 1896 
// 1897     /* Reset the IC1PSC Bits */ /* Set the IC1PSC value */
// 1898     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
// 1899                             | (uint8_t)TIM1_IC1Prescaler);
        LD        A, L:0x5258
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5258, A
// 1900 
// 1901 }
        RET
// 1902 
// 1903 /**
// 1904   * @brief  Sets the TIM1 Input Capture 2 prescaler.
// 1905   * @param   TIM1_IC2Prescaler specifies the Input Capture prescaler new value
// 1906   * This parameter can be one of the following values:
// 1907   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1908   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1909   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1910   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1911   * @retval None
// 1912   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1913 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
// 1914 {
TIM1_SetIC2Prescaler:
        LD        S:?b0, A
// 1915 
// 1916     /* Check the parameters */
// 1917     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
// 1918 
// 1919     /* Reset the IC1PSC Bits */ /* Set the IC1PSC value */
// 1920     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
// 1921                             | (uint8_t)TIM1_IC2Prescaler);
        LD        A, L:0x5259
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5259, A
// 1922 }
        RET
// 1923 
// 1924 
// 1925 /**
// 1926   * @brief  Sets the TIM1 Input Capture 3 prescaler.
// 1927   * @param   TIM1_IC3Prescaler specifies the Input Capture prescaler new value
// 1928   * This parameter can be one of the following values:
// 1929   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1930   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1931   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1932   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1933   * @retval None
// 1934   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1935 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
// 1936 {
TIM1_SetIC3Prescaler:
        LD        S:?b0, A
// 1937 
// 1938     /* Check the parameters */
// 1939     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
// 1940 
// 1941     /* Reset the IC1PSC Bits & Set the IC1PSC value */
// 1942     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
// 1943                             (uint8_t)TIM1_IC3Prescaler);
        LD        A, L:0x525a
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x525a, A
// 1944 }
        RET
// 1945 
// 1946 /**
// 1947   * @brief  Sets the TIM1 Input Capture 4 prescaler.
// 1948   * @param  TIM1_IC4Prescaler specifies the Input Capture prescaler new value
// 1949   *         This parameter can be one of the following values:
// 1950   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1951   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1952   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1953   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1954   * @retval None
// 1955   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1956 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
// 1957 {
TIM1_SetIC4Prescaler:
        LD        S:?b0, A
// 1958 
// 1959     /* Check the parameters */
// 1960     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
// 1961 
// 1962     /* Reset the IC1PSC Bits &  Set the IC1PSC value */
// 1963     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
// 1964                             (uint8_t)TIM1_IC4Prescaler);
        LD        A, L:0x525b
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x525b, A
// 1965 }
        RET
// 1966 
// 1967 /**
// 1968   * @brief  Gets the TIM1 Input Capture 1 value.
// 1969   * @param  None
// 1970   * @retval Capture Compare 1 Register value.
// 1971   */

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

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1972 uint16_t TIM1_GetCapture1(void)
// 1973 {
// 1974     /* Get the Capture 1 Register value */
// 1975 
// 1976     uint16_t tmpccr1 = 0;
// 1977     uint8_t tmpccr1l=0, tmpccr1h=0;
// 1978 
// 1979     tmpccr1h = TIM1->CCR1H;
TIM1_GetCapture1:
        LD        A, L:0x5265
        LD        S:?b1, A
// 1980     tmpccr1l = TIM1->CCR1L;
        LD        A, L:0x5266
        CALL      L:?Subroutine0
// 1981 
// 1982     tmpccr1 = (uint16_t)(tmpccr1l);
// 1983     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
// 1984     /* Get the Capture 1 Register value */
// 1985     return (uint16_t)tmpccr1;
??CrossCallReturnLabel_3:
        RET
// 1986 }
// 1987 
// 1988 /**
// 1989   * @brief  Gets the TIM1 Input Capture 2 value.
// 1990   * @param  None
// 1991   * @retval Capture Compare 2 Register value.
// 1992   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1993 uint16_t TIM1_GetCapture2(void)
// 1994 {
// 1995     /* Get the Capture 2 Register value */
// 1996 
// 1997     uint16_t tmpccr2 = 0;
// 1998     uint8_t tmpccr2l=0, tmpccr2h=0;
// 1999 
// 2000     tmpccr2h = TIM1->CCR2H;
TIM1_GetCapture2:
        LD        A, L:0x5267
        LD        S:?b1, A
// 2001     tmpccr2l = TIM1->CCR2L;
        LD        A, L:0x5268
        CALL      L:?Subroutine0
// 2002 
// 2003     tmpccr2 = (uint16_t)(tmpccr2l);
// 2004     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
// 2005     /* Get the Capture 2 Register value */
// 2006     return (uint16_t)tmpccr2;
??CrossCallReturnLabel_2:
        RET
// 2007 }
// 2008 
// 2009 /**
// 2010   * @brief  Gets the TIM1 Input Capture 3 value.
// 2011   * @param  None
// 2012   * @retval Capture Compare 3 Register value.
// 2013   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2014 uint16_t TIM1_GetCapture3(void)
// 2015 {
// 2016     /* Get the Capture 3 Register value */
// 2017     uint16_t tmpccr3 = 0;
// 2018     uint8_t tmpccr3l=0, tmpccr3h=0;
// 2019 
// 2020     tmpccr3h = TIM1->CCR3H;
TIM1_GetCapture3:
        LD        A, L:0x5269
        LD        S:?b1, A
// 2021     tmpccr3l = TIM1->CCR3L;
        LD        A, L:0x526a
        CALL      L:?Subroutine0
// 2022 
// 2023     tmpccr3 = (uint16_t)(tmpccr3l);
// 2024     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
// 2025     /* Get the Capture 3 Register value */
// 2026     return (uint16_t)tmpccr3;
??CrossCallReturnLabel_1:
        RET
// 2027 }
// 2028 
// 2029 /**
// 2030   * @brief  Gets the TIM1 Input Capture 4 value.
// 2031   * @param  None
// 2032   * @retval Capture Compare 4 Register value.
// 2033   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2034 uint16_t TIM1_GetCapture4(void)
// 2035 {
// 2036     /* Get the Capture 4 Register value */
// 2037     uint16_t tmpccr4 = 0;
// 2038     uint8_t tmpccr4l=0, tmpccr4h=0;
// 2039 
// 2040     tmpccr4h = TIM1->CCR4H;
TIM1_GetCapture4:
        LD        A, L:0x526b
        LD        S:?b1, A
// 2041     tmpccr4l = TIM1->CCR4L;
        LD        A, L:0x526c
        CALL      L:?Subroutine0
// 2042 
// 2043     tmpccr4 = (uint16_t)(tmpccr4l);
// 2044     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
// 2045     /* Get the Capture 4 Register value */
// 2046     return (uint16_t)tmpccr4;
??CrossCallReturnLabel_0:
        RET
// 2047 }
// 2048 
// 2049 /**
// 2050   * @brief  Gets the TIM1 Counter value.
// 2051   * @param  None
// 2052   * @retval Counter Register value.
// 2053   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2054 uint16_t TIM1_GetCounter(void)
// 2055 {
// 2056   uint16_t tmpcntr = 0;
// 2057   
// 2058   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
TIM1_GetCounter:
        LD        A, L:0x525e
// 2059    
// 2060   /* Get the Counter Register value */
// 2061     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LD        A, L:0x525f
        CALL      L:?Subroutine17
??CrossCallReturnLabel_41:
        RET
// 2062 }

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine17:
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
        RET
// 2063 
// 2064 /**
// 2065   * @brief  Gets the TIM1 Prescaler value.
// 2066   * @param  None
// 2067   * @retval Prescaler Register value.
// 2068   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2069 uint16_t TIM1_GetPrescaler(void)
// 2070 {
// 2071    uint16_t temp = 0;
// 2072    
// 2073    temp = ((uint16_t)TIM1->PSCRH << 8);
TIM1_GetPrescaler:
        LD        A, L:0x5260
// 2074    
// 2075   /* Get the Prescaler Register value */
// 2076     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LD        A, L:0x5261
        CALL      L:?Subroutine17
??CrossCallReturnLabel_40:
        RET
// 2077 }
// 2078 
// 2079 /**
// 2080   * @brief  Checks whether the specified TIM1 flag is set or not.
// 2081   * @param  TIM1_FLAG specifies the flag to check.
// 2082   *         This parameter can be one of the following values:
// 2083   *                   - TIM1_FLAG_UPDATE: TIM1 update Flag
// 2084   *                   - TIM1_FLAG_CC1: TIM1 Capture Compare 1 Flag
// 2085   *                   - TIM1_FLAG_CC2: TIM1 Capture Compare 2 Flag
// 2086   *                   - TIM1_FLAG_CC3: TIM1 Capture Compare 3 Flag
// 2087   *                   - TIM1_FLAG_CC4: TIM1 Capture Compare 4 Flag
// 2088   *                   - TIM1_FLAG_COM: TIM1 Commutation Flag
// 2089   *                   - TIM1_FLAG_TRIGGER: TIM1 Trigger Flag
// 2090   *                   - TIM1_FLAG_BREAK: TIM1 Break Flag
// 2091   *                   - TIM1_FLAG_CC1OF: TIM1 Capture Compare 1 overcapture Flag
// 2092   *                   - TIM1_FLAG_CC2OF: TIM1 Capture Compare 2 overcapture Flag
// 2093   *                   - TIM1_FLAG_CC3OF: TIM1 Capture Compare 3 overcapture Flag
// 2094   *                   - TIM1_FLAG_CC4OF: TIM1 Capture Compare 4 overcapture Flag
// 2095   * @retval FlagStatus The new state of TIM1_FLAG (SET or RESET).
// 2096   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2097 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
// 2098 {
TIM1_GetFlagStatus:
        LDW       Y, X
// 2099     FlagStatus bitstatus = RESET;
// 2100     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
// 2101 
// 2102     /* Check the parameters */
// 2103     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
// 2104 
// 2105     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
        LD        A, L:0x5255
        LD        S:?b1, A
// 2106     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
// 2107 
// 2108     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
        CLR       A
        RRWA      X, A
        LD        A, XL
        AND       A, L:0x5256
        PUSH      A
        LD        A, YL
        AND       A, S:?b1
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        JREQ      L:??TIM1_GetFlagStatus_0
// 2109     {
// 2110         bitstatus = SET;
        LD        A, #0x1
        RET
// 2111     }
// 2112     else
// 2113     {
// 2114         bitstatus = RESET;
??TIM1_GetFlagStatus_0:
        CLR       A
// 2115     }
// 2116     return (FlagStatus)(bitstatus);
        RET
// 2117 }
// 2118 
// 2119 /**
// 2120   * @brief  Clears the TIM1’s pending flags.
// 2121   * @param  TIM1_FLAG specifies the flag to clear.
// 2122   *         This parameter can be one of the following values:
// 2123   *                       - TIM1_FLAG_UPDATE: TIM1 update Flag
// 2124   *                       - TIM1_FLAG_CC1: TIM1 Capture Compare 1 Flag
// 2125   *                       - TIM1_FLAG_CC2: TIM1 Capture Compare 2 Flag
// 2126   *                       - TIM1_FLAG_CC3: TIM1 Capture Compare 3 Flag
// 2127   *                       - TIM1_FLAG_CC4: TIM1 Capture Compare 4 Flag
// 2128   *                       - TIM1_FLAG_COM: TIM1 Commutation Flag
// 2129   *                       - TIM1_FLAG_TRIGGER: TIM1 Trigger Flag
// 2130   *                       - TIM1_FLAG_BREAK: TIM1 Break Flag
// 2131   *                       - TIM1_FLAG_CC1OF: TIM1 Capture Compare 1 overcapture Flag
// 2132   *                       - TIM1_FLAG_CC2OF: TIM1 Capture Compare 2 overcapture Flag
// 2133   *                       - TIM1_FLAG_CC3OF: TIM1 Capture Compare 3 overcapture Flag
// 2134   *                       - TIM1_FLAG_CC4OF: TIM1 Capture Compare 4 overcapture Flag
// 2135   * @retval None.
// 2136   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2137 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
// 2138 {
// 2139     /* Check the parameters */
// 2140     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
// 2141 
// 2142     /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
// 2143     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
TIM1_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x5255, A
// 2144     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
// 2145                           (uint8_t)0x1E);
        CLR       A
        RRWA      X, A
        LD        A, XL
        CPL       A
        AND       A, #0x1e
        LD        L:0x5256, A
// 2146 }
        RET
// 2147 
// 2148 /**
// 2149   * @brief  Checks whether the TIM1 interrupt has occurred or not.
// 2150   * @param  TIM1_IT specifies the TIM1 interrupt source to check.
// 2151   *         This parameter can be one of the following values:
// 2152   *                       - TIM1_IT_UPDATE: TIM1 update Interrupt source
// 2153   *                       - TIM1_IT_CC1: TIM1 Capture Compare 1 Interrupt source
// 2154   *                       - TIM1_IT_CC2: TIM1 Capture Compare 2 Interrupt source
// 2155   *                       - TIM1_IT_CC3: TIM1 Capture Compare 3 Interrupt source
// 2156   *                       - TIM1_IT_CC4: TIM1 Capture Compare 4 Interrupt source
// 2157   *                       - TIM1_IT_COM: TIM1 Commutation Interrupt source
// 2158   *                       - TIM1_IT_TRIGGER: TIM1 Trigger Interrupt source
// 2159   *                       - TIM1_IT_BREAK: TIM1 Break Interrupt source
// 2160   * @retval ITStatus The new state of the TIM1_IT(SET or RESET).
// 2161   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2162 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
// 2163 {
TIM1_GetITStatus:
        LD        S:?b0, A
// 2164     ITStatus bitstatus = RESET;
// 2165     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
// 2166 
// 2167     /* Check the parameters */
// 2168     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
// 2169 
// 2170     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
        LD        A, L:0x5255
        LD        S:?b2, A
// 2171 
// 2172     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
        LD        A, S:?b0
        AND       A, L:0x5254
        LD        S:?b1, A
// 2173 
// 2174     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
        LD        A, S:?b0
        BCP       A, S:?b2
        JREQ      L:??TIM1_GetITStatus_0
        TNZ       S:?b1
        JREQ      L:??TIM1_GetITStatus_0
// 2175     {
// 2176         bitstatus = SET;
        LD        A, #0x1
        RET
// 2177     }
// 2178     else
// 2179     {
// 2180         bitstatus = RESET;
??TIM1_GetITStatus_0:
        CLR       A
// 2181     }
// 2182     return (ITStatus)(bitstatus);
        RET
// 2183 }
// 2184 
// 2185 /**
// 2186   * @brief  Clears the TIM1's interrupt pending bits.
// 2187   * @param  TIM1_IT specifies the pending bit to clear.
// 2188   *         This parameter can be one of the following values:
// 2189   *                       - TIM1_IT_UPDATE: TIM1 update Interrupt source
// 2190   *                       - TIM1_IT_CC1: TIM1 Capture Compare 1 Interrupt source
// 2191   *                       - TIM1_IT_CC2: TIM1 Capture Compare 2 Interrupt source
// 2192   *                       - TIM1_IT_CC3: TIM1 Capture Compare 3 Interrupt source
// 2193   *                       - TIM1_IT_CC4: TIM1 Capture Compare 4 Interrupt source
// 2194   *                       - TIM1_IT_COM: TIM1 Commutation Interrupt source
// 2195   *                       - TIM1_IT_TRIGGER: TIM1 Trigger Interrupt source
// 2196   *                       - TIM1_IT_BREAK: TIM1 Break Interrupt source
// 2197   * @retval None.
// 2198   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2199 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
// 2200 {
// 2201     /* Check the parameters */
// 2202     assert_param(IS_TIM1_IT_OK(TIM1_IT));
// 2203 
// 2204     /* Clear the IT pending Bit */
// 2205     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
TIM1_ClearITPendingBit:
        CPL       A
        LD        L:0x5255, A
// 2206 }
        RET
// 2207 
// 2208 /**
// 2209   * @brief  Configure the TI1 as Input.
// 2210   * @param  TIM1_ICPolarity  The Input Polarity.
// 2211   *         This parameter can be one of the following values:
// 2212   *                       - TIM1_ICPOLARITY_FALLING
// 2213   *                       - TIM1_ICPOLARITY_RISING
// 2214   * @param  TIM1_ICSelection specifies the input to be used.
// 2215   *         This parameter can be one of the following values:
// 2216   *                       - TIM1_ICSELECTION_DIRECTTI: TIM1 Input 1 is selected to
// 2217   *                         be connected to IC1.
// 2218   *                       - TIM1_ICSELECTION_INDIRECTTI: TIM1 Input 1 is selected to
// 2219   *                         be connected to IC2.
// 2220   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2221   *         This parameter must be a value between 0x00 and 0x0F.
// 2222   * @retval None
// 2223   */

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

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2224 static void TI1_Config(uint8_t TIM1_ICPolarity,
// 2225                        uint8_t TIM1_ICSelection,
// 2226                        uint8_t TIM1_ICFilter)
// 2227 {
TI1_Config:
        LD        S:?b2, A
// 2228 
// 2229     /* Disable the Channel 1: Reset the CCE Bit */
// 2230     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
        BRES      L:0x525c, #0x0
// 2231 
// 2232     /* Select the Input and set the filter */
// 2233     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
// 2234                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        LD        A, L:0x5258
        CALL      L:?Subroutine1
??CrossCallReturnLabel_7:
        LD        L:0x5258, A
// 2235 
// 2236     /* Select the Polarity */
// 2237     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI1_Config_0
// 2238     {
// 2239         TIM1->CCER1 |= TIM1_CCER1_CC1P;
        BSET      L:0x525c, #0x1
        JRA       L:??TI1_Config_1
// 2240     }
// 2241     else
// 2242     {
// 2243         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
??TI1_Config_0:
        BRES      L:0x525c, #0x1
// 2244     }
// 2245 
// 2246     /* Set the CCE Bit */
// 2247     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
??TI1_Config_1:
        BSET      L:0x525c, #0x0
// 2248 }
        RET
// 2249 
// 2250 /**
// 2251   * @brief  Configure the TI2 as Input.
// 2252   * @param  TIM1_ICPolarity  The Input Polarity.
// 2253   *         This parameter can be one of the following values:
// 2254   *                       - TIM1_ICPOLARITY_FALLING
// 2255   *                       - TIM1_ICPOLARITY_RISING
// 2256   * @param  TIM1_ICSelection specifies the input to be used.
// 2257   *         This parameter can be one of the following values:
// 2258   *                       - TIM1_ICSELECTION_DIRECTTI: TIM1 Input 2 is selected to
// 2259   *                         be connected to IC2.
// 2260   *                       - TIM1_ICSELECTION_INDIRECTTI: TIM1 Input 2 is selected to
// 2261   *                         be connected to IC1.
// 2262   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2263   *         This parameter must be a value between 0x00 and 0x0F.
// 2264   * @retval None
// 2265   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2266 static void TI2_Config(uint8_t TIM1_ICPolarity,
// 2267                        uint8_t TIM1_ICSelection,
// 2268                        uint8_t TIM1_ICFilter)
// 2269 {
TI2_Config:
        LD        S:?b2, A
// 2270     /* Disable the Channel 2: Reset the CCE Bit */
// 2271     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
        BRES      L:0x525c, #0x4
// 2272 
// 2273     /* Select the Input and set the filter */
// 2274     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
// 2275                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        LD        A, L:0x5259
        CALL      L:?Subroutine1
??CrossCallReturnLabel_6:
        LD        L:0x5259, A
// 2276     /* Select the Polarity */
// 2277     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI2_Config_0
// 2278     {
// 2279         TIM1->CCER1 |= TIM1_CCER1_CC2P;
        BSET      L:0x525c, #0x5
        JRA       L:??TI2_Config_1
// 2280     }
// 2281     else
// 2282     {
// 2283         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
??TI2_Config_0:
        BRES      L:0x525c, #0x5
// 2284     }
// 2285     /* Set the CCE Bit */
// 2286     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
??TI2_Config_1:
        BSET      L:0x525c, #0x4
// 2287 }
        RET
// 2288 
// 2289 /**
// 2290   * @brief  Configure the TI3 as Input.
// 2291   * @param  TIM1_ICPolarity  The Input Polarity.
// 2292   *         This parameter can be one of the following values:
// 2293   *                       - TIM1_ICPOLARITY_FALLING
// 2294   *                       - TIM1_ICPOLARITY_RISING
// 2295   * @param  TIM1_ICSelection specifies the input to be used.
// 2296   *         This parameter can be one of the following values:
// 2297   *                       - TIM1_ICSELECTION_DIRECTTI: TIM1 Input 3 is selected to
// 2298   *                         be connected to IC3.
// 2299   *                       - TIM1_ICSELECTION_INDIRECTTI: TIM1 Input 3 is selected to
// 2300   *                         be connected to IC4.
// 2301   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2302   *         This parameter must be a value between 0x00 and 0x0F.
// 2303   * @retval None
// 2304   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2305 static void TI3_Config(uint8_t TIM1_ICPolarity,
// 2306                        uint8_t TIM1_ICSelection,
// 2307                        uint8_t TIM1_ICFilter)
// 2308 {
TI3_Config:
        LD        S:?b2, A
// 2309     /* Disable the Channel 3: Reset the CCE Bit */
// 2310     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
        BRES      L:0x525d, #0x0
// 2311 
// 2312     /* Select the Input and set the filter */
// 2313     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
// 2314                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        LD        A, L:0x525a
        CALL      L:?Subroutine1
??CrossCallReturnLabel_5:
        LD        L:0x525a, A
// 2315 
// 2316     /* Select the Polarity */
// 2317     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI3_Config_0
// 2318     {
// 2319         TIM1->CCER2 |= TIM1_CCER2_CC3P;
        BSET      L:0x525d, #0x1
        JRA       L:??TI3_Config_1
// 2320     }
// 2321     else
// 2322     {
// 2323         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
??TI3_Config_0:
        BRES      L:0x525d, #0x1
// 2324     }
// 2325     /* Set the CCE Bit */
// 2326     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
??TI3_Config_1:
        BSET      L:0x525d, #0x0
// 2327 }
        RET
// 2328 
// 2329 
// 2330 /**
// 2331   * @brief  Configure the TI4 as Input.
// 2332   * @param  TIM1_ICPolarity  The Input Polarity.
// 2333   *         This parameter can be one of the following values:
// 2334   *                       - TIM1_ICPOLARITY_FALLING
// 2335   *                       - TIM1_ICPOLARITY_RISING
// 2336   * @param  TIM1_ICSelection specifies the input to be used.
// 2337   *         This parameter can be one of the following values:
// 2338   *                       - TIM1_ICSELECTION_DIRECTTI: TIM1 Input 4 is selected to
// 2339   *                         be connected to IC4.
// 2340   *                       - TIM1_ICSELECTION_INDIRECTTI: TIM1 Input 4 is selected to
// 2341   *                         be connected to IC3.
// 2342   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2343   *         This parameter must be a value between 0x00 and 0x0F.
// 2344   * @retval None
// 2345   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2346 static void TI4_Config(uint8_t TIM1_ICPolarity,
// 2347                        uint8_t TIM1_ICSelection,
// 2348                        uint8_t TIM1_ICFilter)
// 2349 {
TI4_Config:
        LD        S:?b2, A
// 2350 
// 2351     /* Disable the Channel 4: Reset the CCE Bit */
// 2352     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
        BRES      L:0x525d, #0x4
// 2353 
// 2354     /* Select the Input and set the filter */
// 2355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
// 2356                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        LD        A, L:0x525b
        CALL      L:?Subroutine1
??CrossCallReturnLabel_4:
        LD        L:0x525b, A
// 2357 
// 2358     /* Select the Polarity */
// 2359     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI4_Config_0
// 2360     {
// 2361         TIM1->CCER2 |= TIM1_CCER2_CC4P;
        BSET      L:0x525d, #0x5
        JRA       L:??TI4_Config_1
// 2362     }
// 2363     else
// 2364     {
// 2365         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
??TI4_Config_0:
        BRES      L:0x525d, #0x5
// 2366     }
// 2367 
// 2368     /* Set the CCE Bit */
// 2369     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
??TI4_Config_1:
        BSET      L:0x525d, #0x4
// 2370 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 2371 
// 2372 
// 2373 /**
// 2374   * @}
// 2375   */
// 2376   
// 2377 /**
// 2378   * @}
// 2379   */
// 2380   
// 2381 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 2 005 bytes in section .near_func.text
// 
// 2 005 bytes of CODE memory
//
//Errors: none
//Warnings: none
