///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  10:42:45 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\stm8s\src\init_peripher.c                    /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\src\init_peripher.c" -e -On --no_cse   /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o "E:\RDA1846s\walkphone           /
//                    program\ucos - transeiver\stm8s\iar\Debug\Obj\"         /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench 6.5\stm8\LIB\dlstm8smn.h"    /
//                    -D STM8S207 -lB "E:\RDA1846s\walkphone program\ucos -   /
//                    transeiver\stm8s\iar\Debug\List\" --diag_suppress       /
//                    pa089 -I "E:\RDA1846s\walkphone program\ucos -          /
//                    transeiver\stm8s\iar\..\..\ucos_ii\" -I                 /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\iar\..\..\ucos_ii\iarstm8\" -I         /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\iar\..\src\" -I                        /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\iar\..\fwlib\inc\" --vregs 16          /
//    List file    =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\stm8s\iar\Debug\List\init_peripher.s         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME init_peripher

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b2
        EXTERN ?epilogue_w4
        EXTERN ?mov_w0_w1
        EXTERN ?push_w4
        EXTERN ?sdiv16_x_x_y
        EXTERN ?srl8_a_a_6
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4

        PUBLIC All_Init
        PUBLIC Delay_Ms
        PUBLIC EEPROM_ReadByte
        PUBLIC EEPROM_WriteByte
        PUBLIC FLASH_DUKR
        PUBLIC IWDG_Init
        PUBLIC IWDG_KR
        PUBLIC IWDG_RLR
        PUBLIC SendFrame
        PUBLIC TIM1_ARRH
        PUBLIC TIM1_ARRL
        PUBLIC TIM1_CCR1H
        PUBLIC TIM1_CCR1L
        PUBLIC TIM1_PSCRH
        PUBLIC TIM1_PSCRL
        PUBLIC TIM1_PWM_Init
        PUBLIC TIM2_ARRH
        PUBLIC TIM2_ARRL
        PUBLIC TIM2_CNTRH
        PUBLIC TIM2_CNTRL
        PUBLIC TIM4_ARR
        PUBLIC TIM4_CNTR
        PUBLIC TIM4_Init
        PUBLIC UART2_DR
        PUBLIC UART2_SendByte
        PUBLIC _A_CLK_CKDIVR
        PUBLIC _A_CLK_SWCR
        PUBLIC _A_FLASH_IAPSR
        PUBLIC _A_IWDG_PR
        PUBLIC _A_PB_CR1
        PUBLIC _A_PB_CR2
        PUBLIC _A_PB_DDR
        PUBLIC _A_PB_ODR
        PUBLIC _A_PD_CR1
        PUBLIC _A_PD_CR2
        PUBLIC _A_PD_DDR
        PUBLIC _A_PD_ODR
        PUBLIC _A_PF_CR1
        PUBLIC _A_PF_CR2
        PUBLIC _A_PF_DDR
        PUBLIC _A_TIM1_BKR
        PUBLIC _A_TIM1_CCER1
        PUBLIC _A_TIM1_CCMR1
        PUBLIC _A_TIM1_CR1
        PUBLIC _A_TIM2_CR1
        PUBLIC _A_TIM2_EGR
        PUBLIC _A_TIM2_IER
        PUBLIC _A_TIM2_PSCR
        PUBLIC _A_TIM4_CR1
        PUBLIC _A_TIM4_EGR
        PUBLIC _A_TIM4_IER
        PUBLIC _A_TIM4_PSCR
        PUBLIC _A_UART2_SR

// E:\RDA1846s\walkphone program\ucos - transeiver\stm8s\src\init_peripher.c
//    1 /**********************************************************************************
//    2 
//    3 File_name:      init_peripher.c
//    4 Version:		   0.0
//    5 Revised:        $Date:2014-7-  ; $
//    6 Description:    the main file of this project.
//    7 Notes:          This version targets the stm8
//    8 Editor:		    Mr.Kong
//    9 
//   10 **********************************************************************************/
//   11 
//   12 
//   13 /*================================================================================
//   14 @ Include files
//   15 */
//   16 #include "init_peripher.h"

        ASEGN `.near.noinit`:DATA:NOROOT,05005H
        SECTION_GROUP _A_PB_ODR
