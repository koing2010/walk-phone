///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:27 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_spi.c          /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_spi.c -e -Oh   /
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
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_spi.s     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_spi

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?sll16_x_x_a

        PUBLIC SPI_BiDirectionalLineConfig
        PUBLIC SPI_CalculateCRCCmd
        PUBLIC SPI_ClearFlag
        PUBLIC SPI_ClearITPendingBit
        PUBLIC SPI_Cmd
        PUBLIC SPI_DeInit
        PUBLIC SPI_GetCRC
        PUBLIC SPI_GetCRCPolynomial
        PUBLIC SPI_GetFlagStatus
        PUBLIC SPI_GetITStatus
        PUBLIC SPI_ITConfig
        PUBLIC SPI_Init
        PUBLIC SPI_NSSInternalSoftwareCmd
        PUBLIC SPI_ReceiveData
        PUBLIC SPI_ResetCRC
        PUBLIC SPI_SendData
        PUBLIC SPI_TransmitCRC

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_spi.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_spi.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the SPI peripheral.
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
//   23 #include "stm8s_spi.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28   
//   29 /* Private define ------------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 /* Private functions ---------------------------------------------------------*/
//   34 
//   35 /** @addtogroup SPI_Public_Functions
//   36   * @{
//   37   */
//   38 
//   39 /**
//   40   * @brief  Deinitializes the SPI peripheral registers to their default reset values.
//   41   * @param  None
//   42   * @retval None
//   43   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   44 void SPI_DeInit(void)
//   45 {
//   46     SPI->CR1    = SPI_CR1_RESET_VALUE;
SPI_DeInit:
        CLR       L:0x5200
//   47     SPI->CR2    = SPI_CR2_RESET_VALUE;
        CLR       L:0x5201
//   48     SPI->ICR    = SPI_ICR_RESET_VALUE;
        CLR       L:0x5202
//   49     SPI->SR     = SPI_SR_RESET_VALUE;
        MOV       L:0x5203, #0x2
//   50     SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
        MOV       L:0x5205, #0x7
//   51 }
        RET
//   52 
//   53 /**
//   54   * @brief  Initializes the SPI according to the specified parameters.
//   55   * @param  FirstBit : This parameter can be any of the 
//   56   *         @ref SPI_FirstBit_TypeDef enumeration.
//   57   * @param  BaudRatePrescaler : This parameter can be any of the 
//   58   *         @ref SPI_BaudRatePrescaler_TypeDef enumeration.
//   59   * @param  Mode : This parameter can be any of the  
//   60   *         @ref SPI_Mode_TypeDef enumeration.
//   61   * @param  ClockPolarity : This parameter can be any of the 
//   62   *         @ref SPI_ClockPolarity_TypeDef enumeration.
//   63   * @param  ClockPhase : This parameter can be any of the 
//   64   *         @ref SPI_ClockPhase_TypeDef enumeration.
//   65   * @param  Data_Direction : This parameter can be any of the 
//   66   *         @ref SPI_DataDirection_TypeDef enumeration.
//   67   * @param  Slave_Management : This parameter can be any of the 
//   68   *         @ref SPI_NSS_TypeDef enumeration.
//   69   * @param  CRCPolynomial : Configures the CRC polynomial.
//   70   * @retval None
//   71   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   72 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
//   73 {
SPI_Init:
        LD        S:?b7, A
        LD        A, S:?b0
//   74     /* Check structure elements */
//   75     assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
//   76     assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
//   77     assert_param(IS_SPI_MODE_OK(Mode));
//   78     assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
//   79     assert_param(IS_SPI_PHASE_OK(ClockPhase));
//   80     assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
//   81     assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
//   82     assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
//   83 
//   84     /* Frame Format, BaudRate, Clock Polarity and Phase configuration */
//   85     SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
//   86                     (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
        OR        A, S:?b7
        OR        A, S:?b2
        OR        A, S:?b3
        LD        L:0x5200, A
