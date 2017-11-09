///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:30 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_uart1.c        /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_uart1.c -e     /
//                    -Oh --debug --code_model small --data_model medium -o   /
//                    E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\Obj\ --dlib_config   /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.0\stm8\LIB\dlstm8smn.h" -D STM8S207 -lB               /
//                    E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\                /
//                    --diag_suppress pa089 -I E:\HWT\HWT_OS\ucos\stm8s\iar\. /
//                    .\..\ucos_ii\ -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\..\uco /
//                    s_ii\iarstm8\ -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\src\   /
//                    -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\fwlib\inc\ --vregs   /
//                    16                                                      /
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_uart1.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_uart1

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?epilogue_l2_l3
        EXTERN ?mov_l1_l2
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?mul32_l0_l0_dl
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?sll16_x_x_a
        EXTERN ?sll32_l0_l0_db
        EXTERN ?srl16_x_x_4
        EXTERN ?sub32_l0_l0_l1
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w7
        EXTERN CLK_GetClockFreq

        PUBLIC UART1_ClearFlag
        PUBLIC UART1_ClearITPendingBit
        PUBLIC UART1_Cmd
        PUBLIC UART1_DeInit
        PUBLIC UART1_GetFlagStatus
        PUBLIC UART1_GetITStatus
        PUBLIC UART1_HalfDuplexCmd
        PUBLIC UART1_ITConfig
        PUBLIC UART1_Init
        PUBLIC UART1_IrDACmd
        PUBLIC UART1_IrDAConfig
        PUBLIC UART1_LINBreakDetectionConfig
        PUBLIC UART1_LINCmd
        PUBLIC UART1_ReceiveData8
        PUBLIC UART1_ReceiveData9
        PUBLIC UART1_ReceiverWakeUpCmd
        PUBLIC UART1_SendBreak
        PUBLIC UART1_SendData8
        PUBLIC UART1_SendData9
        PUBLIC UART1_SetAddress
        PUBLIC UART1_SetGuardTime
        PUBLIC UART1_SetPrescaler
        PUBLIC UART1_SmartCardCmd
        PUBLIC UART1_SmartCardNACKCmd
        PUBLIC UART1_WakeUpConfig

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_uart1.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8s_uart1.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the UART1 peripheral.
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
//   23 #include "stm8s_uart1.h"
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
//   34 /* Public functions ----------------------------------------------------------*/
//   35 
//   36 /** @}
//   37   * @addtogroup UART1_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 /**
//   42   * @brief  Deinitializes the UART peripheral.
//   43   * @param  None
//   44   * @retval None
//   45 	*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 void UART1_DeInit(void)
//   47 {
//   48     /* Clear the Idle Line Detected bit in the status rerister by a read
//   49        to the UART1_SR register followed by a Read to the UART1_DR register */
//   50     (void)UART1->SR;
UART1_DeInit:
        LD        A, L:0x5230
//   51     (void)UART1->DR;
        LD        A, L:0x5231
//   52 
//   53     UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
        CLR       L:0x5233
//   54     UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
        CLR       L:0x5232
//   55 
//   56     UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
        CLR       L:0x5234
//   57     UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
        CLR       L:0x5235
//   58     UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
        CLR       L:0x5236
//   59     UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
        CLR       L:0x5237
//   60     UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
        CLR       L:0x5238
//   61 
//   62     UART1->GTR = UART1_GTR_RESET_VALUE;
        CLR       L:0x5239
//   63     UART1->PSCR = UART1_PSCR_RESET_VALUE;
        CLR       L:0x523a
//   64 }
        RET
//   65 
//   66 /**
//   67   * @brief  Initializes the UART1 according to the specified parameters.
//   68   * @note   Configure in Push Pull or Open Drain mode the Tx pin by setting the
//   69   *         correct I/O Port register according the product package and line
//   70   *         configuration
//   71   * @param  BaudRate: The baudrate.
//   72   * @param  WordLength : This parameter can be any of the 
//   73   *         @ref UART1_WordLength_TypeDef enumeration.
//   74   * @param  StopBits: This parameter can be any of the 
//   75   *         @ref UART1_StopBits_TypeDef enumeration.
//   76   * @param  Parity: This parameter can be any of the 
//   77   *         @ref UART1_Parity_TypeDef enumeration.
//   78   * @param  SyncMode: This parameter can be any of the 
//   79   *         @ref UART1_SyncMode_TypeDef values.
//   80   * @param  Mode: This parameter can be any of the @ref UART1_Mode_TypeDef values
//   81   * @retval None
//   82   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        OR        A, L:0x5234
        LD        L:0x5234, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   83 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
//   84                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
//   85                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
//   86 {
UART1_Init:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSH      S:?b6
        PUSH      S:?b7
//   87     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
//   88 
//   89     /* Check the parameters */
//   90     assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
//   91     assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
//   92     assert_param(IS_UART1_STOPBITS_OK(StopBits));
//   93     assert_param(IS_UART1_PARITY_OK(Parity));
//   94     assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
//   95     assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
//   96 
//   97     /* Clear the word length bit */
//   98     UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
        BRES      L:0x5234, #0x4
