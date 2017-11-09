///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:34:09 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\stm8s\src\at1846s.c                          /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\src\at1846s.c" -e -On --no_cse         /
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
//                    transeiver\stm8s\iar\Debug\List\at1846s.s               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME at1846s

        EXTERN ?and16_x_x_dw
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?mov_l0_l2
        EXTERN ?or16_x_x_dw
        EXTERN ?push_l2
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?srl32_l0_l0_db
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN OSTimeDly

        PUBLIC AT1846s
        PUBLIC At1846sOPenRx
        PUBLIC At1846sOPenTx
        PUBLIC C_RFIC_R04H_FOSC
        PUBLIC C_RFIC_R30H_NARROW
        PUBLIC IntAt1846s
        PUBLIC ReadReg
        PUBLIC TestInit
        PUBLIC _A_PC_ODR
        PUBLIC _A_PD_DDR
        PUBLIC _A_PD_IDR
        PUBLIC _A_PD_ODR
        PUBLIC reg03
        PUBLIC reg04
        PUBLIC reg08
        PUBLIC reg09
        PUBLIC reg0a
        PUBLIC reg15
        PUBLIC reg24
        PUBLIC reg29
        PUBLIC reg2a
        PUBLIC reg30
        PUBLIC reg32
        PUBLIC reg3a
        PUBLIC reg41
        PUBLIC reg44
        PUBLIC reg4e

// E:\RDA1846s\walkphone program\ucos - transeiver\stm8s\src\at1846s.c
//    1 /*******************************************************************************
//    2 Copyright: 
//    3 File_name:       at1846s.c
//    4 Version:	     0.0
//    5 Revised:        $Date:2017-1-16  ; $
//    6 Description:    the driver of at1846.
//    7 Notes:          This version targets the stm8
//    8 Editor:		    Mr.kon
//    9 
//   10 *******************************************************************************/
//   11 
//   12 
//   13 /*==============================================================================
//   14 @ Include files
//   15 */
//   16 #include "at1846s.h"

        ASEGN `.near.noinit`:DATA:NOROOT,0500aH
        SECTION_GROUP _A_PC_ODR
// union <unnamed> volatile _A_PC_ODR
_A_PC_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0500fH
        SECTION_GROUP _A_PD_ODR
// union <unnamed> volatile _A_PD_ODR
_A_PD_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05010H
        SECTION_GROUP _A_PD_IDR
// union <unnamed> const volatile _A_PD_IDR
_A_PD_IDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05011H
        SECTION_GROUP _A_PD_DDR
// union <unnamed> volatile _A_PD_DDR
_A_PD_DDR:
        DS8 1
//   17 
//   18 
//   19 /*==============================================================================
//   20 @ Global variable
//   21 */
//   22 
//   23 
//   24 
//   25 /*==============================================================================
//   26 @ All functions  as follow
//   27 */

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   28 ATINFO AT1846s;
AT1846s:
        DS8 4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   29 REG_30H reg30;
reg30:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   30 REG_03H reg03;
reg03:
        DS8 3

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   31 REG_04H reg04;
reg04:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   32 REG_08H reg08;
reg08:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   33 REG_09H reg09;
reg09:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   34 REG_0AH reg0a;
reg0a:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   35 REG_15H reg15;
reg15:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   36 REG_24H reg24;
reg24:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   37 REG_29H reg29;
reg29:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   38 REG_2AH reg2a;
reg2a:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   39 REG_32H reg32;
reg32:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   40 REG_3AH reg3a;
reg3a:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   41 REG_41H reg41;
reg41:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   42 REG_44H reg44;
reg44:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   43 REG_4EH reg4e;
reg4e:
        DS8 2
//   44 
//   45 
//   46 /*******************************************************************************
//   47 Function: rda_spi_write_Bytes
//   48 Description:
//   49 SPI write a bytes, HSB module
//   50 
//   51 Input:        None
//   52 Output:       None
//   53 Return:       None
//   54 Editor:	      Mr.kon
//   55 Others:	      2017/1/16
//   56 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   57 static void rda_spi_write_Bytes( unsigned char wdata)
//   58 {
rda_spi_write_Bytes:
        LD        S:?b1, A
//   59   //set the IO output
//   60   SET_SDIO_OUT
        BSET      L:0x5011, #0x3
//   61     
//   62     for(unsigned char i = 8; i !=0 ; i--)
        MOV       S:?b0, #0x8
??rda_spi_write_Bytes_0:
        TNZ       S:?b0
        JREQ      L:??rda_spi_write_Bytes_1
//   63     {
//   64       if (wdata & 0x80)
        LD        A, S:?b1
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??rda_spi_write_Bytes_2
//   65       {
//   66         RDA1846_O = 1;
        BSET      L:0x500f, #0x3
        JRA       L:??rda_spi_write_Bytes_3
//   67       }
//   68       else 
//   69       {
//   70         RDA1846_O = 0;
??rda_spi_write_Bytes_2:
        BRES      L:0x500f, #0x3
