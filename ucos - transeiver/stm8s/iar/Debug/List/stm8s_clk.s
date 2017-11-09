///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:25 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_clk.c          /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_clk.c -e -Oh   /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_clk.s     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_clk

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?sll16_x_x_a
        EXTERN ?udiv32_l0_dl_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3

        PUBLIC CLKPrescTable
        PUBLIC CLK_AdjustHSICalibrationValue
        PUBLIC CLK_CCOCmd
        PUBLIC CLK_CCOConfig
        PUBLIC CLK_ClearITPendingBit
        PUBLIC CLK_ClockSecuritySystemEnable
        PUBLIC CLK_ClockSwitchCmd
        PUBLIC CLK_ClockSwitchConfig
        PUBLIC CLK_DeInit
        PUBLIC CLK_FastHaltWakeUpCmd
        PUBLIC CLK_GetClockFreq
        PUBLIC CLK_GetFlagStatus
        PUBLIC CLK_GetITStatus
        PUBLIC CLK_GetSYSCLKSource
        PUBLIC CLK_HSECmd
        PUBLIC CLK_HSICmd
        PUBLIC CLK_HSIPrescalerConfig
        PUBLIC CLK_ITConfig
        PUBLIC CLK_LSICmd
        PUBLIC CLK_PeripheralClockConfig
        PUBLIC CLK_SWIMConfig
        PUBLIC CLK_SYSCLKConfig
        PUBLIC CLK_SYSCLKEmergencyClear
        PUBLIC CLK_SlowActiveHaltWakeUpCmd
        PUBLIC HSIDivFactor

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_clk.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_clk.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the CLK peripheral.
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
//   24 #include "stm8s_clk.h"
//   25 
//   26 /** @addtogroup STM8S_StdPeriph_Driver
//   27   * @{
//   28   */
//   29 /* Private typedef -----------------------------------------------------------*/
//   30 /* Private define ------------------------------------------------------------*/
//   31 /* Private macro -------------------------------------------------------------*/
//   32 /* Private variables ---------------------------------------------------------*/
//   33 /* Private function prototypes -----------------------------------------------*/
//   34 
//   35 /* Private Constants ---------------------------------------------------------*/
//   36 
//   37 /**
//   38   * @addtogroup CLK_Private_Constants
//   39   * @{
//   40   */
//   41 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   42 CONST uint8_t HSIDivFactor[4] = {1, 2, 4, 8}; /*!< Holds the different HSI Divider factors */
HSIDivFactor:
        DC8 1, 2, 4, 8

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   43 CONST uint8_t CLKPrescTable[8] = {1, 2, 4, 8, 10, 16, 20, 40}; /*!< Holds the different CLK prescaler values */
CLKPrescTable:
        DC8 1, 2, 4, 8, 10, 16, 20, 40
//   44 
//   45 /**
//   46   * @}
//   47   */
//   48 
//   49 /* Public functions ----------------------------------------------------------*/
//   50 /**
//   51   * @addtogroup CLK_Public_Functions
//   52   * @{
//   53   */
//   54 
//   55 /**
//   56   * @brief  Deinitializes the CLK peripheral registers to their default reset
//   57   * values.
//   58   * @param  None
//   59   * @retval None
//   60   * @par Warning:
//   61   * Resetting the CCOR register: \n
//   62   * When the CCOEN bit is set, the reset of the CCOR register require
//   63   * two consecutive write instructions in order to reset first the CCOEN bit
//   64   * and the second one is to reset the CCOSEL bits.
//   65   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   66 void CLK_DeInit(void)
//   67 {
//   68 
//   69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
CLK_DeInit:
        MOV       L:0x50c0, #0x1
//   70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
        CLR       L:0x50c1
//   71     CLK->SWR  = CLK_SWR_RESET_VALUE;
        MOV       L:0x50c4, #0xe1
//   72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
        CLR       L:0x50c5
//   73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
        MOV       L:0x50c6, #0x18
//   74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
        MOV       L:0x50c7, #0xff
//   75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
        MOV       L:0x50ca, #0xff
//   76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
        CLR       L:0x50c8
//   77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
        CLR       L:0x50c9
//   78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
??CLK_DeInit_0:
        BTJT      L:0x50c9, #0x0, L:??CLK_DeInit_0
//   79     {}
//   80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
        CLR       L:0x50c9
//   81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
        CLR       L:0x50cc
//   82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
        CLR       L:0x50cd
//   83 
//   84 }
        RET