//   99     
//  100      /* Set the word length bit according to UART1_WordLength value */
//  101     UART1->CR1 |= (uint8_t)WordLength;
        CALL      L:?Subroutine0
//  102 
//  103     /* Clear the STOP bits */
//  104     UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
??CrossCallReturnLabel_2:
        LD        A, L:0x5236
        AND       A, #0xcf
        LD        L:0x5236, A
//  105     /* Set the STOP bits number according to UART1_StopBits value  */
//  106     UART1->CR3 |= (uint8_t)StopBits;  
        LD        A, S:?b4
        CALL      L:?Subroutine2
//  107 
//  108     /* Clear the Parity Control bit */
//  109     UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
??CrossCallReturnLabel_6:
        LD        A, L:0x5234
        AND       A, #0xf9
        LD        L:0x5234, A
//  110     /* Set the Parity Control bit to UART1_Parity value */
//  111     UART1->CR1 |= (uint8_t)Parity;  
        LD        A, S:?b5
        CALL      L:?Subroutine0
//  112 
//  113     /* Clear the LSB mantissa of UART1DIV  */
//  114     UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
??CrossCallReturnLabel_3:
        LD        A, L:0x5232
        CLR       L:0x5232
//  115     /* Clear the MSB mantissa of UART1DIV  */
//  116     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
        LD        A, L:0x5233
        AND       A, #0xf
        LD        L:0x5233, A
//  117     /* Clear the Fraction bits of UART1DIV */
//  118     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
        LD        A, L:0x5233
        AND       A, #0xf0
        LD        L:0x5233, A
//  119 
//  120     /* Set the UART1 BaudRates in BRR1 and BRR2 registers according to UART1_BaudRate value */
//  121     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x4
        CODE
        CALL      L:?mov_l2_l0
        CALL      L:CLK_GetClockFreq
        CALL      L:?mov_l1_l2
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?mov_l3_l0
//  122     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
//  123     /* Set the fraction of UART1DIV  */
//  124     UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
        CALL      L:?Subroutine3
??CrossCallReturnLabel_9:
        CALL      L:?push_l0
        CALL      L:CLK_GetClockFreq
        CALL      L:?Subroutine3
??CrossCallReturnLabel_10:
        CALL      L:?mov_l1_l2
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?pop_l1
        CALL      L:?sub32_l0_l0_l1
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x4
        CODE
        CALL      L:?udiv32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        LD        A, S:?b3
        AND       A, #0xf
        OR        A, L:0x5233
        LD        L:0x5233, A
//  125     /* Set the MSB mantissa of UART1DIV  */
//  126     UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
        LDW       X, S:?w7
        CALL      L:?srl16_x_x_4
        LD        A, XL
        AND       A, #0xf0
        OR        A, L:0x5233
        LD        L:0x5233, A
//  127     /* Set the LSB mantissa of UART1DIV  */
//  128     UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
        LD        A, S:?b15
        OR        A, L:0x5232
        LD        L:0x5232, A
//  129 
//  130     /* Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */
//  131     UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
        LD        A, L:0x5235
        AND       A, #0xf3
        LD        L:0x5235, A
//  132     /* Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
//  133     UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
        LD        A, L:0x5236
        AND       A, #0xf8
        LD        L:0x5236, A
//  134     /* Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
//  135     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
//  136                                               UART1_CR3_CPHA | UART1_CR3_LBCL));  
        LD        A, (0x2,SP)
        AND       A, #0x7
        CALL      L:?Subroutine2
//  137 
//  138     if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
??CrossCallReturnLabel_7:
        LD        A, (0x1,SP)
        BCP       A, #0x4
        JREQ      L:??UART1_Init_0
//  139     {
//  140         /* Set the Transmitter Enable bit */
//  141         UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
        BSET      L:0x5235, #0x3
        JRA       L:??UART1_Init_1
//  142     }
//  143     else
//  144     {
//  145         /* Clear the Transmitter Disable bit */
//  146         UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
??UART1_Init_0:
        BRES      L:0x5235, #0x3
//  147     }
//  148     if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
??UART1_Init_1:
        LD        A, (0x1,SP)
        BCP       A, #0x8
        JREQ      L:??UART1_Init_2
//  149     {
//  150         /* Set the Receiver Enable bit */
//  151         UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
        BSET      L:0x5235, #0x2
        JRA       L:??UART1_Init_3
//  152     }
//  153     else
//  154     {
//  155         /* Clear the Receiver Disable bit */
//  156         UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
??UART1_Init_2:
        BRES      L:0x5235, #0x2
//  157     }
//  158     /* Set the Clock Enable bit, lock Polarity, lock Phase and Last Bit Clock 
//  159            pulse bits according to UART1_Mode value */
//  160     if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
??UART1_Init_3:
        LD        A, (0x2,SP)
        BCP       A, #0x80
        JREQ      L:??UART1_Init_4
//  161     {
//  162         /* Clear the Clock Enable bit */
//  163         UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
        BRES      L:0x5236, #0x3
        JRA       L:??CrossCallReturnLabel_8
