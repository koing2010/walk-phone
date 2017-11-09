///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:32 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim2.c         /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim2.c -e -Oh  /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_tim2.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_tim2

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

        PUBLIC TIM2_ARRPreloadConfig
        PUBLIC TIM2_CCxCmd
        PUBLIC TIM2_ClearFlag
        PUBLIC TIM2_ClearITPendingBit
        PUBLIC TIM2_Cmd
        PUBLIC TIM2_DeInit
        PUBLIC TIM2_ForcedOC1Config
        PUBLIC TIM2_ForcedOC2Config
        PUBLIC TIM2_ForcedOC3Config
        PUBLIC TIM2_GenerateEvent
        PUBLIC TIM2_GetCapture1
        PUBLIC TIM2_GetCapture2
        PUBLIC TIM2_GetCapture3
        PUBLIC TIM2_GetCounter
        PUBLIC TIM2_GetFlagStatus
        PUBLIC TIM2_GetITStatus
        PUBLIC TIM2_GetPrescaler
        PUBLIC TIM2_ICInit
        PUBLIC TIM2_ITConfig
        PUBLIC TIM2_OC1Init
        PUBLIC TIM2_OC1PolarityConfig
        PUBLIC TIM2_OC1PreloadConfig
        PUBLIC TIM2_OC2Init
        PUBLIC TIM2_OC2PolarityConfig
        PUBLIC TIM2_OC2PreloadConfig
        PUBLIC TIM2_OC3Init
        PUBLIC TIM2_OC3PolarityConfig
        PUBLIC TIM2_OC3PreloadConfig
        PUBLIC TIM2_PWMIConfig
        PUBLIC TIM2_PrescalerConfig
        PUBLIC TIM2_SelectOCxM
        PUBLIC TIM2_SelectOnePulseMode
        PUBLIC TIM2_SetAutoreload
        PUBLIC TIM2_SetCompare1
        PUBLIC TIM2_SetCompare2
        PUBLIC TIM2_SetCompare3
        PUBLIC TIM2_SetCounter
        PUBLIC TIM2_SetIC1Prescaler
        PUBLIC TIM2_SetIC2Prescaler
        PUBLIC TIM2_SetIC3Prescaler
        PUBLIC TIM2_TimeBaseInit
        PUBLIC TIM2_UpdateDisableConfig
        PUBLIC TIM2_UpdateRequestConfig

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim2.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_tim2.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the TIM2 peripheral.
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
//   23 #include "stm8s_tim2.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 static void TI1_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection, uint8_t TIM2_ICFilter);
//   34 static void TI2_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection, uint8_t TIM2_ICFilter);
//   35 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection, uint8_t TIM2_ICFilter);
//   36 /**
//   37   * @addtogroup TIM2_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 /**
//   42   * @brief  Deinitializes the TIM2 peripheral registers to their default reset values.
//   43   * @param  None
//   44   * @retval None
//   45   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 void TIM2_DeInit(void)
//   47 {
//   48 
//   49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
TIM2_DeInit:
        CLR       L:0x5300
//   50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
        CLR       L:0x5301
//   51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
        CLR       L:0x5303
//   52 
//   53     /* Disable channels */
//   54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
        CALL      L:?Subroutine13
//   55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
//   56 
//   57 
//   58     /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
//   59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
??CrossCallReturnLabel_28:
        CALL      L:?Subroutine13
//   60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
//   61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
??CrossCallReturnLabel_29:
        CLR       L:0x5305
//   62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
        CLR       L:0x5306
//   63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
        CLR       L:0x5307
//   64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
        CLR       L:0x530a
//   65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
        CLR       L:0x530b
//   66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
        CLR       L:0x530c
//   67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
        MOV       L:0x530d, #0xff
//   68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
        MOV       L:0x530e, #0xff
//   69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
        CLR       L:0x530f
//   70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
        CLR       L:0x5310
//   71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
        CLR       L:0x5311
//   72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
        CLR       L:0x5312
//   73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
        CLR       L:0x5313
//   74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
        CLR       L:0x5314
//   75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
        CLR       L:0x5302
//   76 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine13:
        CLR       L:0x5308
        CLR       L:0x5309
        RET
//   77 
//   78 
//   79 /**
//   80   * @brief  Initializes the TIM2 Time Base Unit according to the specified parameters.
//   81   * @param    TIM2_Prescaler specifies the Prescaler from TIM2_Prescaler_TypeDef.
//   82   * @param    TIM2_Period specifies the Period value.
//   83   * @retval None
//   84   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
//   86                         uint16_t TIM2_Period)
//   87 {
TIM2_TimeBaseInit:
        LDW       Y, X
//   88     /* Set the Prescaler value */
//   89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
        LD        L:0x530c, A
//   90     /* Set the Autoreload value */
//   91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
        CALL      L:?Subroutine9
//   92     TIM2->ARRL = (uint8_t)(TIM2_Period);
//   93 }
??CrossCallReturnLabel_21:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine9:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x530d, A
        LD        A, YL
        LD        L:0x530e, A
        RET
//   94 
//   95 
//   96 /**
//   97   * @brief  Initializes the TIM2 Channel1 according to the specified parameters.
//   98   * @param   TIM2_OCMode specifies the Output Compare mode  from @ref TIM2_OCMode_TypeDef.
//   99   * @param   TIM2_OutputState specifies the Output State  from @ref TIM2_OutputState_TypeDef.
//  100   * @param   TIM2_Pulse specifies the Pulse width  value.
//  101   * @param   TIM2_OCPolarity specifies the Output Compare Polarity  from @ref TIM2_OCPolarity_TypeDef.
//  102   * @retval None
//  103   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
//  105                   TIM2_OutputState_TypeDef TIM2_OutputState,
//  106                   uint16_t TIM2_Pulse,
//  107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  108 {
TIM2_OC1Init:
        LD        S:?b2, A
        LDW       Y, X
//  109     /* Check the parameters */
//  110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
//  111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
//  112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
//  113 
//  114     /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , the Output Polarity */
//  115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
        LD        A, L:0x5308
        AND       A, #0xfc
        LD        L:0x5308, A
//  116     /* Set the Output State &  Set the Output Polarity  */
//  117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
//  118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
        CALL      L:?Subroutine2
??CrossCallReturnLabel_7:
        OR        A, L:0x5308
        LD        L:0x5308, A
//  119 
//  120     /* Reset the Output Compare Bits  & Set the Ouput Compare Mode */
//  121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
//  122                             (uint8_t)TIM2_OCMode);
        LD        A, L:0x5305
        AND       A, #0x8f
        OR        A, S:?b2
        LD        L:0x5305, A
//  123 
//  124     /* Set the Pulse value */
//  125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
        CALL      L:?Subroutine8
//  126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
//  127 }
??CrossCallReturnLabel_19:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine8:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x530f, A
        LD        A, YL
        LD        L:0x5310, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        LD        A, S:?b1
        AND       A, #0x2
        PUSH      A
        LD        A, S:?b0
        AND       A, #0x1
        LD        S:?b0, A
        POP       A
        OR        A, S:?b0
        RET
//  128 
//  129 
//  130 /**
//  131   * @brief  Initializes the TIM2 Channel2 according to the specified parameters.
//  132   * @param   TIM2_OCMode specifies the Output Compare mode  from @ref TIM2_OCMode_TypeDef.
//  133   * @param   TIM2_OutputState specifies the Output State  from @ref TIM2_OutputState_TypeDef.
//  134   * @param   TIM2_Pulse specifies the Pulse width  value.
//  135   * @param   TIM2_OCPolarity specifies the Output Compare Polarity  from @ref TIM2_OCPolarity_TypeDef.
//  136   * @retval None
//  137   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
//  139                   TIM2_OutputState_TypeDef TIM2_OutputState,
//  140                   uint16_t TIM2_Pulse,
//  141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  142 {
TIM2_OC2Init:
        LD        S:?b2, A
        LDW       Y, X