// union <unnamed> volatile _A_PB_ODR
_A_PB_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05007H
        SECTION_GROUP _A_PB_DDR
// union <unnamed> volatile _A_PB_DDR
_A_PB_DDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05008H
        SECTION_GROUP _A_PB_CR1
// union <unnamed> volatile _A_PB_CR1
_A_PB_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05009H
        SECTION_GROUP _A_PB_CR2
// union <unnamed> volatile _A_PB_CR2
_A_PB_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0500fH
        SECTION_GROUP _A_PD_ODR
// union <unnamed> volatile _A_PD_ODR
_A_PD_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05011H
        SECTION_GROUP _A_PD_DDR
// union <unnamed> volatile _A_PD_DDR
_A_PD_DDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05012H
        SECTION_GROUP _A_PD_CR1
// union <unnamed> volatile _A_PD_CR1
_A_PD_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05013H
        SECTION_GROUP _A_PD_CR2
// union <unnamed> volatile _A_PD_CR2
_A_PD_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0501bH
        SECTION_GROUP _A_PF_DDR
// union <unnamed> volatile _A_PF_DDR
_A_PF_DDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0501cH
        SECTION_GROUP _A_PF_CR1
// union <unnamed> volatile _A_PF_CR1
_A_PF_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0501dH
        SECTION_GROUP _A_PF_CR2
// union <unnamed> volatile _A_PF_CR2
_A_PF_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0505fH
        SECTION_GROUP _A_FLASH_IAPSR
// union <unnamed> volatile _A_FLASH_IAPSR
_A_FLASH_IAPSR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05064H
        SECTION_GROUP FLASH_DUKR
// unsigned char volatile FLASH_DUKR
FLASH_DUKR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050c5H
        SECTION_GROUP _A_CLK_SWCR
// union <unnamed> volatile _A_CLK_SWCR
_A_CLK_SWCR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050c6H
        SECTION_GROUP _A_CLK_CKDIVR
// union <unnamed> volatile _A_CLK_CKDIVR
_A_CLK_CKDIVR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050e0H
        SECTION_GROUP IWDG_KR
// unsigned char volatile IWDG_KR
IWDG_KR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050e1H
        SECTION_GROUP _A_IWDG_PR
// union <unnamed> volatile _A_IWDG_PR
_A_IWDG_PR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050e2H
        SECTION_GROUP IWDG_RLR
// unsigned char volatile IWDG_RLR
IWDG_RLR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05240H
        SECTION_GROUP _A_UART2_SR
// union <unnamed> volatile _A_UART2_SR
_A_UART2_SR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05241H
        SECTION_GROUP UART2_DR
// unsigned char volatile UART2_DR
UART2_DR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05250H
        SECTION_GROUP _A_TIM1_CR1
// union <unnamed> volatile _A_TIM1_CR1
_A_TIM1_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05258H
        SECTION_GROUP _A_TIM1_CCMR1
// union <unnamed> volatile _A_TIM1_CCMR1
_A_TIM1_CCMR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0525cH
        SECTION_GROUP _A_TIM1_CCER1
// union <unnamed> volatile _A_TIM1_CCER1
_A_TIM1_CCER1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05260H
        SECTION_GROUP TIM1_PSCRH
// unsigned char volatile TIM1_PSCRH
TIM1_PSCRH:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05261H
        SECTION_GROUP TIM1_PSCRL
// unsigned char volatile TIM1_PSCRL
TIM1_PSCRL:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05262H
        SECTION_GROUP TIM1_ARRH
