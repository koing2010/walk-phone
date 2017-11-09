///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:32 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_adc2.c         /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_adc2.c -e -Oh  /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_adc2.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_adc2

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?sll16_x_x_6
        EXTERN ?sll16_x_x_a
        EXTERN ?w0
        EXTERN ?w1

        PUBLIC ADC2_ClearFlag
        PUBLIC ADC2_ClearITPendingBit
        PUBLIC ADC2_Cmd
        PUBLIC ADC2_ConversionConfig
        PUBLIC ADC2_DeInit
        PUBLIC ADC2_ExternalTriggerConfig
        PUBLIC ADC2_GetConversionValue
        PUBLIC ADC2_GetFlagStatus
        PUBLIC ADC2_GetITStatus
        PUBLIC ADC2_ITConfig
        PUBLIC ADC2_Init
        PUBLIC ADC2_PrescalerConfig
        PUBLIC ADC2_SchmittTriggerConfig
        PUBLIC ADC2_StartConversion

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_adc2.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_adc2.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions/macros for the ADC2 peripheral.
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
//   23 #include "stm8s_adc2.h"
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
//   38   * @addtogroup ADC2_Public_Functions
//   39   * @{
//   40   */
//   41 
//   42 /**
//   43   * @brief  Deinitializes the ADC2 peripheral registers to their default reset
//   44   * values.
//   45   * @param  None
//   46   * @retval None
//   47   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   48 void ADC2_DeInit(void)
//   49 {
//   50     ADC2->CSR  = ADC2_CSR_RESET_VALUE;
ADC2_DeInit:
        CLR       L:0x5400
//   51     ADC2->CR1  = ADC2_CR1_RESET_VALUE;
        CLR       L:0x5401
//   52     ADC2->CR2  = ADC2_CR2_RESET_VALUE;
        CLR       L:0x5402
//   53     ADC2->TDRH = ADC2_TDRH_RESET_VALUE;
        CLR       L:0x5406
//   54     ADC2->TDRL = ADC2_TDRL_RESET_VALUE;
        CLR       L:0x5407
//   55 }
        RET
//   56 
//   57 /**
//   58   * @brief  Initializes the ADC2 peripheral according to the specified parameters
//   59   * @param   ADC2_ConversionMode: specifies the conversion mode
//   60   * can be one of the values of @ref ADC2_ConvMode_TypeDef.
//   61   * @param   ADC2_Channel: specifies the channel to convert
//   62   * can be one of the values of @ref ADC2_Channel_TypeDef.
//   63   * @param   ADC2_PrescalerSelection: specifies the ADC2 prescaler
//   64   * can be one of the values of @ref ADC2_PresSel_TypeDef.
//   65   * @param   ADC2_ExtTrigger: specifies the external trigger
//   66   * can be one of the values of @ref ADC2_ExtTrig_TypeDef.
//   67   * @param   ADC2_ExtTriggerState: specifies the external trigger new state
//   68   * can be one of the values of @ref FunctionalState.
//   69   * @param   ADC2_Align: specifies the converted data alignment
//   70   * can be one of the values of @ref ADC2_Align_TypeDef.
//   71   * @param   ADC2_SchmittTriggerChannel: specifies the schmitt trigger channel
//   72   * can be one of the values of @ref ADC2_SchmittTrigg_TypeDef.
//   73   * @param   ADC2_SchmittTriggerState: specifies the schmitt trigger state
//   74   * can be one of the values of @ref FunctionalState.
//   75   * @retval None
//   76   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   77 void ADC2_Init(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_PresSel_TypeDef ADC2_PrescalerSelection, ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTriggerState, ADC2_Align_TypeDef ADC2_Align, ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
//   78 {
ADC2_Init:
        PUSH      S:?b8
        MOV       S:?b7, S:?b1
        MOV       S:?b8, S:?b2
        MOV       S:?b1, S:?b4
//   79 
//   80     /* Check the parameters */
//   81     assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
//   82     assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
//   83     assert_param(IS_ADC2_PRESSEL_OK(ADC2_PrescalerSelection));
//   84     assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
//   85     assert_param(IS_FUNCTIONALSTATE_OK(((ADC2_ExtTriggerState))));
//   86     assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
//   87     assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
//   88     assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));
//   89 
//   90     /*-----------------CR1 & CSR configuration --------------------*/
//   91     /* Configure the conversion mode and the channel to convert
//   92     respectively according to ADC2_ConversionMode & ADC2_Channel values  &  ADC2_Align values */
//   93     ADC2_ConversionConfig(ADC2_ConversionMode, ADC2_Channel, ADC2_Align);
        CALL      L:ADC2_ConversionConfig
