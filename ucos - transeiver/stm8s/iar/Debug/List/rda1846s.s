///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:54 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\stm8s\src\rda1846s.c                         /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\src\rda1846s.c" -e -On --no_cse        /
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
//                    transeiver\stm8s\iar\Debug\List\rda1846s.s              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME rda1846s

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w4
        EXTERN OSTimeDly

        PUBLIC BZRAM
        PUBLIC RDA1846RX
        PUBLIC RDA1846TX
        PUBLIC RDA1846_Init
        PUBLIC Readrda1846
        PUBLIC V8RAM1
        PUBLIC Writerda1846
        PUBLIC _A_PC_ODR
        PUBLIC _A_PD_CR1
        PUBLIC _A_PD_CR2
        PUBLIC _A_PD_DDR
        PUBLIC _A_PD_IDR
        PUBLIC _A_PD_ODR
        PUBLIC rda1846RX
        PUBLIC rda1846TX
        PUBLIC rda1846r30r
        PUBLIC rda1846r45r
        PUBLIC rda1846r45t
        PUBLIC rda1846r58r
        PUBLIC rda1846rt05ht
        PUBLIC rda1846rt05lt
        PUBLIC rda1846rt64lt
        PUBLIC rdaCTCSSRX
        PUBLIC rdaCTCSSTX
        PUBLIC rdaDTCRX
        PUBLIC rdaDTCTX
        PUBLIC rda_spi_read_Bytes
        PUBLIC rda_spi_write_Bytes
        PUBLIC txpram

// E:\RDA1846s\walkphone program\ucos - transeiver\stm8s\src\rda1846s.c
//    1 /***************************************************************************/
//    2 #include <iostm8s105k4.h>

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
//    3 #include <intrinsics.h>
//    4 #include "includes.h"
//    5 
//    6 #define NOP          for(u8 i = 0;i < 16 ; i ++) {asm("NOP");asm("NOP"); asm("NOP"); asm("NOP");}
//    7 
//    8   
//    9    
//   10 
//   11 

        ASEGN `.tiny.data`:DATA:NOROOT,060H
//   12 unsigned char rda1846TX[3] @0x60 = {0x00,0x48,0x26};          //发射频率
rda1846TX:
        DC8 0, 72, 38

        ASEGN `.tiny.data`:DATA:NOROOT,063H
//   13 unsigned char rda1846RX[3] @0X63 = {0x00,0x48,0x26};          //接收频率
rda1846RX:
        DC8 0, 72, 38

        ASEGN `.tiny.data`:DATA:NOROOT,066H
//   14 unsigned char rdaCTCSSTX[2] @0X66 = {0x22,0x68};         //发射模拟哑音
rdaCTCSSTX:
        DC8 34, 104

        ASEGN `.tiny.bss`:DATA:NOROOT,068H
//   15 unsigned int  rdaCTCSSRX @0X68;            //接收模拟哑音
rdaCTCSSRX:
        DS8 2

        ASEGN `.tiny.bss`:DATA:NOROOT,06aH
//   16 unsigned char rdaDTCTX[3] @0X6A ;          //发射数字哑音
rdaDTCTX:
        DS8 3

        ASEGN `.tiny.bss`:DATA:NOROOT,06dH
//   17 unsigned int  rdaDTCRX    @0X6D;              //接收数字哑音
rdaDTCRX:
        DS8 2

        ASEGN `.tiny.bss`:DATA:NOROOT,06fH
//   18 unsigned char rda1846r30r @0x6f;           //接收专用寄存器
rda1846r30r:
        DS8 1

        ASEGN `.tiny.bss`:DATA:NOROOT,070H
//   19 unsigned char rda1846r58r @0x70 = 0x00;            //接收CTCSS(rda1846r58r=0x03)CDCSS(rda1846r58r=0x00)
rda1846r58r:
        DS8 1

        ASEGN `.tiny.data`:DATA:NOROOT,071H