//   71       }
//   72       
//   73       RDA1846CLK = 1;
??rda_spi_write_Bytes_3:
        BSET      L:0x500f, #0x2
//   74       
//   75       NOP 
        CLR       A
??rda_spi_write_Bytes_4:
        CP        A, #0x10
        JRNC      L:??rda_spi_write_Bytes_5
        NOP
        NOP
        NOP
        NOP
        ADD       A, #0x1
        JRA       L:??rda_spi_write_Bytes_4
//   76         RDA1846CLK=0;
??rda_spi_write_Bytes_5:
        BRES      L:0x500f, #0x2
//   77       wdata <<= 1;
        LD        A, S:?b1
        SLL       A
        LD        S:?b1, A
//   78     }
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b0, A
        JRA       L:??rda_spi_write_Bytes_0
//   79   
//   80 }
??rda_spi_write_Bytes_1:
        RET
        REQUIRE _A_PD_DDR
        REQUIRE _A_PD_ODR
//   81 
//   82 /*******************************************************************************
//   83 Function: rda_spi_read_Bytes
//   84 Description:
//   85 SPI read a bytes, HSB module
//   86 
//   87 Input:        None
//   88 Output:       None
//   89 Return:       the data of readed
//   90 Editor:	      Mr.kon
//   91 Others:	      2017/1/16
//   92 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   93 static unsigned char rda_spi_read_Bytes()
//   94 {
//   95   unsigned char  rdaRead = 0;
rda_spi_read_Bytes:
        CLR       S:?b1
//   96   //set the IO input
//   97   //SDIO 
//   98   SET_SDIO_IN
        BRES      L:0x5011, #0x3
//   99     
//  100     for(unsigned char i= 8;i!=0;i--)
        MOV       S:?b0, #0x8
??rda_spi_read_Bytes_0:
        TNZ       S:?b0
        JREQ      L:??rda_spi_read_Bytes_1
//  101     {
//  102       rdaRead =rdaRead<< 1;
        LD        A, S:?b1
        SLL       A
        LD        S:?b1, A
//  103       RDA1846CLK=1;
        BSET      L:0x500f, #0x2
//  104       
//  105       NOP
        CLR       A
??rda_spi_read_Bytes_2:
        CP        A, #0x10
        JRNC      L:??rda_spi_read_Bytes_3
        NOP
        NOP
        NOP
        NOP
        ADD       A, #0x1
        JRA       L:??rda_spi_read_Bytes_2
//  106         
//  107         if(RDA1846_I) 
??rda_spi_read_Bytes_3:
        LD        A, L:0x5010
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??rda_spi_read_Bytes_4
//  108         {
//  109           rdaRead|= 0x1;
        LD        A, S:?b1
        OR        A, #0x1
        LD        S:?b1, A
//  110         }
//  111       RDA1846CLK=0;
??rda_spi_read_Bytes_4:
        BRES      L:0x500f, #0x2
//  112     }
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b0, A
        JRA       L:??rda_spi_read_Bytes_0
//  113   
//  114   return rdaRead;
??rda_spi_read_Bytes_1:
        LD        A, S:?b1
        RET
        REQUIRE _A_PD_DDR
        REQUIRE _A_PD_ODR
        REQUIRE _A_PD_IDR
//  115 }
//  116 
//  117 /*******************************************************************************
//  118 Function: Readrda1846
//  119 Description:
//  120 write : rdarom |080  and the read  16bitsvalue value.
//  121 
//  122 Input:        rdarom : the address of register 
//  123 Output:       None
//  124 Return:       16bits register value
//  125 Editor:	      Mr.kon
//  126 Others:	      2017/1/16
//  127 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  128 static unsigned int Readrda1846(unsigned char rdarom) //读出RDA寄存器程序
//  129 {
Readrda1846:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
//  130   unsigned  int rdaRead;
//  131   
//  132   RDA1846SEN=1;
        BSET      L:0x500f, #0x0
//  133   //  RDA1846IOC=0;
//  134   RDA1846CLK=0;
        BRES      L:0x500f, #0x2
//  135   RDA1846SEN=0;
        BRES      L:0x500f, #0x0
//  136   rdarom|=0x80;
        LD        A, S:?b10
        OR        A, #0x80
        LD        S:?b10, A
//  137   rda_spi_write_Bytes(rdarom);
        LD        A, S:?b10
        CALL      L:rda_spi_write_Bytes
//  138   rdaRead = rda_spi_read_Bytes();
        CALL      L:rda_spi_read_Bytes
        CLRW      X
        LD        XL, A
        LDW       S:?w4, X
//  139   rdaRead <<= 8;
        LDW       X, S:?w4
        CLR       A
        RLWA      X, A
        LDW       S:?w4, X
//  140   rdaRead |= rda_spi_read_Bytes();
        CALL      L:rda_spi_read_Bytes
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, S:?w4
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       S:?w4, X
//  141   
//  142   RDA1846IOC=0;
        BRES      L:0x500a, #0x4
//  143   RDA1846SEN=1;
        BSET      L:0x500f, #0x0
