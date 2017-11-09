///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:29 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_uart3.c        /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_uart3.c -e     /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_uart3.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_uart3

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
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

        PUBLIC UART3_ClearFlag
        PUBLIC UART3_ClearITPendingBit
        PUBLIC UART3_Cmd
        PUBLIC UART3_DeInit
        PUBLIC UART3_GetFlagStatus
        PUBLIC UART3_GetITStatus
        PUBLIC UART3_ITConfig
        PUBLIC UART3_Init
        PUBLIC UART3_LINBreakDetectionConfig
        PUBLIC UART3_LINCmd
        PUBLIC UART3_LINConfig
        PUBLIC UART3_ReceiveData8
        PUBLIC UART3_ReceiveData9
        PUBLIC UART3_ReceiverWakeUpCmd
        PUBLIC UART3_SendBreak
        PUBLIC UART3_SendData8
        PUBLIC UART3_SendData9
        PUBLIC UART3_SetAddress
        PUBLIC UART3_WakeUpConfig

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_uart3.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8s_uart3.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the uart3 peripheral.
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
//   23 #include "stm8s_uart3.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 
//   34 /* Private functions ---------------------------------------------------------*/
//   35 /* Public functions ----------------------------------------------------------*/
//   36 
//   37 /** @}
//   38   * @addtogroup UART3_Public_Functions
//   39   * @{
//   40   */
//   41 
//   42 /**
//   43   * @brief  Deinitializes the UART peripheral.
//   44   * @param  None
//   45   * @retval None
//   46   */
//   47 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   48 void UART3_DeInit(void)
//   49 {
//   50     /* Clear the Idle Line Detected bit in the status rerister by a read
//   51        to the UART3_SR register followed by a Read to the UART3_DR register */
//   52     (void) UART3->SR;
UART3_DeInit:
        LD        A, L:0x5240
//   53     (void) UART3->DR;
        LD        A, L:0x5241
//   54 
//   55     UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
        CLR       L:0x5243
//   56     UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
        CLR       L:0x5242
//   57 
//   58     UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
        CLR       L:0x5244
//   59     UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
        CLR       L:0x5245
//   60     UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
        CLR       L:0x5246
//   61     UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
        CLR       L:0x5247
//   62     UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
        CLR       L:0x5249
//   63 
//   64 }
        RET
//   65 
//   66 /**
//   67   * @brief  Initializes the UART3 according to the specified parameters.
//   68   * @param  BaudRate: The baudrate.
//   69   * @param  WordLength : This parameter can be any of 
//   70   *         the @ref UART3_WordLength_TypeDef enumeration.
//   71   * @param  StopBits: This parameter can be any of the 
//   72   *         @ref UART3_StopBits_TypeDef enumeration.
//   73   * @param  Parity: This parameter can be any of the 
//   74   *         @ref UART3_Parity_TypeDef enumeration.
//   75   * @param  Mode: This parameter can be any of the @ref UART3_Mode_TypeDef values
//   76   * @retval None
//   77   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        OR        A, L:0x5244
        LD        L:0x5244, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   78 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
//   79                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
//   80                 UART3_Mode_TypeDef Mode)
//   81 {
UART3_Init:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSH      S:?b6
//   82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
//   83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
//   84 
//   85         /* Check the parameters */
//   86     assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
//   87     assert_param(IS_UART3_STOPBITS_OK(StopBits));
//   88     assert_param(IS_UART3_PARITY_OK(Parity));
//   89     assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
//   90     assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
//   91 
//   92     /* Clear the word length bit */
//   93     UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
        BRES      L:0x5244, #0x4
//   94     /* Set the word length bit according to UART3_WordLength value */
//   95     UART3->CR1 |= (uint8_t)WordLength; 
        CALL      L:?Subroutine0
//   96 
//   97     /* Clear the STOP bits */
//   98     UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
??CrossCallReturnLabel_2:
        LD        A, L:0x5246
        AND       A, #0xcf
        LD        L:0x5246, A
//   99     /* Set the STOP bits number according to UART3_StopBits value  */
//  100     UART3->CR3 |= (uint8_t)StopBits;  
        LD        A, S:?b4
        OR        A, L:0x5246
        LD        L:0x5246, A
//  101 
//  102     /* Clear the Parity Control bit */
//  103     UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
        LD        A, L:0x5244
        AND       A, #0xf9
        LD        L:0x5244, A
//  104     /* Set the Parity Control bit to UART3_Parity value */
//  105     UART3->CR1 |= (uint8_t)Parity;     
        LD        A, S:?b5
        CALL      L:?Subroutine0