//   94     /* Select the prescaler division factor according to ADC2_PrescalerSelection values */
//   95     ADC2_PrescalerConfig(ADC2_PrescalerSelection);
        LD        A, S:?b7
        CALL      L:ADC2_PrescalerConfig
//   96 
//   97     /*-----------------CR2 configuration --------------------*/
//   98     /* Configure the external trigger state and event respectively
//   99     according to ADC2_ExtTrigStatus, ADC2_ExtTrigger */
//  100     ADC2_ExternalTriggerConfig(ADC2_ExtTrigger, ADC2_ExtTriggerState);
        MOV       S:?b0, S:?b3
        LD        A, S:?b8
        CALL      L:ADC2_ExternalTriggerConfig
//  101 
//  102     /*------------------TDR configuration ---------------------------*/
//  103     /* Configure the schmitt trigger channel and state respectively
//  104     according to ADC2_SchmittTriggerChannel & ADC2_SchmittTriggerNewState  values */
//  105     ADC2_SchmittTriggerConfig(ADC2_SchmittTriggerChannel, ADC2_SchmittTriggerState);
        MOV       S:?b0, S:?b6
        LD        A, S:?b5
        CALL      L:ADC2_SchmittTriggerConfig
//  106 
//  107     /* Enable the ADC2 peripheral */
//  108     ADC2->CR1 |= ADC2_CR1_ADON;
        BSET      L:0x5401, #0x0
//  109 
//  110 }
        POP       S:?b8
        RET
//  111 
//  112 
//  113 /**
//  114   * @brief  Enables or Disables the ADC2 peripheral.
//  115   * @param   NewState: specifies the peripheral enabled or disabled state.
//  116   * @retval None
//  117   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  118 void ADC2_Cmd(FunctionalState NewState)
//  119 {
//  120 
//  121     /* Check the parameters */
//  122     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  123 
//  124     if (NewState != DISABLE)
ADC2_Cmd:
        TNZ       A
        JREQ      L:??ADC2_Cmd_0
//  125     {
//  126         ADC2->CR1 |= ADC2_CR1_ADON;
        BSET      L:0x5401, #0x0
        RET
//  127     }
//  128     else /* NewState == DISABLE */
//  129     {
//  130         ADC2->CR1 &= (uint8_t)(~ADC2_CR1_ADON);
??ADC2_Cmd_0:
        BRES      L:0x5401, #0x0
//  131     }
//  132 
//  133 }
        RET
//  134 
//  135 /**
//  136   * @brief  Enables or disables the ADC2 interrupt.
//  137   * @param   NewState specifies the state of ADC2 interrupt.
//  138   * @retval None
//  139   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  140 void ADC2_ITConfig(FunctionalState NewState)
//  141 {
//  142 
//  143     /* Check the parameters */
//  144     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  145 
//  146     if (NewState != DISABLE)
ADC2_ITConfig:
        TNZ       A
        JREQ      L:??ADC2_ITConfig_0
//  147     {
//  148         /* Enable the ADC2 interrupts */
//  149         ADC2->CSR |= (uint8_t)ADC2_CSR_EOCIE;
        BSET      L:0x5400, #0x5
        RET
//  150     }
//  151     else  /*NewState == DISABLE */
//  152     {
//  153         /* Disable the ADC2 interrupts */
//  154         ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOCIE);
??ADC2_ITConfig_0:
        BRES      L:0x5400, #0x5
//  155     }
//  156 
//  157 }
        RET
//  158 
//  159 /**
//  160   * @brief  Configure the ADC2 prescaler division factor.
//  161   * @param   ADC2_Prescaler: the selected prescaler.
//  162   * It can be one of the values of @ref ADC2_PresSel_TypeDef.
//  163   * @retval None
//  164   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  165 void ADC2_PrescalerConfig(ADC2_PresSel_TypeDef ADC2_Prescaler)
//  166 {
ADC2_PrescalerConfig:
        LD        S:?b0, A
//  167 
//  168     /* Check the parameter */
//  169     assert_param(IS_ADC2_PRESSEL_OK(ADC2_Prescaler));
//  170 
//  171     /* Clear the SPSEL bits */
//  172     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_SPSEL);
        LD        A, L:0x5401
        AND       A, #0x8f
        LD        L:0x5401, A