//   20 unsigned char rda1846r45r @0x71 = 0x86;            //接收CTCSS(rda1846r45r=0x85)CDCSS(rda1846r58r=0x86)
rda1846r45r:
        DC8 134

        ASEGN `.tiny.data`:DATA:NOROOT,072H
//   21 unsigned char rda1846r45t @0x72 = 0x80;            //发射亚音控制寄存器
rda1846r45t:
        DC8 128

        ASEGN `.tiny.bss`:DATA:NOROOT,073H
//   22 unsigned char rda1846rt05lt @0x73;           //特殊频率发射专用寄存器
rda1846rt05lt:
        DS8 1

        ASEGN `.tiny.bss`:DATA:NOROOT,074H
//   23 unsigned char rda1846rt05ht @0x74;           //特殊频率发射专用寄存器
rda1846rt05ht:
        DS8 1

        ASEGN `.tiny.bss`:DATA:NOROOT,075H
//   24 unsigned char rda1846rt64lt @0x75;           //特殊频率发射专用寄存器
rda1846rt64lt:
        DS8 1

        ASEGN `.tiny.data`:DATA:NOROOT,076H
//   25 unsigned char txpram @0x76 = 0x3F;//发射功率调整寄存器
txpram:
        DC8 63

        ASEGN `.tiny.bss`:DATA:NOROOT,077H
//   26 unsigned char BZRAM @0x77;//接收步长寄存器
BZRAM:
        DS8 1
//   27 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   28 unsigned char V8RAM1 = 0;//收音机专用寄存器；
V8RAM1:
        DS8 1
//   29 
//   30 //unsigned char rda1846r05t ;           //发射控制寄存器
//   31 
//   32 //unsigned char rda1846r64t[2] @0x6f;         //发射控制寄存器
//   33 
//   34 
//   35 /***************************************************************************/
//   36 #define RDASQ        PC_ODR_ODR1
//   37 #define RDA1846_O    PD_ODR_ODR3 
//   38 #define RDA1846_I    PD_IDR_IDR3 
//   39 #define RDA1846CLK   PD_ODR_ODR2
//   40 #define RDA1846SEN   PD_ODR_ODR0
//   41 #define RDA1846IOC   PC_ODR_ODR4 //不清楚这个 IOC 是啥意思
//   42 
//   43 //#define RDA1846PDN   _pa2 
//   44 /***************************************************************************/        
//   45 
//   46 /*
//   47 void Delays4ms(unsigned char number)                        //延时4MS程序
//   48 {
//   49 unsigned char temp,temp1;
//   50 for(;number!=0;number--)        //循环
//   51 { 
//   52 for(temp=80;temp!=0;temp--)                //空循环
//   53 {
//   54 for(temp1=10;temp1!=0;temp1--)
//   55 {
//   56                 }
//   57                 }
//   58         }
//   59 }*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   60 void rda_spi_write_Bytes( unsigned char wdata)
//   61 {
rda_spi_write_Bytes:
        LD        S:?b1, A
//   62    //set the IO input
//   63    PD_DDR_DDR3 = 1;
        BSET      L:0x5011, #0x3
//   64    
//   65   for(unsigned char i = 8; i !=0 ; i--)
        MOV       S:?b0, #0x8
??rda_spi_write_Bytes_0:
        TNZ       S:?b0
        JREQ      L:??rda_spi_write_Bytes_1
//   66   {
//   67     if (wdata & 0x80)
        LD        A, S:?b1
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??rda_spi_write_Bytes_2
//   68     {
//   69       RDA1846_O = 1;
        BSET      L:0x500f, #0x3
        JRA       L:??rda_spi_write_Bytes_3
//   70     }
//   71     else 
//   72     {
//   73       RDA1846_O = 0;
??rda_spi_write_Bytes_2:
        BRES      L:0x500f, #0x3
//   74     }
//   75     
//   76     RDA1846CLK = 1;
??rda_spi_write_Bytes_3:
        BSET      L:0x500f, #0x2