//  144   RDA1846_O=0;
        BRES      L:0x500f, #0x3
//  145   return rdaRead;
        LDW       X, S:?w4
        POP       S:?b10
        JP        L:?epilogue_w4
        REQUIRE _A_PD_ODR
        REQUIRE _A_PC_ODR
//  146 }    

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  147 void ReadReg(unsigned char rdarom, u16* Pdata)
//  148 {
ReadReg:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
        LDW       S:?w4, X
//  149   *Pdata = Readrda1846(rdarom);
        LD        A, S:?b10
        CALL      L:Readrda1846
        LDW       [S:?w4.w], X
//  150 }
        POP       S:?b10
        JP        L:?epilogue_w4
//  151 /*******************************************************************************
//  152 Function: Writerda1846
//  153 Description:
//  154 write : rdarom |080  and the read  16bitsvalue value.
//  155 
//  156 Input:        rdarom : the address of register 
//  157 Output:       None
//  158 Return:       16bits register value
//  159 Editor:	      Mr.kon
//  160 Others:	      2017/1/16
//  161 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  162 static void Writerda1846(unsigned char rdarom, unsigned int * pregvalue)
//  163 {
Writerda1846:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        LD        S:?b12, A
        LDW       S:?w5, X
//  164   unsigned char a;unsigned char b;
//  165   unsigned int  Value = *pregvalue;
        LDW       X, [S:?w5.w]
        LDW       S:?w4, X
//  166   a = Value >> 8; 
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        S:?b13, A
//  167   b = Value;
        MOV       S:?b14, S:?b9
//  168   
//  169   RDA1846SEN=1;
        BSET      L:0x500f, #0x0
//  170   // RDA1846IOC=0;
//  171   RDA1846CLK=0;
        BRES      L:0x500f, #0x2
//  172   RDA1846SEN=0;
        BRES      L:0x500f, #0x0
//  173   rda_spi_write_Bytes(rdarom);
        LD        A, S:?b12
        CALL      L:rda_spi_write_Bytes
//  174   rda_spi_write_Bytes(a);
        LD        A, S:?b13
        CALL      L:rda_spi_write_Bytes
//  175   rda_spi_write_Bytes(b);
        LD        A, S:?b14
        CALL      L:rda_spi_write_Bytes
//  176   RDA1846SEN=1;
        BSET      L:0x500f, #0x0
//  177   RDA1846_O=0;
        BRES      L:0x500f, #0x3
//  178   
//  179 } 
        POP       S:?b14
        JP        L:?epilogue_l2_w6
        REQUIRE _A_PD_ODR

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  180 static void Writerda1846s(unsigned char rdarom, unsigned char a,unsigned char b)
//  181 {
Writerda1846s:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        MOV       S:?b10, S:?b1
//  182   RDA1846SEN=1;
        BSET      L:0x500f, #0x0
//  183   // RDA1846IOC=0;
//  184   RDA1846CLK=0;
        BRES      L:0x500f, #0x2
//  185   RDA1846SEN=0;
        BRES      L:0x500f, #0x0
//  186   rda_spi_write_Bytes(rdarom);
        LD        A, S:?b8
        CALL      L:rda_spi_write_Bytes
//  187   rda_spi_write_Bytes(a);
        LD        A, S:?b9
        CALL      L:rda_spi_write_Bytes
//  188   rda_spi_write_Bytes(b);
        LD        A, S:?b10
        CALL      L:rda_spi_write_Bytes
//  189   RDA1846SEN=1;
        BSET      L:0x500f, #0x0
//  190   RDA1846_O=0;
        BRES      L:0x500f, #0x3
//  191 }
        POP       S:?b10
        JP        L:?epilogue_w4
        REQUIRE _A_PD_ODR

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  192 BOOL IntAt1846s( void )
//  193 {
IntAt1846s:
        CALL      L:?push_l2
        SUB       SP, #0x4
//  194   unsigned int WriteCMD;
//  195   /* reset chip */
//  196   WriteCMD= RESET_AT_CMD;
        CLRW      X
        INCW      X
        LDW       (0x3,SP), X
//  197   Writerda1846(0x30, &WriteCMD);
        LDW       X, SP
        ADDW      X, #0x3
        LD        A, #0x30
        CALL      L:Writerda1846
//  198   OSTimeDly(20);//200ms
        LDW       X, #0x14
        CALL      L:OSTimeDly
//  199   
//  200   /* read chip ID */
//  201   AT1846s.Chip_ID = Readrda1846(0x00);
        CLR       A
        CALL      L:Readrda1846
        LDW       L:AT1846s, X
//  202   if( AT1846s.Chip_ID != 0x1846)
        LDW       X, L:AT1846s
        CPW       X, #0x1846
        JREQ      L:??IntAt1846s_0
//  203   {
//  204     return 0;
        CLR       A
        JP        L:??IntAt1846s_1
//  205   }
//  206   
//  207   /* read version */
//  208   AT1846s.Mr_ID =  Readrda1846(0x01);
??IntAt1846s_0:
        LD        A, #0x1
        CALL      L:Readrda1846
        LDW       L:AT1846s + 2, X