//  173     /* Select the prescaler division factor according to ADC2_PrescalerSelection values */
//  174     ADC2->CR1 |= (uint8_t)(ADC2_Prescaler);
        LD        A, S:?b0
        OR        A, L:0x5401
        LD        L:0x5401, A
//  175 
//  176 }
        RET
//  177 
//  178 
//  179 /**
//  180   * @brief  Enables or disables the ADC2 Schmitt Trigger on a selected channel.
//  181   * @param   ADC2_SchmittTriggerChannel specifies the desired Channel.
//  182   * It can be set of the values of @ref ADC2_SchmittTrigg_TypeDef.
//  183   * @param   NewState specifies the Channel  ADC2 Schmitt Trigger new status.
//  184   * can have one of the values of @ref FunctionalState.
//  185   * @retval None
//  186   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  187 void ADC2_SchmittTriggerConfig(ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState NewState)
//  188 {
//  189 
//  190     /* Check the parameters */
//  191     assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
//  192     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  193 
//  194     if (ADC2_SchmittTriggerChannel == ADC2_SCHMITTTRIG_ALL)
ADC2_SchmittTriggerConfig:
        CP        A, #0x1f
        JRNE      L:??ADC2_SchmittTriggerConfig_0
//  195     {
//  196         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??ADC2_SchmittTriggerConfig_1
//  197         {
//  198             ADC2->TDRL &= (uint8_t)0x0;
        LD        A, L:0x5407
        CLR       L:0x5407
//  199             ADC2->TDRH &= (uint8_t)0x0;
        LD        A, L:0x5406
        CLR       L:0x5406
        RET
//  200         }
//  201         else /* NewState == DISABLE */
//  202         {
//  203             ADC2->TDRL |= (uint8_t)0xFF;
??ADC2_SchmittTriggerConfig_1:
        LD        A, L:0x5407
        MOV       L:0x5407, #0xff
//  204             ADC2->TDRH |= (uint8_t)0xFF;
        LD        A, L:0x5406
        MOV       L:0x5406, #0xff
        RET
//  205         }
//  206     }
//  207     else if (ADC2_SchmittTriggerChannel < ADC2_SCHMITTTRIG_CHANNEL8)
??ADC2_SchmittTriggerConfig_0:
        CP        A, #0x8
        JRNC      L:??ADC2_SchmittTriggerConfig_2
        CALL      L:?Subroutine0
??CrossCallReturnLabel_0:
        JREQ      L:??ADC2_SchmittTriggerConfig_3
//  208     {
//  209         if (NewState != DISABLE)
//  210         {
//  211             ADC2->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel));
        CPL       A
        AND       A, L:0x5407
??ADC2_SchmittTriggerConfig_4:
        LD        L:0x5407, A
        RET
//  212         }
//  213         else /* NewState == DISABLE */
//  214         {
//  215             ADC2->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel);
??ADC2_SchmittTriggerConfig_3:
        OR        A, L:0x5407
        JRA       L:??ADC2_SchmittTriggerConfig_4
//  216         }
//  217     }
//  218     else /* ADC2_SchmittTriggerChannel >= ADC2_SCHMITTTRIG_CHANNEL8 */
//  219     {
//  220         if (NewState != DISABLE)
??ADC2_SchmittTriggerConfig_2:
        ADD       A, #0xf8
        CALL      L:?Subroutine0
??CrossCallReturnLabel_1:
        JREQ      L:??ADC2_SchmittTriggerConfig_5
//  221         {
//  222             ADC2->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8)));
        CPL       A
        AND       A, L:0x5406
        JRA       L:??ADC2_SchmittTriggerConfig_6
//  223         }
//  224         else /* NewState == DISABLE */
//  225         {
//  226             ADC2->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8));
??ADC2_SchmittTriggerConfig_5:
        OR        A, L:0x5406
??ADC2_SchmittTriggerConfig_6:
        LD        L:0x5406, A
//  227         }
//  228     }
//  229 
//  230 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        TNZ       S:?b0
        RET