// unsigned char volatile TIM1_ARRH
TIM1_ARRH:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05263H
        SECTION_GROUP TIM1_ARRL
// unsigned char volatile TIM1_ARRL
TIM1_ARRL:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05265H
        SECTION_GROUP TIM1_CCR1H
// unsigned char volatile TIM1_CCR1H
TIM1_CCR1H:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05266H
        SECTION_GROUP TIM1_CCR1L
// unsigned char volatile TIM1_CCR1L
TIM1_CCR1L:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0526dH
        SECTION_GROUP _A_TIM1_BKR
// union <unnamed> volatile _A_TIM1_BKR
_A_TIM1_BKR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05300H
        SECTION_GROUP _A_TIM2_CR1
// union <unnamed> volatile _A_TIM2_CR1
_A_TIM2_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05301H
        SECTION_GROUP _A_TIM2_IER
// union <unnamed> volatile _A_TIM2_IER
_A_TIM2_IER:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05304H
        SECTION_GROUP _A_TIM2_EGR
// union <unnamed> volatile _A_TIM2_EGR
_A_TIM2_EGR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0530aH
        SECTION_GROUP TIM2_CNTRH
// unsigned char volatile TIM2_CNTRH
TIM2_CNTRH:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0530bH
        SECTION_GROUP TIM2_CNTRL
// unsigned char volatile TIM2_CNTRL
TIM2_CNTRL:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0530cH
        SECTION_GROUP _A_TIM2_PSCR
// union <unnamed> volatile _A_TIM2_PSCR
_A_TIM2_PSCR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0530dH
        SECTION_GROUP TIM2_ARRH
// unsigned char volatile TIM2_ARRH
TIM2_ARRH:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0530eH
        SECTION_GROUP TIM2_ARRL
// unsigned char volatile TIM2_ARRL
TIM2_ARRL:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05340H
        SECTION_GROUP _A_TIM4_CR1
// union <unnamed> volatile _A_TIM4_CR1
_A_TIM4_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05341H
        SECTION_GROUP _A_TIM4_IER
// union <unnamed> volatile _A_TIM4_IER
_A_TIM4_IER:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05343H
        SECTION_GROUP _A_TIM4_EGR
// union <unnamed> volatile _A_TIM4_EGR
_A_TIM4_EGR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05344H
        SECTION_GROUP TIM4_CNTR
// unsigned char volatile TIM4_CNTR
TIM4_CNTR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05345H
        SECTION_GROUP _A_TIM4_PSCR
// union <unnamed> volatile _A_TIM4_PSCR
_A_TIM4_PSCR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05346H
        SECTION_GROUP TIM4_ARR
// unsigned char volatile TIM4_ARR
TIM4_ARR:
        DS8 1
//   17 
//   18 
//   19 /*================================================================================
//   20 @ Global variable
//   21 */
//   22 
//   23 
//   24 /*================================================================================
//   25 @ All functions  as follow
//   26 */
//   27 
//   28 /*********************************************************************************
//   29 Function:  void Delay_Ms(u16 z)
//   30 Description:
//   31 delay 1ms @  8MHz
//   32 
//   33 Input:        ByteData you want to send.
//   34 Output:       None
//   35 Return:       None
//   36 Others:
//   37 *********************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   38 void Delay_Ms(u16 z)
//   39 {
Delay_Ms:
        LDW       S:?w1, X
//   40   u16 x,y;
//   41   for(x=z;x>0;x--)
        CALL      L:?mov_w0_w1
??Delay_Ms_0:
        LDW       Y, S:?w0
        TNZW      Y
        JREQ      L:??Delay_Ms_1
//   42   { for(y=1600;y>0;y--);}
        LDW       Y, #0x640
        LDW       X, Y
??Delay_Ms_2:
        TNZW      X
        JREQ      L:??Delay_Ms_3
        DECW      X
        JRA       L:??Delay_Ms_2