//  106 
//  107     /* Clear the LSB mantissa of UART3DIV  */
//  108     UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
??CrossCallReturnLabel_3:
        LD        A, L:0x5242
        CLR       L:0x5242
//  109     /* Clear the MSB mantissa of UART3DIV  */
//  110     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
        LD        A, L:0x5243
        AND       A, #0xf
        LD        L:0x5243, A
//  111     /* Clear the Fraction bits of UART3DIV */
//  112     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
        LD        A, L:0x5243
        AND       A, #0xf0
        LD        L:0x5243, A
//  113 
//  114     /* Set the UART3 BaudRates in BRR1 and BRR2 registers according to UART3_BaudRate value */
//  115     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x4
        CODE
        CALL      L:?mov_l2_l0
        CALL      L:CLK_GetClockFreq
        CALL      L:?mov_l1_l2
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?mov_l3_l0
//  116     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
//  117     /* The fraction and MSB mantissa should be loaded in one step in the BRR2 register */
//  118     /* Set the fraction of UART3DIV  */
//  119     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
//  120                         << 4) / 100) & (uint8_t)0x0F); 
//  121     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
//  122 
//  123     UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
        CALL      L:?Subroutine2
??CrossCallReturnLabel_6:
        CALL      L:?push_l0
        CALL      L:CLK_GetClockFreq
        CALL      L:?Subroutine2
??CrossCallReturnLabel_7:
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
        PUSH      A
        LDW       X, S:?w7
        CALL      L:?srl16_x_x_4
        LD        A, XL
        AND       A, #0xf0
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x5243, A
//  124     /* Set the LSB mantissa of UART3DIV  */
//  125     UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
        LD        A, S:?b15
        LD        L:0x5242, A
//  126 
//  127     if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
        LD        A, (0x1,SP)
        BCP       A, #0x4
        JREQ      L:??UART3_Init_0
//  128     {
//  129         /* Set the Transmitter Enable bit */
//  130         UART3->CR2 |= UART3_CR2_TEN;  
        BSET      L:0x5245, #0x3
        JRA       L:??UART3_Init_1
//  131     }
//  132     else
//  133     {
//  134         /* Clear the Transmitter Disable bit */
//  135         UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
??UART3_Init_0:
        BRES      L:0x5245, #0x3
//  136     }
//  137     if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
??UART3_Init_1:
        LD        A, (0x1,SP)
        BCP       A, #0x8
        JREQ      L:??UART3_Init_2
//  138     {
//  139         /* Set the Receiver Enable bit */
//  140         UART3->CR2 |= UART3_CR2_REN;  
        BSET      L:0x5245, #0x2
        JRA       L:??UART3_Init_3
//  141     }
//  142     else
//  143     {
//  144         /* Clear the Receiver Disable bit */
//  145         UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
??UART3_Init_2:
        BRES      L:0x5245, #0x2
//  146     }
//  147 }
??UART3_Init_3:
        ADD       SP, #0x1
        JP        L:?epilogue_l2_l3

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        RET
//  148 
//  149 /**
//  150   * @brief  Enable the UART1 peripheral.
//  151   * @param  NewState : The new state of the UART Communication.
//  152   *         This parameter can be any of the @ref FunctionalState enumeration.
//  153   * @retval None
//  154   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  155 void UART3_Cmd(FunctionalState NewState)
//  156 {
//  157 
//  158     if (NewState != DISABLE)
UART3_Cmd:
        TNZ       A
        JREQ      L:??UART3_Cmd_0
//  159     {
//  160         /* UART3 Enable */
//  161         UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
        BRES      L:0x5244, #0x5
        RET
//  162     }
//  163     else
//  164     {
//  165         /* UART3 Disable */
//  166         UART3->CR1 |= UART3_CR1_UARTD;  
??UART3_Cmd_0:
        BSET      L:0x5244, #0x5
//  167     }
//  168 }
        RET
//  169 
//  170 /**
//  171   * @brief  Enables or disables the specified UART3 interrupts.
//  172   * @param  UART3_IT specifies the UART3 interrupt sources to be enabled or disabled.
//  173   *         This parameter can be one of the following values:
//  174   *         - UART3_IT_LBDF:  LIN Break detection interrupt
//  175   *         - UART3_IT_LHDF:  LIN Break detection interrupt
//  176   *         - UART3_IT_TXE:  Tansmit Data Register empty interrupt
//  177   *         - UART3_IT_TC:   Transmission complete interrupt
//  178   *         - UART3_IT_RXNE_OR: Receive Data register not empty/Over run error interrupt
//  179   *         - UART3_IT_IDLE: Idle line detection interrupt
//  180   *         - UART3_IT_PE:   Parity Error interrupt
//  181   * @param  NewState new state of the specified UART3 interrupts.
//  182   *         This parameter can be: ENABLE or DISABLE.
//  183   * @retval None
//  184   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  185 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
//  186 {
UART3_ITConfig:
        LD        S:?b2, A