//  164     }
//  165     else
//  166     {
//  167         UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
??UART1_Init_4:
        LD        A, (0x2,SP)
        AND       A, #0x8
        CALL      L:?Subroutine2
//  168     }
//  169 }
??CrossCallReturnLabel_8:
        ADD       SP, #0x2
        JP        L:?epilogue_l2_l3

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine3:
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        OR        A, L:0x5236
        LD        L:0x5236, A
        RET
//  170 
//  171 /**
//  172   * @brief  Enable the UART1 peripheral.
//  173   * @param  NewState : The new state of the UART Communication.
//  174   *         This parameter can be any of the @ref FunctionalState enumeration.
//  175   * @retval None
//  176   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  177 void UART1_Cmd(FunctionalState NewState)
//  178 {
//  179     if (NewState != DISABLE)
UART1_Cmd:
        TNZ       A
        JREQ      L:??UART1_Cmd_0
//  180     {
//  181         /* UART1 Enable */
//  182         UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
        BRES      L:0x5234, #0x5
        RET
//  183     }
//  184     else
//  185     {
//  186         /* UART Disable */
//  187         UART1->CR1 |= UART1_CR1_UARTD;  
??UART1_Cmd_0:
        BSET      L:0x5234, #0x5
//  188     }
//  189 }
        RET
//  190 
//  191 /**
//  192   * @brief  Enables or disables the specified USART interrupts.
//  193   * @param  UART1_IT specifies the USART interrupt sources to be enabled or disabled.
//  194   *         This parameter can be one of the following values:
//  195   *         - UART1_IT_TXE:  Tansmit Data Register empty interrupt
//  196   *         - UART1_IT_TC:   Transmission complete interrupt
//  197   *         - UART1_IT_RXNE: Receive Data register not empty interrupt
//  198   *         - UART1_IT_OR: Overrun error interrupt
//  199   *         - UART1_IT_IDLE: Idle line detection interrupt
//  200   *         - USRT1_IT_ERR:  Error interrupt
//  201   * @param  NewState new state of the specified USART interrupts.
//  202   *         This parameter can be: ENABLE or DISABLE.
//  203   * @retval None
//  204   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  205 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
//  206 {
UART1_ITConfig:
        LD        S:?b2, A
//  207     uint8_t uartreg = 0, itpos = 0x00;
//  208     
//  209     /* Check the parameters */
//  210     assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
//  211     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  212 
//  213     /* Get the UART1 register index */
//  214     uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
        CLR       A
        RRWA      X, A
        EXG       A, XL
        LD        S:?b1, A
        EXG       A, XL
//  215     /* Get the UART1 IT index */
//  216     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
        CALL      L:?Subroutine1
//  217 
//  218     if (NewState != DISABLE)
??CrossCallReturnLabel_5:
        TNZ       S:?b2
        JREQ      L:??UART1_ITConfig_0
//  219     {
//  220         /**< Enable the Interrupt bits according to UART1_IT mask */
//  221         if (uartreg == 0x01)
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??UART1_ITConfig_1
//  222         {
//  223             UART1->CR1 |= itpos;
        LD        A, S:?b0
        OR        A, L:0x5234
??UART1_ITConfig_2:
        LD        L:0x5234, A
        RET
//  224         }
//  225         else if (uartreg == 0x02)
??UART1_ITConfig_1:
        CP        A, #0x2
        JRNE      L:??UART1_ITConfig_3
//  226         {
//  227             UART1->CR2 |= itpos;
        LD        A, S:?b0
        OR        A, L:0x5235
??UART1_ITConfig_4:
        LD        L:0x5235, A
        RET
//  228         }
//  229         else
//  230         {
//  231             UART1->CR4 |= itpos;
??UART1_ITConfig_3:
        LD        A, S:?b0
        OR        A, L:0x5237
        JRA       L:??UART1_ITConfig_5
//  232         }
//  233     }
//  234     else
//  235     {
//  236         /**< Disable the interrupt bits according to UART1_IT mask */
//  237         if (uartreg == 0x01)
??UART1_ITConfig_0:
        CPL       S:?b0
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??UART1_ITConfig_6
//  238         {
//  239             UART1->CR1 &= (uint8_t)(~itpos);
        LD        A, S:?b0
        AND       A, L:0x5234
        JRA       L:??UART1_ITConfig_2
//  240         }
//  241         else if (uartreg == 0x02)
??UART1_ITConfig_6:
        CP        A, #0x2
        JRNE      L:??UART1_ITConfig_7
//  242         {
//  243             UART1->CR2 &= (uint8_t)(~itpos);
        LD        A, S:?b0
        AND       A, L:0x5235
        JRA       L:??UART1_ITConfig_4
//  244         }
//  245         else
//  246         {
//  247             UART1->CR4 &= (uint8_t)(~itpos);
??UART1_ITConfig_7:
        LD        A, S:?b0
        AND       A, L:0x5237
??UART1_ITConfig_5:
        LD        L:0x5237, A