//   77     
//   78     NOP 
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
//   79     RDA1846CLK=0;
??rda_spi_write_Bytes_5:
        BRES      L:0x500f, #0x2
//   80     wdata <<= 1;
        LD        A, S:?b1
        SLL       A
        LD        S:?b1, A
//   81   }
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b0, A
        JRA       L:??rda_spi_write_Bytes_0
//   82 
//   83 }
??rda_spi_write_Bytes_1:
        RET
        REQUIRE _A_PD_DDR
        REQUIRE _A_PD_ODR
//   84 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   85 unsigned char rda_spi_read_Bytes()
//   86 {
//   87   unsigned char  rdaRead = 0;
rda_spi_read_Bytes:
        CLR       S:?b1
//   88   //set the IO input
//   89     //SDIO 
//   90   PD_DDR_DDR3 = 0;
        BRES      L:0x5011, #0x3
//   91   PD_CR1_C13  = 1;
        BSET      L:0x5012, #0x3
//   92   PD_CR2_C23  = 0; 
        BRES      L:0x5013, #0x3
//   93   
//   94   for(unsigned char i= 8;i!=0;i--)
        MOV       S:?b0, #0x8
??rda_spi_read_Bytes_0:
        TNZ       S:?b0
        JREQ      L:??rda_spi_read_Bytes_1
//   95   {
//   96     rdaRead =rdaRead<< 1;
        LD        A, S:?b1
        SLL       A
        LD        S:?b1, A
//   97     RDA1846CLK=1;
        BSET      L:0x500f, #0x2
//   98     
//   99     NOP
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
//  100 
//  101     if(RDA1846_I) 
??rda_spi_read_Bytes_3:
        LD        A, L:0x5010
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??rda_spi_read_Bytes_4
//  102     {
//  103       rdaRead|= 0x1;
        LD        A, S:?b1
        OR        A, #0x1
        LD        S:?b1, A
//  104     }
//  105     RDA1846CLK=0;
??rda_spi_read_Bytes_4:
        BRES      L:0x500f, #0x2
//  106   }
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b0, A
        JRA       L:??rda_spi_read_Bytes_0
//  107 
//  108   return rdaRead;
??rda_spi_read_Bytes_1:
        LD        A, S:?b1
        RET
        REQUIRE _A_PD_DDR
        REQUIRE _A_PD_CR1
        REQUIRE _A_PD_CR2
        REQUIRE _A_PD_ODR
        REQUIRE _A_PD_IDR
//  109 }

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  110 unsigned int Readrda1846(unsigned char rdarom) //读出RDA寄存器程序
//  111 {
Readrda1846:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
//  112   unsigned  int rdaRead;
//  113 
//  114   RDA1846SEN=1;
        BSET      L:0x500f, #0x0
//  115 //  RDA1846IOC=0;
//  116   RDA1846CLK=0;
        BRES      L:0x500f, #0x2
//  117   RDA1846SEN=0;
        BRES      L:0x500f, #0x0
//  118   rdarom|=0x80;
        LD        A, S:?b10
        OR        A, #0x80
        LD        S:?b10, A
//  119   rda_spi_write_Bytes(rdarom);
        LD        A, S:?b10
        CALL      L:rda_spi_write_Bytes
//  120   rdaRead = rda_spi_read_Bytes();
        CALL      L:rda_spi_read_Bytes
        CLRW      X
        LD        XL, A
        LDW       S:?w4, X
//  121   rdaRead <<= 8;
        LDW       X, S:?w4
        CLR       A
        RLWA      X, A
        LDW       S:?w4, X
//  122   rdaRead |= rda_spi_read_Bytes();
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
//  123   
//  124   RDA1846IOC=0;
        BRES      L:0x500a, #0x4
//  125   RDA1846SEN=1;
        BSET      L:0x500f, #0x0
//  126   RDA1846_O=0;
        BRES      L:0x500f, #0x3
//  127   return rdaRead;
        LDW       X, S:?w4
        POP       S:?b10
        JP        L:?epilogue_w4
        REQUIRE _A_PD_ODR
        REQUIRE _A_PC_ODR
