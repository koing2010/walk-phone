///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:33 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim4.c         /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim4.c -e -Oh  /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_tim4.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_tim4

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2

        PUBLIC TIM4_ARRPreloadConfig
        PUBLIC TIM4_ClearFlag
        PUBLIC TIM4_ClearITPendingBit
        PUBLIC TIM4_Cmd
        PUBLIC TIM4_DeInit
        PUBLIC TIM4_GenerateEvent
        PUBLIC TIM4_GetCounter
        PUBLIC TIM4_GetFlagStatus
        PUBLIC TIM4_GetITStatus
        PUBLIC TIM4_GetPrescaler
        PUBLIC TIM4_ITConfig
        PUBLIC TIM4_PrescalerConfig
        PUBLIC TIM4_SelectOnePulseMode
        PUBLIC TIM4_SetAutoreload
        PUBLIC TIM4_SetCounter
        PUBLIC TIM4_TimeBaseInit
        PUBLIC TIM4_UpdateDisableConfig
        PUBLIC TIM4_UpdateRequestConfig

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_tim4.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_tim4.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the TIM4 peripheral.
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
//   23 #include "stm8s_tim4.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 /**
//   34   * @addtogroup TIM4_Public_Functions
//   35   * @{
//   36   */
//   37 
//   38 /**
//   39   * @brief  Deinitializes the TIM4 peripheral registers to their default reset values.
//   40   * @param  None
//   41   * @retval None
//   42   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   43 void TIM4_DeInit(void)
//   44 {
//   45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
TIM4_DeInit:
        CLR       L:0x5340
//   46     TIM4->IER = TIM4_IER_RESET_VALUE;
        CLR       L:0x5341
//   47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
        CLR       L:0x5344
//   48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
        CLR       L:0x5345
//   49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
        MOV       L:0x5346, #0xff
//   50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
        CLR       L:0x5342
//   51 }
        RET
//   52 
//   53 /**
//   54   * @brief  Initializes the TIM4 Time Base Unit according to the specified parameters.
//   55   * @param    TIM4_Prescaler specifies the Prescaler from TIM4_Prescaler_TypeDef.
//   56   * @param    TIM4_Period specifies the Period value.
//   57   * @retval None
//   58   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
//   60 {
//   61     /* Check TIM4 prescaler value */
//   62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
//   63     /* Set the Prescaler value */
//   64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
TIM4_TimeBaseInit:
        LD        L:0x5345, A
//   65     /* Set the Autoreload value */
//   66     TIM4->ARR = (uint8_t)(TIM4_Period);
        LD        A, S:?b0
        LD        L:0x5346, A
//   67 }
        RET
//   68 
//   69 
//   70 
//   71 /**
//   72   * @brief  Enables or disables the TIM4 peripheral.
//   73   * @param   NewState new state of the TIM4 peripheral. This parameter can
//   74   * be ENABLE or DISABLE.
//   75   * @retval None
//   76   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   77 void TIM4_Cmd(FunctionalState NewState)
//   78 {
//   79     /* Check the parameters */
//   80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//   81 
//   82     /* set or Reset the CEN Bit */
//   83     if (NewState != DISABLE)
TIM4_Cmd:
        TNZ       A
        JREQ      L:??TIM4_Cmd_0
//   84     {
//   85         TIM4->CR1 |= TIM4_CR1_CEN;
        BSET      L:0x5340, #0x0
        RET
//   86     }
//   87     else
//   88     {
//   89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
??TIM4_Cmd_0:
        BRES      L:0x5340, #0x0
//   90     }
//   91 }
        RET
//   92 
//   93 /**
//   94   * @brief  Enables or disables the specified TIM4 interrupts.
//   95   * @param   NewState new state of the TIM4 peripheral.
//   96   * This parameter can be: ENABLE or DISABLE.
//   97   * @param   TIM4_IT specifies the TIM4 interrupts sources to be enabled or disabled.
//   98   * This parameter can be any combination of the following values:
//   99   * - TIM4_IT_UPDATE: TIM4 update Interrupt source
//  100   * @param   NewState new state of the TIM4 peripheral.
//  101   * @retval None
//  102   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
//  104 {
//  105     /* Check the parameters */
//  106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
//  107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  108 
//  109     if (NewState != DISABLE)
TIM4_ITConfig:
        TNZ       S:?b0
        JREQ      L:??TIM4_ITConfig_0