//  248         }
//  249     }
//  250 
//  251 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        CALL      L:?Subroutine4
??CrossCallReturnLabel_12:
        EXG       A, XL
        LD        S:?b0, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine4:
        AND       A, #0xf
        CLRW      X
        INCW      X
        JP        L:?sll16_x_x_a
//  252 /**
//  253   * @brief  Enables or disables the UART’s Half Duplex communication.
//  254   * @param  NewState new state of the UART Communication.
//  255   *         This parameter can be: ENABLE or DISABLE.
//  256   * @retval None
//  257   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  258 void UART1_HalfDuplexCmd(FunctionalState NewState)
//  259 {
//  260     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  261 
//  262     if (NewState != DISABLE)
UART1_HalfDuplexCmd:
        TNZ       A
        JREQ      L:??UART1_HalfDuplexCmd_0
//  263     {
//  264         UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
        BSET      L:0x5238, #0x3
        RET
//  265     }
//  266     else
//  267     {
//  268         UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
??UART1_HalfDuplexCmd_0:
        BRES      L:0x5238, #0x3
//  269     }
//  270 }
        RET
//  271 
//  272 /**
//  273   * @brief  Configures the UART’s IrDA interface.
//  274   * @param  UART1_IrDAMode specifies the IrDA mode.
//  275   *         This parameter can be any of the @ref UART1_IrDAMode_TypeDef values.
//  276   * @retval None
//  277   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  278 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
//  279 {
//  280     assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
//  281 
//  282     if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
UART1_IrDAConfig:
        TNZ       A
        JREQ      L:??UART1_IrDAConfig_0
//  283     {
//  284         UART1->CR5 |= UART1_CR5_IRLP;
        BSET      L:0x5238, #0x2
        RET
//  285     }
//  286     else
//  287     {
//  288         UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
??UART1_IrDAConfig_0:
        BRES      L:0x5238, #0x2
//  289     }
//  290 }
        RET
//  291 
//  292 /**
//  293   * @brief  Enables or disables the UART’s IrDA interface.
//  294   * @param  NewState new state of the IrDA mode.
//  295   *         This parameter can be: ENABLE or DISABLE.
//  296   * @retval None
//  297   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  298 void UART1_IrDACmd(FunctionalState NewState)
//  299 {
//  300 
//  301     /* Check parameters */
//  302     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  303 
//  304     if (NewState != DISABLE)
UART1_IrDACmd:
        TNZ       A
        JREQ      L:??UART1_IrDACmd_0
//  305     {
//  306         /* Enable the IrDA mode by setting the IREN bit in the CR3 register */
//  307         UART1->CR5 |= UART1_CR5_IREN;
        BSET      L:0x5238, #0x1
        RET
//  308     }
//  309     else
//  310     {
//  311         /* Disable the IrDA mode by clearing the IREN bit in the CR3 register */
//  312         UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
??UART1_IrDACmd_0:
        BRES      L:0x5238, #0x1
//  313     }
//  314 }
        RET
//  315 
//  316 /**
//  317   * @brief  Sets the UART1 LIN Break detection length.
//  318   * @param  UART1_LINBreakDetectionLength specifies the LIN break detection length.
//  319   *         This parameter can be any of the
//  320   *         @ref UART1_LINBreakDetectionLength_TypeDef values.
//  321   * @retval None
//  322   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  323 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
//  324 {
//  325     assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
//  326 
//  327     if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
UART1_LINBreakDetectionConfig:
        TNZ       A
        JREQ      L:??UART1_LINBreakDetectionConfig_0
//  328     {
//  329         UART1->CR4 |= UART1_CR4_LBDL;
        BSET      L:0x5237, #0x5
        RET
//  330     }
//  331     else
//  332     {
//  333         UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
??UART1_LINBreakDetectionConfig_0:
        BRES      L:0x5237, #0x5
//  334     }
//  335 }
        RET
//  336 
//  337 /**
//  338   * @brief  Enables or disables the UART1’s LIN mode.
//  339   * @param  NewState is new state of the UART1 LIN mode.
//  340   *         This parameter can be: ENABLE or DISABLE.
//  341   * @retval None
//  342   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  343 void UART1_LINCmd(FunctionalState NewState)
//  344 {
//  345     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  346 
//  347     if (NewState != DISABLE)
UART1_LINCmd:
        TNZ       A
        JREQ      L:??UART1_LINCmd_0
//  348     {
//  349         /* Enable the LIN mode by setting the LINE bit in the CR2 register */
//  350         UART1->CR3 |= UART1_CR3_LINEN;
        BSET      L:0x5236, #0x6
        RET
//  351     }
//  352     else
//  353     {
//  354         /* Disable the LIN mode by clearing the LINE bit in the CR2 register */
//  355         UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
??UART1_LINCmd_0:
        BRES      L:0x5236, #0x6
//  356     }
//  357 }
        RET
//  358 /**
//  359   * @brief  Enables or disables the UART1 Smart Card mode.
//  360   * @param  NewState: new state of the Smart Card mode.
//  361   * This parameter can be: ENABLE or DISABLE.
//  362   * @retval None
//  363   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  364 void UART1_SmartCardCmd(FunctionalState NewState)
//  365 {
//  366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  367 
//  368     if (NewState != DISABLE)
UART1_SmartCardCmd:
        TNZ       A
        JREQ      L:??UART1_SmartCardCmd_0