//  128 }        
//  129 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  130 void Writerda1846(unsigned char rdarom,unsigned char a,unsigned char b)
//  131 {
Writerda1846:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        MOV       S:?b10, S:?b1
//  132 
//  133   RDA1846SEN=1;
        BSET      L:0x500f, #0x0
//  134  // RDA1846IOC=0;
//  135   RDA1846CLK=0;
        BRES      L:0x500f, #0x2
//  136   RDA1846SEN=0;
        BRES      L:0x500f, #0x0
//  137   rda_spi_write_Bytes(rdarom);
        LD        A, S:?b8
        CALL      L:rda_spi_write_Bytes
//  138   rda_spi_write_Bytes(a);
        LD        A, S:?b9
        CALL      L:rda_spi_write_Bytes
//  139   rda_spi_write_Bytes(b);
        LD        A, S:?b10
        CALL      L:rda_spi_write_Bytes
//  140   RDA1846SEN=1;
        BSET      L:0x500f, #0x0
//  141   RDA1846_O=0;
        BRES      L:0x500f, #0x3
//  142   
//  143 }        
        POP       S:?b10
        JP        L:?epilogue_w4
        REQUIRE _A_PD_ODR
//  144 /*25KHZ初始化RDA程序*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  145 void RDA1846_Init(void)
//  146 {
RDA1846_Init:
        CALL      L:?push_w4
//  147   //_clrwdt();//清除看门狗
//  148   Writerda1846(0x30,0x00,0x01);
        MOV       S:?b1, #0x1
        CLR       S:?b0
        LD        A, #0x30
        CALL      L:Writerda1846
//  149   
//  150  //  unsigned int data = Readrda1846(0x01);
//  151 //  data = Readrda1846(0x01);
//  152 //  data = Readrda1846(0x03);
//  153 //  data = Readrda1846(0x04);
//  154 //  data = Readrda1846(0x08);
//  155 //  data = Readrda1846(0x09);
//  156 //  data = Readrda1846(0x0a);
//  157 
//  158   Writerda1846(0x30,0x00,0x04);
        MOV       S:?b1, #0x4
        CLR       S:?b0
        LD        A, #0x30
        CALL      L:Writerda1846
//  159   unsigned int data = Readrda1846(0x30);
        LD        A, #0x30
        CALL      L:Readrda1846
        LDW       S:?w4, X
//  160   //Writerda1846(0x04,0x0f,0xd1);//13M或12.8M
//  161   Writerda1846(0x04,0x0f,0xd0);//26M或25.6M
        MOV       S:?b1, #0xd0
        MOV       S:?b0, #0xf
        LD        A, #0x4
        CALL      L:Writerda1846
//  162   Writerda1846(0x08,0x02,0xA0);
        MOV       S:?b1, #0xa0
        MOV       S:?b0, #0x2
        LD        A, #0x8
        CALL      L:Writerda1846
//  163   Writerda1846(0x09,0x03,0xAC);
        MOV       S:?b1, #0xac
        MOV       S:?b0, #0x3
        LD        A, #0x9
        CALL      L:Writerda1846
//  164   //Writerda1846(0x08,0x42,0xA0);
//  165   //Writerda1846(0x09,0x03,0x2C);
//  166   Writerda1846(0x0B,0x1A,0x10);
        MOV       S:?b1, #0x10
        MOV       S:?b0, #0x1a
        LD        A, #0xb
        CALL      L:Writerda1846
//  167   //Writerda1846(0x0F,0x00,0x24);//400m=0X0024;200m=0X00A4;100m=0X00E4;
//  168   Writerda1846(0x0F,0x00,0xE4);
        MOV       S:?b1, #0xe4
        CLR       S:?b0
        LD        A, #0xf
        CALL      L:Writerda1846
//  169   Writerda1846(0x11,0x3E,0x37);//立信科技提供参考增加
        MOV       S:?b1, #0x37
        MOV       S:?b0, #0x3e
        LD        A, #0x11
        CALL      L:Writerda1846