//  143     /* Check the parameters */
//  144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
//  145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
//  146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
//  147 
//  148 
//  149     /* Disable the Channel 1: Reset the CCE Bit, Set the Output State, the Output Polarity */
//  150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
        LD        A, L:0x5308
        AND       A, #0xcf
        LD        L:0x5308, A
//  151     /* Set the Output State & Set the Output Polarity */
//  152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
//  153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
        LD        A, S:?b1
        AND       A, #0x20
        PUSH      A
        LD        A, S:?b0
        AND       A, #0x10
        LD        S:?b0, A
        POP       A
        OR        A, S:?b0
        OR        A, L:0x5308
        LD        L:0x5308, A
//  154 
//  155 
//  156     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
//  158                             (uint8_t)TIM2_OCMode);
        LD        A, L:0x5306
        AND       A, #0x8f
        OR        A, S:?b2
        LD        L:0x5306, A
//  159 
//  160 
//  161     /* Set the Pulse value */
//  162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
        CALL      L:?Subroutine7
//  163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
//  164 }
??CrossCallReturnLabel_17:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine7:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5311, A
        LD        A, YL
        LD        L:0x5312, A
        RET
//  165 
//  166 
//  167 /**
//  168   * @brief  Initializes the TIM2 Channel3 according to the specified parameters.
//  169   * @param   TIM2_OCMode specifies the Output Compare mode from @ref TIM2_OCMode_TypeDef.
//  170   * @param   TIM2_OutputState specifies the Output State from @ref TIM2_OutputState_TypeDef.
//  171   * @param   TIM2_Pulse specifies the Pulse width value.
//  172   * @param   TIM2_OCPolarity specifies the Output Compare Polarity  from @ref TIM2_OCPolarity_TypeDef.
//  173   * @retval None
//  174   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
//  176                   TIM2_OutputState_TypeDef TIM2_OutputState,
//  177                   uint16_t TIM2_Pulse,
//  178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  179 {
TIM2_OC3Init:
        LD        S:?b2, A
        LDW       Y, X
//  180     /* Check the parameters */
//  181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
//  182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
//  183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
//  184     /* Disable the Channel 1: Reset the CCE Bit, Set the Output State, the Output Polarity */
//  185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
        LD        A, L:0x5309
        AND       A, #0xfc
        LD        L:0x5309, A
//  186     /* Set the Output State & Set the Output Polarity */
//  187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
//  188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
        CALL      L:?Subroutine2
??CrossCallReturnLabel_6:
        OR        A, L:0x5309
        LD        L:0x5309, A
//  189 
//  190     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
//  192                             (uint8_t)TIM2_OCMode);
        LD        A, L:0x5307
        AND       A, #0x8f
        OR        A, S:?b2
        LD        L:0x5307, A
//  193 
//  194     /* Set the Pulse value */
//  195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
        CALL      L:?Subroutine6
//  196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
//  197 
//  198 }
??CrossCallReturnLabel_15:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine6:
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5313, A
        LD        A, YL
        LD        L:0x5314, A
        RET
//  199 
//  200 
//  201 /**
//  202   * @brief  Initializes the TIM2 peripheral according to the specified parameters.
//  203   * @param    TIM2_Channel specifies the Input Capture Channel from @ref TIM2_Channel_TypeDef.
//  204   * @param   TIM2_ICPolarity specifies the Input Capture Polarity from @ref TIM2_ICPolarity_TypeDef.
//  205   * @param   TIM2_ICSelection specifies the Input Capture Selection from @ref TIM2_ICSelection_TypeDef.
//  206   * @param   TIM2_ICPrescaler specifies the Input Capture Prescaler from @ref TIM2_ICPSC_TypeDef.
//  207   * @param   TIM2_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
//  208   * @retval None
//  209   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
//  211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
//  212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
//  213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
//  214                  uint8_t TIM2_ICFilter)
//  215 {
TIM2_ICInit:
        MOV       S:?b4, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b5, S:?b2
        MOV       S:?b1, S:?b3
//  216     /* Check the parameters */
//  217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
//  218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
//  219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
//  220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
//  221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
//  222 
//  223     if (TIM2_Channel == TIM2_CHANNEL_1)
        TNZ       A
        JRNE      L:??TIM2_ICInit_0
//  224     {
//  225         /* TI1 Configuration */
//  226         TI1_Config((uint8_t)TIM2_ICPolarity,
//  227                    (uint8_t)TIM2_ICSelection,
//  228                    (uint8_t)TIM2_ICFilter);
        LD        A, S:?b4
        CALL      L:?Subroutine14
??CrossCallReturnLabel_31:
        OR        A, S:?b5
        LD        L:0x5305, A
//  229 
//  230         /* Set the Input Capture Prescaler value */
//  231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
//  232     }
        RET
//  233     else if (TIM2_Channel == TIM2_CHANNEL_2)
??TIM2_ICInit_0:
        CP        A, #0x1
        JRNE      L:??TIM2_ICInit_1
//  234     {
//  235         /* TI2 Configuration */
//  236         TI2_Config((uint8_t)TIM2_ICPolarity,
//  237                    (uint8_t)TIM2_ICSelection,
//  238                    (uint8_t)TIM2_ICFilter);
        LD        A, S:?b4
        CALL      L:?Subroutine15
??CrossCallReturnLabel_33:
        OR        A, S:?b5
        LD        L:0x5306, A
//  239 
//  240         /* Set the Input Capture Prescaler value */
//  241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
//  242     }
        RET
//  243     else
//  244     {
//  245         /* TI3 Configuration */
//  246         TI3_Config((uint8_t)TIM2_ICPolarity,
//  247                    (uint8_t)TIM2_ICSelection,
//  248                    (uint8_t)TIM2_ICFilter);
??TIM2_ICInit_1:
        LD        A, S:?b4
        CALL      L:TI3_Config
//  249 
//  250         /* Set the Input Capture Prescaler value */
//  251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
        LD        A, L:0x5307
        AND       A, #0xf3
        OR        A, S:?b5
        LD        L:0x5307, A
//  252     }
//  253 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine15:
        CALL      L:TI2_Config
        LD        A, L:0x5306
        AND       A, #0xf3
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine14:
        CALL      L:TI1_Config
        LD        A, L:0x5305
        AND       A, #0xf3
        RET
//  254 
//  255 
//  256 /**
//  257   * @brief  Configures the TIM2 peripheral in PWM Input Mode according to the specified parameters.
//  258     * @param    TIM2_Channel specifies the Input Capture Channel from @ref TIM2_Channel_TypeDef.
//  259   * @param   TIM2_ICPolarity specifies the Input Capture Polarity from @ref TIM2_ICPolarity_TypeDef.
//  260   * @param   TIM2_ICSelection specifies the Input Capture Selection from @ref TIM2_ICSelection_TypeDef.
//  261   * @param   TIM2_ICPrescaler specifies the Input Capture Prescaler from @ref TIM2_ICPSC_TypeDef.
//  262   * @param   TIM2_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
//  263   * @retval None
//  264   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
//  266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
//  267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
//  268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
//  269                      uint8_t TIM2_ICFilter)
//  270 {
TIM2_PWMIConfig:
        PUSH      S:?b8
        LD        S:?b6, A
        MOV       S:?b7, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b8, S:?b2
//  271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
//  272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
//  273 
//  274     /* Check the parameters */
//  275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
//  276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
//  277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
//  278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
//  279 
//  280     /* Select the Opposite Input Polarity */
//  281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
        LD        A, S:?b7
        CP        A, #0x44
        JREQ      L:??TIM2_PWMIConfig_0
//  282     {
//  283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
        MOV       S:?b5, #0x44
        JRA       L:??TIM2_PWMIConfig_1
//  284     }
//  285     else
//  286     {
//  287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
??TIM2_PWMIConfig_0:
        CLR       S:?b5