//  209   if(AT1846s.Mr_ID != 0x003F)
        LDW       X, L:AT1846s + 2
        CPW       X, #0x3f
        JREQ      L:??IntAt1846s_2
//  210   {
//  211     return 0;
        CLR       A
        JP        L:??IntAt1846s_1
//  212   }
//  213   
//  214   /* set basic information int */
//  215   reg30.soft_reset = OFF;
??IntAt1846s_2:
        LDW       X, L:reg30
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0xfe
        RLWA      X, A
        LDW       L:reg30, X
//  216   reg30.chip_cal_en = DISABLE;
        LDW       X, L:reg30
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0xfd
        RLWA      X, A
        LDW       L:reg30, X
//  217   reg30.sq_on = OFF;
        LDW       X, L:reg30
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0xf7
        RLWA      X, A
        LDW       L:reg30, X
//  218   reg30.rx_on = OFF;
        LDW       X, L:reg30
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0xdf
        RLWA      X, A
        LDW       L:reg30, X
//  219   reg30.tx_on = OFF;
        LDW       X, L:reg30
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0xbf
        RLWA      X, A
        LDW       L:reg30, X
//  220   reg30.pdn_reg = ON;
        LDW       X, L:reg30
        RLWA      X, A
        OR        A, #0x0
        RLWA      X, A
        OR        A, #0x4
        RLWA      X, A
        LDW       L:reg30, X
//  221   reg30.mute = OFF;
        LDW       X, L:reg30
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0x7f
        RLWA      X, A
        LDW       L:reg30, X
//  222   reg30.tail_elim_en = OFF;
        LDW       X, L:reg30
        RLWA      X, A
        AND       A, #0xf7
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        LDW       L:reg30, X
//  223   reg30.band_mode_sel = BAND_MODE_25KHZ;
        LDW       X, L:reg30
        RLWA      X, A
        OR        A, #0x10
        RLWA      X, A
        OR        A, #0x0
        RLWA      X, A
        LDW       L:reg30, X
//  224   reg30.filter_band_sel = BAND_MODE_25KHZ;
        LDW       X, L:reg30
        RLWA      X, A
        OR        A, #0x20
        RLWA      X, A
        OR        A, #0x0
        RLWA      X, A
        LDW       L:reg30, X
//  225   reg30.xtal_mode = XTAL_26_OR_13MZh;
        LDW       X, L:reg30
        RLWA      X, A
        OR        A, #0x40
        RLWA      X, A
        OR        A, #0x0
        RLWA      X, A
        LDW       L:reg30, X
//  226   Writerda1846(0x30, (u16*)&reg30);
        LDW       X, #reg30
        LD        A, #0x30
        CALL      L:Writerda1846
//  227   u16 Int = 0x0;
        CLRW      X
        LDW       (0x1,SP), X
//  228   ReadReg(0x30, (u16*)&Int);//
        LDW       X, SP
        ADDW      X, #0x1
        LD        A, #0x30
        CALL      L:ReadReg
//  229   /* set CLK = 26MHZ , 04H */
//  230   reg04.clk_mode = CLK_MODE_25_6_OR_26_MHZ;
        LDW       X, L:reg04
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0xfe
        RLWA      X, A
        LDW       L:reg04, X
//  231   Writerda1846(0x04, (u16*)&reg04);
        LDW       X, #reg04
        LD        A, #0x4
        CALL      L:Writerda1846
//  232   
//  233   /* set ldo , 08H */
//  234   reg08.ldo_master_bypass = 0;//Setting RDA1846S in VHF band , 08H[14]must be 0.
        LDW       X, L:reg08
        RLWA      X, A
        AND       A, #0xbf
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        LDW       L:reg08, X
//  235   Writerda1846(0x08, (u16*)&reg08);
        LDW       X, #reg08
        LD        A, #0x8
        CALL      L:Writerda1846
//  236   
//  237   /* set , 09H */
//  238   reg09.ldo_dig_vbit = 0x7;//3.3v
        LDW       X, L:reg09
        CALL      L:?or16_x_x_dw
        DATA
        DC16      0x380
        CODE
        LDW       L:reg09, X
//  239   Writerda1846(0x09, (u16*)&reg09);
        LDW       X, #reg09
        LD        A, #0x9
        CALL      L:Writerda1846
//  240   /* read 0aH */
//  241   //reg0a.pabias_voltage = 63;//<5:0>
//  242   //  reg0a.pga_gain = 31;//pga_gain<4:0>
//  243   //  reg0a.padrv_ibit = 15;//<3:0>
//  244 
//  245   ReadReg(0x0a, (u16*)&reg0a);//default 0x7C20
        LDW       X, #reg0a
        LD        A, #0xa
        CALL      L:ReadReg
//  246   
//  247   
//  248   /* read 15H */
//  249   ReadReg(0x15, (u16*)&reg15);//default 0x1100
        LDW       X, #reg15
        LD        A, #0x15
        CALL      L:ReadReg