//   85 
//   86 /**
//   87   * @brief   Configures the High Speed Internal oscillator (HSI).
//   88   * @par Full description:
//   89   * If CLK_FastHaltWakeup is enabled, HSI oscillator is automatically
//   90   * switched-on (HSIEN=1) and selected as next clock master
//   91   * (CKM=SWI=HSI) when resuming from HALT/ActiveHalt modes.\n
//   92   * @param   NewState this parameter is the Wake-up Mode state.
//   93   * @retval None
//   94   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
//   96 {
//   97 
//   98     /* check the parameters */
//   99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  100 
//  101     if (NewState != DISABLE)
CLK_FastHaltWakeUpCmd:
        TNZ       A
        JREQ      L:??CLK_FastHaltWakeUpCmd_0
//  102     {
//  103         /* Set FHWU bit (HSI oscillator is automatically switched-on) */
//  104         CLK->ICKR |= CLK_ICKR_FHWU;
        BSET      L:0x50c0, #0x2
        RET
//  105     }
//  106     else  /* FastHaltWakeup = DISABLE */
//  107     {
//  108         /* Reset FHWU bit */
//  109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
??CLK_FastHaltWakeUpCmd_0:
        BRES      L:0x50c0, #0x2
//  110     }
//  111 
//  112 }
        RET
//  113 
//  114 /**
//  115   * @brief  Enable or Disable the External High Speed oscillator (HSE).
//  116   * @param   NewState new state of HSEEN, value accepted ENABLE, DISABLE.
//  117   * @retval None
//  118   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  119 void CLK_HSECmd(FunctionalState NewState)
//  120 {
//  121 
//  122     /* Check the parameters */
//  123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  124 
//  125     if (NewState != DISABLE)
CLK_HSECmd:
        TNZ       A
        JREQ      L:??CLK_HSECmd_0
//  126     {
//  127         /* Set HSEEN bit */
//  128         CLK->ECKR |= CLK_ECKR_HSEEN;
        BSET      L:0x50c1, #0x0
        RET
//  129     }
//  130     else
//  131     {
//  132         /* Reset HSEEN bit */
//  133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
??CLK_HSECmd_0:
        BRES      L:0x50c1, #0x0
//  134     }
//  135 
//  136 }
        RET
//  137 
//  138 /**
//  139   * @brief  Enables or disables the Internal High Speed oscillator (HSI).
//  140   * @param   NewState new state of HSIEN, value accepted ENABLE, DISABLE.
//  141   * @retval None
//  142   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  143 void CLK_HSICmd(FunctionalState NewState)
//  144 {
//  145 
//  146     /* Check the parameters */
//  147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  148 
//  149     if (NewState != DISABLE)
CLK_HSICmd:
        TNZ       A
        JREQ      L:??CLK_HSICmd_0
//  150     {
//  151         /* Set HSIEN bit */
//  152         CLK->ICKR |= CLK_ICKR_HSIEN;
        BSET      L:0x50c0, #0x0
        RET
//  153     }
//  154     else
//  155     {
//  156         /* Reset HSIEN bit */
//  157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
??CLK_HSICmd_0:
        BRES      L:0x50c0, #0x0
//  158     }
//  159 
//  160 }
        RET
//  161 
//  162 /**
//  163   * @brief  Enables or disables the Internal Low Speed oscillator (LSI).
//  164   * @param    NewState new state of LSIEN, value accepted ENABLE, DISABLE.
//  165   * @retval None
//  166   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  167 void CLK_LSICmd(FunctionalState NewState)
//  168 {
//  169 
//  170     /* Check the parameters */
//  171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  172 
//  173     if (NewState != DISABLE)
CLK_LSICmd:
        TNZ       A
        JREQ      L:??CLK_LSICmd_0
//  174     {
//  175         /* Set LSIEN bit */
//  176         CLK->ICKR |= CLK_ICKR_LSIEN;
        BSET      L:0x50c0, #0x3
        RET
//  177     }
//  178     else
//  179     {
//  180         /* Reset LSIEN bit */
//  181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
??CLK_LSICmd_0:
        BRES      L:0x50c0, #0x3
//  182     }
//  183 
//  184 }
        RET
//  185 
//  186 /**
//  187   * @brief  Enables or disablle the Configurable Clock Output (CCO).
//  188   * @param   NewState : New state of CCEN bit (CCO register).
//  189   * This parameter can be any of the @ref FunctionalState enumeration.
//  190   * @retval None
//  191   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  192 void CLK_CCOCmd(FunctionalState NewState)
//  193 {
//  194 
//  195     /* Check the parameters */
//  196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  197 
//  198     if (NewState != DISABLE)
CLK_CCOCmd:
        TNZ       A
        JREQ      L:??CLK_CCOCmd_0