//  288     }
//  289 
//  290     /* Select the Opposite Input */
//  291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
??TIM2_PWMIConfig_1:
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM2_PWMIConfig_2
//  292     {
//  293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
        MOV       S:?b4, #0x2
        JRA       L:??TIM2_PWMIConfig_3
//  294     }
//  295     else
//  296     {
//  297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
??TIM2_PWMIConfig_2:
        MOV       S:?b4, #0x1
//  298     }
//  299 
//  300     if (TIM2_Channel == TIM2_CHANNEL_1)
??TIM2_PWMIConfig_3:
        TNZ       S:?b6
        MOV       S:?b1, S:?b3
        JRNE      L:??TIM2_PWMIConfig_4
//  301     {
//  302         /* TI1 Configuration */
//  303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
//  304                    (uint8_t)TIM2_ICFilter);
        LD        A, S:?b7
        CALL      L:?Subroutine10
//  305 
//  306         /* Set the Input Capture Prescaler value */
//  307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
//  308 
//  309         /* TI2 Configuration */
//  310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
??CrossCallReturnLabel_22:
        CALL      L:?Subroutine12
//  311 
//  312         /* Set the Input Capture Prescaler value */
//  313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
//  314     }
??CrossCallReturnLabel_26:
        CALL      L:?Subroutine4
??CrossCallReturnLabel_10:
        JRA       L:??CrossCallReturnLabel_23
//  315     else
//  316     {
//  317         /* TI2 Configuration */
//  318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
//  319                    (uint8_t)TIM2_ICFilter);
??TIM2_PWMIConfig_4:
        LD        A, S:?b7
        CALL      L:?Subroutine4
//  320 
//  321         /* Set the Input Capture Prescaler value */
//  322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
//  323 
//  324         /* TI1 Configuration */
//  325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
??CrossCallReturnLabel_11:
        CALL      L:?Subroutine12
//  326 
//  327         /* Set the Input Capture Prescaler value */
//  328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
//  329     }
??CrossCallReturnLabel_27:
        CALL      L:?Subroutine10
//  330 }
??CrossCallReturnLabel_23:
        POP       S:?b8
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine12:
        MOV       S:?b1, S:?b3
        MOV       S:?b0, S:?b4
        LD        A, S:?b5
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine10:
        CALL      L:?Subroutine14
??CrossCallReturnLabel_30:
        OR        A, S:?b8
        LD        L:0x5305, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine4:
        CALL      L:?Subroutine15
??CrossCallReturnLabel_32:
        OR        A, S:?b8
        LD        L:0x5306, A
        RET
//  331 
//  332 
//  333 /**
//  334   * @brief  Enables or disables the TIM2 peripheral.
//  335   * @param   NewState new state of the TIM2 peripheral. This parameter can
//  336   * be ENABLE or DISABLE.
//  337   * @retval None
//  338   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  339 void TIM2_Cmd(FunctionalState NewState)
//  340 {
//  341     /* Check the parameters */
//  342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  343 
//  344     /* set or Reset the CEN Bit */
//  345     if (NewState != DISABLE)
TIM2_Cmd:
        TNZ       A
        JREQ      L:??TIM2_Cmd_0
//  346     {
//  347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
        BSET      L:0x5300, #0x0
        RET
//  348     }
//  349     else
//  350     {
//  351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
??TIM2_Cmd_0:
        BRES      L:0x5300, #0x0
//  352     }
//  353 }
        RET
//  354 
//  355 
//  356 /**
//  357   * @brief  Enables or disables the specified TIM2 interrupts.
//  358   * @param   NewState new state of the TIM2 peripheral.
//  359   * This parameter can be: ENABLE or DISABLE.
//  360   * @param   TIM2_IT specifies the TIM2 interrupts sources to be enabled or disabled.
//  361   * This parameter can be any combination of the following values:
//  362   *                       - TIM2_IT_UPDATE: TIM2 update Interrupt source
//  363   *                       - TIM2_IT_CC1: TIM2 Capture Compare 1 Interrupt source
//  364   *                       - TIM2_IT_CC2: TIM2 Capture Compare 2 Interrupt source
//  365   *                       - TIM2_IT_CC3: TIM2 Capture Compare 3 Interrupt source
//  366   * @param   NewState new state of the TIM2 peripheral.
//  367   * @retval None
//  368   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
//  370 {
//  371     /* Check the parameters */
//  372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
//  373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  374 
//  375     if (NewState != DISABLE)
TIM2_ITConfig:
        TNZ       S:?b0
        JREQ      L:??TIM2_ITConfig_0
//  376     {
//  377         /* Enable the Interrupt sources */
//  378         TIM2->IER |= (uint8_t)TIM2_IT;
        OR        A, L:0x5301
        JRA       L:??TIM2_ITConfig_1
//  379     }
//  380     else
//  381     {
//  382         /* Disable the Interrupt sources */
//  383         TIM2->IER &= (uint8_t)(~TIM2_IT);
??TIM2_ITConfig_0:
        CPL       A
        AND       A, L:0x5301
??TIM2_ITConfig_1:
        LD        L:0x5301, A
//  384     }
//  385 }
        RET
//  386 
//  387 
//  388 /**
//  389   * @brief  Enables or Disables the TIM2 Update event.
//  390   * @param   NewState new state of the TIM2 peripheral Preload register. This parameter can
//  391   * be ENABLE or DISABLE.
//  392   * @retval None
//  393   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
//  395 {
//  396     /* Check the parameters */
//  397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  398 
//  399     /* Set or Reset the UDIS Bit */
//  400     if (NewState != DISABLE)
TIM2_UpdateDisableConfig:
        TNZ       A
        JREQ      L:??TIM2_UpdateDisableConfig_0
//  401     {
//  402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
        BSET      L:0x5300, #0x1
        RET
//  403     }
//  404     else
//  405     {
//  406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
??TIM2_UpdateDisableConfig_0:
        BRES      L:0x5300, #0x1
//  407     }
//  408 }
        RET
//  409 
//  410 /**
//  411   * @brief  Selects the TIM2 Update Request Interrupt source.
//  412   * @param   TIM2_UpdateSource specifies the Update source.
//  413   * This parameter can be one of the following values
//  414   *                       - TIM2_UPDATESOURCE_REGULAR
//  415   *                       - TIM2_UPDATESOURCE_GLOBAL
//  416   * @retval None
//  417   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
//  419 {
//  420     /* Check the parameters */
//  421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
//  422 
//  423     /* Set or Reset the URS Bit */
//  424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
TIM2_UpdateRequestConfig:
        TNZ       A
        JREQ      L:??TIM2_UpdateRequestConfig_0
//  425     {
//  426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
        BSET      L:0x5300, #0x2
        RET
//  427     }
//  428     else
//  429     {
//  430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
??TIM2_UpdateRequestConfig_0:
        BRES      L:0x5300, #0x2
//  431     }
//  432 }
        RET
//  433 
//  434 
//  435 /**
//  436   * @brief  Selects the TIM2’s One Pulse Mode.
//  437   * @param   TIM2_OPMode specifies the OPM Mode to be used.
//  438   * This parameter can be one of the following values
//  439   *                    - TIM2_OPMODE_SINGLE
//  440   *                    - TIM2_OPMODE_REPETITIVE
//  441   * @retval None
//  442   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
//  444 {
//  445     /* Check the parameters */
//  446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
//  447 
//  448     /* Set or Reset the OPM Bit */
//  449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
TIM2_SelectOnePulseMode:
        TNZ       A
        JREQ      L:??TIM2_SelectOnePulseMode_0
//  450     {
//  451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
        BSET      L:0x5300, #0x3
        RET
//  452     }
//  453     else
//  454     {
//  455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
??TIM2_SelectOnePulseMode_0:
        BRES      L:0x5300, #0x3
//  456     }
//  457 
//  458 }
        RET