??Delay_Ms_3:
        LDW       Y, S:?w0
        DECW      Y
        LDW       S:?w0, Y
        JRA       L:??Delay_Ms_0
//   43   
//   44   
//   45 }
??Delay_Ms_1:
        RET
//   46 
//   47 /*********************************************************************************
//   48 **名称：void EEPROM_WriteByte(uchar EEPROM_Data,uint EEPROM_Add)
//   49 **
//   50 **功能：向EEPROM 写入一字节
//   51 **
//   52 **说明：存储一字节数据 0-639
//   53 **
//   54 **时间：2013.5.6
//   55 **********************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   56 void EEPROM_WriteByte(uchar EEPROM_Data,u16 EEPROM_Add)
//   57 {
EEPROM_WriteByte:
        LDW       Y, X
//   58   uchar *Address;
//   59   Address=(uchar *)(EEPROM_Add+0x4000);
        LDW       X, Y
        ADDW      X, #0x4000
        LDW       S:?w0, X
//   60   do
//   61   {
//   62     FLASH_DUKR=0xae; // 写入第一个密钥
??EEPROM_WriteByte_0:
        MOV       L:0x5064, #0xae
//   63     FLASH_DUKR=0x56; // 写入第二个密钥
        MOV       L:0x5064, #0x56
//   64   }
//   65   while((FLASH_IAPSR&0x08)==0); // 若解锁未成功，则重新再来
        BTJF      L:0x505f, #0x3, L:??EEPROM_WriteByte_0
//   66   *Address =EEPROM_Data;     // 写入第一个字节
        LD        [S:?w0.w], A
//   67   while((FLASH_IAPSR&0x04)==0); // 等待写操作成功
??EEPROM_WriteByte_1:
        BTJF      L:0x505f, #0x2, L:??EEPROM_WriteByte_1
//   68 }
        RET
        REQUIRE FLASH_DUKR
        REQUIRE _A_FLASH_IAPSR
//   69 
//   70 
//   71 
//   72 
//   73 /*********************************************************************************
//   74 **名称：uchar EEPROM_ReadByte(uint EEPROM_Add)
//   75 **
//   76 **功能：从EEPROM 读取一字节
//   77 **
//   78 **说明：读取一字节数据
//   79 **
//   80 **时间：2013.5.6
//   81 *********************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   82 uchar EEPROM_ReadByte(u16 EEPROM_Add)
//   83 {
//   84   uchar EEPROM_Data;
//   85   EEPROM_Data = *((uchar*) (EEPROM_Add+0x4000));
EEPROM_ReadByte:
        LDW       Y, X
        ADDW      Y, #0x4000
        LD        A, (Y)
        LD        S:?b0, A
//   86   
//   87   return EEPROM_Data;
        LD        A, S:?b0
        RET
//   88 }
//   89 
//   90 
//   91 /********************************************************************************
//   92 Function:  void UART2_SendBytE
//   93 Description:
//   94 send a byte by UART2
//   95 Input:        ByteData you want to send.
//   96 Output:       None
//   97 Return:       None
//   98 Others:
//   99 *********************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  100 void UART2_SendByte(uchar ByteData)
//  101 {
UART2_SendByte:
        LD        S:?b0, A
//  102   
//  103   while(!UART2_SR_TXE);
??UART2_SendByte_0:
        BTJF      L:0x5240, #0x7, L:??UART2_SendByte_0
//  104   UART2_DR=ByteData;     //向USART1发送一字节数据
        LD        A, S:?b0
        LD        L:0x5241, A
//  105   
//  106   while(!UART2_SR_TC);   //是否发送完毕
??UART2_SendByte_1:
        LD        A, L:0x5240
        CALL      L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??UART2_SendByte_1
//  107   
//  108 }
        RET
        REQUIRE _A_UART2_SR
        REQUIRE UART2_DR