//  231 
//  232 /**
//  233   * @brief  Configure the ADC2 conversion on selected channel.
//  234   * @param   ADC2_ConversionMode Specifies the conversion type.
//  235   * It can be set of the values of @ref ADC2_ConvMode_TypeDef
//  236   * @param   ADC2_Channel specifies the ADC2 Channel.
//  237   * It can be set of the values of @ref ADC2_Channel_TypeDef
//  238   * @param   ADC2_Align specifies the converted data alignment.
//  239   * It can be set of the values of @ref ADC2_Align_TypeDef
//  240   * @retval None
//  241   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  242 void ADC2_ConversionConfig(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_Align_TypeDef ADC2_Align)
//  243 {
ADC2_ConversionConfig:
        LD        S:?b2, A
        LD        A, S:?b1
//  244 
//  245     /* Check the parameters */
//  246     assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
//  247     assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
//  248     assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
//  249 
//  250     /* Clear the align bit */
//  251     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_ALIGN);
        BRES      L:0x5402, #0x3
//  252     /* Configure the data alignment */
//  253     ADC2->CR2 |= (uint8_t)(ADC2_Align);
        OR        A, L:0x5402
        LD        L:0x5402, A
//  254 
//  255     if (ADC2_ConversionMode == ADC2_CONVERSIONMODE_CONTINUOUS)
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??ADC2_ConversionConfig_0
//  256     {
//  257         /* Set the continuous conversion mode */
//  258         ADC2->CR1 |= ADC2_CR1_CONT;
        BSET      L:0x5401, #0x1
        JRA       L:??ADC2_ConversionConfig_1
//  259     }
//  260     else /* ADC2_ConversionMode == ADC2_CONVERSIONMODE_SINGLE */
//  261     {
//  262         /* Set the single conversion mode */
//  263         ADC2->CR1 &= (uint8_t)(~ADC2_CR1_CONT);
??ADC2_ConversionConfig_0:
        BRES      L:0x5401, #0x1
//  264     }
//  265 
//  266     /* Clear the ADC2 channels */
//  267     ADC2->CSR &= (uint8_t)(~ADC2_CSR_CH);
??ADC2_ConversionConfig_1:
        LD        A, L:0x5400
        AND       A, #0xf0
        LD        L:0x5400, A
//  268     /* Select the ADC2 channel */
//  269     ADC2->CSR |= (uint8_t)(ADC2_Channel);
        LD        A, S:?b0
        OR        A, L:0x5400
        LD        L:0x5400, A
//  270 
//  271 }
        RET
//  272 
//  273 
//  274 /**
//  275   * @brief  Configure the ADC2 conversion on external trigger event.
//  276   * @par Full description:
//  277   * The selected external trigger event can be enabled or disabled.
//  278   * @param   ADC2_ExtTrigger to select the External trigger event.
//  279   * can have one of the values of @ref ADC2_ExtTrig_TypeDef.
//  280   * @param   NewState to enable/disable the selected external trigger
//  281   * can have one of the values of @ref FunctionalState.
//  282   * @retval None
//  283   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  284 void ADC2_ExternalTriggerConfig(ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState NewState)
//  285 {
ADC2_ExternalTriggerConfig:
        LD        S:?b1, A
//  286 
//  287     /* Check the parameters */
//  288     assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
//  289     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  290 
//  291     /* Clear the external trigger selection bits */
//  292     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTSEL);
        LD        A, L:0x5402
        AND       A, #0xcf
        LD        L:0x5402, A
//  293 
//  294     if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??ADC2_ExternalTriggerConfig_0
//  295     {
//  296         /* Enable the selected external Trigger */
//  297         ADC2->CR2 |= (uint8_t)(ADC2_CR2_EXTTRIG);
        BSET      L:0x5402, #0x6
        JRA       L:??ADC2_ExternalTriggerConfig_1
//  298     }
//  299     else /* NewState == DISABLE */
//  300     {
//  301         /* Disable the selected external trigger */
//  302         ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTTRIG);
??ADC2_ExternalTriggerConfig_0:
        BRES      L:0x5402, #0x6
//  303     }
//  304 
//  305     /* Set the slected external trigger */
//  306     ADC2->CR2 |= (uint8_t)(ADC2_ExtTrigger);
??ADC2_ExternalTriggerConfig_1:
        LD        A, S:?b1
        OR        A, L:0x5402
        LD        L:0x5402, A
//  307 
//  308 }
        RET
//  309 
//  310 
//  311 /**
//  312   * @brief  Start ADC2 conversion
//  313   * @par Full description:
//  314   * This function  triggers the start of conversion, after ADC2 configuration.
//  315   * @param  None
//  316   * @retval None
//  317   * @par Required preconditions:
//  318   * Enable the ADC2 peripheral before calling this function
//  319   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  320 void ADC2_StartConversion(void)
//  321 {
//  322     ADC2->CR1 |= ADC2_CR1_ADON;
ADC2_StartConversion:
        BSET      L:0x5401, #0x0