//  199     {
//  200         /* Set CCOEN bit */
//  201         CLK->CCOR |= CLK_CCOR_CCOEN;
        BSET      L:0x50c9, #0x0
        RET
//  202     }
//  203     else
//  204     {
//  205         /* Reset CCOEN bit */
//  206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
??CLK_CCOCmd_0:
        BRES      L:0x50c9, #0x0
//  207     }
//  208 
//  209 }
        RET
//  210 
//  211 /**
//  212   * @brief  Starts or Stops manually the clock switch execution.
//  213   * @par Full description:
//  214   * NewState parameter set the SWEN.
//  215   * @param   NewState new state of SWEN, value accepted ENABLE, DISABLE.
//  216   * @retval None
//  217   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  218 void CLK_ClockSwitchCmd(FunctionalState NewState)
//  219 {
//  220 
//  221     /* Check the parameters */
//  222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  223 
//  224     if (NewState != DISABLE )
CLK_ClockSwitchCmd:
        TNZ       A
        JREQ      L:??CLK_ClockSwitchCmd_0
//  225     {
//  226         /* Enable the Clock Switch */
//  227         CLK->SWCR |= CLK_SWCR_SWEN;
        BSET      L:0x50c5, #0x1
        RET
//  228     }
//  229     else
//  230     {
//  231         /* Disable the Clock Switch */
//  232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
??CLK_ClockSwitchCmd_0:
        BRES      L:0x50c5, #0x1
//  233     }
//  234 
//  235 }
        RET
//  236 
//  237 /**
//  238   * @brief  Configures the slow active halt wake up
//  239   * @param   NewState: specifies the Slow Active Halt wake up state.
//  240   * can be set of the following values:
//  241   * - DISABLE: Slow Active Halt mode disabled;
//  242   * - ENABLE:  Slow Active Halt mode enabled.
//  243   * @retval None
//  244   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
//  246 {
//  247 
//  248     /* check the parameters */
//  249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  250 
//  251     if (NewState != DISABLE)
CLK_SlowActiveHaltWakeUpCmd:
        TNZ       A
        JREQ      L:??CLK_SlowActiveHaltWakeUpCmd_0
//  252     {
//  253         /* Set S_ACTHALT bit */
//  254         CLK->ICKR |= CLK_ICKR_SWUAH;
        BSET      L:0x50c0, #0x5
        RET
//  255     }
//  256     else
//  257     {
//  258         /* Reset S_ACTHALT bit */
//  259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
??CLK_SlowActiveHaltWakeUpCmd_0:
        BRES      L:0x50c0, #0x5
//  260     }
//  261 
//  262 }
        RET
//  263 
//  264 /**
//  265   * @brief   Enables or disables the specified peripheral CLK.
//  266   * @param   CLK_Peripheral : This parameter specifies the peripheral clock to gate.
//  267   * This parameter can be any of the  @ref CLK_Peripheral_TypeDef enumeration.
//  268   * @param   NewState : New state of specified peripheral clock.
//  269   * This parameter can be any of the @ref FunctionalState enumeration.
//  270   * @retval None
//  271   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
//  273 {
CLK_PeripheralClockConfig:
        LD        S:?b2, A
//  274 
//  275     /* Check the parameters */
//  276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
//  278 
//  279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
        LD        A, S:?b2
        BCP       A, #0x10
        JRNE      L:??CLK_PeripheralClockConfig_0
//  280     {
//  281         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??CLK_PeripheralClockConfig_1
//  282         {
//  283             /* Enable the peripheral Clock */
//  284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b1
        OR        A, L:0x50c7
??CLK_PeripheralClockConfig_2:
        LD        L:0x50c7, A
        RET
//  285         }
//  286         else
//  287         {
//  288             /* Disable the peripheral Clock */
//  289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
??CLK_PeripheralClockConfig_1:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x50c7
        JRA       L:??CLK_PeripheralClockConfig_2
//  290         }
//  291     }
//  292     else
//  293     {
//  294         if (NewState != DISABLE)
??CLK_PeripheralClockConfig_0:
        TNZ       S:?b0
        JREQ      L:??CLK_PeripheralClockConfig_3
//  295         {
//  296             /* Enable the peripheral Clock */
//  297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b1
        OR        A, L:0x50ca
        JRA       L:??CLK_PeripheralClockConfig_4