//  250   
//  251   /* read 24H  */
//  252   ReadReg(0x24, (u16*)&reg24);//default 0x0001
        LDW       X, #reg24
        LD        A, #0x24
        CALL      L:ReadReg
//  253   
//  254   reg24.pll_lock_det_sel = ENABLE;
        LDW       X, L:reg24
        RLWA      X, A
        OR        A, #0x80
        RLWA      X, A
        OR        A, #0x0
        RLWA      X, A
        LDW       L:reg24, X
//  255   Writerda1846(0x24, (u16*)&reg24); 
        LDW       X, #reg24
        LD        A, #0x24
        CALL      L:Writerda1846
//  256    
//  257   /* set RF fre 29H  */
//  258   u32 rf_fre = 156800*16; //uint KHz*16
        LDW       X, #0x4800
        LDW       S:?w5, X
        LDW       X, #0x26
        LDW       S:?w4, X
//  259   
//  260   reg29.freqH = (u16)(rf_fre >> 16);
        CALL      L:?mov_l0_l2
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x10
        CODE
        LDW       Y, S:?w1
        EXGW      X, Y
        RLWA      X, A
        AND       A, #0x3f
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        EXGW      X, Y
        LDW       X, L:reg29
        RLWA      X, A
        AND       A, #0xc0
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       L:reg29, X
//  261   reg2a.freqL = (u16)rf_fre;
        LDW       X, S:?w5
        LDW       L:reg2a, X
//  262   Writerda1846(0x29, (u16*)&reg29); 
        LDW       X, #reg29
        LD        A, #0x29
        CALL      L:Writerda1846
//  263   Writerda1846(0x2a, (u16*)&reg2a);
        LDW       X, #reg2a
        LD        A, #0x2a
        CALL      L:Writerda1846
//  264 
//  265   
//  266   /* set  3aH */
//  267   
//  268   reg3a.voice_sel = FROM_MIC;
        LDW       X, L:reg3a
        RLWA      X, A
        AND       A, #0x8f
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        RLWA      X, A
        OR        A, #0x40
        RLWA      X, A
        OR        A, #0x0
        RLWA      X, A
        LDW       L:reg3a, X
//  269   reg3a.sq_dten = 0x00;//rssi detect enable
        LDW       X, L:reg3a
        CALL      L:?and16_x_x_dw
        DATA
        DC16      0xf83f
        CODE
        LDW       L:reg3a, X
//  270   Writerda1846(0x3a, (u16*)&reg3a);
        LDW       X, #reg3a
        LD        A, #0x3a
        CALL      L:Writerda1846
//  271   
//  272   //reg44.gain_tx = 
//  273   reg44.dac_vgain_ = 0x8;//Analog DAC gain
        LDW       X, L:reg44
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0xf
        RLWA      X, A
        RLWA      X, A
        OR        A, #0x0
        RLWA      X, A
        OR        A, #0x80
        RLWA      X, A
        LDW       L:reg44, X
//  274   reg44.volume = 0x8;//Digital Voice gain
        LDW       X, L:reg44
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0xf0
        RLWA      X, A
        RLWA      X, A
        OR        A, #0x0
        RLWA      X, A
        OR        A, #0x8
        RLWA      X, A
        LDW       L:reg44, X
//  275   Writerda1846(0x44, (u16*)&reg44);
        LDW       X, #reg44
        LD        A, #0x44
        CALL      L:Writerda1846
//  276   
//  277   
//  278   reg4e.ctcss_or_cdcss_sel = DISABLE;//not Tx ctcss/cdcss
        LDW       X, L:reg4e
        RLWA      X, A
        AND       A, #0xf9
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        LDW       L:reg4e, X
//  279   Writerda1846(0x4e, (u16*)&reg4e);
        LDW       X, #reg4e
        LD        A, #0x4e
        CALL      L:Writerda1846
//  280  
//  281   
//  282   return 1;
        LD        A, #0x1
??IntAt1846s_1:
        ADD       SP, #0x4
        JP        L:?epilogue_l2
//  283 }
//  284 
//  285 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//  286 u8 C_RFIC_R04H_FOSC = CLK_MODE_25_6_OR_26_MHZ;//
C_RFIC_R04H_FOSC:
        DS8 1

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//  287 u8 C_RFIC_R30H_NARROW = 0x70;
C_RFIC_R30H_NARROW:
        DC8 112

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  288 void At1846sOPenTx()
//  289 {
At1846sOPenTx:
        CALL      L:?push_l2
//  290 //  reg30.rx_on = OFF;
//  291 //  reg30.tx_on = ON;
//  292 //  Writerda1846(0x30, (u16*)&reg30);
//  293 //  OSTimeDly(1000);//10s
//  294 //  u16 VoxMic = Readrda1846(0x1a);
//  295 //  OSTimeDly(10);//100ms
//  296   Writerda1846s(0x30,0x00,0x04);//关闭收发	
        MOV       S:?b1, #0x4
        CLR       S:?b0
        LD        A, #0x30
        CALL      L:Writerda1846s