//  170   Writerda1846(0x2B,0x32,0xc8);//26M
        MOV       S:?b1, #0xc8
        MOV       S:?b0, #0x32
        LD        A, #0x2b
        CALL      L:Writerda1846
//  171   //Writerda1846(0x2B,0x32,0x00);//12.8M或25.6M
//  172   Writerda1846(0x2C,0x19,0x64);//26M
        MOV       S:?b1, #0x64
        MOV       S:?b0, #0x19
        LD        A, #0x2c
        CALL      L:Writerda1846
//  173   //Writerda1846(0x2C,0x19,0x00);//12.8M或25.6M
//  174   //Writerda1846(0x32,0x62,0x7C);//UHF
//  175   Writerda1846(0x32,0x62,0xBC);//VHF
        MOV       S:?b1, #0xbc
        MOV       S:?b0, #0x62
        LD        A, #0x32
        CALL      L:Writerda1846
//  176   Writerda1846(0x33,0x0A,0xF2);
        MOV       S:?b1, #0xf2
        MOV       S:?b0, #0xa
        LD        A, #0x33
        CALL      L:Writerda1846
//  177   //Writerda1846(0x41,r[1],r[0]);//声控开启
//  178   //Writerda1846(0x42,r[3],r[2]);//声控关闭
//  179   Writerda1846(0x47,0x2C,0x2F);
        MOV       S:?b1, #0x2f
        MOV       S:?b0, #0x2c
        LD        A, #0x47
        CALL      L:Writerda1846
//  180   Writerda1846(0x4E,0x29,0x3A);
        MOV       S:?b1, #0x3a
        MOV       S:?b0, #0x29
        LD        A, #0x4e
        CALL      L:Writerda1846
//  181   Writerda1846(0x54,0x1D,0x4C);
        MOV       S:?b1, #0x4c
        MOV       S:?b0, #0x1d
        LD        A, #0x54
        CALL      L:Writerda1846
//  182   Writerda1846(0x56,0x06,0x52);
        MOV       S:?b1, #0x52
        MOV       S:?b0, #0x6
        LD        A, #0x56
        CALL      L:Writerda1846
//  183   Writerda1846(0x6E,0x06,0x2D);
        MOV       S:?b1, #0x2d
        MOV       S:?b0, #0x6
        LD        A, #0x6e
        CALL      L:Writerda1846
//  184   Writerda1846(0x70,0x10,0x29);
        MOV       S:?b1, #0x29
        MOV       S:?b0, #0x10
        LD        A, #0x70
        CALL      L:Writerda1846
//  185   Writerda1846(0x7F,0x00,0x01);
        MOV       S:?b1, #0x1
        CLR       S:?b0
        LD        A, #0x7f
        CALL      L:Writerda1846
//  186   Writerda1846(0x05,0x00,0x1F);
        MOV       S:?b1, #0x1f
        CLR       S:?b0
        LD        A, #0x5
        CALL      L:Writerda1846
//  187   Writerda1846(0x7F,0x00,0x00);
        CLR       S:?b1
        CLR       S:?b0
        LD        A, #0x7f
        CALL      L:Writerda1846
//  188   Writerda1846(0x30,0x30,0xA4);
        MOV       S:?b1, #0xa4
        MOV       S:?b0, #0x30
        LD        A, #0x30
        CALL      L:Writerda1846
//  189   Writerda1846(0x30,0x30,0xA6);
        MOV       S:?b1, #0xa6
        MOV       S:?b0, #0x30
        LD        A, #0x30
        CALL      L:Writerda1846
//  190   //_clrwdt();//清除看门狗
//  191   OSTimeDly(10);//10*10ms 延时100MS
        LDW       X, #0xa
        CALL      L:OSTimeDly
//  192   Writerda1846(0x30,0x30,0x06);
        MOV       S:?b1, #0x6
        MOV       S:?b0, #0x30
        LD        A, #0x30
        CALL      L:Writerda1846