//  298         }
//  299         else
//  300         {
//  301             /* Disable the peripheral Clock */
//  302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
??CLK_PeripheralClockConfig_3:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x50ca
??CLK_PeripheralClockConfig_4:
        LD        L:0x50ca, A
//  303         }
//  304     }
//  305 
//  306 }
        RET
//  307 
//  308 /**
//  309   * @brief  configures the Switch from one clock to another
//  310   * @param   CLK_SwitchMode select the clock switch mode.
//  311   * It can be set of the values of @ref CLK_SwitchMode_TypeDef
//  312   * @param   CLK_NewClock choice of the future clock.
//  313   * It can be set of the values of @ref CLK_Source_TypeDef
//  314   * @param   NewState Enable or Disable the Clock Switch interrupt.
//  315   * @param   CLK_CurrentClockState current clock to switch OFF or to keep ON.
//  316   * It can be set of the values of @ref CLK_CurrentClockState_TypeDef
//  317   * @retval ErrorStatus this shows the clock switch status (ERROR/SUCCESS).
//  318   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
//  320 {
CLK_ClockSwitchConfig:
        LD        S:?b3, A
//  321 
//  322     CLK_Source_TypeDef clock_master;
//  323     uint16_t DownCounter = CLK_TIMEOUT;
        LDW       X, #0x491
//  324     ErrorStatus Swif = ERROR;
//  325 
//  326     /* Check the parameters */
//  327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
//  328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
//  329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
//  330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
//  331 
//  332     /* Current clock master saving */
//  333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
        LD        A, L:0x50c3
        LD        S:?b4, A
//  334 
//  335     /* Automatic switch mode management */
//  336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
        LD        A, S:?b3
        CP        A, #0x1
        JRNE      L:??CLK_ClockSwitchConfig_0
//  337     {
//  338 
//  339         /* Enables Clock switch */
//  340         CLK->SWCR |= CLK_SWCR_SWEN;
        BSET      L:0x50c5, #0x1
//  341 
//  342         /* Enables or Disables Switch interrupt */
//  343         if (ITState != DISABLE)
        TNZ       S:?b1
        JREQ      L:??CLK_ClockSwitchConfig_1
//  344         {
//  345             CLK->SWCR |= CLK_SWCR_SWIEN;
        BSET      L:0x50c5, #0x2
        JRA       L:??CLK_ClockSwitchConfig_2
//  346         }
//  347         else
//  348         {
//  349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
??CLK_ClockSwitchConfig_1:
        BRES      L:0x50c5, #0x2
//  350         }
//  351 
//  352         /* Selection of the target clock source */
//  353         CLK->SWR = (uint8_t)CLK_NewClock;
??CLK_ClockSwitchConfig_2:
        LD        A, S:?b0
        LD        L:0x50c4, A
        JRA       L:??CLK_ClockSwitchConfig_3
//  354 
//  355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
??CLK_ClockSwitchConfig_4:
        JREQ      L:??CLK_ClockSwitchConfig_5
//  356         {
//  357             DownCounter--;
        DECW      X
//  358         }
??CLK_ClockSwitchConfig_3:
        TNZW      X
        BTJT      L:0x50c5, #0x0, L:??CLK_ClockSwitchConfig_4
//  359 
//  360         if (DownCounter != 0)
        JRNE      L:??CLK_ClockSwitchConfig_6
//  361         {
//  362             Swif = SUCCESS;
//  363         }
//  364         else
//  365         {
//  366             Swif = ERROR;
??CLK_ClockSwitchConfig_5:
        CLR       S:?b0
        JRA       L:??CLK_ClockSwitchConfig_7
//  367         }
//  368 
//  369     }
//  370     else /* CLK_SwitchMode == CLK_SWITCHMODE_MANUAL */
//  371     {
//  372 
//  373         /* Enables or Disables Switch interrupt  if required  */
//  374         if (ITState != DISABLE)
??CLK_ClockSwitchConfig_0:
        TNZ       S:?b1
        JREQ      L:??CLK_ClockSwitchConfig_8
//  375         {
//  376             CLK->SWCR |= CLK_SWCR_SWIEN;
        BSET      L:0x50c5, #0x2
        JRA       L:??CLK_ClockSwitchConfig_9
//  377         }
//  378         else
//  379         {
//  380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
??CLK_ClockSwitchConfig_8:
        BRES      L:0x50c5, #0x2
//  381         }
//  382 
//  383         /* Selection of the target clock source */
//  384         CLK->SWR = (uint8_t)CLK_NewClock;
??CLK_ClockSwitchConfig_9:
        LD        A, S:?b0
        LD        L:0x50c4, A