//  187     uint8_t uartreg = 0, itpos = 0x00;
//  188     
//  189     /* Check the parameters */
//  190     assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
//  191     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  192 
//  193     /* Get the UART3 register index */
//  194     uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
        CLR       A
        RRWA      X, A
        EXG       A, XL
        LD        S:?b1, A
        EXG       A, XL
//  195 
//  196     /* Get the UART3 IT index */
//  197     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
        CALL      L:?Subroutine1
//  198 
//  199     if (NewState != DISABLE)
??CrossCallReturnLabel_5:
        TNZ       S:?b2
        JREQ      L:??UART3_ITConfig_0
//  200     {
//  201         /* Enable the Interrupt bits according to UART3_IT mask */
//  202         if (uartreg == 0x01)
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??UART3_ITConfig_1
//  203         {
//  204             UART3->CR1 |= itpos;
        LD        A, S:?b0
        OR        A, L:0x5244
??UART3_ITConfig_2:
        LD        L:0x5244, A
        RET
//  205         }
//  206         else if (uartreg == 0x02)
??UART3_ITConfig_1:
        CP        A, #0x2
        JRNE      L:??UART3_ITConfig_3
//  207         {
//  208             UART3->CR2 |= itpos;
        LD        A, S:?b0
        OR        A, L:0x5245
??UART3_ITConfig_4:
        LD        L:0x5245, A
        RET
//  209         }
//  210         else if (uartreg == 0x03)
??UART3_ITConfig_3:
        CP        A, #0x3
        JRNE      L:??UART3_ITConfig_5
//  211         {
//  212             UART3->CR4 |= itpos;
        LD        A, S:?b0
        OR        A, L:0x5247
??UART3_ITConfig_6:
        LD        L:0x5247, A
        RET
//  213         }
//  214         else
//  215         {
//  216             UART3->CR6 |= itpos;
??UART3_ITConfig_5:
        LD        A, S:?b0
        OR        A, L:0x5249
        JRA       L:??UART3_ITConfig_7
//  217         }
//  218     }
//  219     else
//  220     {
//  221         /* Disable the interrupt bits according to UART3_IT mask */
//  222         if (uartreg == 0x01)
??UART3_ITConfig_0:
        CPL       S:?b0
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??UART3_ITConfig_8
//  223         {
//  224             UART3->CR1 &= (uint8_t)(~itpos);
        LD        A, S:?b0
        AND       A, L:0x5244
        JRA       L:??UART3_ITConfig_2
//  225         }
//  226         else if (uartreg == 0x02)
??UART3_ITConfig_8:
        CP        A, #0x2
        JRNE      L:??UART3_ITConfig_9
//  227         {
//  228             UART3->CR2 &= (uint8_t)(~itpos);
        LD        A, S:?b0
        AND       A, L:0x5245
        JRA       L:??UART3_ITConfig_4
//  229         }
//  230         else if (uartreg == 0x03)
??UART3_ITConfig_9:
        CP        A, #0x3
        JRNE      L:??UART3_ITConfig_10
//  231         {
//  232             UART3->CR4 &= (uint8_t)(~itpos);
        LD        A, S:?b0
        AND       A, L:0x5247
        JRA       L:??UART3_ITConfig_6
//  233         }
//  234         else
//  235         {
//  236             UART3->CR6 &= (uint8_t)(~itpos);
??UART3_ITConfig_10:
        LD        A, S:?b0
        AND       A, L:0x5249
??UART3_ITConfig_7:
        LD        L:0x5249, A
//  237         }
//  238     }
//  239 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        CALL      L:?Subroutine3
??CrossCallReturnLabel_9:
        EXG       A, XL
        LD        S:?b0, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine3:
        AND       A, #0xf
        CLRW      X
        INCW      X
        JP        L:?sll16_x_x_a
//  240 
//  241 /**
//  242   * @brief  Sets the UART3 LIN Break detection length.
//  243   * @param  UART3_LINBreakDetectionLength specifies the LIN break detection length.
//  244   *         This parameter can be any of the 
//  245   *         @ref UART3_LINBreakDetectionLength_TypeDef values.
//  246   * @retval None
//  247   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  248 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
//  249 {
//  250     /* Check the parameters */
//  251     assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
//  252 
//  253     if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
UART3_LINBreakDetectionConfig:
        TNZ       A
        JREQ      L:??UART3_LINBreakDetectionConfig_0