//  109 
//  110 /********************************************************************************
//  111 Function:       TIM1_PWM_Init
//  112 Description:
//  113 configurate PWM generator
//  114 Input:        CarrierFrq  you set
//  115 Output:       None
//  116 Return:       None
//  117 Others:
//  118 *********************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  119 void TIM1_PWM_Init(u8 CarrierFrq)
//  120 
//  121 {
TIM1_PWM_Init:
        LD        S:?b2, A
//  122   
//  123   u16  TIM1_ARR;
//  124   
//  125   TIM1_CCMR1=TIM1_CCMR1|0x70;
        LD        A, L:0x5258
        OR        A, #0x70
        LD        L:0x5258, A
//  126   TIM1_CCER1=TIM1_CCER1|0x03;
        LD        A, L:0x525c
        OR        A, #0x3
        LD        L:0x525c, A
//  127   
//  128   TIM1_ARR  = ( 16000 / CarrierFrq ) -1 ;// calculate the timer1 count.
        CLRW      X
        EXG       A, XL
        LD        A, S:?b2
        EXG       A, XL
        LDW       Y, X
        LDW       X, #0x3e80
        CALL      L:?sdiv16_x_x_y
        DECW      X
        LDW       S:?w0, X
//  129   TIM1_ARRH =( TIM1_ARR >> 8) & 0xFF;//
        LDW       X, S:?w0
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5262, A
//  130   TIM1_ARRL = TIM1_ARR & 0XFF;
        LD        A, S:?b1
        LD        L:0x5263, A
//  131   
//  132   
//  133   TIM1_ARR = (TIM1_ARR +1 )/ 3 -1 ;//calculate the timer1 compare data.
        LDW       X, S:?w0
        INCW      X
        LDW       Y, #0x3
        DIVW      X, Y
        DECW      X
        LDW       S:?w0, X
//  134   TIM1_CCR1H = (TIM1_ARR >> 8) & 0xFF;//
        LDW       X, S:?w0
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5265, A
//  135   TIM1_CCR1L = TIM1_ARR & 0xFF;
        LD        A, S:?b1
        LD        L:0x5266, A
//  136   
//  137   TIM1_PSCRH = 0x00;
        MOV       L:0x5260, #0x0
//  138   TIM1_PSCRL = 0x00;
        MOV       L:0x5261, #0x0
//  139   //TIM1_CCMR1_OC1M = 100;
//  140   // TIM1_CR1=TIM1_CR1|0X01;
//  141   TIM1_BKR=0x80;
        MOV       L:0x526d, #0x80
//  142   DISABLE_TIM1_PWM;
        BRES      L:0x5250, #0x0
//  143   
//  144   
//  145   
//  146 }
        RET
        REQUIRE _A_TIM1_CCMR1
        REQUIRE _A_TIM1_CCER1
        REQUIRE TIM1_ARRH
        REQUIRE TIM1_ARRL
        REQUIRE TIM1_CCR1H
        REQUIRE TIM1_CCR1L
        REQUIRE TIM1_PSCRH
        REQUIRE TIM1_PSCRL
        REQUIRE _A_TIM1_BKR
        REQUIRE _A_TIM1_CR1
//  147 /********************************************************************************
//  148 Function: void SendFrame(u8 *data,u8 Length)
//  149 Description: send a frame of data by UART2
//  150 
//  151 Input:     u8 *data    pointer  of a series of data you want to send.
//  152 u8 Length  the number of this series of
//  153 
//  154 data.
//  155 Output:       None
//  156 Return:       None
//  157 Others:
//  158 *********************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  159 void SendFrame(u8 *data,u8 Length)
//  160 {
SendFrame:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
        LD        S:?b10, A
//  161   
//  162   while( Length>0 )
??SendFrame_0:
        TNZ       S:?b10
        JREQ      L:??SendFrame_1
//  163   {
//  164     
//  165     UART2_SendByte(*data);
        LD        A, [S:?w4.w]
        CALL      L:UART2_SendByte