//  385 
//  386         /* In manual mode, there is no risk to be stuck in a loop, value returned
//  387           is then always SUCCESS */
//  388         Swif = SUCCESS;
??CLK_ClockSwitchConfig_6:
        MOV       S:?b0, #0x1
//  389 
//  390     }
//  391 
//  392     /* Switch OFF current clock if required */
//  393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
??CLK_ClockSwitchConfig_7:
        TNZ       S:?b2
        JRNE      L:??CLK_ClockSwitchConfig_10
        LD        A, S:?b4
        CP        A, #0xe1
        JRNE      L:??CLK_ClockSwitchConfig_11
//  394     {
//  395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
        BRES      L:0x50c0, #0x0
        JRA       L:??CLK_ClockSwitchConfig_10
//  396     }
??CLK_ClockSwitchConfig_11:
        CP        A, #0xd2
        JRNE      L:??CLK_ClockSwitchConfig_12
//  397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
//  398     {
//  399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
        BRES      L:0x50c0, #0x3
        JRA       L:??CLK_ClockSwitchConfig_10
//  400     }
??CLK_ClockSwitchConfig_12:
        CP        A, #0xb4
        JRNE      L:??CLK_ClockSwitchConfig_10
//  401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
//  402     {
//  403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
        BRES      L:0x50c1, #0x0
//  404     }
//  405 
//  406     return(Swif);
??CLK_ClockSwitchConfig_10:
        LD        A, S:?b0
        RET
//  407 
//  408 }
//  409 
//  410 /**
//  411   * @brief  Configures the HSI clock dividers.
//  412   * @param   HSIPrescaler : Specifies the HSI clock divider to apply.
//  413   * This parameter can be any of the @ref CLK_Prescaler_TypeDef enumeration.
//  414   * @retval None
//  415   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
//  417 {
CLK_HSIPrescalerConfig:
        LD        S:?b0, A
//  418 
//  419     /* check the parameters */
//  420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
//  421 
//  422     /* Clear High speed internal clock prescaler */
//  423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
        CALL      L:?Subroutine0
//  424 
//  425     /* Set High speed internal clock prescaler */
//  426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
??CrossCallReturnLabel_1:
        OR        A, L:0x50c6
        LD        L:0x50c6, A
//  427 
//  428 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LD        A, L:0x50c6
        AND       A, #0xe7
        LD        L:0x50c6, A
        LD        A, S:?b0
        RET
//  429 
//  430 /**
//  431   * @brief  Output the selected clock on a dedicated I/O pin.
//  432   * @param   CLK_CCO : Specifies the clock source.
//  433   * This parameter can be any of the  @ref CLK_Output_TypeDef enumeration.
//  434   * @retval None
//  435   * @par Required preconditions:
//  436   * The dedicated I/O pin must be set at 1 in the corresponding Px_CR1 register \n
//  437   * to be set as input with pull-up or push-pull output.
//  438   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
//  440 {
CLK_CCOConfig:
        LD        S:?b0, A
//  441 
//  442     /* check the parameters */
//  443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
//  444 
//  445     /* Clears of the CCO type bits part */
//  446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
        LD        A, L:0x50c9
        AND       A, #0xe1
        LD        L:0x50c9, A
//  447 
//  448     /* Selects the source provided on cco_ck output */
//  449     CLK->CCOR |= (uint8_t)CLK_CCO;
        LD        A, S:?b0
        OR        A, L:0x50c9
        LD        L:0x50c9, A
//  450 
//  451     /* Enable the clock output */
//  452     CLK->CCOR |= CLK_CCOR_CCOEN;
        BSET      L:0x50c9, #0x0
//  453 
//  454 }
        RET
//  455 
//  456 /**
//  457   * @brief   Enables or disables the specified CLK interrupts.
//  458   * @param   CLK_IT This parameter specifies the interrupt sources.
//  459   * It can be one of the values of @ref CLK_IT_TypeDef.
//  460   * @param   NewState New state of the Interrupt.
//  461   * Value accepted ENABLE, DISABLE.
//  462   * @retval None
//  463   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
//  465 {
//  466 
//  467     /* check the parameters */
//  468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  469     assert_param(IS_CLK_IT_OK(CLK_IT));
//  470 
//  471     if (NewState != DISABLE)
CLK_ITConfig:
        TNZ       S:?b0
        JREQ      L:??CLK_ITConfig_0
//  472     {
//  473         switch (CLK_IT)
        SUB       A, #0xc
        JREQ      L:??CLK_ITConfig_1
        SUB       A, #0x10
        JRNE      L:??CLK_ITConfig_2
