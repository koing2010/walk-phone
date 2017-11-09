///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            08/Jan/2017  00:51:44 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\stm8s\src\stled316s.c                        /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\src\stled316s.c" -e -Oh --debug        /
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
//                    transeiver\stm8s\iar\Debug\List\stled316s.s             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stled316s

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?push_l2

        PUBLIC Delay_STLED316S
        PUBLIC InitSTLED316
        PUBLIC SPI_SendData
        PUBLIC SegA
        PUBLIC Write_8LED
        PUBLIC Write_LED
        PUBLIC _A_PA_ODR
        PUBLIC _A_PF_ODR

// E:\RDA1846s\walkphone program\ucos - transeiver\stm8s\src\stled316s.c
//    1 
//    2 #include "stled316s.h"

        ASEGN `.near.noinit`:DATA:NOROOT,05000H
        SECTION_GROUP _A_PA_ODR
// union <unnamed> volatile _A_PA_ODR
_A_PA_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05019H
        SECTION_GROUP _A_PF_ODR
// union <unnamed> volatile _A_PF_ODR
_A_PF_ODR:
        DS8 1
//    3 //数码管显示字数组
//    4 //                  			0 1 2 3 4 5 6 7 8 9 A B C D E F - 灭 N  t L H r o

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//    5 const uchar SegA[] ={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,
SegA:
        DC8 63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121
        DC8 113, 64, 0, 55, 120, 56, 118, 80, 62, 92

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine8:
        CALL      L:SPI_SendData
        CLR       A
        JP        L:SPI_SendData

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine4:
        CALL      L:Delay_STLED316S
        REQUIRE ??Subroutine16_0
        ;               // Fall through to label ??Subroutine16_0

        SECTION `.near_func.text`:CODE:NOROOT(0)
??Subroutine16_0:
        CALL      L:?Subroutine15
??CrossCallReturnLabel_34:
        RET

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine3:
        BRES      L:0x5000, #0x1
        LD        A, #0xd
        REQUIRE ??Subroutine17_0
        ;               // Fall through to label ??Subroutine17_0

        SECTION `.near_func.text`:CODE:NOROOT(0)
??Subroutine17_0:
        CALL      L:SPI_SendData
        BSET      L:0x5000, #0x1
        RET

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine1:
        CALL      L:SPI_SendData
        CALL      L:?Subroutine10
??CrossCallReturnLabel_20:
        RET

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine10:
        CALL      L:?Subroutine14
??CrossCallReturnLabel_28:
        CALL      L:?Subroutine15
??CrossCallReturnLabel_33:
        RET

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine15:
        BRES      L:0x5000, #0x1
        JP        L:Delay_STLED316S

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine14:
        CALL      L:Delay_STLED316S
        BSET      L:0x5000, #0x1
        JP        L:Delay_STLED316S

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine0:
        CALL      L:?Subroutine10
??CrossCallReturnLabel_21:
        LD        A, #0x11
        JP        L:SPI_SendData

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
SPI_SendData:
        LD        S:?b1, A
        MOV       S:?b0, #0x8
??SPI_SendData_0:
        BRES      L:0x5000, #0x2
        LD        A, S:?b1
        BCP       A, #0x1
        JREQ      L:??SPI_SendData_1
        BSET      L:0x5019, #0x4
        JRA       L:??SPI_SendData_2
??SPI_SendData_1:
        BRES      L:0x5019, #0x4
??SPI_SendData_2:
        LD        A, S:?b1
        SRL       A
        LD        S:?b1, A
        BSET      L:0x5000, #0x2
        LD        A, S:?b0
        DEC       A
        LD        S:?b0, A
        JRNE      L:??SPI_SendData_0
        RET
        REQUIRE _A_PA_ODR
        REQUIRE _A_PF_ODR
//    6 			         0x77,0x7c,0x39,0x5e,0x79,0x71,0x40,0x00,0x37,0x78,0x38,0x76,0x50,0x3E,0x5c};    //段码
//    7 
//    8 
//    9 /*  STLED316S */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   10 void Delay_STLED316S(void)  //延时
//   11 {
//   12  uint i;
//   13  for( i=0;i<10;i++ )
//   14    {;}
//   15 }
Delay_STLED316S:
        RET