//  166     data++;
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  167     Length--;
        LD        A, S:?b10
        ADD       A, #0xff
        LD        S:?b10, A
        JRA       L:??SendFrame_0
//  168     
//  169   }
//  170 }
??SendFrame_1:
        POP       S:?b10
        JP        L:?epilogue_w4
//  171 
//  172 /********************************************************************************
//  173 **名称：void TIM4_Init(void)
//  174 **
//  175 **功能：定时器4 初始化
//  176 **
//  177 **说明：定时器4 用于模拟串口  波特率为9600
//  178 **
//  179 **时间：2013.04.26
//  180 *********************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  181 void TIM4_Init(void)
//  182 {
//  183   TIM4_IER=0x00; // 禁止中断
TIM4_Init:
        MOV       L:0x5341, #0x0
//  184   TIM4_EGR=0x01; // 允许产生更新事件 // 设置控制器，启动定时器
        MOV       L:0x5343, #0x1
//  185   
//  186   TIM4_PSCR = 0x00;//0.0625us
        MOV       L:0x5345, #0x0
//  187   
//  188   TIM4_ARR  = 0xEF; // 15us
        MOV       L:0x5346, #0xef
//  189   TIM4_CNTR = 0XEF;
        MOV       L:0x5344, #0xef
//  190   
//  191   //TIM4_CR1=0x01; // b0=1,允许计数器工作
//  192   TIM4_IER=0x01; // 允许中断
        MOV       L:0x5341, #0x1
//  193   DISABLE_TIM4 ;
        MOV       L:0x5340, #0x0
//  194   
//  195   
//  196 }
        RET
        REQUIRE _A_TIM4_IER
        REQUIRE _A_TIM4_EGR
        REQUIRE _A_TIM4_PSCR
        REQUIRE TIM4_ARR
        REQUIRE TIM4_CNTR
        REQUIRE _A_TIM4_CR1
//  197 /********************************************************************************
//  198 **名称：void IWDG_Init(void)
//  199 **
//  200 **功能：独立看门狗初始化
//  201 **
//  202 **说明：
//  203 **
//  204 **时间：2013.09.27
//  205 *********************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  206 void IWDG_Init(void)
//  207 {
//  208   
//  209   IWDG_KR=0xcc;
IWDG_Init:
        MOV       L:0x50e0, #0xcc
//  210   IWDG_KR=0x55;
        MOV       L:0x50e0, #0x55
//  211   IWDG_PR=0x06;
        MOV       L:0x50e1, #0x6
//  212   IWDG_RLR=0xff;
        MOV       L:0x50e2, #0xff
//  213   IWDG_KR=0xaa;
        MOV       L:0x50e0, #0xaa
//  214   
//  215 }
        RET
        REQUIRE IWDG_KR
        REQUIRE _A_IWDG_PR
        REQUIRE IWDG_RLR
//  216 
//  217 
//  218 
//  219 
//  220 /********************************************************************************
//  221 Function:  All_Iint
//  222 Description:  external device will be configurated in this sector.
//  223 Input:        None
//  224 Output:       None
//  225 Return:       None
//  226 Others:
//  227 *********************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  228 void All_Init(void)
//  229 {
//  230   
//  231   
//  232   /***************MCU clock config*********/
//  233   CLK_CKDIVR = 0x00;     //RC振荡器不分频   CPU分频 M
All_Init:
        MOV       L:0x50c6, #0x0
//  234   CLK_SWCR = 0x00;      //禁止时钟切换
        MOV       L:0x50c5, #0x0
//  235   // CLK_ICKR_LSIEN = 1;   //开启看门狗时钟；
//  236   //  while(!CLK_ICKR_LSIRDY);
//  237   
//  238   
//  239   //  IWDG_Init();//in
//  240   
//  241   
//  242   //Rx Power ennable
//  243   PD_DDR_DDR6 = 1;
        BSET      L:0x5011, #0x6
