///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:53 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\ucos_II\iarstm8\os_cpu_c.c                   /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\ucos_II\iarstm8\os_cpu_c.c" -e -On --no_cse  /
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
//                    transeiver\stm8s\iar\Debug\List\os_cpu_c.s              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME os_cpu_c

        EXTERN ?b3
        EXTERN ?epilogue_l2_w6
        EXTERN ?mov_l0_l2
        EXTERN ?mov_w2_w0
        EXTERN ?mov_w3_w2
        EXTERN ?mov_w6_w1
        EXTERN ?push_l2
        EXTERN ?push_w6
        EXTERN ?srl32_l0_l0_db
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5

        PUBLIC OSInitHookBegin
        PUBLIC OSInitHookEnd
        PUBLIC OSTCBInitHook
        PUBLIC OSTaskCreateHook
        PUBLIC OSTaskDelHook
        PUBLIC OSTaskIdleHook
        PUBLIC OSTaskStatHook
        PUBLIC OSTaskStkInit
        PUBLIC OSTaskSwHook
        PUBLIC OSTimeTickHook
        PUBLIC __zero_in_ram__

// E:\RDA1846s\walkphone program\ucos - transeiver\ucos_II\iarstm8\os_cpu_c.c
//    1 
//    2 
//    3 #define  OS_CPU_GLOBALS
//    4 #include "includes.h"
//    5 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    6 INT8U __zero_in_ram__=0;
__zero_in_ram__:
        DS8 1
//    7 
//    8 /********************************************************************************************************
//    9   Local variables ¾Ö²¿±äÁ¿
//   10 ********************************************************************************************************/
//   11 #if OS_TMR_EN > 0
//   12     static INT16U OSTmrCtr;
//   13 #endif
//   14 
//   15 #if OS_CPU_HOOKS_EN > 0 && OS_VERSION > 203

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   16     void OSInitHookBegin (void)
//   17     {
//   18         #if OS_TMR_EN > 0
//   19             OSTmrCtr = 0;
//   20         #endif
//   21     }
OSInitHookBegin:
        RET
//   22 #endif
//   23 
//   24 
//   25 #if OS_CPU_HOOKS_EN > 0 && OS_VERSION > 203

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   26     void OSInitHookEnd (void)
//   27     {
//   28     }
OSInitHookEnd:
        RET
//   29 #endif
//   30 
//   31 
//   32 #if OS_CPU_HOOKS_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   33     void OSTaskCreateHook (OS_TCB  *ptcb)
//   34     {
//   35         (void)ptcb;                                                     /*  Prevent compiler warning    */
//   36                                                                         /*  ·ÀÖ¹±àÒë¾¯¸æ                */
//   37     }
OSTaskCreateHook:
        RET
//   38 #endif
//   39 
//   40 
//   41 #if OS_CPU_HOOKS_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   42     void  OSTaskDelHook (OS_TCB  *ptcb)
//   43     {
//   44         (void)ptcb;                                                     /*  Prevent compiler warning    */
//   45                                                                         /*  ·ÀÖ¹±àÒë¾¯¸æ                */
//   46     }
OSTaskDelHook:
        RET
//   47 #endif
//   48 
//   49 
//   50 #if OS_CPU_HOOKS_EN > 0 && OS_VERSION >= 251

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   51     void OSTaskIdleHook (void)
//   52     {
//   53     }
OSTaskIdleHook:
        RET
//   54 #endif
//   55 
//   56 
//   57 #if OS_CPU_HOOKS_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   58     void OSTaskStatHook (void)
//   59     {
//   60     }
OSTaskStatHook:
        RET
//   61 #endif
//   62 
//   63 
//   64     
//   65 //                            ?b3:?b2:?b1             X           Y          ?b5:?b4   

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   66 OS_STK  *OSTaskStkInit (void (*task)(void *pd), void *p_arg, OS_STK *ptos, INT16U opt)
//   67 {
OSTaskStkInit:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LDW       S:?w5, X
        CALL      L:?mov_w2_w0
        CALL      L:?mov_w6_w1
//   68     INT8U  *psoft_stk;
//   69     INT32U  tmp;
//   70 
//   71     (void)opt;                          
//   72     
//   73     psoft_stk     = (INT8U *)ptos;
        CALL      L:?mov_w3_w2
//   74     
//   75     tmp           = (INT32U)task;
        CLRW      X
        LDW       S:?w4, X
        CALL      L:?mov_l0_l2
//   76                                             
//   77     *psoft_stk--  = (INT8U)(tmp & 0xFF);       //PCL
        LD        A, S:?b3
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   78     tmp         >>= 8;
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x8
        CODE