//   87 
//   88     /* Data direction configuration: BDM, BDOE and RXONLY bits */
//   89     SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
        LD        A, S:?b5
        OR        A, S:?b4
        LD        L:0x5201, A
//   90 
//   91     if (Mode == SPI_MODE_MASTER)
        LD        A, S:?b1
        CP        A, #0x4
        JRNE      L:??SPI_Init_0
//   92     {
//   93         SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
        BSET      L:0x5201, #0x0
        JRA       L:??SPI_Init_1
//   94     }
//   95     else
//   96     {
//   97         SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
??SPI_Init_0:
        BRES      L:0x5201, #0x0
//   98     }
//   99 
//  100     /* Master/Slave mode configuration */
//  101     SPI->CR1 |= (uint8_t)(Mode);
??SPI_Init_1:
        OR        A, L:0x5200
        LD        L:0x5200, A
//  102 
//  103     /* CRC configuration */
//  104     SPI->CRCPR = (uint8_t)CRCPolynomial;
        LD        A, S:?b6
        LD        L:0x5205, A
//  105 }
        RET
//  106 
//  107 /**
//  108   * @brief  Enables or disables the SPI peripheral.
//  109   * @param  NewState New state of the SPI peripheral.
//  110   *         This parameter can be: ENABLE or DISABLE
//  111   * @retval None
//  112   */

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
//  113 void SPI_Cmd(FunctionalState NewState)
//  114 {
//  115     /* Check function parameters */
//  116     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  117 
//  118     if (NewState != DISABLE)
SPI_Cmd:
        TNZ       A
        JREQ      L:??SPI_Cmd_0
//  119     {
//  120         SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
        BSET      L:0x5200, #0x6
        RET
//  121     }
//  122     else
//  123     {
//  124         SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
??SPI_Cmd_0:
        BRES      L:0x5200, #0x6
//  125     }
//  126 }
        RET
//  127 
//  128 /**
//  129   * @brief  Enables or disables the specified interrupts.
//  130   * @param  SPI_IT Specifies the SPI interrupts sources to be enabled or disabled.
//  131   * @param  NewState: The new state of the specified SPI interrupts.
//  132   *         This parameter can be: ENABLE or DISABLE.
//  133   * @retval None
//  134   */
//  135 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
//  136 {
//  137     uint8_t itpos = 0;
//  138     /* Check function parameters */
//  139     assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
//  140     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  141 
//  142     /* Get the SPI IT index */
//  143     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
//  144 
//  145     if (NewState != DISABLE)
//  146     {
//  147         SPI->ICR |= itpos; /* Enable interrupt*/
//  148     }
//  149     else
//  150     {
//  151         SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
//  152     }
//  153 }
//  154 /**
//  155   * @brief  Transmits a Data through the SPI peripheral.
//  156   * @param  Data : Byte to be transmitted.
//  157   * @retval None
//  158   */
//  159 void SPI_SendData(uint8_t Data)
//  160 {
//  161     SPI->DR = Data; /* Write in the DR register the data to be sent*/
//  162 }
//  163 
//  164 /**
//  165   * @brief  Returns the most recent received data by the SPI peripheral.
//  166   * @param  None
//  167   * @retval The value of the received data.
//  168   */
//  169 uint8_t SPI_ReceiveData(void)
//  170 {
//  171     return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
//  172 }
//  173 
//  174 /**
//  175   * @brief  Configures internally by software the NSS pin.
//  176   * @param  NewState Indicates the new state of the SPI Software slave management.
//  177   *         This parameter can be: ENABLE or DISABLE.
//  178   * @retval None
//  179   */
//  180 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
//  181 {
//  182     /* Check function parameters */
//  183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  184 
//  185     if (NewState != DISABLE)
//  186     {
//  187         SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
//  188     }
//  189     else
//  190     {
//  191         SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
//  192     }
//  193 }
//  194 
//  195 /**
//  196   * @brief  Enables the transmit of the CRC value.
//  197   * @param  None
//  198   * @retval None
//  199   */
//  200 void SPI_TransmitCRC(void)
//  201 {
//  202     SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
//  203 }
//  204 
//  205 /**
//  206   * @brief  Enables or disables the CRC value calculation of the transferred bytes.
//  207   * @param  NewState Indicates the new state of the SPI CRC value calculation.
//  208   *         This parameter can be: ENABLE or DISABLE.
//  209   * @retval None
//  210   */

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
//  211 void SPI_CalculateCRCCmd(FunctionalState NewState)
//  212 {
//  213     /* Check function parameters */
//  214     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  215 
//  216     if (NewState != DISABLE)
SPI_CalculateCRCCmd:
        TNZ       A
        JREQ      L:??SPI_CalculateCRCCmd_0