//  244   PD_CR1_C16  = 1;
        BSET      L:0x5012, #0x6
//  245   PD_CR2_C26  = 0;
        BRES      L:0x5013, #0x6
//  246   
//  247   //SQL
//  248   PF_DDR_DDR4 = 1;
        BSET      L:0x501b, #0x4
//  249   PF_CR1_C14  = 1;
        BSET      L:0x501c, #0x4
//  250   PF_CR2_C24  = 0;
        BRES      L:0x501d, #0x4
//  251   //Tx Power ennable
//  252   PB_DDR_DDR0 = 1;
        BSET      L:0x5007, #0x0
//  253   PB_CR1_C10  = 1;
        BSET      L:0x5008, #0x0
//  254   PB_CR2_C20  = 0;
        BRES      L:0x5009, #0x0
//  255   
//  256   
//  257   //SDIO 
//  258   PD_DDR_DDR3 = 1;
        BSET      L:0x5011, #0x3
//  259   PD_CR1_C13  = 1;
        BSET      L:0x5012, #0x3
//  260   PD_CR2_C23  = 0; 
        BRES      L:0x5013, #0x3
//  261   
//  262   //SCLK
//  263   PD_DDR_DDR2 = 1;
        BSET      L:0x5011, #0x2
//  264   PD_CR1_C12  = 1;
        BSET      L:0x5012, #0x2
//  265   PD_CR2_C22  = 0; 
        BRES      L:0x5013, #0x2
//  266   
//  267   //SEBN
//  268   PD_DDR_DDR0 = 1;
        BSET      L:0x5011, #0x0
//  269   PD_CR1_C10  = 1;
        BSET      L:0x5012, #0x0
//  270   PD_CR2_C20  = 0; 
        BRES      L:0x5013, #0x0
//  271   PD_ODR_ODR0 = 1;
        BSET      L:0x500f, #0x0
//  272 //  //stled316s IO all is pp out
//  273 //  PA_DDR_DDR2 = 1;
//  274 //  PA_CR1_C12  = 1;
//  275 //  PA_CR2_C22  = 0;
//  276 //  
//  277 //  PA_DDR_DDR1 = 1;
//  278 //  PA_CR1_C11  = 1;
//  279 //  PA_CR2_C21  = 0;
//  280 //  
//  281 //  PF_DDR_DDR4 = 1;
//  282 //  PF_CR1_C14  = 1;
//  283 //  PF_CR2_C24  = 0; 
//  284   
//  285   //key input
//  286   PB_DDR_DDR1 = 0;
        BRES      L:0x5007, #0x1
//  287   PB_CR1_C11  = 1;
        BSET      L:0x5008, #0x1
//  288   PB_CR2_C21  = 0;
        BRES      L:0x5009, #0x1
//  289   PB_ODR_ODR1 = 1;
        BSET      L:0x5005, #0x1
//  290   
//  291   PD_DDR_DDR7 = 0;//
        BRES      L:0x5011, #0x7
//  292   PD_CR1_C17  = 1;
        BSET      L:0x5012, #0x7
//  293   PD_CR2_C27  = 0;
        BRES      L:0x5013, #0x7
//  294   PD_ODR_ODR7 = 1;
        BSET      L:0x500f, #0x7
