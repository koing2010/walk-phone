///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:30 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_i2c.c          /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_i2c.c -e -Oh   /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_i2c.s     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_i2c

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?epilogue_l2_l3
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?mul16_x_x_w0
        EXTERN ?mul32_l0_l0_dl
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?sdiv16_x_x_y
        EXTERN ?sll32_l0_l0_db
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5

        PUBLIC I2C_AcknowledgeConfig
        PUBLIC I2C_CheckEvent
        PUBLIC I2C_ClearFlag
        PUBLIC I2C_ClearITPendingBit
        PUBLIC I2C_Cmd
        PUBLIC I2C_DeInit
        PUBLIC I2C_FastModeDutyCycleConfig
        PUBLIC I2C_GeneralCallCmd
        PUBLIC I2C_GenerateSTART
        PUBLIC I2C_GenerateSTOP
        PUBLIC I2C_GetFlagStatus
        PUBLIC I2C_GetITStatus
        PUBLIC I2C_GetLastEvent
        PUBLIC I2C_ITConfig
        PUBLIC I2C_Init
        PUBLIC I2C_ReceiveData
        PUBLIC I2C_Send7bitAddress
        PUBLIC I2C_SendData
        PUBLIC I2C_SoftwareResetCmd
        PUBLIC I2C_StretchClockCmd

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_i2c.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_i2c.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the I2C peripheral.
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
//   23 #include "stm8s_i2c.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 
//   30 /** @defgroup I2C_Private_Defines
//   31   * @{
//   32   */
//   33 /* I2C register mask */
//   34 #define REGISTER_Mask               ((uint16_t)0x3000)
//   35 #define REGISTER_SR1_Index          ((uint16_t)0x0100)
//   36 #define REGISTER_SR2_Index          ((uint16_t)0x0200)
//   37 /* I2C Interrupt Enable mask */
//   38 #define ITEN_Mask                   ((uint16_t)0x0700)
//   39 /* I2C FLAG mask */
//   40 #define FLAG_Mask                   ((uint16_t)0x00FF)
//   41 /**
//   42   * @}
//   43   */
//   44 
//   45 /* Private macro -------------------------------------------------------------*/
//   46 /* Private variables ---------------------------------------------------------*/
//   47 /* Private function prototypes -----------------------------------------------*/
//   48 /* Private functions ---------------------------------------------------------*/
//   49 
//   50 
//   51 /**
//   52   * @addtogroup I2C_Public_Functions
//   53   * @{
//   54   */
//   55 
//   56 /**
//   57   * @brief  Deinitializes the I2C peripheral registers to their default reset values.
//   58   * @param  None
//   59   * @retval None
//   60   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   61 void I2C_DeInit(void)
//   62 {
//   63   I2C->CR1 = I2C_CR1_RESET_VALUE;
I2C_DeInit:
        CLR       L:0x5210
//   64   I2C->CR2 = I2C_CR2_RESET_VALUE;
        CLR       L:0x5211
//   65   I2C->FREQR = I2C_FREQR_RESET_VALUE;
        CLR       L:0x5212
//   66   I2C->OARL = I2C_OARL_RESET_VALUE;
        CLR       L:0x5213
//   67   I2C->OARH = I2C_OARH_RESET_VALUE;
        CLR       L:0x5214
//   68   I2C->ITR = I2C_ITR_RESET_VALUE;
        CLR       L:0x521a
//   69   I2C->CCRL = I2C_CCRL_RESET_VALUE;
        CLR       L:0x521b
//   70   I2C->CCRH = I2C_CCRH_RESET_VALUE;
        CLR       L:0x521c
//   71   I2C->TRISER = I2C_TRISER_RESET_VALUE;
        MOV       L:0x521d, #0x2
//   72 }
        RET
//   73 
//   74 /**
//   75   * @brief  Initializes the I2C according to the specified parameters in standard
//   76   *         or fast mode.
//   77   * @param  OutputClockFrequencyHz : Specifies the output clock frequency in Hz.
//   78   * @param  OwnAddress : Specifies the own address.
//   79   * @param  I2C_DutyCycle : Specifies the duty cycle to apply in fast mode.
//   80   *         This parameter can be any of the  @ref I2C_DutyCycle_TypeDef enumeration.
//   81   * @note   This parameter don't have impact when the OutputClockFrequency lower
//   82   *         than 100KHz.
//   83   * @param  Ack : Specifies the acknowledge mode to apply.
//   84   *         This parameter can be any of the  @ref I2C_Ack_TypeDef enumeration.
//   85   * @param  AddMode : Specifies the acknowledge address to apply.
//   86   *         This parameter can be any of the  @ref I2C_AddMode_TypeDef enumeration.
//   87   * @param  InputClockFrequencyMHz : Specifies the input clock frequency in MHz.
//   88   * @retval None
//   89   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   90 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
//   91               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
//   92               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
//   93 {
I2C_Init:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        PUSH      A
        PUSH      S:?b4
        PUSH      S:?b5
        PUSH      S:?b6
        SUB       SP, #0x1
        CALL      L:?mov_l2_l0
//   94   uint16_t result = 0x0004;
//   95   uint16_t tmpval = 0;
//   96   uint8_t tmpccrh = 0;
        CLR       A
        LD        (0x1,SP), A
//   97 
//   98   /* Check the parameters */
//   99   assert_param(IS_I2C_ACK_OK(Ack));
//  100   assert_param(IS_I2C_ADDMODE_OK(AddMode));
//  101   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
//  102   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
//  103   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
//  104   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
//  105 
//  106 
//  107   /*------------------------- I2C FREQ Configuration ------------------------*/
//  108   /* Clear frequency bits */
//  109   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
        LD        A, L:0x5212
        AND       A, #0xc0
        LD        L:0x5212, A
//  110   /* Write new value */
//  111   I2C->FREQR |= InputClockFrequencyMHz;
        LD        A, (0x2,SP)
        OR        A, L:0x5212
        LD        L:0x5212, A