//  323 }
        RET
//  324 
//  325 /**
//  326   * @brief  Get one sample of measured signal.
//  327   * @param  None
//  328   * @retval ConversionValue:  value of the measured signal.
//  329   * @par Required preconditions:
//  330   * ADC2 conversion finished.
//  331   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  332 uint16_t ADC2_GetConversionValue(void)
//  333 {
//  334 
//  335     uint16_t temph = 0;
//  336     uint8_t templ = 0;
//  337 
//  338     if ((ADC2->CR2 & ADC2_CR2_ALIGN) != 0) /* Right alignment */
ADC2_GetConversionValue:
        BTJF      L:0x5402, #0x3, L:??ADC2_GetConversionValue_0
//  339     {
//  340         /* Read LSB first */
//  341         templ = ADC2->DRL;
        LD        A, L:0x5405
        LD        S:?b0, A
//  342         /* Then read MSB */
//  343         temph = ADC2->DRH;
        LD        A, L:0x5404
//  344 
//  345         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        CLRW      Y
        LD        A, S:?b0
        EXG       A, YL
        LDW       S:?w0, X
        LDW       X, Y
        RLWA      X, A
        OR        A, S:?b0
        JRA       L:??ADC2_GetConversionValue_1
//  346     }
//  347     else /* Left alignment */
//  348     {
//  349         /* Read MSB firts*/
//  350         temph = ADC2->DRH;
??ADC2_GetConversionValue_0:
        LD        A, L:0x5404
        LD        S:?b1, A
//  351         /* Then read LSB */
//  352         templ = ADC2->DRL;
        LD        A, L:0x5405
        LD        S:?b0, A
//  353 
//  354         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        CLR       A
        RLWA      X, A
        LDW       S:?w1, X
        CLRW      X
        LD        A, S:?b0
        EXG       A, XL
        CALL      L:?sll16_x_x_6
        RLWA      X, A
        OR        A, S:?b2
??ADC2_GetConversionValue_1:
        RRWA      X, A
//  355     }
//  356 
//  357     return ((uint16_t)temph);
        RET
//  358 
//  359 }
//  360 
//  361 /**
//  362   * @brief  Checks the ADC2 EOC flag status.
//  363   * @param  None
//  364   * @retval FlagStatus Status of the ADC2 EOC flag.
//  365   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  366 FlagStatus ADC2_GetFlagStatus(void)
//  367 {
//  368     /* Get EOC  flag status */
//  369     return (FlagStatus)(ADC2->CSR & ADC2_CSR_EOC);
ADC2_GetFlagStatus:
        LD        A, L:0x5400
        SLL       A
        CLR       A
        RLC       A
        RET
//  370 
//  371 }
//  372 
//  373 /**
//  374   * @brief  Clear the ADC2 EOC Flag.
//  375   * @param  None
//  376   * @retval None
//  377   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  378 void ADC2_ClearFlag(void)
//  379 {
//  380     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
ADC2_ClearFlag:
        BRES      L:0x5400, #0x7
//  381 }
        RET
//  382 
//  383 /**
//  384   * @brief  Returns the EOC  pending bit status
//  385  * @par Parameters:
//  386   * None
//  387   * @retval FlagStatus: status of the EOC pending bit.
//  388   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  389 ITStatus ADC2_GetITStatus(void)
//  390 {
//  391     return (ITStatus)(ADC2->CSR & ADC2_CSR_EOC);
ADC2_GetITStatus:
        LD        A, L:0x5400
        SLL       A
        CLR       A
        RLC       A
        RET
//  392 }
//  393 
//  394 /**
//  395   * @brief  Clear the ADC2 End of Conversion pending bit.
//  396   * @param  None
//  397   * @retval None
//  398   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  399 void ADC2_ClearITPendingBit(void)
//  400 {
//  401     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
ADC2_ClearITPendingBit:
        BRES      L:0x5400, #0x7
//  402 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  403 
//  404 /**
//  405   * @}
//  406   */
//  407   
//  408 /**
//  409   * @}
//  410   */
//  411   
//  412 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 369 bytes in section .near_func.text
// 
// 369 bytes of CODE memory
//
//Errors: none
//Warnings: none