//  459 
//  460 
//  461 /**
//  462   * @brief  Configures the TIM2 Prescaler.
//  463   * @param   Prescaler specifies the Prescaler Register value
//  464   * This parameter can be one of the following values
//  465   *                       -  TIM2_PRESCALER_1
//  466   *                       -  TIM2_PRESCALER_2
//  467   *                       -  TIM2_PRESCALER_4
//  468   *                       -  TIM2_PRESCALER_8
//  469   *                       -  TIM2_PRESCALER_16
//  470   *                       -  TIM2_PRESCALER_32
//  471   *                       -  TIM2_PRESCALER_64
//  472   *                       -  TIM2_PRESCALER_128
//  473   *                       -  TIM2_PRESCALER_256
//  474   *                       -  TIM2_PRESCALER_512
//  475   *                       -  TIM2_PRESCALER_1024
//  476   *                       -  TIM2_PRESCALER_2048
//  477   *                       -  TIM2_PRESCALER_4096
//  478   *                       -  TIM2_PRESCALER_8192
//  479   *                       -  TIM2_PRESCALER_16384
//  480   *                       -  TIM2_PRESCALER_32768
//  481   * @param   TIM2_PSCReloadMode specifies the TIM2 Prescaler Reload mode.
//  482   * This parameter can be one of the following values
//  483   *                       - TIM2_PSCRELOADMODE_IMMEDIATE: The Prescaler is loaded
//  484   *                         immediately.
//  485   *                       - TIM2_PSCRELOADMODE_UPDATE: The Prescaler is loaded at
//  486   *                         the update event.
//  487   * @retval None
//  488   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
//  490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
//  491 {
//  492     /* Check the parameters */
//  493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
//  494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
//  495 
//  496     /* Set the Prescaler value */
//  497     TIM2->PSCR = (uint8_t)Prescaler;
TIM2_PrescalerConfig:
        LD        L:0x530c, A
//  498 
//  499     /* Set or reset the UG Bit */
//  500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
        LD        A, S:?b0
        LD        L:0x5304, A
//  501 }
        RET
//  502 
//  503 /**
//  504   * @brief  Forces the TIM2 Channel1 output waveform to active or inactive level.
//  505   * @param   TIM2_ForcedAction specifies the forced Action to be set to the output waveform.
//  506   * This parameter can be one of the following values:
//  507   *                       - TIM2_FORCEDACTION_ACTIVE: Force active level on OC1REF
//  508   *                       - TIM2_FORCEDACTION_INACTIVE: Force inactive level on
//  509   *                         OC1REF.
//  510   * @retval None
//  511   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
//  513 {
TIM2_ForcedOC1Config:
        LD        S:?b0, A
//  514     /* Check the parameters */
//  515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
//  516 
//  517     /* Reset the OCM Bits & Configure the Forced output Mode */
//  518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
//  519                               | (uint8_t)TIM2_ForcedAction);
        CALL      L:?Subroutine11
//  520 }
??CrossCallReturnLabel_25:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine11:
        LD        A, L:0x5305
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5305, A
        RET
//  521 
//  522 /**
//  523   * @brief  Forces the TIM2 Channel2 output waveform to active or inactive level.
//  524   * @param   TIM2_ForcedAction specifies the forced Action to be set to the output waveform.
//  525   * This parameter can be one of the following values:
//  526   *                       - TIM2_FORCEDACTION_ACTIVE: Force active level on OC2REF
//  527   *                       - TIM2_FORCEDACTION_INACTIVE: Force inactive level on
//  528   *                         OC2REF.
//  529   * @retval None
//  530   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
//  532 {
TIM2_ForcedOC2Config:
        LD        S:?b0, A
//  533     /* Check the parameters */
//  534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
//  535 
//  536     /* Reset the OCM Bits & Configure the Forced output Mode */
//  537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
//  538                             | (uint8_t)TIM2_ForcedAction);
        CALL      L:?Subroutine5
//  539 }
??CrossCallReturnLabel_13:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine5:
        LD        A, L:0x5306
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5306, A
        RET
//  540 
//  541 /**
//  542   * @brief  Forces the TIM2 Channel3 output waveform to active or inactive level.
//  543   * @param   TIM2_ForcedAction specifies the forced Action to be set to the output waveform.
//  544   * This parameter can be one of the following values:
//  545   *                       - TIM2_FORCEDACTION_ACTIVE: Force active level on OC3REF
//  546   *                       - TIM2_FORCEDACTION_INACTIVE: Force inactive level on
//  547   *                         OC3REF.
//  548   * @retval None
//  549   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
//  551 {
TIM2_ForcedOC3Config:
        LD        S:?b0, A
//  552     /* Check the parameters */
//  553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
//  554 
//  555     /* Reset the OCM Bits & Configure the Forced output Mode */
//  556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
//  557                               | (uint8_t)TIM2_ForcedAction);
        CALL      L:?Subroutine3
//  558 }
??CrossCallReturnLabel_9:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine3:
        LD        A, L:0x5307
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5307, A
        RET
//  559 
//  560 
//  561 /**
//  562   * @brief  Enables or disables TIM2 peripheral Preload register on ARR.
//  563   * @param   NewState new state of the TIM2 peripheral Preload register.
//  564   * This parameter can be ENABLE or DISABLE.
//  565   * @retval None
//  566   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
//  568 {
//  569     /* Check the parameters */
//  570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  571 
//  572     /* Set or Reset the ARPE Bit */
//  573     if (NewState != DISABLE)
TIM2_ARRPreloadConfig:
        TNZ       A
        JREQ      L:??TIM2_ARRPreloadConfig_0
//  574     {
//  575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
        BSET      L:0x5300, #0x7
        RET
//  576     }
//  577     else
//  578     {
//  579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
??TIM2_ARRPreloadConfig_0:
        BRES      L:0x5300, #0x7
//  580     }
//  581 }
        RET
//  582 
//  583 
//  584 /**
//  585   * @brief  Enables or disables the TIM2 peripheral Preload Register on CCR1.
//  586   * @param   NewState new state of the Capture Compare Preload register.
//  587   * This parameter can be ENABLE or DISABLE.
//  588   * @retval None
//  589   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
//  591 {
//  592     /* Check the parameters */
//  593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  594 
//  595     /* Set or Reset the OC1PE Bit */
//  596     if (NewState != DISABLE)
TIM2_OC1PreloadConfig:
        TNZ       A
        JREQ      L:??TIM2_OC1PreloadConfig_0
//  597     {
//  598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
        BSET      L:0x5305, #0x3
        RET
//  599     }
//  600     else
//  601     {
//  602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
??TIM2_OC1PreloadConfig_0:
        BRES      L:0x5305, #0x3
//  603     }
//  604 }
        RET
//  605 
//  606 
//  607 /**
//  608   * @brief  Enables or disables the TIM2 peripheral Preload Register on CCR2.
//  609   * @param   NewState new state of the Capture Compare Preload register.
//  610   * This parameter can be ENABLE or DISABLE.
//  611   * @retval None
//  612   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
//  614 {
//  615     /* Check the parameters */
//  616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  617 
//  618     /* Set or Reset the OC2PE Bit */
//  619     if (NewState != DISABLE)
TIM2_OC2PreloadConfig:
        TNZ       A
        JREQ      L:??TIM2_OC2PreloadConfig_0
//  620     {
//  621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
        BSET      L:0x5306, #0x3
        RET
//  622     }
//  623     else
//  624     {
//  625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
??TIM2_OC2PreloadConfig_0:
        BRES      L:0x5306, #0x3
//  626     }
//  627 }
        RET
//  628 
//  629 
//  630 /**
//  631   * @brief  Enables or disables the TIM2 peripheral Preload Register on CCR3.
//  632   * @param   NewState new state of the Capture Compare Preload register.
//  633   * This parameter can be ENABLE or DISABLE.
//  634   * @retval None
//  635   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
//  637 {
//  638     /* Check the parameters */
//  639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  640 
//  641     /* Set or Reset the OC3PE Bit */
//  642     if (NewState != DISABLE)
TIM2_OC3PreloadConfig:
        TNZ       A
        JREQ      L:??TIM2_OC3PreloadConfig_0