//  295   
//  296   //MB1504 IO
//  297 //  PD_DDR_DDR5 = 1 ;
//  298 //  PD_CR1_C15 =  1 ;
//  299 //  PD_CR2_C25 =  0 ;
//  300 //  
//  301 //  PD_DDR_DDR6 = 1 ;
//  302 //  PD_CR1_C16 =  1 ;
//  303 //  PD_CR2_C26 =  0 ;
//  304 //  
//  305 //  PD_DDR_DDR7 = 1 ;
//  306 //  PD_CR1_C17 =  1 ;
//  307 //  PD_CR2_C27 =  0 ;
//  308 //  
//  309 //  PC_DDR_DDR7 = 1 ;
//  310 //  PC_CR1_C17 =  1 ;
//  311 //  PC_CR2_C27 =  0 ;
//  312 //  
//  313 //  PB_DDR_DDR5 = 1 ;
//  314 //  PB_CR1_C15 =  1 ;
//  315 //  PB_CR2_C25 =  0 ;
//  316   /*******serial_port_config************/
//  317   
//  318   //   UART2_BRR2= 0x01;
//  319   //   UART2_BRR1= 0x34;
//  320   //   UART2_CR2 = 0x2c;//允许接收，发送，开接收中断
//  321   
//  322   //UART2_CR2=0x0c;//关闭接受中断
//  323   
//  324   /*************TIM2_config************/
//  325   
//  326   //主要用于50ms计时
//  327   TIM2_IER = 0x00; // 禁止中断
        MOV       L:0x5301, #0x0
//  328   TIM2_EGR = 0x01; // 允许产生更新事件 // 设置控制器，启动定时器
        MOV       L:0x5304, #0x1
//  329   
//  330   TIM2_PSCR = 0x08;//计数器时钟=主时钟/2^8相当于计数器周期为32us
        MOV       L:0x530c, #0x8
//  331   
//  332   TIM2_ARRH = 0x02; // 设定重装载时的寄存器值，
        MOV       L:0x530d, #0x2
//  333   TIM2_ARRL = 0x70;
        MOV       L:0x530e, #0x70
//  334   TIM2_CNTRH = 0x02;// 设定计数器的初值
        MOV       L:0x530a, #0x2
//  335   TIM2_CNTRL = 0x70;// 定时周期=(ARR+1)*32uS=125mS;
        MOV       L:0x530b, #0x70
//  336   TIM2_CR1 = 0x01; // b0=1,允许计数器工作
        MOV       L:0x5300, #0x1
//  337   TIM2_IER = 0x01; // 允许中断
        MOV       L:0x5301, #0x1
//  338   //TIM1_PWM_Init( CarrierFreqency);
//  339   
//  340   
//  341   
//  342   /*************TIM4_config***********/
//  343   //主要为接收数据计时用
//  344   //   TIM4_CR1=0x01;//使能计数器
//  345   //
//  346   //   TIM4_IER=0x01;//更新中断使能
//  347   //   TIM4_EGR=0x01;
//  348   //   TIM4_CNTR=255;//计数器值
//  349   //   TIM4_ARR=255;//自动重装的值
//  350   //   TIM4_PSCR=0x07;//128分频值
//  351   //   TIM4_CR1=0x01;  //启动 TIM4;
//  352   
//  353 }
        RET
        REQUIRE _A_CLK_CKDIVR
        REQUIRE _A_CLK_SWCR
        REQUIRE _A_PD_DDR
        REQUIRE _A_PD_CR1
        REQUIRE _A_PD_CR2
        REQUIRE _A_PF_DDR
        REQUIRE _A_PF_CR1
        REQUIRE _A_PF_CR2
        REQUIRE _A_PB_DDR
        REQUIRE _A_PB_CR1
        REQUIRE _A_PB_CR2
        REQUIRE _A_PD_ODR
        REQUIRE _A_PB_ODR
        REQUIRE _A_TIM2_IER
        REQUIRE _A_TIM2_EGR
        REQUIRE _A_TIM2_PSCR
        REQUIRE TIM2_ARRH
        REQUIRE TIM2_ARRL
        REQUIRE TIM2_CNTRH
        REQUIRE TIM2_CNTRL
        REQUIRE _A_TIM2_CR1

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  354 
//  355 
//  356 
//  357 
//  358 /*@*****************************end of file*************************************@*/
// 
//  44 bytes in section .near.noinit    (abs)
// 432 bytes in section .near_func.text
// 
// 432 bytes of CODE memory
//   0 bytes of DATA memory (+ 44 bytes shared)
//
//Errors: none
//Warnings: none