//  474         {
//  475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
//  476             CLK->SWCR |= CLK_SWCR_SWIEN;
        BSET      L:0x50c5, #0x2
//  477             break;
        RET
//  478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
//  479             CLK->CSSR |= CLK_CSSR_CSSDIE;
??CLK_ITConfig_1:
        BSET      L:0x50c8, #0x2
//  480             break;
        RET
//  481         default:
//  482             break;
//  483         }
//  484     }
//  485     else  /*(NewState == DISABLE)*/
//  486     {
//  487         switch (CLK_IT)
??CLK_ITConfig_0:
        SUB       A, #0xc
        JREQ      L:??CLK_ITConfig_3
        SUB       A, #0x10
        JRNE      L:??CLK_ITConfig_2
//  488         {
//  489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
//  490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
        BRES      L:0x50c5, #0x2
//  491             break;
        RET
//  492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
//  493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
??CLK_ITConfig_3:
        BRES      L:0x50c8, #0x2
//  494             break;
//  495         default:
//  496             break;
//  497         }
//  498     }
//  499 
//  500 }
??CLK_ITConfig_2:
        RET
//  501 
//  502 /**
//  503   * @brief  Configures the HSI and CPU clock dividers.
//  504   * @param   ClockPrescaler Specifies the HSI or CPU clock divider to apply.
//  505   * @retval None
//  506   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
//  508 {
CLK_SYSCLKConfig:
        LD        S:?b0, A
//  509 
//  510     /* check the parameters */
//  511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
//  512 
//  513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
        BCP       A, #0x80
        JRNE      L:??CLK_SYSCLKConfig_0
//  514     {
//  515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
        CALL      L:?Subroutine0
//  516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
//  517     }
??CrossCallReturnLabel_0:
        AND       A, #0x18
        JRA       L:??CLK_SYSCLKConfig_1
//  518     else /* Bit7 = 1 means CPU divider */
//  519     {
//  520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
??CLK_SYSCLKConfig_0:
        LD        A, L:0x50c6
        AND       A, #0xf8
        LD        L:0x50c6, A
//  521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
        LD        A, S:?b0
        AND       A, #0x7
??CLK_SYSCLKConfig_1:
        OR        A, L:0x50c6
        LD        L:0x50c6, A
//  522     }
//  523 
//  524 }
        RET
//  525 /**
//  526   * @brief  Configures the SWIM clock frequency on the fly.
//  527   * @param   CLK_SWIMDivider Specifies the SWIM clock divider to apply.
//  528   * can be one of the value of @ref CLK_SWIMDivider_TypeDef
//  529   * @retval None
//  530   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
//  532 {
//  533 
//  534     /* check the parameters */
//  535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
//  536 
//  537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
CLK_SWIMConfig:
        TNZ       A
        JREQ      L:??CLK_SWIMConfig_0
//  538     {
//  539         /* SWIM clock is not divided by 2 */
//  540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
        BSET      L:0x50cd, #0x0
        RET
//  541     }
//  542     else /* CLK_SWIMDivider == CLK_SWIMDIVIDER_2 */
//  543     {
//  544         /* SWIM clock is divided by 2 */
//  545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
??CLK_SWIMConfig_0:
        BRES      L:0x50cd, #0x0
//  546     }
//  547 
//  548 }
        RET
//  549 
//  550 /**
//  551   * @brief  Enables the Clock Security System.
//  552   * @par Full description:
//  553   * once CSS is enabled it cannot be disabled until the next reset.
//  554   * @param  None
//  555   * @retval None
//  556   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  557 void CLK_ClockSecuritySystemEnable(void)
//  558 {
//  559     /* Set CSSEN bit */
//  560     CLK->CSSR |= CLK_CSSR_CSSEN;
CLK_ClockSecuritySystemEnable:
        BSET      L:0x50c8, #0x0
//  561 }
        RET
//  562 
//  563 /**
//  564   * @brief  Returns the clock source used as system clock.
//  565   * @param  None
//  566   * @retval  Clock source used.
//  567   * can be one of the values of @ref CLK_Source_TypeDef
//  568   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
//  570 {
//  571     return((CLK_Source_TypeDef)CLK->CMSR);
CLK_GetSYSCLKSource:
        LD        A, L:0x50c3
        RET