//  643     {
//  644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
        BSET      L:0x5307, #0x3
        RET
//  645     }
//  646     else
//  647     {
//  648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
??TIM2_OC3PreloadConfig_0:
        BRES      L:0x5307, #0x3
//  649     }
//  650 }
        RET
//  651 
//  652 
//  653 /**
//  654   * @brief  Configures the TIM2 event to be generated by software.
//  655   * @param   TIM2_EventSource specifies the event source.
//  656   * This parameter can be one of the following values:
//  657   *                       - TIM2_EVENTSOURCE_UPDATE: TIM2 update Event source
//  658   *                       - TIM2_EVENTSOURCE_CC1: TIM2 Capture Compare 1 Event source
//  659   *                       - TIM2_EVENTSOURCE_CC2: TIM2 Capture Compare 2 Event source
//  660   *                       - TIM2_EVENTSOURCE_CC3: TIM2 Capture Compare 3 Event source
//  661   * @retval None
//  662   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
//  664 {
//  665     /* Check the parameters */
//  666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
//  667 
//  668     /* Set the event sources */
//  669     TIM2->EGR = (uint8_t)TIM2_EventSource;
TIM2_GenerateEvent:
        LD        L:0x5304, A
//  670 }
        RET
//  671 
//  672 
//  673 /**
//  674   * @brief  Configures the TIM2 Channel 1 polarity.
//  675   * @param   TIM2_OCPolarity specifies the OC1 Polarity.
//  676   * This parameter can be one of the following values:
//  677   *                       - TIM2_OCPOLARITY_LOW: Output Compare active low
//  678   *                       - TIM2_OCPOLARITY_HIGH: Output Compare active high
//  679   * @retval None
//  680   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  682 {
//  683     /* Check the parameters */
//  684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
//  685 
//  686     /* Set or Reset the CC1P Bit */
//  687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
TIM2_OC1PolarityConfig:
        TNZ       A
        JREQ      L:??TIM2_OC1PolarityConfig_0
//  688     {
//  689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
        BSET      L:0x5308, #0x1
        RET
//  690     }
//  691     else
//  692     {
//  693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
??TIM2_OC1PolarityConfig_0:
        BRES      L:0x5308, #0x1
//  694     }
//  695 }
        RET
//  696 
//  697 
//  698 /**
//  699   * @brief  Configures the TIM2 Channel 2 polarity.
//  700   * @param   TIM2_OCPolarity specifies the OC2 Polarity.
//  701   * This parameter can be one of the following values:
//  702   *                       - TIM2_OCPOLARITY_LOW: Output Compare active low
//  703   *                       - TIM2_OCPOLARITY_HIGH: Output Compare active high
//  704   * @retval None
//  705   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  707 {
//  708     /* Check the parameters */
//  709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
//  710 
//  711     /* Set or Reset the CC2P Bit */
//  712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
TIM2_OC2PolarityConfig:
        TNZ       A
        JREQ      L:??TIM2_OC2PolarityConfig_0
//  713     {
//  714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
        BSET      L:0x5308, #0x5
        RET
//  715     }
//  716     else
//  717     {
//  718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
??TIM2_OC2PolarityConfig_0:
        BRES      L:0x5308, #0x5
//  719     }
//  720 }
        RET
//  721 
//  722 
//  723 /**
//  724   * @brief  Configures the TIM2 Channel 3 polarity.
//  725   * @param   TIM2_OCPolarity specifies the OC3 Polarity.
//  726   * This parameter can be one of the following values:
//  727   *                       - TIM2_OCPOLARITY_LOW: Output Compare active low
//  728   *                       - TIM2_OCPOLARITY_HIGH: Output Compare active high
//  729   * @retval None
//  730   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  732 {
//  733     /* Check the parameters */
//  734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
//  735 
//  736     /* Set or Reset the CC3P Bit */
//  737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
TIM2_OC3PolarityConfig:
        TNZ       A
        JREQ      L:??TIM2_OC3PolarityConfig_0
//  738     {
//  739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
        BSET      L:0x5309, #0x1
        RET
//  740     }
//  741     else
//  742     {
//  743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
??TIM2_OC3PolarityConfig_0:
        BRES      L:0x5309, #0x1
//  744     }
//  745 }
        RET
//  746 
//  747 
//  748 /**
//  749   * @brief  Enables or disables the TIM2 Capture Compare Channel x.
//  750   * @param   TIM2_Channel specifies the TIM2 Channel.
//  751   * This parameter can be one of the following values:
//  752   *                       - TIM2_CHANNEL_1: TIM2 Channel1
//  753   *                       - TIM2_CHANNEL_2: TIM2 Channel2
//  754   *                       - TIM2_CHANNEL_3: TIM2 Channel3
//  755   * @param   NewState specifies the TIM2 Channel CCxE bit new state.
//  756   * This parameter can be: ENABLE or DISABLE.
//  757   * @retval None
//  758   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
//  760 {
//  761     /* Check the parameters */
//  762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
//  763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  764 
//  765     if (TIM2_Channel == TIM2_CHANNEL_1)
TIM2_CCxCmd:
        TNZ       A
        JRNE      L:??TIM2_CCxCmd_0
//  766     {
//  767         /* Set or Reset the CC1E Bit */
//  768         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??TIM2_CCxCmd_1
//  769         {
//  770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
        BSET      L:0x5308, #0x0
        RET
//  771         }
//  772         else
//  773         {
//  774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
??TIM2_CCxCmd_1:
        BRES      L:0x5308, #0x0
        RET
//  775         }
//  776 
//  777     }
//  778     else if (TIM2_Channel == TIM2_CHANNEL_2)
??TIM2_CCxCmd_0:
        CP        A, #0x1
        JRNE      L:??TIM2_CCxCmd_2
//  779     {
//  780         /* Set or Reset the CC2E Bit */
//  781         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??TIM2_CCxCmd_3
//  782         {
//  783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
        BSET      L:0x5308, #0x4
        RET
//  784         }
//  785         else
//  786         {
//  787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
??TIM2_CCxCmd_3:
        BRES      L:0x5308, #0x4
        RET
//  788         }
//  789     }
//  790     else
//  791     {
//  792         /* Set or Reset the CC3E Bit */
//  793         if (NewState != DISABLE)
??TIM2_CCxCmd_2:
        TNZ       S:?b0
        JREQ      L:??TIM2_CCxCmd_4
//  794         {
//  795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
        BSET      L:0x5309, #0x0
        RET
//  796         }
//  797         else
//  798         {
//  799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
??TIM2_CCxCmd_4:
        BRES      L:0x5309, #0x0
//  800         }
//  801     }
//  802 }
        RET
//  803 
//  804 /**
//  805   * @brief  Selects the TIM2 Output Compare Mode. This function disables the
//  806   * selected channel before changing the Output Compare Mode. User has to
//  807   * enable this channel using TIM2_CCxCmd and TIM2_CCxNCmd functions.
//  808   * @param   TIM2_Channel specifies the TIM2 Channel.
//  809   * This parameter can be one of the following values:
//  810   *                       - TIM2_CHANNEL_1: TIM2 Channel1
//  811   *                       - TIM2_CHANNEL_2: TIM2 Channel2
//  812   *                       - TIM2_CHANNEL_3: TIM2 Channel3
//  813   * @param   TIM2_OCMode specifies the TIM2 Output Compare Mode.
//  814   * This paramter can be one of the following values:
//  815   *                       - TIM2_OCMODE_TIMING
//  816   *                       - TIM2_OCMODE_ACTIVE
//  817   *                       - TIM2_OCMODE_TOGGLE
//  818   *                       - TIM2_OCMODE_PWM1
//  819   *                       - TIM2_OCMODE_PWM2
//  820   *                       - TIM2_FORCEDACTION_ACTIVE
//  821   *                       - TIM2_FORCEDACTION_INACTIVE
//  822   * @retval None
//  823   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
//  825 {
//  826     /* Check the parameters */
//  827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
//  828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
//  829 
//  830     if (TIM2_Channel == TIM2_CHANNEL_1)
TIM2_SelectOCxM:
        TNZ       A
        JRNE      L:??TIM2_SelectOCxM_0