//  217     {
//  218         SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
        BSET      L:0x5201, #0x5
        RET
//  219     }
//  220     else
//  221     {
//  222         SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
??SPI_CalculateCRCCmd_0:
        BRES      L:0x5201, #0x5
//  223     }
//  224 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_ResetCRC:
        LD        A, #0x1
        CALL      L:SPI_CalculateCRCCmd
        LD        A, #0x1
        JP        L:SPI_Cmd

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_ITConfig:
        CALL      L:??Subroutine1_0
??CrossCallReturnLabel_1:
        TNZ       S:?b0
        JREQ      L:??SPI_ITConfig_0
        OR        A, L:0x5202
        JRA       L:??SPI_ITConfig_1
??SPI_ITConfig_0:
        CPL       A
        AND       A, L:0x5202
??SPI_ITConfig_1:
        LD        L:0x5202, A
        RET

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine0:
        SWAP      A
        REQUIRE ??Subroutine1_0
        ;               // Fall through to label ??Subroutine1_0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine1_0:
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_SendData:
        LD        L:0x5204, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_ReceiveData:
        LD        A, L:0x5204
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_NSSInternalSoftwareCmd:
        TNZ       A
        JREQ      L:??SPI_NSSInternalSoftwareCmd_0
        BSET      L:0x5201, #0x0
        RET
??SPI_NSSInternalSoftwareCmd_0:
        BRES      L:0x5201, #0x0
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_TransmitCRC:
        BSET      L:0x5201, #0x4
        RET
//  225 
//  226 /**
//  227   * @brief  Returns the transmit or the receive CRC register value.
//  228   * @param  SPI_CRC Specifies the CRC register to be read.
//  229   * @retval The selected CRC register value.
//  230   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  231 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
//  232 {
//  233     uint8_t crcreg = 0;
//  234 
//  235     /* Check function parameters */
//  236     assert_param(IS_SPI_CRC_OK(SPI_CRC));
//  237 
//  238     if (SPI_CRC != SPI_CRC_RX)
SPI_GetCRC:
        TNZ       A
        JREQ      L:??SPI_GetCRC_0
//  239     {
//  240         crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
        LD        A, L:0x5207
        RET
//  241     }
//  242     else
//  243     {
//  244         crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
??SPI_GetCRC_0:
        LD        A, L:0x5206
//  245     }
//  246 
//  247     /* Return the selected CRC register status*/
//  248     return crcreg;
        RET
//  249 }
//  250 
//  251 /**
//  252   * @brief  Reset the Rx CRCR and Tx CRCR registers.
//  253   * @param  None
//  254   * @retval None
//  255   */
//  256 void SPI_ResetCRC(void)
//  257 {
//  258     /* Rx CRCR & Tx CRCR registers are reset when CRCEN (hardware calculation)
//  259        bit in SPI_CR2 is written to 1 (enable) */
//  260     SPI_CalculateCRCCmd(ENABLE);
//  261 
//  262     /* Previous function disable the SPI */
//  263     SPI_Cmd(ENABLE);
//  264 }
//  265 
//  266 /**
//  267   * @brief  Returns the CRC Polynomial register value.
//  268   * @param  None
//  269   * @retval The CRC Polynomial register value.
//  270   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  271 uint8_t SPI_GetCRCPolynomial(void)
//  272 {
//  273     return SPI->CRCPR; /* Return the CRC polynomial register */
SPI_GetCRCPolynomial:
        LD        A, L:0x5205
        RET
