///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            08/Jan/2017  01:19:23 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\stm8s\src\MB1504.c                           /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\src\MB1504.c" -e -Oh --debug           /
//                    --code_model small --data_model medium -o               /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\iar\Debug\Obj\" --dlib_config          /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\stm8\LIB\dlstm8smn.h" -D STM8S207 -lB               /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
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
//                    transeiver\stm8s\iar\Debug\List\MB1504.s                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME MB1504

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN ?w4

        PUBLIC FrequenceToSend
        PUBLIC Send11Bit
        PUBLIC Send16Bit
        PUBLIC Send8Bit
        PUBLIC SendReferF
        PUBLIC _A_PD_ODR

// E:\RDA1846s\walkphone program\ucos - transeiver\stm8s\src\MB1504.c
//    1 /******************************************************
//    2 MB1504 PLL 芯片驱动部分
//    3 *******************************************************/
//    4 #include <MB1504.h>

        ASEGN `.near.noinit`:DATA:NOROOT,0500fH
        SECTION_GROUP _A_PD_ODR
// union <unnamed> volatile _A_PD_ODR
_A_PD_ODR:
        DS8 1

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
SendReferF:
        LDW       X, #0x8641
        JP        L:Send16Bit

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
Send8Bit:
        LD        S:?b1, A
        MOV       S:?b0, #0x8
??Send8Bit_0:
        LD        A, S:?b1
        BCP       A, #0x80
        JREQ      L:??Send8Bit_1
        BSET      L:0x500f, #0x6
        JRA       L:??Send8Bit_2
??Send8Bit_1:
        BRES      L:0x500f, #0x6
??Send8Bit_2:
        NOP
        NOP
        BSET      L:0x500f, #0x7
        NOP
        NOP
        BRES      L:0x500f, #0x7
        LD        A, S:?b1
        SLL       A
        LD        S:?b1, A
        LD        A, S:?b0
        DEC       A
        LD        S:?b0, A
        JRNE      L:??Send8Bit_0
        BSET      L:0x500f, #0x5
        NOP
        NOP
        BRES      L:0x500f, #0x5
        RET
        REQUIRE _A_PD_ODR

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
Send11Bit:
        CALL      L:?Subroutine2
??CrossCallReturnLabel_4:
        MOV       S:?b0, #0xb
??Send11Bit_0:
        CALL      L:?Subroutine0
??CrossCallReturnLabel_0:
        JREQ      L:??Send11Bit_1
        BSET      L:0x500f, #0x6
        JRA       L:??Send11Bit_2
??Send11Bit_1:
        BRES      L:0x500f, #0x6
??Send11Bit_2:
        NOP
        NOP
        BSET      L:0x500f, #0x7
        NOP
        NOP
        CALL      L:?Subroutine1
??CrossCallReturnLabel_2:
        JRNE      L:??Send11Bit_0
        RET
        REQUIRE _A_PD_ODR
//    5 /*
//    6 //数字锁相环（ MB1504 ）驱动程序
//    7 //针对晶体 采用12M  步进采用 100KHz 的驱动程序
//    8 // 12M / 100K = 120 = 0x78
//    9 // Refer counter   = ( 0x78 << 1 ) | 0x8001   SW = 32
//   10 // Refer counter   = ( 0xF0 ) | 0x8001
//   11 // Refer counter   = 0x80F1 ;
//   12 //针对适用频率范围 为 8M -> 60M
//   13 //   Frequence
//   14 //  8M    60M
//   15 //  800    6000
//   16 //  0x0320   0x1770
//   17 */
//   18 
//   19 #define SetData 0x8641// Fre = 10khz
//   20 
//   21 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   22 void Send16Bit( unsigned int SendData )
//   23 
//   24 {
//   25   unsigned char i;
//   26   unsigned int SendMiddle;
//   27 
//   28   SendMiddle = SendData;
//   29    MB1504_LE = 0;  MB1504_CLK = 0;
Send16Bit:
        CALL      L:?Subroutine2
//   30 
//   31   for( i = 0; i < 16; i ++ )
??CrossCallReturnLabel_5:
        MOV       S:?b0, #0x10
//   32   {
//   33    if( SendMiddle & 0x8000 ) MB1504_DATA = 1;
??Send16Bit_0:
        CALL      L:?Subroutine0
??CrossCallReturnLabel_1:
        JREQ      L:??Send16Bit_1
        BSET      L:0x500f, #0x6
        JRA       L:??Send16Bit_2
//   34    else  MB1504_DATA = 0;
??Send16Bit_1:
        BRES      L:0x500f, #0x6