//  831     {
//  832         /* Disable the Channel 1: Reset the CCE Bit */
//  833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
        BRES      L:0x5308, #0x0
//  834 
//  835         /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
//  837                                | (uint8_t)TIM2_OCMode);
        CALL      L:?Subroutine11
//  838     }
??CrossCallReturnLabel_24:
        RET
//  839     else if (TIM2_Channel == TIM2_CHANNEL_2)
??TIM2_SelectOCxM_0:
        CP        A, #0x1
        JRNE      L:??TIM2_SelectOCxM_1
//  840     {
//  841         /* Disable the Channel 2: Reset the CCE Bit */
//  842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
        BRES      L:0x5308, #0x4
//  843 
//  844         /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
//  846                                 | (uint8_t)TIM2_OCMode);
        CALL      L:?Subroutine5
//  847     }
??CrossCallReturnLabel_12:
        RET
//  848     else
//  849     {
//  850         /* Disable the Channel 3: Reset the CCE Bit */
//  851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
??TIM2_SelectOCxM_1:
        BRES      L:0x5309, #0x0
//  852 
//  853         /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
//  855                                 | (uint8_t)TIM2_OCMode);
        CALL      L:?Subroutine3
//  856     }
//  857 }
??CrossCallReturnLabel_8:
        RET
//  858 
//  859 
//  860 /**
//  861   * @brief  Sets the TIM2 Counter Register value.
//  862   * @param   Counter specifies the Counter register new value.
//  863   * This parameter is between 0x0000 and 0xFFFF.
//  864   * @retval None
//  865   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  866 void TIM2_SetCounter(uint16_t Counter)
//  867 {
TIM2_SetCounter:
        LDW       Y, X
//  868     /* Set the Counter Register value */
//  869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x530a, A
//  870     TIM2->CNTRL = (uint8_t)(Counter);
        LD        A, YL
        LD        L:0x530b, A
//  871 
//  872 }
        RET
//  873 
//  874 
//  875 /**
//  876   * @brief  Sets the TIM2 Autoreload Register value.
//  877   * @param   Autoreload specifies the Autoreload register new value.
//  878   * This parameter is between 0x0000 and 0xFFFF.
//  879   * @retval None
//  880   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  881 void TIM2_SetAutoreload(uint16_t Autoreload)
//  882 {
TIM2_SetAutoreload:
        LDW       Y, X
//  883 
//  884     /* Set the Autoreload Register value */
//  885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
        CALL      L:?Subroutine9
//  886     TIM2->ARRL = (uint8_t)(Autoreload);
//  887 
//  888 }
??CrossCallReturnLabel_20:
        RET
//  889 
//  890 
//  891 /**
//  892   * @brief  Sets the TIM2 Capture Compare1 Register value.
//  893   * @param   Compare1 specifies the Capture Compare1 register new value.
//  894   * This parameter is between 0x0000 and 0xFFFF.
//  895   * @retval None
//  896   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  897 void TIM2_SetCompare1(uint16_t Compare1)
//  898 {
TIM2_SetCompare1:
        LDW       Y, X
//  899     /* Set the Capture Compare1 Register value */
//  900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
        CALL      L:?Subroutine8
//  901     TIM2->CCR1L = (uint8_t)(Compare1);
//  902 
//  903 }
??CrossCallReturnLabel_18:
        RET
//  904 
//  905 
//  906 /**
//  907   * @brief  Sets the TIM2 Capture Compare2 Register value.
//  908   * @param   Compare2 specifies the Capture Compare2 register new value.
//  909   * This parameter is between 0x0000 and 0xFFFF.
//  910   * @retval None
//  911   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  912 void TIM2_SetCompare2(uint16_t Compare2)
//  913 {
TIM2_SetCompare2:
        LDW       Y, X
//  914     /* Set the Capture Compare2 Register value */
//  915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
        CALL      L:?Subroutine7
//  916     TIM2->CCR2L = (uint8_t)(Compare2);
//  917 
//  918 }
??CrossCallReturnLabel_16:
        RET
//  919 
//  920 
//  921 /**
//  922   * @brief  Sets the TIM2 Capture Compare3 Register value.
//  923   * @param   Compare3 specifies the Capture Compare3 register new value.
//  924   * This parameter is between 0x0000 and 0xFFFF.
//  925   * @retval None
//  926   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  927 void TIM2_SetCompare3(uint16_t Compare3)
//  928 {
TIM2_SetCompare3:
        LDW       Y, X
//  929     /* Set the Capture Compare3 Register value */
//  930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
        CALL      L:?Subroutine6
//  931     TIM2->CCR3L = (uint8_t)(Compare3);
//  932 
//  933 }
??CrossCallReturnLabel_14:
        RET
//  934 
//  935 
//  936 /**
//  937   * @brief  Sets the TIM2 Input Capture 1 Prescaler.
//  938   * @param   TIM2_IC1Prescaler specifies the Input Capture prescaler new value
//  939   * This parameter can be one of the following values:
//  940   *                       - TIM2_ICPSC_DIV1: no prescaler
//  941   *                       - TIM2_ICPSC_DIV2: capture is done once every 2 events
//  942   *                       - TIM2_ICPSC_DIV4: capture is done once every 4 events
//  943   *                       - TIM2_ICPSC_DIV8: capture is done once every 8 events
//  944   * @retval None
//  945   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
//  947 {
TIM2_SetIC1Prescaler:
        LD        S:?b0, A
//  948     /* Check the parameters */
//  949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
//  950 
//  951     /* Reset the IC1PSC Bits &Set the IC1PSC value */
//  952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
//  953                             | (uint8_t)TIM2_IC1Prescaler);
        LD        A, L:0x5305
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5305, A
//  954 }
        RET
//  955 
//  956 /**
//  957   * @brief  Sets the TIM2 Input Capture 2 prescaler.
//  958   * @param   TIM2_IC2Prescaler specifies the Input Capture prescaler new value
//  959   * This parameter can be one of the following values:
//  960   *                       - TIM2_ICPSC_DIV1: no prescaler
//  961   *                       - TIM2_ICPSC_DIV2: capture is done once every 2 events
//  962   *                       - TIM2_ICPSC_DIV4: capture is done once every 4 events
//  963   *                       - TIM2_ICPSC_DIV8: capture is done once every 8 events
//  964   * @retval None
//  965   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
//  967 {
TIM2_SetIC2Prescaler:
        LD        S:?b0, A
//  968     /* Check the parameters */
//  969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
//  970 
//  971     /* Reset the IC1PSC Bits &Set the IC1PSC value */
//  972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
//  973                             | (uint8_t)TIM2_IC2Prescaler);
        LD        A, L:0x5306
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5306, A
//  974 }
        RET
//  975 
//  976 /**
//  977   * @brief  Sets the TIM2 Input Capture 3 prescaler.
//  978   * @param   TIM2_IC3Prescaler specifies the Input Capture prescaler new value
//  979   * This parameter can be one of the following values:
//  980   *                       - TIM2_ICPSC_DIV1: no prescaler
//  981   *                       - TIM2_ICPSC_DIV2: capture is done once every 2 events
//  982   *                       - TIM2_ICPSC_DIV4: capture is done once every 4 events
//  983   *                       - TIM2_ICPSC_DIV8: capture is done once every 8 events
//  984   * @retval None
//  985   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
//  987 {
TIM2_SetIC3Prescaler:
        LD        S:?b0, A
//  988 
//  989     /* Check the parameters */
//  990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
//  991     /* Reset the IC1PSC Bits &Set the IC1PSC value */
//  992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
//  993                             | (uint8_t)TIM2_IC3Prescaler);
        LD        A, L:0x5307
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5307, A
//  994 }
        RET