//  110     {
//  111         /* Enable the Interrupt sources */
//  112         TIM4->IER |= (uint8_t)TIM4_IT;
        OR        A, L:0x5341
        JRA       L:??TIM4_ITConfig_1
//  113     }
//  114     else
//  115     {
//  116         /* Disable the Interrupt sources */
//  117         TIM4->IER &= (uint8_t)(~TIM4_IT);
??TIM4_ITConfig_0:
        CPL       A
        AND       A, L:0x5341
??TIM4_ITConfig_1:
        LD        L:0x5341, A
//  118     }
//  119 }
        RET
//  120 
//  121 /**
//  122   * @brief  Enables or Disables the TIM4 Update event.
//  123   * @param   NewState new state of the TIM4 peripheral Preload register. This parameter can
//  124   * be ENABLE or DISABLE.
//  125   * @retval None
//  126   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
//  128 {
//  129     /* Check the parameters */
//  130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  131 
//  132     /* Set or Reset the UDIS Bit */
//  133     if (NewState != DISABLE)
TIM4_UpdateDisableConfig:
        TNZ       A
        JREQ      L:??TIM4_UpdateDisableConfig_0
//  134     {
//  135         TIM4->CR1 |= TIM4_CR1_UDIS;
        BSET      L:0x5340, #0x1
        RET
//  136     }
//  137     else
//  138     {
//  139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
??TIM4_UpdateDisableConfig_0:
        BRES      L:0x5340, #0x1
//  140     }
//  141 }
        RET
//  142 
//  143 /**
//  144   * @brief  Selects the TIM4 Update Request Interrupt source.
//  145   * @param   TIM4_UpdateSource specifies the Update source.
//  146   * This parameter can be one of the following values
//  147   *                       - TIM4_UPDATESOURCE_REGULAR
//  148   *                       - TIM4_UPDATESOURCE_GLOBAL
//  149   * @retval None
//  150   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
//  152 {
//  153     /* Check the parameters */
//  154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
//  155 
//  156     /* Set or Reset the URS Bit */
//  157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
TIM4_UpdateRequestConfig:
        TNZ       A
        JREQ      L:??TIM4_UpdateRequestConfig_0
//  158     {
//  159         TIM4->CR1 |= TIM4_CR1_URS;
        BSET      L:0x5340, #0x2
        RET
//  160     }
//  161     else
//  162     {
//  163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
??TIM4_UpdateRequestConfig_0:
        BRES      L:0x5340, #0x2
//  164     }
//  165 }
        RET
//  166 
//  167 /**
//  168   * @brief  Selects the TIM4’s One Pulse Mode.
//  169   * @param   TIM4_OPMode specifies the OPM Mode to be used.
//  170   * This parameter can be one of the following values
//  171   *                    - TIM4_OPMODE_SINGLE
//  172   *                    - TIM4_OPMODE_REPETITIVE
//  173   * @retval None
//  174   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
//  176 {
//  177     /* Check the parameters */
//  178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
//  179 
//  180     /* Set or Reset the OPM Bit */
//  181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
TIM4_SelectOnePulseMode:
        TNZ       A
        JREQ      L:??TIM4_SelectOnePulseMode_0
//  182     {
//  183         TIM4->CR1 |= TIM4_CR1_OPM;
        BSET      L:0x5340, #0x3
        RET
//  184     }
//  185     else
//  186     {
//  187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
??TIM4_SelectOnePulseMode_0:
        BRES      L:0x5340, #0x3
//  188     }
//  189 
//  190 }
        RET