//  274 }
//  275 
//  276 /**
//  277   * @brief  Selects the data transfer direction in bi-directional mode.
//  278   * @param  SPI_Direction Specifies the data transfer direction in bi-directional mode.
//  279   * @retval None
//  280   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  281 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
//  282 {
//  283     /* Check function parameters */
//  284     assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
//  285 
//  286     if (SPI_Direction != SPI_DIRECTION_RX)
SPI_BiDirectionalLineConfig:
        TNZ       A
        JREQ      L:??SPI_BiDirectionalLineConfig_0
//  287     {
//  288         SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
        BSET      L:0x5201, #0x6
        RET
//  289     }
//  290     else
//  291     {
//  292         SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
??SPI_BiDirectionalLineConfig_0:
        BRES      L:0x5201, #0x6
//  293     }
//  294 }
        RET
//  295 
//  296 /**
//  297   * @brief  Checks whether the specified SPI flag is set or not.
//  298   * @param  SPI_FLAG : Specifies the flag to check.
//  299   *         This parameter can be any of the @ref SPI_FLAG_TypeDef enumeration.
//  300   * @retval FlagStatus : Indicates the state of SPI_FLAG.
//  301   *         This parameter can be any of the @ref FlagStatus enumeration.
//  302   */
//  303 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  304 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
//  305 {
//  306     FlagStatus status = RESET;
//  307     /* Check parameters */
//  308     assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
//  309 
//  310     /* Check the status of the specified SPI flag */
//  311     if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
SPI_GetFlagStatus:
        BCP       A, L:0x5203
        JREQ      L:??SPI_GetFlagStatus_0
//  312     {
//  313         status = SET; /* SPI_FLAG is set */
        LD        A, #0x1
        RET
//  314     }
//  315     else
//  316     {
//  317         status = RESET; /* SPI_FLAG is reset*/
??SPI_GetFlagStatus_0:
        CLR       A
//  318     }
//  319 
//  320     /* Return the SPI_FLAG status */
//  321     return status;
        RET
//  322 }
//  323 
//  324 /**
//  325   * @brief  Clears the SPI flags.
//  326   * @param  SPI_FLAG : Specifies the flag to clear.
//  327   *         This parameter can be one of the following values:
//  328   *         - SPI_FLAG_CRCERR
//  329   *         - SPI_FLAG_WKUP
//  330   * @note   - OVR (OverRun Error) interrupt pending bit is cleared by software
//  331   *         sequence:
//  332   *         a read operation to SPI_DR register (SPI_ReceiveData()) followed by
//  333   *         a read operation to SPI_SR register (SPI_GetFlagStatus()).
//  334   *         - MODF (Mode Fault) interrupt pending bit is cleared by software sequence:
//  335   *         a read/write operation to SPI_SR register (SPI_GetFlagStatus()) followed by
//  336   *         a write operation to SPI_CR1 register (SPI_Cmd() to enable the SPI).
//  337   * @retval None
//  338   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  339 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
//  340 {
//  341     assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
//  342     /* Clear the flag bit */
//  343     SPI->SR = (uint8_t)(~SPI_FLAG);
SPI_ClearFlag:
        CPL       A
        LD        L:0x5203, A
//  344 }
        RET