//  297   OSTimeDly(10);//delay_100ms
        LDW       X, #0xa
        CALL      L:OSTimeDly
//  298     /* set RF fre 29H  */
//  299   u32 rf_fre = 156800*16; //uint KHz*16
        LDW       X, #0x4800
        LDW       S:?w5, X
        LDW       X, #0x26
        LDW       S:?w4, X
//  300   
//  301   reg29.freqH = (u16)(rf_fre >> 16);
        CALL      L:?mov_l0_l2
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x10
        CODE
        LDW       Y, S:?w1
        EXGW      X, Y
        RLWA      X, A
        AND       A, #0x3f
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        EXGW      X, Y
        LDW       X, L:reg29
        RLWA      X, A
        AND       A, #0xc0
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       L:reg29, X
//  302   reg2a.freqL = (u16)rf_fre;
        LDW       X, S:?w5
        LDW       L:reg2a, X
//  303   Writerda1846(0x29, (u16*)&reg29); 
        LDW       X, #reg29
        LD        A, #0x29
        CALL      L:Writerda1846
//  304   Writerda1846(0x2a, (u16*)&reg2a);
        LDW       X, #reg2a
        LD        A, #0x2a
        CALL      L:Writerda1846
//  305   Writerda1846s(0x30,C_RFIC_R30H_NARROW,0x06);
        MOV       S:?b1, #0x6
        LD        A, L:C_RFIC_R30H_NARROW
        LD        S:?b0, A
        LD        A, #0x30
        CALL      L:Writerda1846s
//  306   OSTimeDly(10);//delay_100ms_end
        LDW       X, #0xa
        CALL      L:OSTimeDly
//  307   Writerda1846s(0x30,C_RFIC_R30H_NARROW,0x26);
        MOV       S:?b1, #0x26
        LD        A, L:C_RFIC_R30H_NARROW
        LD        S:?b0, A
        LD        A, #0x30
        CALL      L:Writerda1846s
//  308 	
//  309 }
        JP        L:?epilogue_l2
//  310 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  311 void At1846sOPenRx()
//  312 {
At1846sOPenRx:
        CALL      L:?push_l2
//  313 //  reg30.rx_on = ON;
//  314 //  reg30.tx_on = OFF;
//  315 //  Writerda1846(0x30, (u16*)&reg30);
//  316 //  
//  317 //  OSTimeDly(1000);//10s
//  318 //  u16 RssiNoise = Readrda1846(0x1b);
//  319 //  RssiNoise = Readrda1846(0x2d);
//  320 //  OSTimeDly(10);//10s
//  321   Writerda1846s(0x30,0x00,0x04);//关闭收发	
        MOV       S:?b1, #0x4
        CLR       S:?b0
        LD        A, #0x30
        CALL      L:Writerda1846s
//  322   OSTimeDly(10);//delay_100ms
        LDW       X, #0xa
        CALL      L:OSTimeDly
//  323     /* set RF fre 29H  */
//  324   u32 rf_fre = 156800*16; //uint KHz*16
        LDW       X, #0x4800
        LDW       S:?w5, X
        LDW       X, #0x26
        LDW       S:?w4, X
//  325   
//  326   reg29.freqH = (u16)(rf_fre >> 16);
        CALL      L:?mov_l0_l2
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x10
        CODE
        LDW       Y, S:?w1
        EXGW      X, Y
        RLWA      X, A
        AND       A, #0x3f
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        EXGW      X, Y
        LDW       X, L:reg29
        RLWA      X, A
        AND       A, #0xc0
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       L:reg29, X
//  327   reg2a.freqL = (u16)rf_fre;
        LDW       X, S:?w5
        LDW       L:reg2a, X
//  328   Writerda1846(0x29, (u16*)&reg29); 
        LDW       X, #reg29
        LD        A, #0x29
        CALL      L:Writerda1846
//  329   Writerda1846s(0x30,C_RFIC_R30H_NARROW,0x06);
        MOV       S:?b1, #0x6
        LD        A, L:C_RFIC_R30H_NARROW
        LD        S:?b0, A
        LD        A, #0x30
        CALL      L:Writerda1846s
//  330   OSTimeDly(10);//delay_100ms_end
        LDW       X, #0xa
        CALL      L:OSTimeDly
//  331   Writerda1846s(0x30,C_RFIC_R30H_NARROW,0x46);
        MOV       S:?b1, #0x46
        LD        A, L:C_RFIC_R30H_NARROW
        LD        S:?b0, A
        LD        A, #0x30
        CALL      L:Writerda1846s
//  332 }
        JP        L:?epilogue_l2
//  333 
//  334 /***************************test int *******************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  335 void TestInit(void)
//  336 {
//  337         Writerda1846s(0x30,0x00,0x01);		
TestInit:
        MOV       S:?b1, #0x1
        CLR       S:?b0
        LD        A, #0x30
        CALL      L:Writerda1846s