//  191 
//  192 /**
//  193   * @brief  Configures the TIM4 Prescaler.
//  194   * @param   Prescaler specifies the Prescaler Register value
//  195   * This parameter can be one of the following values
//  196   *                       -  TIM4_PRESCALER_1
//  197   *                       -  TIM4_PRESCALER_2
//  198   *                       -  TIM4_PRESCALER_4
//  199   *                       -  TIM4_PRESCALER_8
//  200   *                       -  TIM4_PRESCALER_16
//  201   *                       -  TIM4_PRESCALER_32
//  202   *                       -  TIM4_PRESCALER_64
//  203   *                       -  TIM4_PRESCALER_128
//  204   * @param   TIM4_PSCReloadMode specifies the TIM4 Prescaler Reload mode.
//  205   * This parameter can be one of the following values
//  206   *                       - TIM4_PSCRELOADMODE_IMMEDIATE: The Prescaler is loaded
//  207   *                         immediatly.
//  208   *                       - TIM4_PSCRELOADMODE_UPDATE: The Prescaler is loaded at
//  209   *                         the update event.
//  210   * @retval None
//  211   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
//  213 {
//  214     /* Check the parameters */
//  215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
//  216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
//  217 
//  218     /* Set the Prescaler value */
//  219     TIM4->PSCR = (uint8_t)Prescaler;
TIM4_PrescalerConfig:
        LD        L:0x5345, A
//  220 
//  221     /* Set or reset the UG Bit */
//  222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
        LD        A, S:?b0
        LD        L:0x5343, A
//  223 }
        RET
//  224 
//  225 /**
//  226   * @brief  Enables or disables TIM4 peripheral Preload register on ARR.
//  227   * @param   NewState new state of the TIM4 peripheral Preload register.
//  228   * This parameter can be ENABLE or DISABLE.
//  229   * @retval None
//  230   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
//  232 {
//  233     /* Check the parameters */
//  234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  235 
//  236     /* Set or Reset the ARPE Bit */
//  237     if (NewState != DISABLE)
TIM4_ARRPreloadConfig:
        TNZ       A
        JREQ      L:??TIM4_ARRPreloadConfig_0
//  238     {
//  239         TIM4->CR1 |= TIM4_CR1_ARPE;
        BSET      L:0x5340, #0x7
        RET
//  240     }
//  241     else
//  242     {
//  243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
??TIM4_ARRPreloadConfig_0:
        BRES      L:0x5340, #0x7
//  244     }
//  245 }
        RET
//  246 
//  247 /**
//  248   * @brief  Configures the TIM4 event to be generated by software.
//  249   * @param   TIM4_EventSource specifies the event source.
//  250   * This parameter can be one of the following values:
//  251   *                       - TIM4_EVENTSOURCE_UPDATE: TIM4 update Event source
//  252   * @retval None
//  253   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
//  255 {
//  256     /* Check the parameters */
//  257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
//  258 
//  259     /* Set the event sources */
//  260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
TIM4_GenerateEvent:
        LD        L:0x5343, A
//  261 }
        RET
//  262 
//  263 
//  264 /**
//  265   * @brief  Sets the TIM4 Counter Register value.
//  266   * @param   Counter specifies the Counter register new value.
//  267   * This parameter is between 0x00 and 0xFF.
//  268   * @retval None
//  269   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  270 void TIM4_SetCounter(uint8_t Counter)
//  271 {
//  272     /* Set the Counter Register value */
//  273     TIM4->CNTR = (uint8_t)(Counter);
TIM4_SetCounter:
        LD        L:0x5344, A
//  274 }
        RET
//  275 
//  276 
//  277 /**
//  278   * @brief  Sets the TIM4 Autoreload Register value.
//  279   * @param   Autoreload specifies the Autoreload register new value.
//  280   * This parameter is between 0x00 and 0xFF.
//  281   * @retval None
//  282   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  283 void TIM4_SetAutoreload(uint8_t Autoreload)
//  284 {
//  285     /* Set the Autoreload Register value */
//  286     TIM4->ARR = (uint8_t)(Autoreload);
TIM4_SetAutoreload:
        LD        L:0x5346, A
//  287 }
        RET
//  288 
//  289 /**
//  290   * @brief  Gets the TIM4 Counter value.
//  291   * @param  None
//  292   * @retval Counter Register value.
//  293   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  294 uint8_t TIM4_GetCounter(void)
//  295 {
//  296     /* Get the Counter Register value */
//  297     return (uint8_t)(TIM4->CNTR);
TIM4_GetCounter:
        LD        A, L:0x5344
        RET