//  345 
//  346 /**
//  347   * @brief  Checks whether the specified interrupt has occurred or not.
//  348   * @param  SPI_IT: Specifies the SPI interrupt pending bit to check.
//  349   *         This parameter can be one of the following values:
//  350   *         - SPI_IT_CRCERR
//  351   *         - SPI_IT_WKUP
//  352   *         - SPI_IT_OVR
//  353   *         - SPI_IT_MODF
//  354   *         - SPI_IT_RXNE
//  355   *         - SPI_IT_TXE
//  356   * @retval ITStatus : Indicates the state of the SPI_IT.
//  357   *         This parameter can be any of the @ref ITStatus enumeration.
//  358   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  359 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
//  360 {
SPI_GetITStatus:
        LD        S:?b0, A
//  361     ITStatus pendingbitstatus = RESET;
//  362     uint8_t itpos = 0;
//  363     uint8_t itmask1 = 0;
//  364     uint8_t itmask2 = 0;
//  365     uint8_t enablestatus = 0;
//  366     assert_param(IS_SPI_GET_IT_OK(SPI_IT));
//  367     /* Get the SPI IT index */
//  368     itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
//  369 
//  370     /* Get the SPI IT mask */
//  371     itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
//  372     /* Set the IT mask */
//  373     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
//  374     /* Get the SPI_ITPENDINGBIT enable bit status */
//  375     enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
        CALL      L:?Subroutine0
??CrossCallReturnLabel_3:
        AND       A, L:0x5203
        LD        S:?b1, A
//  376     /* Check the status of the specified SPI interrupt */
//  377     if (((SPI->ICR & itpos) != RESET) && enablestatus)
        LD        A, S:?b0
        CALL      L:??Subroutine1_0
??CrossCallReturnLabel_0:
        BCP       A, L:0x5202
        JREQ      L:??SPI_GetITStatus_0
        TNZ       S:?b1
        JREQ      L:??SPI_GetITStatus_0
//  378     {
//  379         /* SPI_ITPENDINGBIT is set */
//  380         pendingbitstatus = SET;
        LD        A, #0x1
        RET
//  381     }
//  382     else
//  383     {
//  384         /* SPI_ITPENDINGBIT is reset */
//  385         pendingbitstatus = RESET;
??SPI_GetITStatus_0:
        CLR       A
//  386     }
//  387     /* Return the SPI_ITPENDINGBIT status */
//  388     return  pendingbitstatus;
        RET
//  389 }
//  390 /**
//  391   * @brief  Clears the interrupt pending bits.
//  392   * @param  SPI_IT: Specifies the interrupt pending bit to clear.
//  393   *         This parameter can be one of the following values:
//  394   *         - SPI_IT_CRCERR
//  395   *         - SPI_IT_WKUP
//  396   * @note   - OVR (OverRun Error) interrupt pending bit is cleared by software sequence:
//  397   *         a read operation to SPI_DR register (SPI_ReceiveData()) followed by
//  398   *         a read operation to SPI_SR register (SPI_GetITStatus()).
//  399   *         - MODF (Mode Fault) interrupt pending bit is cleared by software sequence:
//  400   *         a read/write operation to SPI_SR register (SPI_GetITStatus()) followed by
//  401   *         a write operation to SPI_CR1 register (SPI_Cmd() to enable the SPI).
//  402   * @retval None
//  403   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  404 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
//  405 {
//  406     uint8_t itpos = 0;
//  407     assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
//  408 
//  409     /* Clear  SPI_IT_CRCERR or SPI_IT_WKUP interrupt pending bits */
//  410 
//  411     /* Get the SPI pending bit index */
//  412     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
//  413     /* Clear the pending bit */
//  414     SPI->SR = (uint8_t)(~itpos);
SPI_ClearITPendingBit:
        CALL      L:?Subroutine0
??CrossCallReturnLabel_2:
        CPL       A
        LD        L:0x5203, A
//  415 
//  416 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  417 /**
//  418   * @}
//  419   */
//  420   
//  421 /**
//  422   * @}
//  423   */
//  424   
//  425 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 241 bytes in section .near_func.text
// 
// 241 bytes of CODE memory
//
//Errors: none
//Warnings: none