//  369     {
//  370         /* Enable the SC mode by setting the SCEN bit in the CR5 register */
//  371         UART1->CR5 |= UART1_CR5_SCEN;
        BSET      L:0x5238, #0x5
        RET
//  372     }
//  373     else
//  374     {
//  375         /* Disable the SC mode by clearing the SCEN bit in the CR5 register */
//  376         UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
??UART1_SmartCardCmd_0:
        BRES      L:0x5238, #0x5
//  377     }
//  378 }
        RET
//  379 
//  380 /**
//  381   * @brief  Enables or disables NACK transmission.
//  382   * @note   This function is valid only for UART1 because is related to SmartCard mode.
//  383   * @param  NewState: new state of the Smart Card mode.
//  384   *         This parameter can be: ENABLE or DISABLE.
//  385   * @retval None
//  386   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  387 void UART1_SmartCardNACKCmd(FunctionalState NewState)
//  388 {
//  389     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  390 
//  391     if (NewState != DISABLE)
UART1_SmartCardNACKCmd:
        TNZ       A
        JREQ      L:??UART1_SmartCardNACKCmd_0
//  392     {
//  393         /* Enable the NACK transmission by setting the NACK bit in the CR5 register */
//  394         UART1->CR5 |= UART1_CR5_NACK;
        BSET      L:0x5238, #0x4
        RET
//  395     }
//  396     else
//  397     {
//  398         /* Disable the NACK transmission by clearing the NACK bit in the CR5 register */
//  399         UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
??UART1_SmartCardNACKCmd_0:
        BRES      L:0x5238, #0x4
//  400     }
//  401 }
        RET
//  402 
//  403 /**
//  404   * @brief  Selects the UART1 WakeUp method.
//  405   * @param  UART1_WakeUp: specifies the UART1 wakeup method.
//  406   *         This parameter can be any of the @ref UART1_WakeUp_TypeDef values.
//  407   * @retval None
//  408   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  409 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
//  410 {
//  411     assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
//  412 
//  413     UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
UART1_WakeUpConfig:
        BRES      L:0x5234, #0x3
//  414     UART1->CR1 |= (uint8_t)UART1_WakeUp;
        CALL      L:?Subroutine0
//  415 }
??CrossCallReturnLabel_1:
        RET
//  416 /**
//  417   * @brief  Determines if the UART1 is in mute mode or not.
//  418   * @param  NewState: new state of the UART1 mode.
//  419   *         This parameter can be: ENABLE or DISABLE.
//  420   * @retval None
//  421   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  422 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
//  423 {
//  424     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  425 
//  426     if (NewState != DISABLE)
UART1_ReceiverWakeUpCmd:
        TNZ       A
        JREQ      L:??UART1_ReceiverWakeUpCmd_0
//  427     {
//  428         /* Enable the mute mode UART1 by setting the RWU bit in the CR2 register */
//  429         UART1->CR2 |= UART1_CR2_RWU;
        BSET      L:0x5235, #0x1
        RET
//  430     }
//  431     else
//  432     {
//  433         /* Disable the mute mode UART1 by clearing the RWU bit in the CR1 register */
//  434         UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
??UART1_ReceiverWakeUpCmd_0:
        BRES      L:0x5235, #0x1
//  435     }
//  436 }
        RET
//  437 
//  438 /**
//  439   * @brief  Returns the most recent received data by the UART1 peripheral.
//  440   * @param  None
//  441   * @retval The received data.
//  442   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  443 uint8_t UART1_ReceiveData8(void)
//  444 {
//  445     return ((uint8_t)UART1->DR);
UART1_ReceiveData8:
        LD        A, L:0x5231
        RET
//  446 }
//  447 
//  448 /**
//  449   * @brief  Returns the most recent received data by the UART1 peripheral.
//  450   * @param  None
//  451   * @retval The received data.
//  452   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  453 uint16_t UART1_ReceiveData9(void)
//  454 {
//  455   uint16_t temp = 0;
//  456   
//  457   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
UART1_ReceiveData9:
        LD        A, L:0x5234
//  458   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
        CLRW      X
        LD        XL, A
        RRWA      X, A
        AND       A, #0x80
        RLWA      X, A
        SLLW      X
        LD        A, L:0x5231
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, X
        LDW       X, Y
        RLWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
//  459 }
//  460 
//  461 /**
//  462   * @brief  Transmits 8 bit data through the UART1 peripheral.
//  463   * @param  Data: The data to transmit.
//  464   * @retval None
//  465   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  466 void UART1_SendData8(uint8_t Data)
//  467 {
//  468     /* Transmit Data */
//  469     UART1->DR = Data;
UART1_SendData8:
        LD        L:0x5231, A
//  470 }
        RET