//  338 	OSTimeDly(10);//delay_100ms
        LDW       X, #0xa
        CALL      L:OSTimeDly
//  339 	Writerda1846s(0x30,0x00,0x04);		
        MOV       S:?b1, #0x4
        CLR       S:?b0
        LD        A, #0x30
        CALL      L:Writerda1846s
//  340 	Writerda1846s(0x04,0x0F,C_RFIC_R04H_FOSC);		// To set you want 
        LD        A, L:C_RFIC_R04H_FOSC
        LD        S:?b1, A
        MOV       S:?b0, #0xf
        LD        A, #0x4
        CALL      L:Writerda1846s
//  341 	Writerda1846s(0x0A,0x43,0xA0);		
        MOV       S:?b1, #0xa0
        MOV       S:?b0, #0x43
        LD        A, #0xa
        CALL      L:Writerda1846s
//  342 	Writerda1846s(0x13,0xA1,0x00);		
        CLR       S:?b1
        MOV       S:?b0, #0xa1
        LD        A, #0x13
        CALL      L:Writerda1846s
//  343 	Writerda1846s(0x1F,0x50,0x01);		// To set you want
        MOV       S:?b1, #0x1
        MOV       S:?b0, #0x50
        LD        A, #0x1f
        CALL      L:Writerda1846s
//  344 
//  345 	Writerda1846s(0x31,0x00,0x31);	
        MOV       S:?b1, #0x31
        CLR       S:?b0
        LD        A, #0x31
        CALL      L:Writerda1846s
//  346 	Writerda1846s(0x33,0x44,0xa5);
        MOV       S:?b1, #0xa5
        MOV       S:?b0, #0x44
        LD        A, #0x33
        CALL      L:Writerda1846s
//  347 	Writerda1846s(0x34,0x2b,0x8e);
        MOV       S:?b1, #0x8e
        MOV       S:?b0, #0x2b
        LD        A, #0x34
        CALL      L:Writerda1846s
//  348 
//  349 	Writerda1846s(0x41,0x06,0x0F);		
        MOV       S:?b1, #0xf
        MOV       S:?b0, #0x6
        LD        A, #0x41
        CALL      L:Writerda1846s
//  350 	Writerda1846s(0x44,0x0A,0xFF);	
        MOV       S:?b1, #0xff
        MOV       S:?b0, #0xa
        LD        A, #0x44
        CALL      L:Writerda1846s
//  351 	Writerda1846s(0x47,0x7F,0x2F);		
        MOV       S:?b1, #0x2f
        MOV       S:?b0, #0x7f
        LD        A, #0x47
        CALL      L:Writerda1846s
//  352 	Writerda1846s(0x4F,0x2C,0x62);		
        MOV       S:?b1, #0x62
        MOV       S:?b0, #0x2c
        LD        A, #0x4f
        CALL      L:Writerda1846s
//  353 	Writerda1846s(0x53,0x00,0x94);		
        MOV       S:?b1, #0x94
        CLR       S:?b0
        LD        A, #0x53
        CALL      L:Writerda1846s
//  354 	Writerda1846s(0x54,0x2A,0x18);		
        MOV       S:?b1, #0x18
        MOV       S:?b0, #0x2a
        LD        A, #0x54
        CALL      L:Writerda1846s
//  355 	Writerda1846s(0x55,0x00,0x81);		
        MOV       S:?b1, #0x81
        CLR       S:?b0
        LD        A, #0x55
        CALL      L:Writerda1846s
//  356 	Writerda1846s(0x56,0x0B,0x22);		
        MOV       S:?b1, #0x22
        MOV       S:?b0, #0xb
        LD        A, #0x56
        CALL      L:Writerda1846s
//  357 	Writerda1846s(0x57,0x1C,0x00);
        CLR       S:?b1
        MOV       S:?b0, #0x1c
        LD        A, #0x57
        CALL      L:Writerda1846s
//  358 	Writerda1846s(0x58,0x80,0x0D);	
        MOV       S:?b1, #0xd
        MOV       S:?b0, #0x80
        LD        A, #0x58
        CALL      L:Writerda1846s
//  359 	Writerda1846s(0x5A,0x0E,0xDD);		
        MOV       S:?b1, #0xdd
        MOV       S:?b0, #0xe
        LD        A, #0x5a
        CALL      L:Writerda1846s
//  360 	Writerda1846s(0x63,0x3F,0xFF);
        MOV       S:?b1, #0xff
        MOV       S:?b0, #0x3f
        LD        A, #0x63
        CALL      L:Writerda1846s