//  254     {
//  255         UART3->CR4 |= UART3_CR4_LBDL;
        BSET      L:0x5247, #0x5
        RET
//  256     }
//  257     else
//  258     {
//  259         UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
??UART3_LINBreakDetectionConfig_0:
        BRES      L:0x5247, #0x5
//  260     }
//  261 }
        RET
//  262 
//  263 /**
//  264   * @brief  Configure the UART3 peripheral.
//  265   * @param  UART3_Mode specifies the LIN mode.
//  266   *         This parameter can be any of the @ref UART3_LinMode_TypeDef values.
//  267   * @param  UART3_Autosync specifies the LIN automatic resynchronization mode.
//  268   *         This parameter can be any of the @ref UART3_LinAutosync_TypeDef values.
//  269   * @param  UART3_DivUp specifies the LIN divider update method.
//  270   *         This parameter can be any of the @ref UART3_LinDivUp_TypeDef values.
//  271   * @retval None
//  272   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  273 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
//  274                      UART3_LinAutosync_TypeDef UART3_Autosync, 
//  275                      UART3_LinDivUp_TypeDef UART3_DivUp)
//  276 {
//  277     /* Check the parameters */
//  278     assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
//  279     assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
//  280     assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
//  281 
//  282     if (UART3_Mode != UART3_LIN_MODE_MASTER)
UART3_LINConfig:
        TNZ       A
        JREQ      L:??UART3_LINConfig_0
//  283     {
//  284         UART3->CR6 |=  UART3_CR6_LSLV;
        BSET      L:0x5249, #0x5
        JRA       L:??UART3_LINConfig_1
//  285     }
//  286     else
//  287     {
//  288         UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
??UART3_LINConfig_0:
        BRES      L:0x5249, #0x5
//  289     }
//  290 
//  291     if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
??UART3_LINConfig_1:
        TNZ       S:?b0
        JREQ      L:??UART3_LINConfig_2
//  292     {
//  293         UART3->CR6 |=  UART3_CR6_LASE ;
        BSET      L:0x5249, #0x4
        JRA       L:??UART3_LINConfig_3
//  294     }
//  295     else
//  296     {
//  297         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
??UART3_LINConfig_2:
        BRES      L:0x5249, #0x4
//  298     }
//  299 
//  300     if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
??UART3_LINConfig_3:
        TNZ       S:?b1
        JREQ      L:??UART3_LINConfig_4
//  301     {
//  302         UART3->CR6 |=  UART3_CR6_LDUM;
        BSET      L:0x5249, #0x7
        RET
//  303     }
//  304     else
//  305     {
//  306         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
??UART3_LINConfig_4:
        BRES      L:0x5249, #0x7
//  307     }
//  308 }
        RET
//  309 
//  310 /**
//  311   * @brief  Enables or disables the UART3 LIN mode.
//  312   * @param  NewState is new state of the UART3 LIN mode.
//  313   *         This parameter can be ENABLE or DISABLE
//  314   * @retval None
//  315   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  316 void UART3_LINCmd(FunctionalState NewState)
//  317 {
//  318     /* Check the parameters */
//  319     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  320 
//  321     if (NewState != DISABLE)
UART3_LINCmd:
        TNZ       A
        JREQ      L:??UART3_LINCmd_0
//  322     {
//  323         /* Enable the LIN mode by setting the LINE bit in the CR2 register */
//  324         UART3->CR3 |= UART3_CR3_LINEN;
        BSET      L:0x5246, #0x6
        RET
//  325     }
//  326     else
//  327     {
//  328         /* Disable the LIN mode by clearing the LINE bit in the CR2 register */
//  329         UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
??UART3_LINCmd_0:
        BRES      L:0x5246, #0x6
//  330     }
//  331 }
        RET
//  332 
//  333 /**
//  334   * @brief  Selects the UART3 WakeUp method.
//  335   * @param  UART3_WakeUp: specifies the UART3 wakeup method.
//  336   *         This parameter can be any of the @ref UART3_WakeUp_TypeDef values.
//  337   * @retval None
//  338   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  339 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
//  340 {
//  341     /* Check the parameters */
//  342     assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
//  343 
//  344     UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
UART3_WakeUpConfig:
        BRES      L:0x5244, #0x3
//  345     UART3->CR1 |= (uint8_t)UART3_WakeUp;
        CALL      L:?Subroutine0
//  346 }
??CrossCallReturnLabel_1:
        RET
//  347 
//  348 /**
//  349   * @brief  Determines if the UART3 is in mute mode or not.
//  350   * @param  NewState: new state of the UART3 mode.
//  351   *         This parameter can be ENABLE or DISABLE
//  352   * @retval None
//  353   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  354 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
//  355 {
//  356     /* Check the parameters */
//  357     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  358 
//  359     if (NewState != DISABLE)
UART3_ReceiverWakeUpCmd:
        TNZ       A
        JREQ      L:??UART3_ReceiverWakeUpCmd_0