//  471 
//  472 /**
//  473   * @brief  Transmits 9 bit data through the UART peripheral.
//  474   * @param  Data : The data to transmit.
//  475   *         This parameter should be lower than 0x1FF.
//  476   * @retval None
//  477   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  478 void UART1_SendData9(uint16_t Data)
//  479 {
UART1_SendData9:
        LDW       Y, X
//  480     /**< Clear the transmit data bit 8 [8]  */
//  481     UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
        BRES      L:0x5234, #0x6
//  482     /**< Write the transmit data bit [8]  */
//  483     UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
        SRLW      X
        SRLW      X
        LD        A, XL
        AND       A, #0x40
        CALL      L:?Subroutine0
//  484     /**< Write the transmit data bit [0:7] */
//  485     UART1->DR   = (uint8_t)(Data);
??CrossCallReturnLabel_0:
        LD        A, YL
        LD        L:0x5231, A
//  486 }
        RET
//  487 
//  488 /**
//  489   * @brief  Transmits break characters.
//  490   * @param  None
//  491   * @retval None
//  492   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  493 void UART1_SendBreak(void)
//  494 {
//  495     UART1->CR2 |= UART1_CR2_SBK;
UART1_SendBreak:
        BSET      L:0x5235, #0x0
//  496 }
        RET
//  497 
//  498 /**
//  499   * @brief  Sets the address of the UART1 node.
//  500   * @param  UART1_Address: Indicates the address of the UART1 node.
//  501   * @retval None
//  502   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  503 void UART1_SetAddress(uint8_t UART1_Address)
//  504 {
UART1_SetAddress:
        LD        S:?b0, A
//  505     /*assert_param for UART1_Address*/
//  506     assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
//  507 
//  508     /* Clear the UART1 address */
//  509     UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
        LD        A, L:0x5237
        AND       A, #0xf0
        LD        L:0x5237, A
//  510     /* Set the UART1 address node */
//  511     UART1->CR4 |= UART1_Address;
        LD        A, S:?b0
        OR        A, L:0x5237
        LD        L:0x5237, A
//  512 }
        RET
//  513 
//  514 /**
//  515   * @brief  Sets the specified UART guard time.
//  516   * @note   SmartCard Mode should be Enabled
//  517   * @param  UART1_GuardTime: specifies the guard time.
//  518   * @retval None
//  519   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  520 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
//  521 {
//  522     /* Set the UART1 guard time */
//  523     UART1->GTR = UART1_GuardTime;
UART1_SetGuardTime:
        LD        L:0x5239, A
//  524 }
        RET
//  525 
//  526 /**
//  527   * @brief  Sets the system clock prescaler.
//  528   * @note   IrDA Low Power mode or smartcard mode should be enabled
//  529   * @note   This function is related to SmartCard and IrDa mode.
//  530   * @param  UART1_Prescaler: specifies the prescaler clock.
//  531   *         This parameter can be one of the following values:
//  532   *         @par IrDA Low Power Mode
//  533   *         The clock source is divided by the value given in the register (8 bits)
//  534   *         - 0000 0000 Reserved
//  535   *         - 0000 0001 divides the clock source by 1
//  536   *         - 0000 0010 divides the clock source by 2
//  537   *         - ...........................................................
//  538   *        @par Smart Card Mode
//  539   *        The clock source is divided by the value given in the register
//  540   *        (5 significant bits) multiplied by 2
//  541   *         - 0 0000 Reserved
//  542   *         - 0 0001 divides the clock source by 2
//  543   *         - 0 0010 divides the clock source by 4
//  544   *         - 0 0011 divides the clock source by 6
//  545   *         - ...........................................................
//  546   * @retval None
//  547   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  548 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
//  549 {
//  550     /* Load the UART1 prescaler value*/
//  551     UART1->PSCR = UART1_Prescaler;
UART1_SetPrescaler:
        LD        L:0x523a, A
//  552 }
        RET
//  553 
//  554 /**
//  555   * @brief  Checks whether the specified UART1 flag is set or not.
//  556   * @param  UART1_FLAG specifies the flag to check.
//  557   *         This parameter can be any of the @ref UART1_Flag_TypeDef enumeration.
//  558   * @retval FlagStatus (SET or RESET)
//  559   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  560 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
//  561 {
//  562     FlagStatus status = RESET;
//  563 
//  564     /* Check parameters */
//  565     assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
//  566 
//  567 
//  568     /* Check the status of the specified UART1 flag*/
//  569     if (UART1_FLAG == UART1_FLAG_LBDF)
UART1_GetFlagStatus:
        CPW       X, #0x210
        JRNE      L:??UART1_GetFlagStatus_0
//  570     {
//  571         if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
        BTJF      L:0x5237, #0x4, L:??UART1_GetFlagStatus_1
//  572         {
//  573             /* UART1_FLAG is set*/
//  574             status = SET;
??UART1_GetFlagStatus_2:
        LD        A, #0x1