//   35     _nop_( ); 
??Send16Bit_2:
        NOP
        NOP
//   36     MB1504_CLK = 1;
        BSET      L:0x500f, #0x7
//   37     _nop_( );
        NOP
        NOP
//   38     MB1504_CLK = 0;
        CALL      L:?Subroutine1
//   39     SendMiddle = SendMiddle << 1;
//   40 
//   41   }
??CrossCallReturnLabel_3:
        JRNE      L:??Send16Bit_0
//   42 
//   43   MB1504_LE = 1;  
        BSET      L:0x500f, #0x5
//   44   _nop_( ); 
        NOP
        NOP
//   45   MB1504_LE = 0;
        BRES      L:0x500f, #0x5
//   46 
//   47 }
        RET
        REQUIRE _A_PD_ODR

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
//   48 
//   49 
//   50 
//   51 void Send11Bit( unsigned int SendData )
//   52 
//   53 {
//   54 
//   55   unsigned char i;
//   56  // unsigned int  SendMiddle;
//   57 
//   58 //  SendMiddle = SendData;
//   59 
//   60   MB1504_LE = 0; MB1504_CLK = 0;
        BRES      L:0x500f, #0x5
        BRES      L:0x500f, #0x7
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
//   61   for( i = 0; i < 11; i ++ )
//   62   {
//   63 
//   64    if( SendData & 0x8000 )MB1504_DATA = 1;
//   65     else MB1504_DATA = 0;
//   66     _nop_( ); MB1504_CLK = 1;
//   67     _nop_( ); MB1504_CLK = 0;
        BRES      L:0x500f, #0x7
//   68     SendData = SendData << 1;
        SLLW      X
        LD        A, S:?b0
        DEC       A
        LD        S:?b0, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LDW       Y, X
        RLWA      X, A
        AND       A, #0x80
        RLWA      X, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
        TNZW      Y
        RET
//   69 
//   70   }
//   71 
//   72 }
//   73 
//   74 
//   75 
//   76 void Send8Bit( unsigned char SendData )
//   77 
//   78 {
//   79 
//   80   unsigned char i;
//   81  // unsigned char SendMiddle;
//   82  // SendMiddle = SendData;
//   83 
//   84   for( i = 0; i < 8; i ++ )
//   85 
//   86   {
//   87 
//   88      if( SendData & 0x80 )MB1504_DATA = 1;
//   89      else MB1504_DATA =0;
//   90     _nop_(); MB1504_CLK = 1;
//   91     _nop_(); MB1504_CLK = 0;
//   92     SendData = SendData << 1;
//   93 
//   94   }
//   95 
//   96   MB1504_LE = 1; _nop_( ); MB1504_LE = 0;
//   97 
//   98 }
//   99 
//  100 
//  101 
//  102 void SendReferF()
//  103 
//  104 { // 针对晶体 采用12M
//  105 
//  106   Send16Bit( SetData ); // 12M Crystal
//  107 
//  108 }
//  109 
//  110 
//  111 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  112 void FrequenceToSend( unsigned int FrequenceD )
//  113 
//  114 {
FrequenceToSend:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  115 
//  116   unsigned char AD = 0 ;
//  117   unsigned int  ND = 0, MiddleF = 2000;
//  118  // FrequenceD = FrequenceD*2;
//  119 
//  120   if( ( FrequenceD >= 800 ) && ( FrequenceD <= 30000 ) )
        ADDW      X, #0xfce0
        CPW       X, #0x7211
        JRNC      L:??FrequenceToSend_0
//  121 
//  122   {     // 限制 锁定频率
//  123 
//  124     MiddleF = FrequenceD;
//  125 
//  126     ND = ( unsigned int  ) ( MiddleF / 32 );
//  127 
//  128     AD = ( unsigned char ) ( MiddleF % 32 );
//  129 
//  130     ND = ND << 5;  AD = AD << 1; AD = AD & 0xef;
//  131 
//  132     Send11Bit( ND );
        LDW       X, S:?w4
        RRWA      X, A
        AND       A, #0xe0
        RLWA      X, A
        CALL      L:Send11Bit
//  133     Send8Bit( AD );
        LD        A, S:?b9
        SLL       A
        AND       A, #0x2e
        CALL      L:Send8Bit
//  134   }
//  135 
//  136 }
??FrequenceToSend_0:
        JP        L:?epilogue_w4

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  137 
//  138 
// 
//   1 byte  in section .near.noinit    (abs)
// 210 bytes in section .near_func.text
// 
// 210 bytes of CODE memory
//   0 bytes of DATA memory (+ 1 byte shared)
//
//Errors: none
//Warnings: none