//  360     {
//  361         /* Enable the mute mode UART3 by setting the RWU bit in the CR2 register */
//  362         UART3->CR2 |= UART3_CR2_RWU;
        BSET      L:0x5245, #0x1
        RET
//  363     }
//  364     else
//  365     {
//  366         /* Disable the mute mode UART3 by clearing the RWU bit in the CR1 register */
//  367         UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
??UART3_ReceiverWakeUpCmd_0:
        BRES      L:0x5245, #0x1
//  368     }
//  369 }
        RET
//  370 
//  371 /**
//  372   * @brief  Returns the most recent received data by the UART3 peripheral.
//  373   * @param  None
//  374   * @retval Received Data
//  375   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  376 uint8_t UART3_ReceiveData8(void)
//  377 {
//  378     return ((uint8_t)UART3->DR);
UART3_ReceiveData8:
        LD        A, L:0x5241
        RET
//  379 }
//  380 
//  381 /**
//  382   * @brief  Returns the most recent received data by the UART3 peripheral.
//  383   * @param  None
//  384   * @retval Received Data
//  385   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  386 uint16_t UART3_ReceiveData9(void)
//  387 {
//  388   uint16_t temp = 0;
//  389 
//  390  temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
UART3_ReceiveData9:
        LD        A, L:0x5244
//  391   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
        CLRW      X
        LD        XL, A
        RRWA      X, A
        AND       A, #0x80
        RLWA      X, A
        SLLW      X
        LD        A, L:0x5241
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, X
        LDW       X, Y
        RLWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
//  392 }
//  393 
//  394 /**
//  395   * @brief  Transmits 8 bit data through the UART3 peripheral.
//  396   * @param  Data the data to transmit.
//  397   * @retval None
//  398   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  399 void UART3_SendData8(uint8_t Data)
//  400 {
//  401     /* Transmit Data */
//  402     UART3->DR = Data;
UART3_SendData8:
        LD        L:0x5241, A
//  403 }
        RET
//  404 
//  405 /**
//  406   * @brief  Transmits 9 bit data through the UART3 peripheral.
//  407   * @param   Data: the data to transmit.
//  408   * @retval None
//  409   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  410 void UART3_SendData9(uint16_t Data)
//  411 {
UART3_SendData9:
        LDW       Y, X
//  412     /* Clear the transmit data bit 8 */
//  413     UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
        BRES      L:0x5244, #0x6
//  414     
//  415     /* Write the transmit data bit [8] */
//  416     UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
        SRLW      X
        SRLW      X
        LD        A, XL
        AND       A, #0x40
        CALL      L:?Subroutine0
//  417     
//  418     /* Write the transmit data bit [0:7] */
//  419     UART3->DR   = (uint8_t)(Data);                    
??CrossCallReturnLabel_0:
        LD        A, YL
        LD        L:0x5241, A
//  420 }
        RET
//  421 
//  422 /**
//  423   * @brief  Transmits break characters.
//  424   * @param  None
//  425   * @retval None
//  426   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  427 void UART3_SendBreak(void)
//  428 {
//  429     UART3->CR2 |= UART3_CR2_SBK;
UART3_SendBreak:
        BSET      L:0x5245, #0x0
//  430 }
        RET
//  431 
//  432 /**
//  433   * @brief  Sets the address of the UART3 node.
//  434   * @param  UART3_Address: Indicates the address of the UART3 node.
//  435   * @retval None
//  436   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  437 void UART3_SetAddress(uint8_t UART3_Address)
//  438 {
UART3_SetAddress:
        LD        S:?b0, A
//  439     /* Check the parameters */
//  440     assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
//  441 
//  442     /* Clear the UART3 address */
//  443     UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
        LD        A, L:0x5247
        AND       A, #0xf0
        LD        L:0x5247, A
//  444     /* Set the UART3 address node */
//  445     UART3->CR4 |= UART3_Address;
        LD        A, S:?b0
        OR        A, L:0x5247
        LD        L:0x5247, A
//  446 }
        RET
//  447 
//  448 /**
//  449   * @brief  Checks whether the specified UART3 flag is set or not.
//  450   * @param  UART3_FLAG specifies the flag to check.
//  451   *         This parameter can be any of the @ref UART3_Flag_TypeDef enumeration.
//  452   * @retval FlagStatus (SET or RESET)
//  453   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  454 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
//  455 {
//  456     FlagStatus status = RESET;
//  457 
//  458     /* Check parameters */
//  459     assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
//  460 
//  461     /* Check the status of the specified UART3 flag*/
//  462     if (UART3_FLAG == UART3_FLAG_LBDF)
UART3_GetFlagStatus:
        CPW       X, #0x210
        JRNE      L:??UART3_GetFlagStatus_0