//  575         }
//  576         else
//  577         {
//  578             /* UART1_FLAG is reset*/
//  579             status = RESET;
//  580         }
//  581     }
//  582     else if (UART1_FLAG == UART1_FLAG_SBK)
//  583     {
//  584         if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
//  585         {
//  586             /* UART1_FLAG is set*/
//  587             status = SET;
//  588         }
//  589         else
//  590         {
//  591             /* UART1_FLAG is reset*/
//  592             status = RESET;
//  593         }
//  594     }
//  595     else
//  596     {
//  597         if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
//  598         {
//  599             /* UART1_FLAG is set*/
//  600             status = SET;
//  601         }
//  602         else
//  603         {
//  604             /* UART1_FLAG is reset*/
//  605             status = RESET;
//  606         }
//  607     }
//  608     /* Return the UART1_FLAG status*/
//  609     return status;
        RET
??UART1_GetFlagStatus_0:
        CPW       X, #0x101
        JRNE      L:??UART1_GetFlagStatus_3
        BTJT      L:0x5235, #0x0, L:??UART1_GetFlagStatus_2
??UART1_GetFlagStatus_1:
        CLR       A
        RET
??UART1_GetFlagStatus_3:
        LD        A, XL
        BCP       A, L:0x5230
        JRNE      L:??UART1_GetFlagStatus_2
        JRA       L:??UART1_GetFlagStatus_1
//  610 }
//  611 
//  612 /**
//  613   * @brief  Clears the UART1 flags.
//  614   * @param  UART1_FLAG specifies the flag to clear
//  615   *         This parameter can be any combination of the following values:
//  616   *         - UART1_FLAG_LBDF: LIN Break detection flag.
//  617   *         - UART1_FLAG_RXNE: Receive data register not empty flag.
//  618   * @note
//  619   *         - PE (Parity error), FE (Framing error), NE (Noise error), 
//  620   *         OR (OverRun error) and IDLE (Idle line detected) flags are 
//  621   *         cleared by software sequence: a read operation to UART1_SR register
//  622   *         (UART1_GetFlagStatus())followed by a read operation to UART1_DR 
//  623   *         register(UART1_ReceiveData8() or UART1_ReceiveData9()).
//  624   *           
//  625   *         - RXNE flag can be also cleared by a read to the UART1_DR register
//  626   *         (UART1_ReceiveData8()or UART1_ReceiveData9()).
//  627   *           
//  628   *         - TC flag can be also cleared by software sequence: a read operation
//  629   *         to UART1_SR register (UART1_GetFlagStatus()) followed by a write 
//  630   *         operation to UART1_DR register (UART1_SendData8() or UART1_SendData9()).
//  631   *           
//  632   *         - TXE flag is cleared only by a write to the UART1_DR register 
//  633   *         (UART1_SendData8() or UART1_SendData9()).
//  634   *           
//  635   *         - SBK flag is cleared during the stop bit of break.
//  636   * @retval None
//  637   */
//  638 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  639 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
//  640 {
//  641     assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
//  642 
//  643     /* Clear the Receive Register Not Empty flag */
//  644     if (UART1_FLAG == UART1_FLAG_RXNE)
UART1_ClearFlag:
        CPW       X, #0x20
        JRNE      L:??UART1_ClearFlag_0
//  645     {
//  646         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
        MOV       L:0x5230, #0xdf
        RET
//  647     }
//  648     /* Clear the LIN Break Detection flag */
//  649     else
//  650     {
//  651         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
??UART1_ClearFlag_0:
        BRES      L:0x5237, #0x4
//  652     }
//  653 }
        RET
//  654 
//  655 /**
//  656   * @brief  Checks whether the specified UART1 interrupt has occurred or not.
//  657   * @param  UART1_IT: Specifies the UART1 interrupt pending bit to check.
//  658   *         This parameter can be one of the following values:
//  659   *         - UART1_IT_LBDF:  LIN Break detection interrupt
//  660   *         - UART1_IT_TXE:  Tansmit Data Register empty interrupt
//  661   *         - UART1_IT_TC:   Transmission complete interrupt
//  662   *         - UART1_IT_RXNE: Receive Data register not empty interrupt
//  663   *         - UART1_IT_IDLE: Idle line detection interrupt
//  664   *         - UART1_IT_OR:  OverRun Error interrupt
//  665   *         - UART1_IT_PE:   Parity Error interrupt
//  666   * @retval The new state of UART1_IT (SET or RESET).
//  667   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  668 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
//  669 {
UART1_GetITStatus:
        LDW       Y, X
//  670     ITStatus pendingbitstatus = RESET;
//  671     uint8_t itpos = 0;
//  672     uint8_t itmask1 = 0;
//  673     uint8_t itmask2 = 0;
//  674     uint8_t enablestatus = 0;
//  675 
//  676     /* Check parameters */
//  677     assert_param(IS_UART1_GET_IT_OK(UART1_IT));
//  678 
//  679     /* Get the UART1 IT index */
//  680     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
        LD        A, YL
        CALL      L:?Subroutine1
//  681     /* Get the UART1 IT index */
//  682     itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
//  683     /* Set the IT mask*/
//  684     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
??CrossCallReturnLabel_4:
        LD        A, YL
        SWAP      A
        CALL      L:?Subroutine4
??CrossCallReturnLabel_11:
        LD        A, XL