//   16 /****************************************************************************
//   17 功能:		串口数据传送
//   18 描述: 	    给stled316s发送数据
//   19 参数:		data
//   20 返回值:		无
//   21 备注:		
//   22 ******************************************************************************/
//   23 void SPI_SendData( uchar data )              
//   24 {
//   25 	uchar i,l;
//   26 	for(i=0; i<8 ;i++)
//   27 		{
//   28 	      CLK=0;
//   29           if(data&0x01==1)			
//   30 	      DIN=1;
//   31           else  DIN=0;	
//   32           data>>=1;		
//   33 		  for( l=0 ; l<5 ; l++);
//   34 		  CLK=1;		
//   35 		  for( l=0 ; l<5 ; l++);					
//   36 		}
//   37 }
//   38 /****************************************************************************
//   39 功能:		stled316s初始化
//   40 描述: 	    对数码管的个数、亮度及led的亮度进行初始化	
//   41 参数:		Brightness 
//   42 返回值:		无
//   43 备注:		
//   44 ******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine7:
        CALL      L:SPI_SendData
        LD        A, S:?b8
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 void InitSTLED316( uchar Brightness )   //初始化
//   46 {  
InitSTLED316:
        PUSH      S:?b8
        LD        S:?b8, A
//   47 	STB=1;	
        BSET      L:0x5000, #0x1
//   48 	Delay_STLED316S();												
        CALL      L:?Subroutine4
//   49 	STB=0;
//   50 	Delay_STLED316S();					
//   51     SPI_SendData(0x30);
??CrossCallReturnLabel_30:
        LD        A, #0x30
        CALL      L:?Subroutine1
//   52     Delay_STLED316S();		
//   53 	STB=1;	
//   54 	Delay_STLED316S();												
//   55 	STB=0;
//   56 	Delay_STLED316S();	
//   57     SPI_SendData(0x30);  //地址
??CrossCallReturnLabel_3:
        LD        A, #0x30
        CALL      L:SPI_SendData
//   58     SPI_SendData(0xE4); //个数设置   E5是6个      
        LD        A, #0xe4
        CALL      L:SPI_SendData
//   59 	Delay_STLED316S();												
        CALL      L:?Subroutine0
//   60 	STB=1;	
//   61 	Delay_STLED316S();												
//   62 	STB=0;
//   63 	Delay_STLED316S();
//   64   	SPI_SendData(0x11);	       	
//   65 	Delay_STLED316S();
??CrossCallReturnLabel_1:
        CALL      L:?Subroutine0
//   66    	STB=1;	
//   67 	Delay_STLED316S();												
//   68 	STB=0;
//   69 	Delay_STLED316S();	
//   70     SPI_SendData(0x11);//地址
//   71 	SPI_SendData( Brightness );//亮度设置	         
??CrossCallReturnLabel_0:
        LD        A, S:?b8
        CALL      L:?Subroutine7
//   72 	SPI_SendData( Brightness );							 
??CrossCallReturnLabel_13:
        CALL      L:?Subroutine7
//   73     SPI_SendData( Brightness );							 															
??CrossCallReturnLabel_14:
        CALL      L:??Subroutine17_0
//   74 	STB=1;	
//   75 	Delay_STLED316S();												
??CrossCallReturnLabel_38:
        CALL      L:?Subroutine4
//   76 	STB=0;
//   77 	Delay_STLED316S();
//   78     SPI_SendData(0x18);	       	
??CrossCallReturnLabel_31:
        LD        A, #0x18
        CALL      L:?Subroutine1
//   79 	Delay_STLED316S();
//   80     STB=1;	
//   81 	Delay_STLED316S();												
//   82 	STB=0;
//   83 	Delay_STLED316S();	
//   84     SPI_SendData(0x18);     //地址
??CrossCallReturnLabel_4:
        LD        A, #0x18
        CALL      L:?Subroutine8
//   85 	SPI_SendData(0x00);					         
//   86 	SPI_SendData(0x00);	
??CrossCallReturnLabel_16:
        CLR       A
        CALL      L:?Subroutine8
//   87     SPI_SendData(0x00);		//亮度设置				 	
//   88 }
??CrossCallReturnLabel_15:
        POP       S:?b8
        RET
        REQUIRE _A_PA_ODR