//  463     {
//  464         if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
        BTJF      L:0x5247, #0x4, L:??UART3_GetFlagStatus_1
//  465         {
//  466             /* UART3_FLAG is set*/
//  467             status = SET;
??UART3_GetFlagStatus_2:
        LD        A, #0x1
//  468         }
//  469         else
//  470         {
//  471             /* UART3_FLAG is reset*/
//  472             status = RESET;
//  473         }
//  474     }
//  475     else if (UART3_FLAG == UART3_FLAG_SBK)
//  476     {
//  477         if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
//  478         {
//  479             /* UART3_FLAG is set*/
//  480             status = SET;
//  481         }
//  482         else
//  483         {
//  484             /* UART3_FLAG is reset*/
//  485             status = RESET;
//  486         }
//  487     }
//  488     else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
//  489     {
//  490         if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
//  491         {
//  492             /* UART3_FLAG is set*/
//  493             status = SET;
//  494         }
//  495         else
//  496         {
//  497             /* UART3_FLAG is reset*/
//  498             status = RESET;
//  499         }
//  500     }
//  501     else
//  502     {
//  503         if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
//  504         {
//  505             /* UART3_FLAG is set*/
//  506             status = SET;
//  507         }
//  508         else
//  509         {
//  510             /* UART3_FLAG is reset*/
//  511             status = RESET;
//  512         }
//  513     }
//  514 
//  515     /* Return the UART3_FLAG status*/
//  516     return  status;
        RET
??UART3_GetFlagStatus_0:
        CPW       X, #0x101
        JRNE      L:??UART3_GetFlagStatus_3
        BTJT      L:0x5245, #0x0, L:??UART3_GetFlagStatus_2
??UART3_GetFlagStatus_1:
        CLR       A
        RET
??UART3_GetFlagStatus_3:
        CPW       X, #0x302
        JREQ      L:??UART3_GetFlagStatus_4
        CPW       X, #0x301
        JRNE      L:??UART3_GetFlagStatus_5
??UART3_GetFlagStatus_4:
        LD        A, XL
        AND       A, L:0x5249
??UART3_GetFlagStatus_6:
        CP        A, #0x0
        JRNE      L:??UART3_GetFlagStatus_2
        JRA       L:??UART3_GetFlagStatus_1
??UART3_GetFlagStatus_5:
        LD        A, XL
        AND       A, L:0x5240
        JRA       L:??UART3_GetFlagStatus_6
//  517 }
//  518 /**
//  519   * @brief  Clears the UART3 flags.
//  520   * @param  UART3_FLAG specifies the flag to clear
//  521   *         This parameter can be any combination of the following values:
//  522   *         - UART3_FLAG_LBDF: LIN Break detection flag.
//  523   *         - UART3_FLAG_LHDF: LIN Header detection flag.
//  524   *         - UART3_FLAG_LSF: LIN synchrone field flag.
//  525   *         - UART3_FLAG_RXNE: Receive data register not empty flag.
//  526   * @note
//  527   *         - PE (Parity error), FE (Framing error), NF (Noise error), 
//  528   *           OR (OverRun error) and IDLE (Idle line detected) flags are cleared
//  529   *           by software sequence: a read operation to UART3_SR register 
//  530   *           (UART3_GetFlagStatus())followed by a read operation to UART3_DR 
//  531   *           register(UART3_ReceiveData8() or UART3_ReceiveData9()).
//  532   *             
//  533   *         - RXNE flag can be also cleared by a read to the UART3_DR register
//  534   *           (UART3_ReceiveData8()or UART3_ReceiveData9()).
//  535   *             
//  536   *         - TC flag can be also cleared by software sequence: a read operation
//  537   *           to UART3_SR register (UART3_GetFlagStatus()) followed by a write 
//  538   *           operation to UART3_DR register (UART3_SendData8() or UART3_SendData9()).
//  539   *             
//  540   *         - TXE flag is cleared only by a write to the UART3_DR register 
//  541   *           (UART3_SendData8() or UART3_SendData9()).
//  542   *             
//  543   *         - SBK flag is cleared during the stop bit of break.
//  544   * @retval None
//  545   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  546 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
//  547 {
//  548     /* Check the parameters */
//  549     assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
//  550 
//  551     /*Clear the Receive Register Not Empty flag */
//  552     if (UART3_FLAG == UART3_FLAG_RXNE)
UART3_ClearFlag:
        CPW       X, #0x20
        JRNE      L:??UART3_ClearFlag_0