//  685 
//  686 
//  687     /* Check the status of the specified UART1 pending bit*/
//  688     if (UART1_IT == UART1_IT_PE)
        CPW       Y, #0x100
        JRNE      L:??UART1_GetITStatus_0
//  689     {
//  690         /* Get the UART1_IT enable bit status*/
//  691         enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
        AND       A, L:0x5234
        LD        S:?b1, A
//  692         /* Check the status of the specified UART1 interrupt*/
//  693 
//  694         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, S:?b0
        BCP       A, L:0x5230
        JREQ      L:??UART1_GetITStatus_1
??UART1_GetITStatus_2:
        TNZ       S:?b1
        JREQ      L:??UART1_GetITStatus_1
//  695         {
//  696             /* Interrupt occurred*/
//  697             pendingbitstatus = SET;
        LD        A, #0x1
//  698         }
//  699         else
//  700         {
//  701             /* Interrupt not occurred*/
//  702             pendingbitstatus = RESET;
//  703         }
//  704     }
//  705 
//  706     else if (UART1_IT == UART1_IT_LBDF)
//  707     {
//  708         /* Get the UART1_IT enable bit status*/
//  709         enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
//  710         /* Check the status of the specified UART1 interrupt*/
//  711         if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
//  712         {
//  713             /* Interrupt occurred*/
//  714             pendingbitstatus = SET;
//  715         }
//  716         else
//  717         {
//  718             /* Interrupt not occurred*/
//  719             pendingbitstatus = RESET;
//  720         }
//  721     }
//  722     else
//  723     {
//  724         /* Get the UART1_IT enable bit status*/
//  725         enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
//  726         /* Check the status of the specified UART1 interrupt*/
//  727         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
//  728         {
//  729             /* Interrupt occurred*/
//  730             pendingbitstatus = SET;
//  731         }
//  732         else
//  733         {
//  734             /* Interrupt not occurred*/
//  735             pendingbitstatus = RESET;
//  736         }
//  737     }
//  738 
//  739     /* Return the UART1_IT status*/
//  740     return  pendingbitstatus;
        RET
??UART1_GetITStatus_0:
        CPW       Y, #0x346
        JRNE      L:??UART1_GetITStatus_3
        AND       A, L:0x5237
        LD        S:?b1, A
        LD        A, S:?b0
        BCP       A, L:0x5237
        JRNE      L:??UART1_GetITStatus_2
??UART1_GetITStatus_1:
        CLR       A
        RET
??UART1_GetITStatus_3:
        AND       A, L:0x5235
        LD        S:?b1, A
        LD        A, S:?b0
        BCP       A, L:0x5230
        JRNE      L:??UART1_GetITStatus_2
        JRA       L:??UART1_GetITStatus_1
//  741 }
//  742 
//  743 /**
//  744   * @brief  Clears the UART1 pending flags.
//  745   * @param  UART1_IT specifies the pending bit to clear
//  746   *         This parameter can be one of the following values:
//  747   *         - UART1_IT_LBDF:  LIN Break detection interrupt
//  748   *         - UART1_IT_RXNE: Receive Data register not empty interrupt.
//  749   * @note
//  750   *         - PE (Parity error), FE (Framing error), NE (Noise error), 
//  751   *           OR (OverRun error) and IDLE (Idle line detected) pending bits are 
//  752   *           cleared by software sequence: a read operation to UART1_SR register
//  753   *           (UART1_GetITStatus()) followed by a read operation to UART1_DR register
//  754   *           (UART1_ReceiveData8() or UART1_ReceiveData9()).
//  755   *   
//  756   *         - RXNE pending bit can be also cleared by a read to the UART1_DR register
//  757   *           (UART1_ReceiveData8() or UART1_ReceiveData9()).
//  758   * 
//  759   *         - TC (Transmit complete) pending bit can be cleared by software 
//  760   *           sequence: a read operation to UART1_SR register (UART1_GetITStatus())
//  761   *           followed by a write operation to UART1_DR register (UART1_SendData8()
//  762   *           or UART1_SendData9()).
//  763   *             
//  764   *         - TXE pending bit is cleared only by a write to the UART1_DR register
//  765   *           (UART1_SendData8() or UART1_SendData9()).
//  766   * @retval None
//  767   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  768 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
//  769 {
//  770     assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
//  771 
//  772     /* Clear the Receive Register Not Empty pending bit */
//  773     if (UART1_IT == UART1_IT_RXNE)
UART1_ClearITPendingBit:
        CPW       X, #0x255
        JRNE      L:??UART1_ClearITPendingBit_0
//  774     {
//  775         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
        MOV       L:0x5230, #0xdf
        RET
//  776     }
//  777     /* Clear the LIN Break Detection pending bit */
//  778     else
//  779     {
//  780         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
??UART1_ClearITPendingBit_0:
        BRES      L:0x5237, #0x4
//  781     }
//  782 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  783 
//  784 /**
//  785   * @}
//  786   */
//  787   
//  788 /**
//  789   * @}
//  790   */
//  791   
//  792 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 743 bytes in section .near_func.text
// 
// 743 bytes of CODE memory
//
//Errors: none
//Warnings: none