//   89 /****************************************************************************
//   90 功能:		写数码管
//   91 描述: 	    控制数码的显示状态
//   92 参数:		data1,data2,data3,data4,data5,data6
//   93 返回值:		无
//   94 备注:		
//   95 ******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   96 void Write_8LED( uchar oneSecondsFlag,uchar	data1,uchar data2,uchar	data3,uchar	data4)
//   97 {
Write_8LED:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        MOV       S:?b10, S:?b1
        MOV       S:?b11, S:?b2
        MOV       S:?b12, S:?b3
//   98 STB=0;
        CALL      L:??Subroutine16_0
//   99 	Delay_STLED316S();					
//  100     SPI_SendData(0x00);		  	
??CrossCallReturnLabel_32:
        CLR       A
        CALL      L:?Subroutine1
//  101 	Delay_STLED316S();
//  102 	STB=1; 
//  103 	
//  104 	Delay_STLED316S();												
//  105 	STB=0;
//  106 	Delay_STLED316S();				
//  107     SPI_SendData(0x00);   //地址
??CrossCallReturnLabel_2:
        CLR       A
        CALL      L:?Subroutine7
//  108 
//  109 //点亮数码管*******************
//  110 //此处代码可修改
//  111 switch(oneSecondsFlag)
??CrossCallReturnLabel_12:
        JREQ      L:??Write_8LED_0
        DEC       A
        JREQ      L:??Write_8LED_1
        DEC       A
        JREQ      L:??Write_8LED_2
        DEC       A
        JREQ      L:??Write_8LED_3
        DEC       A
        JREQ      L:??Write_8LED_4
        JRA       L:??Write_8LED_5
//  112 {
//  113 case 0://小数点全不亮
//  114 {	
//  115 
//  116 	SPI_SendData(SegA[data1]);
??Write_8LED_0:
        CALL      L:?Subroutine9
//  117 	SPI_SendData(SegA[data2]);
//  118 	SPI_SendData(SegA[data3]);
//  119 	SPI_SendData(SegA[data4]);
//  120 	break;
//  121 }
??CrossCallReturnLabel_17:
        JRA       L:??Write_8LED_6
//  122 case 1://中间时钟冒号点亮
//  123 {	
//  124 	SPI_SendData(SegA[data1]|0x80);
??Write_8LED_1:
        CALL      L:?Subroutine9
//  125 	SPI_SendData(SegA[data2]);
//  126 	SPI_SendData(SegA[data3]);
//  127 	SPI_SendData(SegA[data4]);
//  128 
//  129 	break;
//  130 }
??CrossCallReturnLabel_18:
        OR        A, #0x80
??Write_8LED_6:
        CALL      L:?Subroutine5
??CrossCallReturnLabel_7:
        JRA       L:??Write_8LED_7
//  131 
//  132 case 2://data1小数点亮
//  133 {
//  134 	SPI_SendData(SegA[data1]);
??Write_8LED_2:
        CALL      L:?Subroutine9
//  135 	SPI_SendData(SegA[data2]|0x80);
//  136 	SPI_SendData(SegA[data3]);
//  137 	SPI_SendData(SegA[data4]);
//  138 
//  139 	break;
//  140 }
??CrossCallReturnLabel_19:
        CALL      L:?Subroutine5
??CrossCallReturnLabel_8:
        OR        A, #0x80
??Write_8LED_7:
        CALL      L:?Subroutine11
??CrossCallReturnLabel_22:
        JRA       L:??Write_8LED_8
//  141 case 3://data2小数点亮
//  142 {
//  143         SPI_SendData(SegA[data1]);
??Write_8LED_3:
        CALL      L:?Subroutine2
//  144 	SPI_SendData(SegA[data2]);
//  145 	SPI_SendData(SegA[data3]|0x80);
//  146 	SPI_SendData(SegA[data4]);
//  147 
//  148 	break;
//  149 }
??CrossCallReturnLabel_5:
        OR        A, #0x80
??Write_8LED_8:
        CALL      L:?Subroutine6
??CrossCallReturnLabel_9:
        JRA       L:??Write_8LED_9
//  150 
//  151 case 4://data4小数点亮
//  152 {
//  153 	SPI_SendData(SegA[data1]);
??Write_8LED_4:
        CALL      L:?Subroutine2
//  154 	SPI_SendData(SegA[data2]);
//  155 	SPI_SendData(SegA[data3]);
??CrossCallReturnLabel_6:
        CALL      L:?Subroutine6