//   79     
//   80     *psoft_stk--  = (INT8U)(tmp & 0xFF);       //PCH
        LD        A, S:?b3
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   81     tmp         >>= 8;
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x8
        CODE
//   82     
//   83     *psoft_stk--  = (INT8U)(tmp & 0xFF);       //PCE
        LD        A, S:?b3
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   84     tmp         >>= 8;
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x8
        CODE
//   85           
//   86     *psoft_stk--  = (INT8U)0x01;               //YL
        LD        A, #0x1
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   87     *psoft_stk--  = (INT8U)0x02;               //YH
        LD        A, #0x2
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   88     
//   89     *psoft_stk--  = ((INT16U)p_arg)&0XFF;       //XL
        LD        A, YL
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   90     *psoft_stk--  = (((INT16U)p_arg)>>8)&0XFF;  //XH
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   91     
//   92     *psoft_stk--  = (INT8U)0x05;                //A
        LD        A, #0x5
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   93     *psoft_stk--  = (INT8U)0x20;                //CC
        LD        A, #0x20
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   94     
//   95     *psoft_stk--  = (INT8U)0x00;                //?B0
        CLR       A
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   96     *psoft_stk--  = (INT8U)0x01;                //?B0
        LD        A, #0x1
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   97     *psoft_stk--  = (INT8U)0x02;                //?B0
        LD        A, #0x2
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   98     *psoft_stk--  = (INT8U)0x03;                //?B0
        LD        A, #0x3
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//   99     *psoft_stk--  = (INT8U)0x04;                //?B0
        LD        A, #0x4
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  100     *psoft_stk--  = (INT8U)0x05;                //?B0
        LD        A, #0x5
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  101     *psoft_stk--  = (INT8U)0x06;                //?B0
        LD        A, #0x6
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  102     *psoft_stk--  = (INT8U)0x07;                //?B0
        LD        A, #0x7
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  103     
//  104     *psoft_stk--  = (INT8U)0x08;                //?B0
        LD        A, #0x8
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  105     *psoft_stk--  = (INT8U)0x09;                //?B0
        LD        A, #0x9
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  106     *psoft_stk--  = (INT8U)10;                //?B0
        LD        A, #0xa
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  107     *psoft_stk--  = (INT8U)11;                //?B0
        LD        A, #0xb
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  108     *psoft_stk--  = (INT8U)12;                //?B0
        LD        A, #0xc
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  109     *psoft_stk--  = (INT8U)13;                //?B0
        LD        A, #0xd
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  110     *psoft_stk--  = (INT8U)14;                //?B0
        LD        A, #0xe
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  111     *psoft_stk--  = (INT8U)15;                //?B0    
        LD        A, #0xf
        LD        [S:?w3.w], A
        LDW       X, S:?w3
        DECW      X
        LDW       S:?w3, X
//  112     
//  113     return ((OS_STK *)psoft_stk);
        LDW       X, S:?w3
        JP        L:?epilogue_l2_w6
//  114 }
//  115 
//  116 
//  117 
//  118 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  119 void OSTaskSwHook (void)
//  120 {
//  121 
//  122 }
OSTaskSwHook:
        RET
//  123 
//  124 #if (OS_CPU_HOOKS_EN > 0) && (OS_VERSION > 203)

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  125     void OSTCBInitHook (OS_TCB  *ptcb)
//  126     {
//  127         (void)ptcb;                                                     /*  Prevent compiler warning    */
//  128                                                                         /*  ·ÀÖ¹±àÒë¾¯¸æ                */
//  129     }
OSTCBInitHook:
        RET
//  130 #endif
//  131 
//  132 #if ((OS_CPU_HOOKS_EN > 0) && (OS_TIME_TICK_HOOK_EN > 0)) || (OS_VERSION < 283)

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  133     void OSTimeTickHook (void)
//  134     {
//  135         #if OS_TMR_EN > 0
//  136             OSTmrCtr++;
//  137             if (OSTmrCtr >= (OS_TICKS_PER_SEC / OS_TMR_CFG_TICKS_PER_SEC)) {
//  138                 OSTmrCtr = 0;
//  139                 OSTmrSignal();
//  140 	    }
//  141         #endif
//  142     }
OSTimeTickHook:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  143 #endif
//  144 
// 
//   1 byte  in section .near.bss
// 300 bytes in section .near_func.text
// 
// 300 bytes of CODE memory
//   1 byte  of DATA memory
//
//Errors: none
//Warnings: none