//  553     {
//  554         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
        MOV       L:0x5240, #0xdf
        RET
//  555     }
//  556     /*Clear the LIN Break Detection flag */
//  557     else if (UART3_FLAG == UART3_FLAG_LBDF)
??UART3_ClearFlag_0:
        CPW       X, #0x210
        JRNE      L:??UART3_ClearFlag_1
//  558     {
//  559         UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
        BRES      L:0x5247, #0x4
        RET
//  560     }
//  561     /*Clear the LIN Header Detection Flag */
//  562     else if (UART3_FLAG == UART3_FLAG_LHDF)
??UART3_ClearFlag_1:
        CPW       X, #0x302
        JRNE      L:??UART3_ClearFlag_2
//  563     {
//  564         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
        BRES      L:0x5249, #0x1
        RET
//  565     }
//  566     /*Clear the LIN Synch Field flag */
//  567     else
//  568     {
//  569         UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
??UART3_ClearFlag_2:
        BRES      L:0x5249, #0x0
//  570     }
//  571 }
        RET
//  572 
//  573 /**
//  574   * @brief  Checks whether the specified UART3 interrupt has occurred or not.
//  575   * @param  UART3_IT: Specifies the UART3 interrupt pending bit to check.
//  576   *         This parameter can be one of the following values:
//  577   *         - UART3_IT_LBDF:  LIN Break detection interrupt
//  578   *         - UART3_IT_TXE:  Tansmit Data Register empty interrupt
//  579   *         - UART3_IT_TC:   Transmission complete interrupt
//  580   *         - UART3_IT_RXNE: Receive Data register not empty interrupt
//  581   *         - UART3_IT_IDLE: Idle line detection interrupt
//  582   *         - UART3_IT_OR:  OverRun Error interrupt
//  583   *         - UART3_IT_PE:   Parity Error interrupt
//  584   * @retval The state of UART3_IT (SET or RESET).
//  585   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  586 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
//  587 {
UART3_GetITStatus:
        LDW       Y, X
//  588     ITStatus pendingbitstatus = RESET;
//  589     uint8_t itpos = 0;
//  590     uint8_t itmask1 = 0;
//  591     uint8_t itmask2 = 0;
//  592     uint8_t enablestatus = 0;
//  593 
//  594     /* Check parameters */
//  595     assert_param(IS_UART3_GET_IT_OK(UART3_IT));
//  596 
//  597     /* Get the UART3 IT index*/
//  598     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
        LD        A, YL
        CALL      L:?Subroutine1
//  599     /* Get the UART3 IT index*/
//  600     itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
//  601     /* Set the IT mask*/
//  602     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
??CrossCallReturnLabel_4:
        LD        A, YL
        SWAP      A
        CALL      L:?Subroutine3
??CrossCallReturnLabel_8:
        LD        A, XL
//  603 
//  604     /* Check the status of the specified UART3 pending bit*/
//  605     if (UART3_IT == UART3_IT_PE)
        CPW       Y, #0x100
        JRNE      L:??UART3_GetITStatus_0
//  606     {
//  607         /* Get the UART3_ITPENDINGBIT enable bit status*/
//  608         enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
        AND       A, L:0x5244
        LD        S:?b1, A
//  609         /* Check the status of the specified UART3 interrupt*/
//  610 
//  611         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, S:?b0
        BCP       A, L:0x5240
        JREQ      L:??UART3_GetITStatus_1
??UART3_GetITStatus_2:
        TNZ       S:?b1
        JREQ      L:??UART3_GetITStatus_1
//  612         {
//  613             /* Interrupt occurred*/
//  614             pendingbitstatus = SET;
        LD        A, #0x1
//  615         }
//  616         else
//  617         {
//  618             /* Interrupt not occurred*/
//  619             pendingbitstatus = RESET;
//  620         }
//  621     }
//  622     else if (UART3_IT == UART3_IT_LBDF)
//  623     {
//  624         /* Get the UART3_IT enable bit status*/
//  625         enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
//  626         /* Check the status of the specified UART3 interrupt*/
//  627         if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
//  628         {
//  629             /* Interrupt occurred*/
//  630             pendingbitstatus = SET;
//  631         }
//  632         else
//  633         {
//  634             /* Interrupt not occurred*/
//  635             pendingbitstatus = RESET;
//  636         }
//  637     }
//  638     else if (UART3_IT == UART3_IT_LHDF)
//  639     {
//  640         /* Get the UART3_IT enable bit status*/
//  641         enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
//  642         /* Check the status of the specified UART3 interrupt*/
//  643         if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
//  644         {
//  645             /* Interrupt occurred*/
//  646             pendingbitstatus = SET;
//  647         }
//  648         else
//  649         {
//  650             /* Interrupt not occurred*/
//  651             pendingbitstatus = RESET;
//  652         }
//  653     }
//  654     else
//  655     {
//  656         /* Get the UART3_IT enable bit status*/
//  657         enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
//  658         /* Check the status of the specified UART3 interrupt*/
//  659         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
//  660         {
//  661             /* Interrupt occurred*/
//  662             pendingbitstatus = SET;
//  663         }
//  664         else
//  665         {
//  666             /* Interrupt not occurred*/
//  667             pendingbitstatus = RESET;
//  668         }
//  669     }
//  670     /* Return the UART3_IT status*/
//  671     return  pendingbitstatus;
        RET