//  112 
//  113   /*--------------------------- I2C CCR Configuration ------------------------*/
//  114   /* Disable I2C to configure TRISER */
//  115   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
        BRES      L:0x5210, #0x0
//  116 
//  117   /* Clear CCRH & CCRL */
//  118   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
        LD        A, L:0x521c
        AND       A, #0x30
        LD        L:0x521c, A
//  119   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
        LD        A, L:0x521b
        CLR       L:0x521b
//  120 
//  121   /* Detect Fast or Standard mode depending on the Output clock frequency selected */
//  122   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
        LD        A, (0x2,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0xf4240
        CODE
        CALL      L:?mov_l3_l0
        LDW       X, S:?w4
        CPW       X, #0x1
        JRNE      L:??I2C_Init_0
        LDW       X, S:?w5
        CPW       X, #0x86a1
??I2C_Init_0:
        JRC       L:??I2C_Init_1
//  123   {
//  124     /* Set F/S bit for fast mode */
//  125     tmpccrh = I2C_CCRH_FS;
        LD        A, #0x80
        LD        (0x1,SP), A
//  126 
//  127     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
        TNZ       (0x5,SP)
        CALL      L:?mov_l0_l2
        JRNE      L:??I2C_Init_2
//  128     {
//  129       /* Fast mode speed calculate: Tlow/Thigh = 2 */
//  130       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x3
        CODE
        CALL      L:?Subroutine1
//  131     }
??CrossCallReturnLabel_2:
        JRA       L:??I2C_Init_3
//  132     else /* I2C_DUTYCYCLE_16_9 */
//  133     {
//  134       /* Fast mode speed calculate: Tlow/Thigh = 16/9 */
//  135       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
??I2C_Init_2:
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x19
        CODE
        CALL      L:?Subroutine1
//  136       /* Set DUTY bit */
//  137       tmpccrh |= I2C_CCRH_DUTY;
??CrossCallReturnLabel_3:
        LD        A, #0xc0
        LD        (0x1,SP), A
//  138     }
//  139 
//  140     /* Verify and correct CCR value if below minimum value */
//  141     if (result < (uint16_t)0x01)
??I2C_Init_3:
        LDW       X, S:?w1
        JRNE      L:??I2C_Init_4
//  142     {
//  143       /* Set the minimum allowed value */
//  144       result = (uint16_t)0x0001;
        CLRW      X
        INCW      X
        LDW       S:?w1, X
//  145     }
//  146 
//  147     /* Set Maximum Rise Time: 300ns max in Fast Mode
//  148     = [300ns/(1/InputClockFrequencyMHz.10e6)]+1
//  149     = [(InputClockFrequencyMHz * 3)/10]+1 */
//  150     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
//  151     I2C->TRISER = (uint8_t)tmpval;
??I2C_Init_4:
        LD        A, (0x2,SP)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, #0x3
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       Y, #0xa
        CALL      L:?sdiv16_x_x_y
        LD        A, XL
        JRA       L:??I2C_Init_5
//  152 
//  153   }
//  154   else /* STANDARD MODE */
//  155   {
//  156 
//  157     /* Calculate standard mode speed */
//  158     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
??I2C_Init_1:
        CALL      L:?mov_l0_l2
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x1
        CODE
        CALL      L:?Subroutine1
//  159 
//  160     /* Verify and correct CCR value if below minimum value */
//  161     if (result < (uint16_t)0x0004)
??CrossCallReturnLabel_4:
        LDW       X, S:?w1
        CPW       X, #0x4
        JRNC      L:??I2C_Init_6
//  162     {
//  163       /* Set the minimum allowed value */
//  164       result = (uint16_t)0x0004;
        LDW       X, #0x4
        LDW       S:?w1, X
//  165     }
//  166 
//  167     /* Set Maximum Rise Time: 1000ns max in Standard Mode
//  168     = [1000ns/(1/InputClockFrequencyMHz.10e6)]+1
//  169     = InputClockFrequencyMHz+1 */
//  170     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
??I2C_Init_6:
        LD        A, (0x2,SP)
??I2C_Init_5:
        INC       A
        LD        L:0x521d, A
//  171 
//  172   }
//  173 
//  174   /* Write CCR with new calculated value */
//  175   I2C->CCRL = (uint8_t)result;
        LD        A, S:?b3
        LD        L:0x521b, A
//  176   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
        LDW       X, S:?w1
        CLR       A
        RRWA      X, A
        LD        A, XL
        AND       A, #0xf
        OR        A, (0x1,SP)
        LD        L:0x521c, A
//  177 
//  178   /* Enable I2C */
//  179   I2C->CR1 |= I2C_CR1_PE;
        BSET      L:0x5210, #0x0
//  180 
//  181   /* Configure I2C acknowledgement */
//  182   I2C_AcknowledgeConfig(Ack);
        LD        A, (0x4,SP)
        CALL      L:I2C_AcknowledgeConfig
//  183 
//  184   /*--------------------------- I2C OAR Configuration ------------------------*/
//  185   I2C->OARL = (uint8_t)(OwnAddress);
        LD        A, (0x7,SP)
        LD        L:0x5213, A
//  186   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
//  187                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
        LDW       X, (0x6,SP)
        SLLW      X
        CLR       A
        RLC       A
        RRWA      X, A
        LD        A, XL
        AND       A, #0x6
        OR        A, (0x3,SP)
        OR        A, #0x40
        LD        L:0x5214, A
//  188 }
        ADD       SP, #0x7
        JP        L:?epilogue_l2_l3

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        CALL      L:?mov_l1_l0
        CALL      L:?mov_l0_l3
        JP        L:?udiv32_l0_l0_l1
//  189 
//  190 /**
//  191   * @brief  Enables or disables the I2C peripheral.
//  192   * @param  NewState : Indicate the new I2C peripheral state.
//  193   *         This parameter can be any of the @ref FunctionalState enumeration.
//  194   * @retval None
//  195   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  196 void I2C_Cmd(FunctionalState NewState)
//  197 {
//  198 
//  199   /* Check function parameters */
//  200   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  201 
//  202   if (NewState != DISABLE)
I2C_Cmd:
        TNZ       A
        JREQ      L:??I2C_Cmd_0
//  203   {
//  204     /* Enable I2C peripheral */
//  205     I2C->CR1 |= I2C_CR1_PE;
        BSET      L:0x5210, #0x0
        RET
//  206   }
//  207   else /* NewState == DISABLE */
//  208   {
//  209     /* Disable I2C peripheral */
//  210     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
??I2C_Cmd_0:
        BRES      L:0x5210, #0x0
//  211   }
//  212 }
        RET
//  213 
//  214 /**
//  215   * @brief  Enables or disables the I2C General Call feature.
//  216   * @param  NewState : State of the General Call feature.
//  217   *         This parameter can be any of the @ref FunctionalState enumeration.
//  218   * @retval None
//  219   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  220 void I2C_GeneralCallCmd(FunctionalState NewState)
//  221 {
//  222 
//  223   /* Check function parameters */
//  224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  225 
//  226   if (NewState != DISABLE)
I2C_GeneralCallCmd:
        TNZ       A
        JREQ      L:??I2C_GeneralCallCmd_0
//  227   {
//  228     /* Enable General Call */
//  229     I2C->CR1 |= I2C_CR1_ENGC;
        BSET      L:0x5210, #0x6
        RET
//  230   }
//  231   else /* NewState == DISABLE */
//  232   {
//  233     /* Disable General Call */
//  234     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
??I2C_GeneralCallCmd_0:
        BRES      L:0x5210, #0x6
//  235   }
//  236 }
        RET
//  237 
//  238 /**
//  239   * @brief  Generates I2C communication START condition.
//  240   * @note   CCR must be programmed, i.e. I2C_Init function must have been called
//  241   *         with a valid I2C_ClockSpeed
//  242   * @param  NewState : Enable or disable the start condition.
//  243   *         This parameter can be any of the @ref FunctionalState enumeration.
//  244   * @retval None
//  245   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  246 void I2C_GenerateSTART(FunctionalState NewState)
//  247 {
//  248 
//  249   /* Check function parameters */
//  250   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  251 
//  252   if (NewState != DISABLE)
I2C_GenerateSTART:
        TNZ       A
        JREQ      L:??I2C_GenerateSTART_0
//  253   {
//  254     /* Generate a START condition */
//  255     I2C->CR2 |= I2C_CR2_START;
        BSET      L:0x5211, #0x0
        RET
//  256   }
//  257   else /* NewState == DISABLE */
//  258   {
//  259     /* Disable the START condition generation */
//  260     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
??I2C_GenerateSTART_0:
        BRES      L:0x5211, #0x0
//  261   }
//  262 }
        RET
//  263 
//  264 /**
//  265   * @brief  Generates I2C communication STOP condition.
//  266   * @param   NewState : Enable or disable the stop condition.
//  267   *          This parameter can be any of the @ref FunctionalState enumeration.
//  268   * @retval None
//  269   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  270 void I2C_GenerateSTOP(FunctionalState NewState)
//  271 {
//  272 
//  273   /* Check function parameters */
//  274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  275 
//  276   if (NewState != DISABLE)
I2C_GenerateSTOP:
        TNZ       A
        JREQ      L:??I2C_GenerateSTOP_0
//  277   {
//  278     /* Generate a STOP condition */
//  279     I2C->CR2 |= I2C_CR2_STOP;
        BSET      L:0x5211, #0x1
        RET
//  280   }
//  281   else /* NewState == DISABLE */
//  282   {
//  283     /* Disable the STOP condition generation */
//  284     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
??I2C_GenerateSTOP_0:
        BRES      L:0x5211, #0x1
//  285   }
//  286 }
        RET
//  287 
//  288 /**
//  289   * @brief  Enables or disables I2C software reset.
//  290   * @param  NewState : Specifies the new state of the I2C software reset.
//  291   *         This parameter can be any of the @ref FunctionalState enumeration.
//  292   * @retval None
//  293   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  294 void I2C_SoftwareResetCmd(FunctionalState NewState)
//  295 {
//  296   /* Check function parameters */
//  297   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  298 
//  299   if (NewState != DISABLE)
I2C_SoftwareResetCmd:
        TNZ       A
        JREQ      L:??I2C_SoftwareResetCmd_0
//  300   {
//  301     /* Peripheral under reset */
//  302     I2C->CR2 |= I2C_CR2_SWRST;
        BSET      L:0x5211, #0x7
        RET
//  303   }
//  304   else /* NewState == DISABLE */
//  305   {
//  306     /* Peripheral not under reset */
//  307     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
??I2C_SoftwareResetCmd_0:
        BRES      L:0x5211, #0x7
//  308   }
//  309 }
        RET
//  310 
//  311 /**
//  312   * @brief  Enables or disables the I2C clock stretching.
//  313   * @param  NewState : Specifies the new state of the I2C Clock stretching.
//  314   *         This parameter can be any of the @ref FunctionalState enumeration.
//  315   * @retval None
//  316   */
//  317 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  318 void I2C_StretchClockCmd(FunctionalState NewState)
//  319 {
//  320   /* Check function parameters */
//  321   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  322 
//  323   if (NewState != DISABLE)
I2C_StretchClockCmd:
        TNZ       A
        JREQ      L:??I2C_StretchClockCmd_0
//  324   {
//  325     /* Clock Stretching Enable */
//  326     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
        BRES      L:0x5210, #0x7
        RET
//  327 
//  328   }
//  329   else /* NewState == DISABLE */
//  330   {
//  331     /* Clock Stretching Disable (Slave mode) */
//  332     I2C->CR1 |= I2C_CR1_NOSTRETCH;
??I2C_StretchClockCmd_0:
        BSET      L:0x5210, #0x7
//  333   }
//  334 }
        RET
//  335 
//  336 /**
//  337   * @brief  Enable or Disable the I2C acknowledge and position acknowledge feature.
//  338   * @note   This function must be called before data reception start
//  339   * @param  Ack : Specifies the acknowledge mode to apply.
//  340   *         This parameter can be any of the  @ref I2C_Ack_TypeDef enumeration.
//  341   * @retval None
//  342   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  343 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
//  344 {
//  345 
//  346   /* Check function parameters */
//  347   assert_param(IS_I2C_ACK_OK(Ack));
//  348 
//  349   if (Ack == I2C_ACK_NONE)
I2C_AcknowledgeConfig:
        TNZ       A
        JRNE      L:??I2C_AcknowledgeConfig_0
//  350   {
//  351     /* Disable the acknowledgement */
//  352     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
        BRES      L:0x5211, #0x2
        RET
//  353   }
//  354   else
//  355   {
//  356     /* Enable the acknowledgement */
//  357     I2C->CR2 |= I2C_CR2_ACK;
??I2C_AcknowledgeConfig_0:
        BSET      L:0x5211, #0x2
//  358 
//  359     if (Ack == I2C_ACK_CURR)
        CP        A, #0x1
        JRNE      L:??I2C_AcknowledgeConfig_1
//  360     {
//  361       /* Configure (N)ACK on current byte */
//  362       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
        BRES      L:0x5211, #0x3
        RET
//  363     }
//  364     else
//  365     {
//  366       /* Configure (N)ACK on next byte */
//  367       I2C->CR2 |= I2C_CR2_POS;
??I2C_AcknowledgeConfig_1:
        BSET      L:0x5211, #0x3
//  368     }
//  369   }
//  370 }
        RET
//  371 
//  372 /**
//  373   * @brief  Enables or disables the specified I2C interrupt.
//  374   * @param  ITName : Name of the interrupt to enable or disable.
//  375   *         This parameter can be any of the  @ref I2C_IT_TypeDef enumeration.
//  376   * @param  NewState : State of the interrupt to apply.
//  377   *         This parameter can be any of the @ref FunctionalState enumeration.
//  378   * @retval None
//  379   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  380 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
//  381 {
//  382 
//  383   /* Check functions parameters */
//  384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
//  385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  386 
//  387   if (NewState != DISABLE)
I2C_ITConfig:
        TNZ       S:?b0
        JREQ      L:??I2C_ITConfig_0
//  388   {
//  389     /* Enable the selected I2C interrupts */
//  390     I2C->ITR |= (uint8_t)I2C_IT;
        OR        A, L:0x521a
        JRA       L:??I2C_ITConfig_1
//  391   }
//  392   else /* NewState == DISABLE */
//  393   {
//  394     /* Disable the selected I2C interrupts */
//  395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
??I2C_ITConfig_0:
        CPL       A
        AND       A, L:0x521a
??I2C_ITConfig_1:
        LD        L:0x521a, A
//  396   }
//  397 }
        RET
//  398 
//  399 /**
//  400   * @brief  Selects the specified I2C fast mode duty cycle.
//  401   * @param  I2C_DutyCycle : Specifies the duty cycle to apply.
//  402   *         This parameter can be any of the @ref I2C_DutyCycle_TypeDef enumeration.
//  403   * @retval None
//  404   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
//  406 {
//  407 
//  408   /* Check function parameters */
//  409   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
//  410 
//  411   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
I2C_FastModeDutyCycleConfig:
        CP        A, #0x40
        JRNE      L:??I2C_FastModeDutyCycleConfig_0
//  412   {
//  413     /* I2C fast mode Tlow/Thigh = 16/9 */
//  414     I2C->CCRH |= I2C_CCRH_DUTY;
        BSET      L:0x521c, #0x6
        RET
//  415   }
//  416   else /* I2C_DUTYCYCLE_2 */
//  417   {
//  418     /* I2C fast mode Tlow/Thigh = 2 */
//  419     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
??I2C_FastModeDutyCycleConfig_0:
        BRES      L:0x521c, #0x6
//  420   }
//  421 }
        RET
//  422 
//  423 /**
//  424   * @brief  Returns the most recent received data.
//  425   * @param  None
//  426   * @retval uint8_t : The value of the received byte data.
//  427   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  428 uint8_t I2C_ReceiveData(void)
//  429 {
//  430   /* Return the data present in the DR register */
//  431   return ((uint8_t)I2C->DR);
I2C_ReceiveData:
        LD        A, L:0x5216
        RET
//  432 }
//  433 
//  434 /**
//  435   * @brief  Transmits the 7-bit address (to select the) slave device.
//  436   * @param   Address : Specifies the slave address which will be transmitted.
//  437   * @param   Direction : Specifies whether the I2C device will be a Transmitter or a Receiver.
//  438   * This parameter can be any of the @ref I2C_Direction_TypeDef enumeration.
//  439   * @retval None
//  440   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  441 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
//  442 {
//  443   /* Check function parameters */
//  444   assert_param(IS_I2C_ADDRESS_OK(Address));
//  445   assert_param(IS_I2C_DIRECTION_OK(Direction));
//  446 
//  447   /* Clear bit0 (direction) just in case */
//  448   Address &= (uint8_t)0xFE;
//  449 
//  450   /* Send the Address + Direction */
//  451   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
I2C_Send7bitAddress:
        AND       A, #0xfe
        OR        A, S:?b0
        LD        L:0x5216, A
//  452 }
        RET
//  453 
//  454 /**
//  455   * @brief  Send a byte by writing in the DR register.
//  456   * @param   Data : Byte to be sent.
//  457   * @retval None
//  458   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  459 void I2C_SendData(uint8_t Data)
//  460 {
//  461   /* Write in the DR register the data to be sent */
//  462   I2C->DR = Data;
I2C_SendData:
        LD        L:0x5216, A
//  463 }
        RET
//  464 
//  465 /**
//  466  * @brief
//  467  ****************************************************************************************
//  468  *
//  469  *                         I2C State Monitoring Functions
//  470  *
//  471  ****************************************************************************************
//  472  * This I2C driver provides three different ways for I2C state monitoring
//  473  *  depending on the application requirements and constraints:
//  474  *
//  475  *
//  476  * 1) Basic state monitoring:
//  477  *    Using I2C_CheckEvent() function:
//  478  *    It compares the status registers (SR1, SR2 and SR3) content to a given event
//  479  *    (can be the combination of one or more flags).
//  480  *    It returns SUCCESS if the current status includes the given flags
//  481  *    and returns ERROR if one or more flags are missing in the current status.
//  482  *    - When to use:
//  483  *      - This function is suitable for most applications as well as for startup
//  484  *      activity since the events are fully described in the product reference manual
//  485  *      (RM0016).
//  486  *      - It is also suitable for users who need to define their own events.
//  487  *    - Limitations:
//  488  *      - If an error occurs (ie. error flags are set besides to the monitored flags),
//  489  *        the I2C_CheckEvent() function may return SUCCESS despite the communication
//  490  *        hold or corrupted real state.
//  491  *        In this case, it is advised to use error interrupts to monitor the error
//  492  *        events and handle them in the interrupt IRQ handler.
//  493  *
//  494  *        @note
//  495  *        For error management, it is advised to use the following functions:
//  496  *          - I2C_ITConfig() to configure and enable the error interrupts (I2C_IT_ERR).
//  497  *          - I2C_IRQHandler() which is called when the I2C interurpts occur.
//  498  *          - I2C_GetFlagStatus() or I2C_GetITStatus() to be called into the
//  499  *           I2C_IRQHandler() function in order to determine which error occured.
//  500  *          - I2C_ClearFlag() or I2C_ClearITPendingBit() and/or I2C_SoftwareResetCmd()
//  501  *            and/or I2C_GenerateStop() in order to clear the error flag and
//  502  *            source and return to correct communication status.
//  503  *
//  504  *
//  505  *  2) Advanced state monitoring:
//  506  *     Using the function I2C_GetLastEvent() which returns the image of both SR1
//  507  *     & SR3 status registers in a single word (uint16_t) (Status Register 3 value
//  508  *     is shifted left by 8 bits and concatenated to Status Register 1).
//  509  *     - When to use:
//  510  *       - This function is suitable for the same applications above but it allows to
//  511  *         overcome the limitations of I2C_GetFlagStatus() function (see below).
//  512  *         The returned value could be compared to events already defined in the
//  513  *         library (stm8s_i2c.h) or to custom values defined by user.
//  514  *       - This function is suitable when multiple flags are monitored at the same time.
//  515  *       - At the opposite of I2C_CheckEvent() function, this function allows user to
//  516  *         choose when an event is accepted (when all events flags are set and no
//  517  *         other flags are set or just when the needed flags are set like
//  518  *         I2C_CheckEvent() function).
//  519  *     - Limitations:
//  520  *       - User may need to define his own events.
//  521  *       - Same remark concerning the error management is applicable for this
//  522  *         function if user decides to check only regular communication flags (and
//  523  *         ignores error flags).
//  524  *
//  525  *
//  526  *  3) Flag-based state monitoring:
//  527  *     Using the function I2C_GetFlagStatus() which simply returns the status of
//  528  *     one single flag (ie. I2C_FLAG_RXNE ...).
//  529  *     - When to use:
//  530  *        - This function could be used for specific applications or in debug phase.
//  531  *        - It is suitable when only one flag checking is needed (most I2C events
//  532  *          are monitored through multiple flags).
//  533  *     - Limitations:
//  534  *        - When calling this function, the Status register is accessed. Some flags are
//  535  *          cleared when the status register is accessed. So checking the status
//  536  *          of one Flag, may clear other ones.
//  537  *        - Function may need to be called twice or more in order to monitor one
//  538  *          single event.
//  539  *
//  540  *  For detailed description of Events, please refer to section I2C_Events in
//  541  *  stm8s_i2c.h file.
//  542  *
//  543  */
//  544 /**
//  545  *
//  546  *  1) Basic state monitoring
//  547  *******************************************************************************
//  548  */
//  549 
//  550 /**
//  551   * @brief  Checks whether the last I2C Event is equal to the one passed
//  552   *   as parameter.
//  553   * @param  I2C_EVENT: specifies the event to be checked.
//  554   *   This parameter can be one of the following values:
//  555   *     @arg I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED           : EV1
//  556   *     @arg I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED              : EV1
//  557   *     @arg I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED            : EV1
//  558   *     @arg I2C_EVENT_SLAVE_BYTE_RECEIVED                         : EV2
//  559   *     @arg (I2C_EVENT_SLAVE_BYTE_RECEIVED | I2C_FLAG_GENCALL)    : EV2
//  560   *     @arg I2C_EVENT_SLAVE_BYTE_TRANSMITTED                      : EV3
//  561   *     @arg (I2C_EVENT_SLAVE_BYTE_TRANSMITTED | I2C_FLAG_GENCALL) : EV3
//  562   *     @arg I2C_EVENT_SLAVE_ACK_FAILURE                           : EV3_2
//  563   *     @arg I2C_EVENT_SLAVE_STOP_DETECTED                         : EV4
//  564   *     @arg I2C_EVENT_MASTER_MODE_SELECT                          : EV5
//  565   *     @arg I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED            : EV6
//  566   *     @arg I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED               : EV6
//  567   *     @arg I2C_EVENT_MASTER_BYTE_RECEIVED                        : EV7
//  568   *     @arg I2C_EVENT_MASTER_BYTE_TRANSMITTING                    : EV8
//  569   *     @arg I2C_EVENT_MASTER_BYTE_TRANSMITTED                     : EV8_2
//  570   *     @arg I2C_EVENT_MASTER_MODE_ADDRESS10                       : EV9
//  571   *
//  572   * @note: For detailed description of Events, please refer to section
//  573   *    I2C_Events in stm8s_i2c.h file.
//  574   *
//  575   * @retval An ErrorStatus enumeration value:
//  576   * - SUCCESS: Last event is equal to the I2C_EVENT
//  577   * - ERROR: Last event is different from the I2C_EVENT
//  578   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  579 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
//  580 {
I2C_CheckEvent:
        SUB       SP, #0x2
        LDW       S:?w1, X
//  581   __IO uint16_t lastevent = 0x00;
        CLRW      X
        LDW       (0x1,SP), X
//  582   uint8_t flag1 = 0x00 ;
//  583   uint8_t flag2 = 0x00;
//  584   ErrorStatus status = ERROR;
//  585 
//  586   /* Check the parameters */
//  587   assert_param(IS_I2C_EVENT_OK(I2C_Event));
//  588 
//  589   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
        LDW       X, S:?w1
        CPW       X, #0x4
        JRNE      L:??I2C_CheckEvent_0
//  590   {
//  591     lastevent = I2C->SR2 & I2C_SR2_AF;
        LD        A, L:0x5218
        CLRW      X
        LD        XL, A
        RRWA      X, A
        AND       A, #0x4
        JRA       L:??I2C_CheckEvent_1
//  592   }
//  593   else
//  594   {
//  595     flag1 = I2C->SR1;
??I2C_CheckEvent_0:
        CALL      L:?Subroutine0
//  596     flag2 = I2C->SR3;
//  597     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
??CrossCallReturnLabel_1:
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
        CLRW      X
        LD        A, S:?b0
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
??I2C_CheckEvent_1:
        RLWA      X, A
        LDW       (0x1,SP), X
//  598   }
//  599   /* Check whether the last event is equal to I2C_EVENT */
//  600   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
        LDW       X, (0x1,SP)
        RRWA      X, A
        AND       A, S:?b3
        RRWA      X, A
        AND       A, S:?b2
        RRWA      X, A
        CPW       X, S:?w1
        JRNE      L:??I2C_CheckEvent_2
//  601   {
//  602     /* SUCCESS: last event is equal to I2C_EVENT */
//  603     status = SUCCESS;
        LD        A, #0x1
        JRA       L:??I2C_CheckEvent_3
//  604   }
//  605   else
//  606   {
//  607     /* ERROR: last event is different from I2C_EVENT */
//  608     status = ERROR;
??I2C_CheckEvent_2:
        CLR       A
//  609   }
//  610 
//  611   /* Return status */
//  612   return status;
??I2C_CheckEvent_3:
        ADD       SP, #0x2
        RET
//  613 }

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LD        A, L:0x5217
        LD        S:?b0, A
        LD        A, L:0x5219
        RET
//  614 
//  615 /**
//  616  *
//  617  *  2) Advanced state monitoring
//  618  *******************************************************************************
//  619  */
//  620 /**
//  621   * @brief  Returns the last I2C Event.
//  622   *
//  623   * @note: For detailed description of Events, please refer to section
//  624   *    I2C_Events in stm8s_i2c.h file.
//  625   *
//  626   * @retval The last event
//  627   *   This parameter can be any of the  @ref I2C_Event_TypeDef enumeration.
//  628   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  629 I2C_Event_TypeDef I2C_GetLastEvent(void)
//  630 {
I2C_GetLastEvent:
        SUB       SP, #0x2
//  631   __IO uint16_t lastevent = 0;
        CLRW      X
        LDW       (0x1,SP), X
//  632   uint16_t flag1 = 0;
//  633   uint16_t flag2 = 0;
//  634 
//  635   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
        BTJF      L:0x5218, #0x2, L:??I2C_GetLastEvent_0
//  636   {
//  637     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
        LDW       X, #0x4
        JRA       L:??I2C_GetLastEvent_1
//  638   }
//  639   else
//  640   {
//  641     /* Read the I2C status register */
//  642     flag1 = I2C->SR1;
??I2C_GetLastEvent_0:
        CALL      L:?Subroutine0
//  643     flag2 = I2C->SR3;
//  644 
//  645     /* Get the last event value from I2C status register */
//  646     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
??CrossCallReturnLabel_0:
        LD        XL, A
        CLRW      Y
        LD        A, S:?b0
        EXG       A, YL
        LDW       S:?w0, Y
        OR        A, S:?b1
        RLWA      X, A
??I2C_GetLastEvent_1:
        LDW       (0x1,SP), X
//  647   }
//  648   /* Return status */
//  649   return (I2C_Event_TypeDef)lastevent;
        LDW       X, (0x1,SP)
        ADD       SP, #0x2
        RET
//  650 }
//  651 
//  652 /**
//  653  *
//  654  *  3) Flag-based state monitoring
//  655  *******************************************************************************
//  656  */
//  657 /**
//  658   * @brief  Checks whether the specified I2C flag is set or not.
//  659   * @param  I2C_FLAG: specifies the flag to check.
//  660   *   This parameter can be one of the following values:
//  661   *     @arg I2C_FLAG_GENERALCALL: General call header flag (Slave mode)
//  662   *     @arg I2C_FLAG_TRANSMITTERRECEIVER: Transmitter/Receiver flag
//  663   *     @arg I2C_FLAG_BUSBUSY: Bus busy flag
//  664   *     @arg I2C_FLAG_MASTERSLAVE: Master/Slave flag
//  665   *     @arg I2C_FLAG_WAKEUPFROMHALT: Wake up from HALT flag  
//  666   *     @arg I2C_FLAG_OVERRUNUNDERRUN: Overrun/Underrun flag (Slave mode)
//  667   *     @arg I2C_FLAG_ACKNOWLEDGEFAILURE: Acknowledge failure flag
//  668   *     @arg I2C_FLAG_ARBITRATIONLOSS: Arbitration lost flag (Master mode)
//  669   *     @arg I2C_FLAG_BUSERROR: Bus error flag
//  670   *     @arg I2C_FLAG_TXEMPTY: Data register empty flag (Transmitter)
//  671   *     @arg I2C_FLAG_RXNOTEMPTY: Data register not empty (Receiver) flag
//  672   *     @arg I2C_FLAG_STOPDETECTION: Stop detection flag (Slave mode)
//  673   *     @arg I2C_FLAG_HEADERSENT: 10-bit header sent flag (Master mode)
//  674   *     @arg I2C_FLAG_TRANSFERFINISHED: Byte transfer finished flag
//  675   *     @arg I2C_FLAG_ADDRESSSENTMATCHED: Address sent flag (Master mode) “ADSL”
//  676   *   Address matched flag (Slave mode)”ENDAD”
//  677   *     @arg I2C_FLAG_STARTDETECTION: Start bit flag (Master mode)
//  678   * @retval The new state of I2C_FLAG (SET or RESET).
//  679   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  680 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
//  681 {
I2C_GetFlagStatus:
        LDW       Y, X
//  682   uint8_t tempreg = 0;
        CLR       S:?b0
//  683   uint8_t regindex = 0;
//  684   FlagStatus bitstatus = RESET;
//  685 
//  686   /* Check the parameters */
//  687   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
//  688 
//  689   /* Read flag register index */
//  690   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
//  691   /* Check SRx index */
//  692   switch (regindex)
        CLR       A
        RRWA      X, A
        LD        A, XL
        DEC       A
        JREQ      L:??I2C_GetFlagStatus_0
        DEC       A
        JREQ      L:??I2C_GetFlagStatus_1
        DEC       A
        JREQ      L:??I2C_GetFlagStatus_2
        JRA       L:??I2C_GetFlagStatus_3
//  693   {
//  694       /* Returns whether the status register to check is SR1 */
//  695     case 0x01:
//  696       tempreg = (uint8_t)I2C->SR1;
??I2C_GetFlagStatus_0:
        LD        A, L:0x5217
        JRA       L:??I2C_GetFlagStatus_4
//  697       break;
//  698 
//  699       /* Returns whether the status register to check is SR2 */
//  700     case 0x02:
//  701       tempreg = (uint8_t)I2C->SR2;
??I2C_GetFlagStatus_1:
        LD        A, L:0x5218
        JRA       L:??I2C_GetFlagStatus_4
//  702       break;
//  703 
//  704       /* Returns whether the status register to check is SR3 */
//  705     case 0x03:
//  706       tempreg = (uint8_t)I2C->SR3;
??I2C_GetFlagStatus_2:
        LD        A, L:0x5219
??I2C_GetFlagStatus_4:
        LD        S:?b0, A
//  707       break;
//  708 
//  709     default:
//  710       break;
//  711   }
//  712 
//  713   /* Check the status of the specified I2C flag */
//  714   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
??I2C_GetFlagStatus_3:
        LD        A, YL
        BCP       A, S:?b0
        JREQ      L:??I2C_GetFlagStatus_5
//  715   {
//  716     /* Flag is set */
//  717     bitstatus = SET;
        LD        A, #0x1
        RET
//  718   }
//  719   else
//  720   {
//  721     /* Flag is reset */
//  722     bitstatus = RESET;
??I2C_GetFlagStatus_5:
        CLR       A
//  723   }
//  724   /* Return the flag status */
//  725   return bitstatus;
        RET
//  726 }
//  727 
//  728 /**
//  729   * @brief  Clear flags
//  730   * @param  I2C_Flag : Specifies the flag to clear
//  731   *   This parameter can be any combination of the following values:
//  732   *                       - I2C_FLAG_WAKEUPFROMHALT: Wakeup from Halt
//  733   *                       - I2C_FLAG_OVERRUNUNDERRUN: Overrun/Underrun flag (Slave mode)
//  734   *                       - I2C_FLAG_ACKNOWLEDGEFAILURE: Acknowledge failure flag
//  735   *                       - I2C_FLAG_ARBITRATIONLOSS: Arbitration lost flag (Master mode)
//  736   *                       - I2C_FLAG_BUSERROR: Bus error flag.
//  737   * @note Notes:
//  738   *                       - STOPF (STOP detection) is cleared by software
//  739   *                         sequence: a read operation to I2C_SR1 register
//  740   *                         (I2C_GetFlagStatus()) followed by a write operation
//  741   *                         to I2C_CR2 register.
//  742   *                       - ADD10 (10-bit header sent) is cleared by software
//  743   *                         sequence: a read operation to I2C_SR1
//  744   *                         (I2C_GetFlagStatus()) followed by writing the
//  745   *                         second byte of the address in DR register.
//  746   *                       - BTF (Byte Transfer Finished) is cleared by software
//  747   *                         sequence: a read operation to I2C_SR1 register
//  748   *                         (I2C_GetFlagStatus()) followed by a read/write to
//  749   *                         I2C_DR register (I2C_SendData()).
//  750   *                       - ADDR (Address sent) is cleared by software sequence:
//  751   *                         a read operation to I2C_SR1 register
//  752   *                         (I2C_GetFlagStatus()) followed by a read operation to
//  753   *                         I2C_SR3 register ((void)(I2C->SR3)).
//  754   *                       - SB (Start Bit) is cleared software sequence: a read
//  755   *                         operation to I2C_SR1 register (I2C_GetFlagStatus())
//  756   *                         followed by a write operation to I2C_DR register
//  757   *                         (I2C_SendData()).
//  758   * @retval None
//  759   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  760 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
//  761 {
//  762   uint16_t flagpos = 0;
//  763   /* Check the parameters */
//  764   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
//  765 
//  766   /* Get the I2C flag position */
//  767   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
//  768   /* Clear the selected I2C flag */
//  769   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
I2C_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x5218, A
//  770 }
        RET
//  771 
//  772 /**
//  773   * @brief  Checks whether the specified I2C interrupt has occurred or not.
//  774   * @param  I2C_ITPendingBit: specifies the interrupt source to check.
//  775   *            This parameter can be one of the following values:
//  776   *               - I2C_ITPENDINGBIT_WAKEUPFROMHALT: Wakeup from Halt
//  777   *               - I2C_ITPENDINGBIT_OVERRUNUNDERRUN: Overrun/Underrun flag (Slave mode)
//  778   *               - I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE: Acknowledge failure flag
//  779   *               - I2C_ITPENDINGBIT_ARBITRATIONLOSS: Arbitration lost flag (Master mode)
//  780   *               - I2C_ITPENDINGBIT_BUSERROR: Bus error flag
//  781   *               - I2C_ITPENDINGBIT_TXEMPTY: Data register empty flag (Transmitter)
//  782   *               - I2C_ITPENDINGBIT_RXNOTEMPTY: Data register not empty (Receiver) flag
//  783   *               - I2C_ITPENDINGBIT_STOPDETECTION: Stop detection flag (Slave mode)
//  784   *               - I2C_ITPENDINGBIT_HEADERSENT: 10-bit header sent flag (Master mode)
//  785   *               - I2C_ITPENDINGBIT_TRANSFERFINISHED: Byte transfer finished flag
//  786   *               - I2C_ITPENDINGBIT_ADDRESSSENTMATCHED: Address sent flag (Master mode) “ADSL”
//  787   *                              Address matched flag (Slave mode)“ENDAD”
//  788   *               - I2C_ITPENDINGBIT_STARTDETECTION: Start bit flag (Master mode)
//  789   * @retval The new state of I2C_ITPendingBit
//  790   *   This parameter can be any of the @ref ITStatus enumeration.
//  791   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  792 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
//  793 {
I2C_GetITStatus:
        SUB       SP, #0x1
        LDW       Y, X
//  794   ITStatus bitstatus = RESET;
//  795   __IO uint8_t enablestatus = 0;
        CLR       A
        LD        (0x1,SP), A
//  796   uint16_t tempregister = 0;
//  797 
//  798     /* Check the parameters */
//  799     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
//  800 
//  801   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
//  802 
//  803   /* Check if the interrupt source is enabled or not */
//  804   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
        RRWA      X, A
        LD        A, XL
        AND       A, L:0x521a
        AND       A, #0x7
        LD        (0x1,SP), A
//  805 
//  806   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
//  807   {
//  808     /* Check the status of the specified I2C flag */
//  809     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
//  810     {
//  811       /* I2C_IT is set */
//  812       bitstatus = SET;
//  813     }
//  814     else
//  815     {
//  816       /* I2C_IT is reset */
//  817       bitstatus = RESET;
//  818     }
//  819   }
//  820   else
//  821   {
//  822     /* Check the status of the specified I2C flag */
//  823     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
        LD        A, YL
        BCP       A, L:0x5218
        JREQ      L:??I2C_GetITStatus_0
        TNZ       (0x1,SP)
        JREQ      L:??I2C_GetITStatus_0
//  824     {
//  825       /* I2C_IT is set */
//  826       bitstatus = SET;
        LD        A, #0x1
        JRA       L:??I2C_GetITStatus_1
//  827     }
//  828     else
//  829     {
//  830       /* I2C_IT is reset */
//  831       bitstatus = RESET;
??I2C_GetITStatus_0:
        CLR       A
//  832     }
//  833   }
//  834   /* Return the I2C_IT status */
//  835   return  bitstatus;
??I2C_GetITStatus_1:
        ADD       SP, #0x1
        RET
//  836 
//  837 }
//  838 
//  839 /**
//  840   * @brief  Clear IT pending bit
//  841   * @param  I2C_IT: specifies the interrupt pending bit to clear.
//  842   *            This parameter can be any combination of the following values:
//  843   *                 - I2C_ITPENDINGBIT_WAKEUPFROMHALT: Wakeup from Halt
//  844   *                 - I2C_ITPENDINGBIT_OVERRUNUNDERRUN: Overrun/Underrun interrupt (Slave mode)
//  845   *                 - I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE: Acknowledge failure interrupt
//  846   *                 - I2C_ITPENDINGBIT_ARBITRATIONLOSS: Arbitration lost interrupt (Master mode)
//  847   *                 - I2C_ITPENDINGBIT_BUSERROR: Bus error interrupt
//  848   *
//  849   *             Notes:
//  850   *                  - STOPF (STOP detection) is cleared by software
//  851   *                    sequence: a read operation to I2C_SR1 register
//  852   *                    (I2C_GetITStatus()) followed by a write operation to
//  853   *                    I2C_CR2 register (I2C_AcknowledgeConfig() to configure
//  854   *                    the I2C peripheral Acknowledge).
//  855   *                  - ADD10 (10-bit header sent) is cleared by software
//  856   *                    sequence: a read operation to I2C_SR1
//  857   *                    (I2C_GetITStatus()) followed by writing the second
//  858   *                    byte of the address in I2C_DR register.
//  859   *                  - BTF (Byte Transfer Finished) is cleared by software
//  860   *                    sequence: a read operation to I2C_SR1 register
//  861   *                    (I2C_GetITStatus()) followed by a read/write to
//  862   *                    I2C_DR register (I2C_SendData()).
//  863   *                  - ADDR (Address sent) is cleared by software sequence:
//  864   *                    a read operation to I2C_SR1 register (I2C_GetITStatus())
//  865   *                    followed by a read operation to I2C_SR3 register
//  866   *                    ((void)(I2C->SR3)).
//  867   *                  - SB (Start Bit) is cleared by software sequence: a
//  868   *                    read operation to I2C_SR1 register (I2C_GetITStatus())
//  869   *                    followed by a write operation to I2C_DR register
//  870   *                    (I2C_SendData()).
//  871   * @retval None
//  872   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  873 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
//  874 {
//  875   uint16_t flagpos = 0;
//  876 
//  877   /* Check the parameters */
//  878   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
//  879 
//  880   /* Get the I2C flag position */
//  881   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
//  882 
//  883   /* Clear the selected I2C flag */
//  884   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
I2C_ClearITPendingBit:
        LD        A, XL
        CPL       A
        LD        L:0x5218, A
//  885 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  886 
//  887 /**
//  888   * @}
//  889   */
//  890 
//  891 /**
//  892   * @}
//  893   */
//  894 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 644 bytes in section .near_func.text
// 
// 644 bytes of CODE memory
//
//Errors: none
//Warnings: none