//  193   //_clrwdt();//清除看门狗
//  194   OSTimeDly(10);;//延时100MS
        LDW       X, #0xa
        CALL      L:OSTimeDly
//  195 }
        JP        L:?epilogue_w4
//  196 
//  197 
//  198 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  199 void RDA1846RX(unsigned char rama)
//  200 {
RDA1846RX:
        CALL      L:?push_w4
        LD        S:?b8, A
//  201   unsigned char SQRAM;
//  202   SQRAM=BZRAM-0x18;
        LD        A, S:0x77
        ADD       A, #0xe8
        LD        S:?b9, A
//  203   // _clrwdt();//清除看门狗
//  204   Writerda1846(0x30,0x30,0x06);//关闭收发
        MOV       S:?b1, #0x6
        MOV       S:?b0, #0x30
        LD        A, #0x30
        CALL      L:Writerda1846
//  205   OSTimeDly(5);//delay 50ms
        LDW       X, #0x5
        CALL      L:OSTimeDly
//  206   Writerda1846(0x05,0x07,0x63);//
        MOV       S:?b1, #0x63
        MOV       S:?b0, #0x7
        LD        A, #0x5
        CALL      L:Writerda1846
//  207   Writerda1846(0x64,0x70,0x3A);//
        MOV       S:?b1, #0x3a
        MOV       S:?b0, #0x70
        LD        A, #0x64
        CALL      L:Writerda1846
//  208   Writerda1846(0x29,0x00,rda1846RX[2]);//设定接收频率
        LD        A, S:0x65
        LD        S:?b1, A
        CLR       S:?b0
        LD        A, #0x29
        CALL      L:Writerda1846
//  209   Writerda1846(0x2A,rda1846RX[1],rda1846RX[0]);//设定接收频率
        LD        A, S:0x63
        LD        S:?b1, A
        LD        A, S:0x64
        LD        S:?b0, A
        LD        A, #0x2a
        CALL      L:Writerda1846
//  210   Writerda1846(0x1F,0x55,0x01);//设定GPIO口
        MOV       S:?b1, #0x1
        MOV       S:?b0, #0x55
        LD        A, #0x1f
        CALL      L:Writerda1846
//  211   Writerda1846(0x44,0x00,0xFE);//AF输出大小调整
        MOV       S:?b1, #0xfe
        CLR       S:?b0
        LD        A, #0x44
        CALL      L:Writerda1846
//  212   Writerda1846(0x48,0x00,BZRAM);//设定开启SQ值
        LD        A, S:0x77
        LD        S:?b1, A
        CLR       S:?b0
        LD        A, #0x48
        CALL      L:Writerda1846
//  213   Writerda1846(0x49,0x00,SQRAM);//设定关闭SQ值= 开启SQ值－0x18
        MOV       S:?b1, S:?b9
        CLR       S:?b0
        LD        A, #0x49
        CALL      L:Writerda1846
//  214   Writerda1846(0x4A,0X22,0X68);//=0x2268或0x1740
        MOV       S:?b1, #0x68
        MOV       S:?b0, #0x22
        LD        A, #0x4a
        CALL      L:Writerda1846
//  215   Writerda1846(0x58,rda1846r58r,0x00);//CDCSS 0x0000  CTCSS时Writerda1846(0x58,0x03,0x00) CTCSS(rda1846r58r=0x03)CDCSS(rda1846r58r=0x00)
        CLR       S:?b1
        LD        A, S:0x70
        LD        S:?b0, A
        LD        A, #0x58
        CALL      L:Writerda1846
//  216   Writerda1846(0x45,0x0A,rda1846r45r);//CDCSS 0x0a86  CTCSS时Writerda1846(0x45,0x0A,0x85) CTCSS(rda1846r45r=0x85)CDCSS(rda1846r58r=0x86)
        LD        A, S:0x71
        LD        S:?b1, A
        MOV       S:?b0, #0xa
        LD        A, #0x45
        CALL      L:Writerda1846