//  156 	SPI_SendData(SegA[data4]|0x80);
??CrossCallReturnLabel_10:
        OR        A, #0x80
??Write_8LED_9:
        CALL      L:SPI_SendData
//  157 
//  158 	break;
//  159 }
//  160 /*
//  161 case 5://data5小数点亮
//  162 {
//  163 	SPI_SendData(SegA[data1]);
//  164 	SPI_SendData(SegA[data2]);
//  165 	SPI_SendData(SegA[data3]);
//  166 	SPI_SendData(SegA[data4]);
//  167 	SPI_SendData(SegA[data5]|0x80);
//  168 	SPI_SendData(SegA[data6]);
//  169 	break;
//  170 }
//  171 
//  172 //可在此添加显示程序，例如：
//  173 case 6://data6小数点亮
//  174 {
//  175 	SPI_SendData(SegA[data1]);
//  176 	SPI_SendData(SegA[data2]);
//  177 	SPI_SendData(SegA[data3]);
//  178 	SPI_SendData(SegA[data4]);
//  179 	SPI_SendData(SegA[data5]);
//  180  	SPI_SendData(SegA[data6]|0x80);
//  181 	break;
//  182 }
//  183 */
//  184 //注意要在函数参数中添加data6；
//  185 }
//  186 
//  187 //**********************************************
//  188     Delay_STLED316S();
??Write_8LED_5:
        CALL      L:?Subroutine14
//  189     STB=1;
//  190 	Delay_STLED316S();														
//  191 	STB=0;
??CrossCallReturnLabel_29:
        CALL      L:?Subroutine3
//  192 	Delay_STLED316S();			 										
//  193 	SPI_SendData(0x0d);				//发送显示命令
//  194 	Delay_STLED316S();
//  195 	STB=1;	
//  196 }
??CrossCallReturnLabel_36:
        POP       S:?b12
        JP        L:?epilogue_l2
        REQUIRE _A_PA_ODR

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine9:
        CALL      L:?Subroutine13
??CrossCallReturnLabel_27:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine13:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b9
        EXG       A, XL
        LD        A, (L:SegA,X)
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine6:
        CALL      L:SPI_SendData
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        LD        A, (L:SegA,X)
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine5:
        CALL      L:?Subroutine12
??CrossCallReturnLabel_24:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine12:
        CALL      L:SPI_SendData
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        LD        A, (L:SegA,X)
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        CALL      L:?Subroutine13
??CrossCallReturnLabel_26:
        CALL      L:?Subroutine12
??CrossCallReturnLabel_25:
        CALL      L:?Subroutine11
??CrossCallReturnLabel_23:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine11:
        CALL      L:SPI_SendData
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        LD        A, (L:SegA,X)
        RET
//  197 /****************************************************************************
//  198 功能:		控制led
//  199 描述: 	    控制某一位led的状态
//  200 参数:		data 
//  201 返回值:		无
//  202 备注:		
//  203 ******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  204 void	Write_LED(uchar	data)
//  205 {
Write_LED:
        PUSH      S:?b8
        LD        S:?b8, A
//  206 		STB=0;
        BRES      L:0x5000, #0x1
//  207 		Delay_STLED316S();
//  208 		SPI_SendData(0x28);
        LD        A, #0x28
        CALL      L:?Subroutine7
//  209 		SPI_SendData(data);
??CrossCallReturnLabel_11:
        CALL      L:??Subroutine17_0
//  210 		Delay_STLED316S();
//  211 		STB=1;
//  212 		Delay_STLED316S();
//  213 		STB=0;
??CrossCallReturnLabel_37:
        CALL      L:?Subroutine3
//  214 		Delay_STLED316S();
//  215     	SPI_SendData(0xD);  //Display On
//  216     	Delay_STLED316S();
//  217     	STB=1;
//  218 		Delay_STLED316S();		
//  219 }
??CrossCallReturnLabel_35:
        POP       S:?b8
        RET
        REQUIRE _A_PA_ODR

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
//   2 bytes in section .near.noinit    (abs)
//  25 bytes in section .near.rodata
// 377 bytes in section .near_func.text
// 
// 377 bytes of CODE  memory
//  25 bytes of CONST memory
//   0 bytes of DATA  memory (+ 2 bytes shared)
//
//Errors: none
//Warnings: none