//  298 }
//  299 
//  300 /**
//  301   * @brief  Gets the TIM4 Prescaler value.
//  302   * @param  None
//  303   * @retval Prescaler Register configuration value.
//  304   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
//  306 {
//  307     /* Get the Prescaler Register value */
//  308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
TIM4_GetPrescaler:
        LD        A, L:0x5345
        RET
//  309 }
//  310 
//  311 /**
//  312   * @brief  Checks whether the specified TIM4 flag is set or not.
//  313   * @param   TIM4_FLAG specifies the flag to check.
//  314   * This parameter can be one of the following values:
//  315   *                       - TIM4_FLAG_UPDATE: TIM4 update Flag
//  316   * @retval FlagStatus The new state of TIM4_FLAG (SET or RESET).
//  317   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
//  319 {
//  320     FlagStatus bitstatus = RESET;
//  321   
//  322     /* Check the parameters */
//  323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
//  324 
//  325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
TIM4_GetFlagStatus:
        BCP       A, L:0x5342
        JREQ      L:??TIM4_GetFlagStatus_0
//  326   {
//  327     bitstatus = SET;
        LD        A, #0x1
        RET
//  328   }
//  329   else
//  330   {
//  331     bitstatus = RESET;
??TIM4_GetFlagStatus_0:
        CLR       A
//  332   }
//  333   return ((FlagStatus)bitstatus);
        RET
//  334 }
//  335 
//  336 /**
//  337   * @brief  Clears the TIM4’s pending flags.
//  338   * @param   TIM4_FLAG specifies the flag to clear.
//  339   * This parameter can be one of the following values:
//  340   *                       - TIM4_FLAG_UPDATE: TIM4 update Flag
//  341   * @retval None.
//  342   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
//  344 {
//  345     /* Check the parameters */
//  346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
//  347 
//  348     /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
//  349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
TIM4_ClearFlag:
        CPL       A
        LD        L:0x5342, A
//  350 
//  351 }
        RET
//  352 /**
//  353   * @brief  Checks whether the TIM4 interrupt has occurred or not.
//  354   * @param   TIM4_IT specifies the TIM4 interrupt source to check.
//  355   * This parameter can be one of the following values:
//  356   *                       - TIM4_IT_UPDATE: TIM4 update Interrupt source
//  357   * @retval ITStatus The new state of the TIM4_IT (SET or RESET).
//  358   */
//  359 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
//  361 {
TIM4_GetITStatus:
        LD        S:?b0, A
//  362     ITStatus bitstatus = RESET;
//  363 
//  364   uint8_t itstatus = 0x0, itenable = 0x0;
//  365 
//  366   /* Check the parameters */
//  367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
//  368 
//  369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
        LD        A, L:0x5342
        LD        S:?b2, A
//  370 
//  371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
        LD        A, S:?b0
        AND       A, L:0x5341
        LD        S:?b1, A
//  372 
//  373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
        LD        A, S:?b0
        BCP       A, S:?b2
        JREQ      L:??TIM4_GetITStatus_0
        TNZ       S:?b1
        JREQ      L:??TIM4_GetITStatus_0
//  374   {
//  375     bitstatus = (ITStatus)SET;
        LD        A, #0x1
        RET
//  376   }
//  377   else
//  378   {
//  379     bitstatus = (ITStatus)RESET;
??TIM4_GetITStatus_0:
        CLR       A
//  380   }
//  381   return ((ITStatus)bitstatus);
        RET
//  382 }
//  383 
//  384 /**
//  385   * @brief  Clears the TIM4's interrupt pending bits.
//  386   * @param   TIM4_IT specifies the pending bit to clear.
//  387   * This parameter can be one of the following values:
//  388   *                       - TIM4_IT_UPDATE: TIM4 update Interrupt source
//  389   * @retval None.
//  390   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
//  392 {
//  393     /* Check the parameters */
//  394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
//  395 
//  396     /* Clear the IT pending Bit */
//  397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
TIM4_ClearITPendingBit:
        CPL       A
        LD        L:0x5342, A
//  398 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  399 
//  400 /**
//  401   * @}
//  402   */
//  403   
//  404   /**
//  405   * @}
//  406   */
//  407   
//  408 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 194 bytes in section .near_func.text
// 
// 194 bytes of CODE memory
//
//Errors: none
//Warnings: none