//  217   //Writerda1846(0x58,0X03,0x00);//CDCSS 0x0000  CTCSS时Writerda1846(0x58,0x03,0x00) CTCSS(rda1846r58r=0x03)CDCSS(rda1846r58r=0x00)
//  218   //Writerda1846(0x45,0x0A,0X85);//CDCSS 0x0a86  CTCSS时Writerda1846(0x45,0x0A,0x85) CTCSS(rda1846r45r=0x85)CDCSS(rda1846r58r=0x86)
//  219   Writerda1846(0x30,0x30,0x06);//宽带模式 窄带时Writerda1846(0x30,0x00,0x06)
        MOV       S:?b1, #0x6
        MOV       S:?b0, #0x30
        LD        A, #0x30
        CALL      L:Writerda1846
//  220   OSTimeDly(3);//delay 30ms
        LDW       X, #0x3
        CALL      L:OSTimeDly
//  221   Writerda1846(0x30,0x30,rama);//宽带模式=0x302e时为信号到达SQ值时AF才能信号输出否则为无信号输出
        MOV       S:?b1, S:?b8
        MOV       S:?b0, #0x30
        LD        A, #0x30
        CALL      L:Writerda1846
//  222   // 窄带时Writerda1846(0x30,0x00,0x2E)
//  223   //宽带模式=OX3026时为一直有信号输出
//  224   //宽带模式=0X30A6时为静音模式
//  225 }
        JP        L:?epilogue_w4
        REQUIRE BZRAM
        REQUIRE rda1846RX
        REQUIRE rda1846r58r
        REQUIRE rda1846r45r

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  226 void RDA1846TX(void)
//  227 {
RDA1846TX:
        CALL      L:?push_w4
        SUB       SP, #0x2
//  228   if(V8RAM1==1)//收音机是否在开启状态
        LD        A, L:V8RAM1
        CP        A, #0x1
        JRNE      L:??RDA1846TX_0
//  229   {        
//  230     unsigned char ram[2];
//  231     unsigned char *p;
//  232     ram[0]=0x82;//0X2H=0x8280时为休眠模式
        LD        A, #0x82
        LD        (0x1,SP), A
//  233     ram[1]=0x80;
        LD        A, #0x80
        LD        (0x2,SP), A
//  234     p=ram;
        LDW       X, SP
        ADDW      X, #0x1
        LDW       S:?w4, X
//  235     //???    WriteRDA58XX(p,0x02,2);
//  236     
//  237     //txpram=0x3f;
//  238     V8RAM1=0;//清除收音机状态标志
        MOV       L:V8RAM1, #0x0
//  239     OSTimeDly(2);;
        LDW       X, #0x2
        CALL      L:OSTimeDly
//  240   }
//  241   //_clrwdt();//清除看门狗
//  242   Writerda1846(0x30,0x30,0x06);//关闭收发
??RDA1846TX_0:
        MOV       S:?b1, #0x6
        MOV       S:?b0, #0x30
        LD        A, #0x30
        CALL      L:Writerda1846
//  243   OSTimeDly(2); //12ms
        LDW       X, #0x2
        CALL      L:OSTimeDly
//  244   Writerda1846(0x05,rda1846rt05ht,rda1846rt05lt);
        LD        A, S:0x73
        LD        S:?b1, A
        LD        A, S:0x74
        LD        S:?b0, A
        LD        A, #0x5
        CALL      L:Writerda1846
//  245   Writerda1846(0x64,0x70,rda1846rt64lt);
        LD        A, S:0x75
        LD        S:?b1, A
        MOV       S:?b0, #0x70
        LD        A, #0x64
        CALL      L:Writerda1846
//  246   Writerda1846(0x29,0x00,rda1846TX[2]);//设定发射频率
        LD        A, S:0x62
        LD        S:?b1, A
        CLR       S:?b0
        LD        A, #0x29
        CALL      L:Writerda1846