//  995 
//  996 /**
//  997   * @brief  Gets the TIM2 Input Capture 1 value.
//  998   * @param  None
//  999   * @retval Capture Compare 1 Register value.
// 1000   */

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
// 1001 uint16_t TIM2_GetCapture1(void)
// 1002 {
// 1003     /* Get the Capture 1 Register value */
// 1004     uint16_t tmpccr1 = 0;
// 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
// 1006 
// 1007     tmpccr1h = TIM2->CCR1H;
TIM2_GetCapture1:
        LD        A, L:0x530f
        LD        S:?b1, A
// 1008     tmpccr1l = TIM2->CCR1L;
        LD        A, L:0x5310
        CALL      L:?Subroutine0
// 1009 
// 1010     tmpccr1 = (uint16_t)(tmpccr1l);
// 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
// 1012     /* Get the Capture 1 Register value */
// 1013     return (uint16_t)tmpccr1;
??CrossCallReturnLabel_2:
        RET
// 1014 }
// 1015 
// 1016 /**
// 1017   * @brief  Gets the TIM2 Input Capture 2 value.
// 1018   * @param  None
// 1019   * @retval Capture Compare 2 Register value.
// 1020   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1021 uint16_t TIM2_GetCapture2(void)
// 1022 {
// 1023     /* Get the Capture 2 Register value */
// 1024     uint16_t tmpccr2 = 0;
// 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
// 1026 
// 1027     tmpccr2h = TIM2->CCR2H;
TIM2_GetCapture2:
        LD        A, L:0x5311
        LD        S:?b1, A
// 1028     tmpccr2l = TIM2->CCR2L;
        LD        A, L:0x5312
        CALL      L:?Subroutine0
// 1029 
// 1030     tmpccr2 = (uint16_t)(tmpccr2l);
// 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
// 1032     /* Get the Capture 2 Register value */
// 1033     return (uint16_t)tmpccr2;
??CrossCallReturnLabel_1:
        RET
// 1034 }
// 1035 
// 1036 /**
// 1037   * @brief  Gets the TIM2 Input Capture 3 value.
// 1038   * @param  None
// 1039   * @retval Capture Compare 3 Register value.
// 1040   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1041 uint16_t TIM2_GetCapture3(void)
// 1042 {
// 1043     /* Get the Capture 3 Register value */
// 1044     uint16_t tmpccr3 = 0;
// 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
// 1046 
// 1047     tmpccr3h = TIM2->CCR3H;
TIM2_GetCapture3:
        LD        A, L:0x5313
        LD        S:?b1, A
// 1048     tmpccr3l = TIM2->CCR3L;
        LD        A, L:0x5314
        CALL      L:?Subroutine0
// 1049 
// 1050     tmpccr3 = (uint16_t)(tmpccr3l);
// 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
// 1052     /* Get the Capture 3 Register value */
// 1053     return (uint16_t)tmpccr3;
??CrossCallReturnLabel_0:
        RET
// 1054 }
// 1055 
// 1056 /**
// 1057   * @brief  Gets the TIM2 Counter value.
// 1058   * @param  None
// 1059   * @retval Counter Register value.
// 1060   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1061 uint16_t TIM2_GetCounter(void)
// 1062 {
// 1063      uint16_t tmpcntr = 0;
// 1064      
// 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
TIM2_GetCounter:
        LD        A, L:0x530a
// 1066     /* Get the Counter Register value */
// 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LD        A, L:0x530b
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
        RET
// 1068 }
// 1069 
// 1070 
// 1071 /**
// 1072   * @brief  Gets the TIM2 Prescaler value.
// 1073   * @param  None
// 1074   * @retval Prescaler Register configuration value  @ref TIM2_Prescaler_TypeDef.
// 1075   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
// 1077 {
// 1078     /* Get the Prescaler Register value */
// 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
TIM2_GetPrescaler:
        LD        A, L:0x530c
        RET
// 1080 }
// 1081 
// 1082 
// 1083 /**
// 1084   * @brief  Checks whether the specified TIM2 flag is set or not.
// 1085   * @param   TIM2_FLAG specifies the flag to check.
// 1086   * This parameter can be one of the following values:
// 1087   *                       - TIM2_FLAG_UPDATE: TIM2 update Flag
// 1088   *                       - TIM2_FLAG_CC1: TIM2 Capture Compare 1 Flag
// 1089   *                       - TIM2_FLAG_CC2: TIM2 Capture Compare 2 Flag
// 1090   *                       - TIM2_FLAG_CC3: TIM2 Capture Compare 3 Flag
// 1091   *                       - TIM2_FLAG_CC1OF: TIM2 Capture Compare 1 over capture Flag
// 1092   *                       - TIM2_FLAG_CC2OF: TIM2 Capture Compare 2 over capture Flag
// 1093   *                       - TIM2_FLAG_CC3OF: TIM2 Capture Compare 3 over capture Flag
// 1094   * @retval FlagStatus The new state of TIM2_FLAG (SET or RESET).
// 1095   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
// 1097 {
TIM2_GetFlagStatus:
        LDW       Y, X
// 1098     FlagStatus bitstatus = RESET;
// 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
// 1100 
// 1101     /* Check the parameters */
// 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
// 1103 
// 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
        LD        A, L:0x5302
        LD        S:?b1, A
// 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
// 1106 
// 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
        CLR       A
        RRWA      X, A
        LD        A, XL
        AND       A, L:0x5303
        PUSH      A
        LD        A, YL
        AND       A, S:?b1
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        JREQ      L:??TIM2_GetFlagStatus_0
// 1108     {
// 1109         bitstatus = SET;
        LD        A, #0x1
        RET
// 1110     }
// 1111     else
// 1112     {
// 1113         bitstatus = RESET;
??TIM2_GetFlagStatus_0:
        CLR       A
// 1114     }
// 1115     return (FlagStatus)bitstatus;
        RET
// 1116 }
// 1117 
// 1118 
// 1119 /**
// 1120   * @brief  Clears the TIM2’s pending flags.
// 1121   * @param   TIM2_FLAG specifies the flag to clear.
// 1122   * This parameter can be one of the following values:
// 1123   *                       - TIM2_FLAG_UPDATE: TIM2 update Flag
// 1124   *                       - TIM2_FLAG_CC1: TIM2 Capture Compare 1 Flag
// 1125   *                       - TIM2_FLAG_CC2: TIM2 Capture Compare 2 Flag
// 1126   *                       - TIM2_FLAG_CC3: TIM2 Capture Compare 3 Flag
// 1127   *                       - TIM2_FLAG_CC1OF: TIM2 Capture Compare 1 over capture Flag
// 1128   *                       - TIM2_FLAG_CC2OF: TIM2 Capture Compare 2 over capture Flag
// 1129   *                       - TIM2_FLAG_CC3OF: TIM2 Capture Compare 3 over capture Flag
// 1130   * @retval None.
// 1131   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
// 1133 {
// 1134     /* Check the parameters */
// 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
// 1136 
// 1137     /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
// 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
TIM2_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x5302, A
// 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
        MOV       L:0x5303, #0xff
// 1140 }
        RET
// 1141 
// 1142 
// 1143 /**
// 1144   * @brief  Checks whether the TIM2 interrupt has occurred or not.
// 1145   * @param   TIM2_IT specifies the TIM2 interrupt source to check.
// 1146   * This parameter can be one of the following values:
// 1147   *                       - TIM2_IT_UPDATE: TIM2 update Interrupt source
// 1148   *                       - TIM2_IT_CC1: TIM2 Capture Compare 1 Interrupt source
// 1149   *                       - TIM2_IT_CC2: TIM2 Capture Compare 2 Interrupt source
// 1150   *                       - TIM2_IT_CC3: TIM2 Capture Compare 3 Interrupt source
// 1151   * @retval ITStatus The new state of the TIM2_IT(SET or RESET).
// 1152   */
// 1153 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
// 1155 {
TIM2_GetITStatus:
        LD        S:?b0, A