//  361 /***************  Registers in page 1 ***************/
//  362 //	Writerda1846s(0x7f,0x00,0x01);
//  363 //	Writerda1846s(0x05,0x00,0x0c);
//  364 //	Writerda1846s(0x06,0x02,0x0c);
//  365 //	Writerda1846s(0x07,0x03,0x0c);
//  366 //	Writerda1846s(0x08,0x03,0x24);
//  367 //	Writerda1846s(0x09,0x13,0x44);
//  368 //	Writerda1846s(0x0a,0x3f,0x44);
//  369 //	Writerda1846s(0x0b,0x3f,0x44);
//  370 //	Writerda1846s(0x0c,0x3f,0x44);
//  371 //	Writerda1846s(0x0d,0x3f,0x44);
//  372 //	Writerda1846s(0x0e,0x3f,0x44);
//  373 //	Writerda1846s(0x0f,0x3f,0x44);
//  374 //
//  375 //	Writerda1846s(0x12,0xe0,0xed);
//  376 //	Writerda1846s(0x13,0xf2,0xfe);
//  377 //	Writerda1846s(0x14,0x0a,0x16);
//  378 //	Writerda1846s(0x15,0x24,0x24);
//  379 //	Writerda1846s(0x16,0x24,0x24);
//  380 //	Writerda1846s(0x17,0x24,0x24);
//  381 //	Writerda1846s(0x7f,0x00,0x00);
//  382    
//  383 	Writerda1846s(0x30,C_RFIC_R30H_NARROW,0xA4);
        MOV       S:?b1, #0xa4
        LD        A, L:C_RFIC_R30H_NARROW
        LD        S:?b0, A
        LD        A, #0x30
        CALL      L:Writerda1846s
//  384 	OSTimeDly(10);//delay_100ms
        LDW       X, #0xa
        CALL      L:OSTimeDly
//  385 	Writerda1846s(0x30,C_RFIC_R30H_NARROW,0xA6);
        MOV       S:?b1, #0xa6
        LD        A, L:C_RFIC_R30H_NARROW
        LD        S:?b0, A
        LD        A, #0x30
        CALL      L:Writerda1846s
//  386 	OSTimeDly(10);//delay_100ms
        LDW       X, #0xa
        CALL      L:OSTimeDly
//  387 	Writerda1846s(0x30,C_RFIC_R30H_NARROW,0x06);
        MOV       S:?b1, #0x6
        LD        A, L:C_RFIC_R30H_NARROW
        LD        S:?b0, A
        LD        A, #0x30
        CALL      L:Writerda1846s
//  388 	OSTimeDly(10);//delay_100ms_end
        LDW       X, #0xa
        CALL      L:OSTimeDly
//  389 
//  390 ////窄带设置：
//  391 //	Writerda1846s(0x11,0x3d,0x37);	//0x11,0x3d,0x37,
//  392 //	Writerda1846s(0x12,0x01,0x00);	//0x12,0x71,0x00,
//  393 //	Writerda1846s(0x15,0x11,0x00);	//0x15,0x1f,0x00,
//  394 //
//  395 //	Writerda1846s(0x32,0x44,0x95);		//agc target power
//  396 //	Writerda1846s(0x3A,0x40,0xC3);		//modu_det_sel SQ setting
//  397 //	Writerda1846s(0x3C,0x04,0x07);		//pk_det_th SQ setting [08,07]
//  398 //	Writerda1846s(0x3F,0x28,0xD0);		//rssi3_th SQ setting [51,50]
//  399 //	Writerda1846s(0x48,0x20,0x3E);		//noise1_th
//  400 //	Writerda1846s(0x60,0x1B,0xB7);		//noise2_th SQ setting [37,37]
//  401 //	Writerda1846s(0x62,0x14,0x25);		//modu_det_th SQ setting
//  402 //	Writerda1846s(0x65,0x24,0x94);		//setting th_sif for SQ rssi detect
//  403 //	Writerda1846s(0x66,0xEB,0x2E);		//rssi_comp
//  404 ////宽带设置：
//  405 //	Writerda1846s(0x15,0x1F,0x00);		//tuning for sensitivity
//  406 //	Writerda1846s(0x32,0x75,0x64);		//agc target power
//  407 //	Writerda1846s(0x34,0x2b,0x8c);	
//  408 //	Writerda1846s(0x3A,0x44,0xC3);		//modu_det_sel SQ setting
//  409 //	Writerda1846s(0x3C,0x19,0x30);		//pk_det_th SQ setting [32,30]
//  410 //	Writerda1846s(0x3F,0x29,0xD2);		//rssi3_th SQ setting [53,52]
//  411 //	Writerda1846s(0x48,0x20,0x3E);		//noise1_th [40,3E]
//  412 //	Writerda1846s(0x60,0x10,0x1E);		//noise2_th SQ setting [20,1E]
//  413 //	Writerda1846s(0x62,0x37,0x67);		//modu_det_th SQ setting
//  414 //	Writerda1846s(0x65,0x24,0x8A);		//setting th_sif for SQ rssi detect
//  415 //	Writerda1846s(0x66,0xFF,0xAE);		//rssi_comp
//  416 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  417 
//  418 /*@*****************************end of file**********************************@*/
// 
//    36 bytes in section .near.bss
//     1 byte  in section .near.data
//     4 bytes in section .near.noinit    (abs)
// 1 465 bytes in section .near_func.text
// 
// 1 465 bytes of CODE memory
//    37 bytes of DATA memory (+ 4 bytes shared)
//
//Errors: none
//Warnings: none