//  247   Writerda1846(0x2A,rda1846TX[1],rda1846TX[0]);//设定发射频率
        LD        A, S:0x60
        LD        S:?b1, A
        LD        A, S:0x61
        LD        S:?b0, A
        LD        A, #0x2a
        CALL      L:Writerda1846
//  248   Writerda1846(0x0A,0x04,txpram);//tx功率电压调整(最大＝0x043f，最小＝0x0400)
        LD        A, S:0x76
        LD        S:?b1, A
        MOV       S:?b0, #0x4
        LD        A, #0xa
        CALL      L:Writerda1846
//  249   Writerda1846(0x1F,0x55,0x01);//设定GPIO口
        MOV       S:?b1, #0x1
        MOV       S:?b0, #0x55
        LD        A, #0x1f
        CALL      L:Writerda1846
//  250   Writerda1846(0x43,0x12,0x0F);//设定发射频偏及亚音幅度大小[12:6]调整话放亚音幅度[5:0]调整亚音幅度
        MOV       S:?b1, #0xf
        MOV       S:?b0, #0x12
        LD        A, #0x43
        CALL      L:Writerda1846
//  251   Writerda1846(0x4A,rdaCTCSSTX[0],rdaCTCSSTX[1]);//设定发射亚音频  4aH[15:0](ctcss_sentreg)=0.0974*(2^16) = 6383   
        LD        A, S:0x67
        LD        S:?b1, A
        LD        A, S:0x66
        LD        S:?b0, A
        LD        A, #0x4a
        CALL      L:Writerda1846
//  252   //数字亚音时＝＝0X2268;
//  253   Writerda1846(0x4B,0x00,rdaDTCTX[0]);//设定发射数字亚音频
        LD        A, S:0x6a
        LD        S:?b1, A
        CLR       S:?b0
        LD        A, #0x4b
        CALL      L:Writerda1846
//  254   Writerda1846(0x4C,rdaDTCTX[1],rdaDTCTX[2]);//设定发射数字亚音频
        LD        A, S:0x6c
        LD        S:?b1, A
        LD        A, S:0x6b
        LD        S:?b0, A
        LD        A, #0x4c
        CALL      L:Writerda1846
//  255   Writerda1846(0x45,0x0A,rda1846r45t);//设定亚音频控制寄存器(无亚音为0x80;模拟亚音0x81,数字0x82)
        LD        A, S:0x72
        LD        S:?b1, A
        MOV       S:?b0, #0xa
        LD        A, #0x45
        CALL      L:Writerda1846
//  256   Writerda1846(0x30,0x30,0x06);//宽带模式 窄带时Writerda1846(0x30,0x00,0x06)
        MOV       S:?b1, #0x6
        MOV       S:?b0, #0x30
        LD        A, #0x30
        CALL      L:Writerda1846
//  257   OSTimeDly(3);// 24ms
        LDW       X, #0x3
        CALL      L:OSTimeDly
//  258   Writerda1846(0x30,0x30,0x46);//带VOX时宽带模式 窄带时Writerda1846(0x30,0x00,0x56)                        
        MOV       S:?b1, #0x46
        MOV       S:?b0, #0x30
        LD        A, #0x30
        CALL      L:Writerda1846
//  259 }
        ADD       SP, #0x2
        JP        L:?epilogue_w4
        REQUIRE rda1846rt05ht
        REQUIRE rda1846rt05lt
        REQUIRE rda1846rt64lt
        REQUIRE rda1846TX
        REQUIRE txpram
        REQUIRE rdaCTCSSTX
        REQUIRE rdaDTCTX
        REQUIRE rda1846r45t

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
//     1 byte  in section .near.bss
//     6 bytes in section .near.noinit    (abs)
// 1 031 bytes in section .near_func.text
//    13 bytes in section .tiny.bss       (abs)
//    11 bytes in section .tiny.data      (abs)
// 
// 1 031 bytes of CODE memory
//    25 bytes of DATA memory (+ 6 bytes shared)
//
//Errors: none
//Warnings: 2