// 1156     ITStatus bitstatus = RESET;
// 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
// 1158 
// 1159     /* Check the parameters */
// 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
// 1161 
// 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
        LD        A, L:0x5302
        LD        S:?b2, A
// 1163 
// 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
        LD        A, S:?b0
        AND       A, L:0x5301
        LD        S:?b1, A
// 1165 
// 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
        LD        A, S:?b0
        BCP       A, S:?b2
        JREQ      L:??TIM2_GetITStatus_0
        TNZ       S:?b1
        JREQ      L:??TIM2_GetITStatus_0
// 1167     {
// 1168         bitstatus = SET;
        LD        A, #0x1
        RET
// 1169     }
// 1170     else
// 1171     {
// 1172         bitstatus = RESET;
??TIM2_GetITStatus_0:
        CLR       A
// 1173     }
// 1174     return (ITStatus)(bitstatus);
        RET
// 1175 }
// 1176 
// 1177 
// 1178 /**
// 1179   * @brief  Clears the TIM2's interrupt pending bits.
// 1180   * @param   TIM2_IT specifies the pending bit to clear.
// 1181   * This parameter can be one of the following values:
// 1182   *                       - TIM2_IT_UPDATE: TIM2 update Interrupt source
// 1183   *                       - TIM2_IT_CC1: TIM2 Capture Compare 1 Interrupt source
// 1184   *                       - TIM2_IT_CC2: TIM2 Capture Compare 2 Interrupt source
// 1185   *                       - TIM2_IT_CC3: TIM2 Capture Compare 3 Interrupt source
// 1186   * @retval None.
// 1187   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
// 1189 {
// 1190     /* Check the parameters */
// 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
// 1192 
// 1193     /* Clear the IT pending Bit */
// 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
TIM2_ClearITPendingBit:
        CPL       A
        LD        L:0x5302, A
// 1195 }
        RET
// 1196 
// 1197 
// 1198 /**
// 1199   * @brief  Configure the TI1 as Input.
// 1200   * @param   TIM2_ICPolarity  The Input Polarity.
// 1201   * This parameter can be one of the following values:
// 1202   *                       - TIM2_ICPOLARITY_FALLING
// 1203   *                       - TIM2_ICPOLARITY_RISING
// 1204   * @param   TIM2_ICSelection specifies the input to be used.
// 1205   * This parameter can be one of the following values:
// 1206   *                       - TIM2_ICSELECTION_DIRECTTI: TIM2 Input 1 is selected to
// 1207   *                         be connected to IC1.
// 1208   *                       - TIM2_ICSELECTION_INDIRECTTI: TIM2 Input 1 is selected to
// 1209   *                         be connected to IC2.
// 1210   * @param   TIM2_ICFilter Specifies the Input Capture Filter.
// 1211   * This parameter must be a value between 0x00 and 0x0F.
// 1212   * @retval None
// 1213   */

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
// 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
// 1215                        uint8_t TIM2_ICSelection,
// 1216                        uint8_t TIM2_ICFilter)
// 1217 {
TI1_Config:
        LD        S:?b2, A
// 1218     /* Disable the Channel 1: Reset the CCE Bit */
// 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
        BRES      L:0x5308, #0x0
// 1220 
// 1221     /* Select the Input and set the filter */
// 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
// 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
        LD        A, L:0x5305
        CALL      L:?Subroutine1
??CrossCallReturnLabel_5:
        LD        L:0x5305, A
// 1224 
// 1225     /* Select the Polarity */
// 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI1_Config_0
// 1227     {
// 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
        BSET      L:0x5308, #0x1
        JRA       L:??TI1_Config_1
// 1229     }
// 1230     else
// 1231     {
// 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
??TI1_Config_0:
        BRES      L:0x5308, #0x1
// 1233     }
// 1234     /* Set the CCE Bit */
// 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
??TI1_Config_1:
        BSET      L:0x5308, #0x0
// 1236 }
        RET
// 1237 
// 1238 
// 1239 /**
// 1240   * @brief  Configure the TI2 as Input.
// 1241   * @param   TIM2_ICPolarity  The Input Polarity.
// 1242   * This parameter can be one of the following values:
// 1243   *                       - TIM2_ICPOLARITY_FALLING
// 1244   *                       - TIM2_ICPOLARITY_RISING
// 1245   * @param   TIM2_ICSelection specifies the input to be used.
// 1246   * This parameter can be one of the following values:
// 1247   *                       - TIM2_ICSELECTION_DIRECTTI: TIM2 Input 2 is selected to
// 1248   *                         be connected to IC2.
// 1249   *                       - TIM2_ICSELECTION_INDIRECTTI: TIM2 Input 2 is selected to
// 1250   *                         be connected to IC1.
// 1251   * @param   TIM2_ICFilter Specifies the Input Capture Filter.
// 1252   * This parameter must be a value between 0x00 and 0x0F.
// 1253   * @retval None
// 1254   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
// 1256                        uint8_t TIM2_ICSelection,
// 1257                        uint8_t TIM2_ICFilter)
// 1258 {
TI2_Config:
        LD        S:?b2, A
// 1259     /* Disable the Channel 2: Reset the CCE Bit */
// 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
        BRES      L:0x5308, #0x4
// 1261 
// 1262     /* Select the Input and set the filter */
// 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
// 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
        LD        A, L:0x5306
        CALL      L:?Subroutine1
??CrossCallReturnLabel_4:
        LD        L:0x5306, A
// 1265 
// 1266 
// 1267     /* Select the Polarity */
// 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI2_Config_0
// 1269     {
// 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
        BSET      L:0x5308, #0x5
        JRA       L:??TI2_Config_1
// 1271     }
// 1272     else
// 1273     {
// 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
??TI2_Config_0:
        BRES      L:0x5308, #0x5
// 1275     }
// 1276 
// 1277     /* Set the CCE Bit */
// 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
??TI2_Config_1:
        BSET      L:0x5308, #0x4
// 1279 
// 1280 }
        RET
// 1281 
// 1282 /**
// 1283   * @brief  Configure the TI3 as Input.
// 1284   * @param   TIM2_ICPolarity  The Input Polarity.
// 1285   * This parameter can be one of the following values:
// 1286   *                       - TIM2_ICPOLARITY_FALLING
// 1287   *                       - TIM2_ICPOLARITY_RISING
// 1288   * @param   TIM2_ICSelection specifies the input to be used.
// 1289   * This parameter can be one of the following values:
// 1290   *                       - TIM2_ICSELECTION_DIRECTTI: TIM2 Input 3 is selected to
// 1291   *                         be connected to IC3.
// 1292   * @param   TIM2_ICFilter Specifies the Input Capture Filter.
// 1293   * This parameter must be a value between 0x00 and 0x0F.
// 1294   * @retval None
// 1295   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
// 1297                        uint8_t TIM2_ICFilter)
// 1298 {
TI3_Config:
        LD        S:?b2, A
// 1299     /* Disable the Channel 3: Reset the CCE Bit */
// 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
        BRES      L:0x5309, #0x0
// 1301 
// 1302     /* Select the Input and set the filter */
// 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
// 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
        LD        A, L:0x5307
        CALL      L:?Subroutine1
??CrossCallReturnLabel_3:
        LD        L:0x5307, A
// 1305 
// 1306 
// 1307     /* Select the Polarity */
// 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI3_Config_0
// 1309     {
// 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
        BSET      L:0x5309, #0x1
        JRA       L:??TI3_Config_1
// 1311     }
// 1312     else
// 1313     {
// 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
??TI3_Config_0:
        BRES      L:0x5309, #0x1
// 1315     }
// 1316     /* Set the CCE Bit */
// 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
??TI3_Config_1:
        BSET      L:0x5309, #0x0
// 1318 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 1319 /**
// 1320   * @}
// 1321   */
// 1322   
// 1323   /**
// 1324   * @}
// 1325   */
// 1326 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 1 112 bytes in section .near_func.text
// 
// 1 112 bytes of CODE memory
//
//Errors: none
//Warnings: none