??UART3_GetITStatus_0:
        CPW       Y, #0x346
        JRNE      L:??UART3_GetITStatus_3
        AND       A, L:0x5247
        LD        S:?b1, A
        LD        A, S:?b0
        BCP       A, L:0x5247
        JRNE      L:??UART3_GetITStatus_2
??UART3_GetITStatus_1:
        CLR       A
        RET
??UART3_GetITStatus_3:
        CPW       Y, #0x412
        JRNE      L:??UART3_GetITStatus_4
        AND       A, L:0x5249
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, L:0x5249
??UART3_GetITStatus_5:
        CP        A, #0x0
        JRNE      L:??UART3_GetITStatus_2
        JRA       L:??UART3_GetITStatus_1
??UART3_GetITStatus_4:
        AND       A, L:0x5245
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, L:0x5240
        JRA       L:??UART3_GetITStatus_5
//  672 }
//  673 
//  674 /**
//  675   * @brief  Clears the UART3 pending flags.
//  676   * @param  UART3_IT specifies the pending bit to clear
//  677   *         This parameter can be one of the following values:
//  678   *         - UART3_IT_LBDF:  LIN Break detection interrupt
//  679   *         - UART3_IT_LHDF:  LIN Header detection interrupt
//  680   *         - UART3_IT_RXNE: Receive Data register not empty interrupt.
//  681   *
//  682   * @note
//  683   *         - PE (Parity error), FE (Framing error), NF (Noise error), 
//  684   *           OR (OverRun error) and IDLE (Idle line detected) pending bits are 
//  685   *           cleared by software sequence: a read operation to UART3_SR register
//  686   *           (UART3_GetITStatus()) followed by a read operation to UART3_DR register 
//  687   *           (UART3_ReceiveData8() or UART3_ReceiveData9()).
//  688   *             
//  689   *         - RXNE pending bit can be also cleared by a read to the UART3_DR register
//  690   *           (UART3_ReceiveData8() or UART3_ReceiveData9() ).
//  691   *             
//  692   *         - TC (Transmit complete) pending bit can be cleared by software 
//  693   *           sequence: a read operation to UART3_SR register (UART3_GetITStatus())
//  694   *           followed by a write operation to UART3_DR register 
//  695   *           (UART3_SendData8()or UART3_SendData9()).
//  696   *             
//  697   *         - TXE pending bit is cleared only by a write to the UART3_DR register
//  698   *           (UART3_SendData8() or UART3_SendData9()).
//  699   * @retval None
//  700   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  701 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
//  702 {
//  703     /* Check the parameters */
//  704     assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
//  705 
//  706     /*Clear the Receive Register Not Empty pending bit */
//  707     if (UART3_IT == UART3_IT_RXNE)
UART3_ClearITPendingBit:
        CPW       X, #0x255
        JRNE      L:??UART3_ClearITPendingBit_0
//  708     {
//  709         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
        MOV       L:0x5240, #0xdf
        RET
//  710     }
//  711     /*Clear the LIN Break Detection pending bit */
//  712     else if (UART3_IT == UART3_IT_LBDF)
??UART3_ClearITPendingBit_0:
        CPW       X, #0x346
        JRNE      L:??UART3_ClearITPendingBit_1
//  713     {
//  714         UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
        BRES      L:0x5247, #0x4
        RET
//  715     }
//  716     /*Clear the LIN Header Detection pending bit */
//  717     else
//  718     {
//  719         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
??UART3_ClearITPendingBit_1:
        BRES      L:0x5249, #0x1
//  720     }
//  721 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  722 /**
//  723   * @}
//  724   */
//  725   
//  726 /**
//  727   * @}
//  728   */
//  729   
//  730 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 740 bytes in section .near_func.text
// 
// 740 bytes of CODE memory
//
//Errors: none
//Warnings: none