//  572 }
//  573 
//  574 /**
//  575   * @brief  This function returns the frequencies of different on chip clocks.
//  576   * @param  None
//  577   * @retval the master clock frequency
//  578   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  579 uint32_t CLK_GetClockFreq(void)
//  580 {
//  581 
//  582     uint32_t clockfrequency = 0;
//  583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
//  584     uint8_t tmp = 0, presc = 0;
//  585 
//  586     /* Get CLK source. */
//  587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
CLK_GetClockFreq:
        LD        A, L:0x50c3
//  588 
//  589     if (clocksource == CLK_SOURCE_HSI)
        CP        A, #0xe1
        JRNE      L:??CLK_GetClockFreq_0
//  590     {
//  591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
        LD        A, L:0x50c6
//  592         tmp = (uint8_t)(tmp >> 3);
//  593         presc = HSIDivFactor[tmp];
//  594         clockfrequency = HSI_VALUE / presc;
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x3
        CLRW      X
        LD        XL, A
        LD        A, (L:HSIDivFactor,X)
        LD        XL, A
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?udiv32_l0_dl_l1
        DATA
        DC32      0xf42400
        CODE
        RET
//  595     }
//  596     else if ( clocksource == CLK_SOURCE_LSI)
??CLK_GetClockFreq_0:
        CP        A, #0xd2
        JRNE      L:??CLK_GetClockFreq_1
//  597     {
//  598         clockfrequency = LSI_VALUE;
        LDW       X, #0xf400
        LDW       S:?w1, X
        CLRW      X
        INCW      X
        LDW       S:?w0, X
        RET
//  599     }
//  600     else
//  601     {
//  602         clockfrequency = HSE_VALUE;
??CLK_GetClockFreq_1:
        LDW       X, #0x3600
        LDW       S:?w1, X
        LDW       X, #0x16e
        LDW       S:?w0, X
//  603     }
//  604 
//  605     return((uint32_t)clockfrequency);
        RET
//  606 
//  607 }
//  608 
//  609 /**
//  610   * @brief  Adjusts the Internal High Speed oscillator (HSI) calibration value.
//  611   * @par Full description:
//  612   * @param   CLK_HSICalibrationValue calibration trimming value.
//  613   * can be one of the values of @ref CLK_HSITrimValue_TypeDef
//  614   * @retval None
//  615   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
//  617 {
CLK_AdjustHSICalibrationValue:
        LD        S:?b0, A
//  618 
//  619     /* check the parameters */
//  620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
//  621 
//  622     /* Store the new value */
//  623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
        LD        A, L:0x50cc
        AND       A, #0xf8
        OR        A, S:?b0
        LD        L:0x50cc, A
//  624 
//  625 }
        RET
//  626 
//  627 /**
//  628   * @brief  Reset the SWBSY flag (SWICR Reister)
//  629   * @par Full description:
//  630   * This function reset SWBSY flag in order to reset clock switch operations (target
//  631   * oscillator is broken, stabilization is longing too much, etc.).  If at the same time \n
//  632   * software attempts to set SWEN and clear SWBSY, SWBSY action takes precedence.
//  633   * @param  None
//  634   * @retval None
//  635   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  636 void CLK_SYSCLKEmergencyClear(void)
//  637 {
//  638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
CLK_SYSCLKEmergencyClear:
        BRES      L:0x50c5, #0x0
//  639 }
        RET
//  640 
//  641 /**
//  642   * @brief  Checks whether the specified CLK flag is set or not.
//  643   * @par Full description:
//  644   * @param   CLK_FLAG Flag to check.
//  645   * can be one of the values of @ref CLK_Flag_TypeDef
//  646   * @retval FlagStatus, status of the checked flag
//  647   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
//  649 {
//  650 
//  651     uint16_t statusreg = 0;
//  652     uint8_t tmpreg = 0;
//  653     FlagStatus bitstatus = RESET;
//  654 
//  655     /* check the parameters */
//  656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
//  657 
//  658     /* Get the CLK register index */
//  659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
CLK_GetFlagStatus:
        LDW       Y, X
        RRWA      X, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
//  660 
//  661 
//  662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
        CPW       Y, #0x100
        JRNE      L:??CLK_GetFlagStatus_0
//  663     {
//  664         tmpreg = CLK->ICKR;
        LD        A, L:0x50c0
        JRA       L:??CLK_GetFlagStatus_1
//  665     }
//  666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
??CLK_GetFlagStatus_0:
        CPW       Y, #0x200
        JRNE      L:??CLK_GetFlagStatus_2
//  667     {
//  668         tmpreg = CLK->ECKR;
        LD        A, L:0x50c1
        JRA       L:??CLK_GetFlagStatus_1
//  669     }
//  670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
??CLK_GetFlagStatus_2:
        CPW       Y, #0x300
        JRNE      L:??CLK_GetFlagStatus_3
//  671     {
//  672         tmpreg = CLK->SWCR;
        LD        A, L:0x50c5
        JRA       L:??CLK_GetFlagStatus_1
//  673     }
//  674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
??CLK_GetFlagStatus_3:
        CPW       Y, #0x400
        JRNE      L:??CLK_GetFlagStatus_4
//  675     {
//  676         tmpreg = CLK->CSSR;
        LD        A, L:0x50c8
        JRA       L:??CLK_GetFlagStatus_1
//  677     }
//  678     else /* The flag to check is in CCO register */
//  679     {
//  680         tmpreg = CLK->CCOR;
??CLK_GetFlagStatus_4:
        LD        A, L:0x50c9
??CLK_GetFlagStatus_1:
        LD        S:?b0, A
//  681     }
//  682 
//  683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
        LD        A, XL
        BCP       A, S:?b0
        JREQ      L:??CLK_GetFlagStatus_5
//  684     {
//  685         bitstatus = SET;
        LD        A, #0x1
        RET
//  686     }
//  687     else
//  688     {
//  689         bitstatus = RESET;
??CLK_GetFlagStatus_5:
        CLR       A
//  690     }
//  691 
//  692     /* Return the flag status */
//  693     return((FlagStatus)bitstatus);
        RET
//  694 
//  695 }
//  696 
//  697 /**
//  698   * @brief  Checks whether the specified CLK interrupt has is enabled or not.
//  699   * @param   CLK_IT specifies the CLK interrupt.
//  700   * can be one of the values of @ref CLK_IT_TypeDef
//  701   * @retval ITStatus, new state of CLK_IT (SET or RESET).
//  702   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
//  704 {
//  705 
//  706     ITStatus bitstatus = RESET;
//  707 
//  708     /* check the parameters */
//  709     assert_param(IS_CLK_IT_OK(CLK_IT));
//  710 
//  711     if (CLK_IT == CLK_IT_SWIF)
CLK_GetITStatus:
        CP        A, #0x1c
        JRNE      L:??CLK_GetITStatus_0
//  712     {
//  713         /* Check the status of the clock switch interrupt */
//  714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
        LD        A, L:0x50c5
        AND       A, #0x1c
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_1
//  715         {
//  716             bitstatus = SET;
??CLK_GetITStatus_2:
        LD        A, #0x1
//  717         }
//  718         else
//  719         {
//  720             bitstatus = RESET;
//  721         }
//  722     }
//  723     else /* CLK_IT == CLK_IT_CSSDIE */
//  724     {
//  725         /* Check the status of the security system detection interrupt */
//  726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
//  727         {
//  728             bitstatus = SET;
//  729         }
//  730         else
//  731         {
//  732             bitstatus = RESET;
//  733         }
//  734     }
//  735 
//  736     /* Return the CLK_IT status */
//  737     return bitstatus;
        RET
??CLK_GetITStatus_0:
        AND       A, L:0x50c8
        CP        A, #0xc
        JREQ      L:??CLK_GetITStatus_2
??CLK_GetITStatus_1:
        CLR       A
        RET
//  738 
//  739 }
//  740 
//  741 /**
//  742   * @brief  Clears the CLK’s interrupt pending bits.
//  743   * @param   CLK_IT specifies the interrupt pending bits.
//  744   * can be one of the values of @ref CLK_IT_TypeDef
//  745   * @retval None
//  746   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
//  748 {
//  749 
//  750     /* check the parameters */
//  751     assert_param(IS_CLK_IT_OK(CLK_IT));
//  752 
//  753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
CLK_ClearITPendingBit:
        CP        A, #0xc
        JRNE      L:??CLK_ClearITPendingBit_0
//  754     {
//  755         /* Clear the status of the security system detection interrupt */
//  756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
        BRES      L:0x50c8, #0x3
        RET
//  757     }
//  758     else /* CLK_PendingBit == (uint8_t)CLK_IT_SWIF */
//  759     {
//  760         /* Clear the status of the clock switch interrupt */
//  761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
??CLK_ClearITPendingBit_0:
        BRES      L:0x50c5, #0x3
//  762     }
//  763 
//  764 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  765 /**
//  766   * @}
//  767   */
//  768   
//  769 /**
//  770   * @}
//  771   */
//  772   
//  773 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
//  12 bytes in section .near.rodata
// 644 bytes in section .near_func.text
// 
// 644 bytes of CODE  memory
//  12 bytes of CONST memory
//
//Errors: none
//Warnings: none
