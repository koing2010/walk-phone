///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:54 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\ucos_II\OS_MBOX.C                            /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\ucos_II\OS_MBOX.C" -e -On --no_cse           /
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
//                    transeiver\stm8s\iar\Debug\List\OS_MBOX.s               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OS_MBOX

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?mov_w4_w0
        EXTERN ?pop_w7
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w6
        EXTERN ?push_w7
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN OSEventFreeList
        EXTERN OSIntNesting
        EXTERN OSTCBCur
        EXTERN OS_EventTO
        EXTERN OS_EventTaskRdy
        EXTERN OS_EventTaskWait
        EXTERN OS_EventWaitListInit
        EXTERN OS_Sched

        PUBLIC OSMboxAccept
        PUBLIC OSMboxCreate
        PUBLIC OSMboxDel
        PUBLIC OSMboxPend
        PUBLIC OSMboxPost
        PUBLIC OSMboxPostOpt
        PUBLIC OSMboxQuery

// E:\RDA1846s\walkphone program\ucos - transeiver\ucos_II\OS_MBOX.C
//    1 /*
//    2 *********************************************************************************************************
//    3 *                                                uC/OS-II
//    4 *                                          The Real-Time Kernel
//    5 *                                       MESSAGE MAILBOX MANAGEMENT
//    6 *
//    7 *                          (c) Copyright 1992-2002, Jean J. Labrosse, Weston, FL
//    8 *                                           All Rights Reserved
//    9 *
//   10 * File : OS_MBOX.C
//   11 * By   : Jean J. Labrosse
//   12 *********************************************************************************************************
//   13 */
//   14 
//   15 #ifndef  OS_MASTER_FILE
//   16 #include "includes.h"

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// static unsigned char CriticalEnter(void)
CriticalEnter:
        PUSH      CC
        POP       A
        AND       A, #0x28
        SIM
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// static void CriticalExit(unsigned char)
CriticalExit:
        LD        S:?b0, A
        LD        A, S:?b0
        LD        S:?b1, A
        PUSH      CC
        POP       A
        AND       A, #0xffffffffffffffd7
        OR        A, S:?b1
        PUSH      A
        POP       CC
        RET
//   17 #endif
//   18 
//   19 #if OS_MBOX_EN > 0
//   20 /*
//   21 *********************************************************************************************************
//   22 *                                     ACCEPT MESSAGE FROM MAILBOX
//   23 *
//   24 * Description: This function checks the mailbox to see if a message is available.  Unlike OSMboxPend(),
//   25 *              OSMboxAccept() does not suspend the calling task if a message is not available.
//   26 *
//   27 * Arguments  : pevent        is a pointer to the event control block
//   28 *
//   29 * Returns    : != (void *)0  is the message in the mailbox if one is available.  The mailbox is cleared
//   30 *                            so the next time OSMboxAccept() is called, the mailbox will be empty.
//   31 *              == (void *)0  if the mailbox is empty or,
//   32 *                            if 'pevent' is a NULL pointer or,
//   33 *                            if you didn't pass the proper event pointer.
//   34 *********************************************************************************************************
//   35 */
//   36 
//   37 #if OS_MBOX_ACCEPT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   38 void  *OSMboxAccept (OS_EVENT *pevent)
//   39 {
OSMboxAccept:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w4, X
//   40 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//   41     OS_CPU_SR  cpu_sr;
//   42 #endif    
//   43     void      *msg;
//   44 
//   45 
//   46 #if OS_ARG_CHK_EN > 0
//   47     if (pevent == (OS_EVENT *)0) {                        /* Validate 'pevent'                         */
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSMboxAccept_0
//   48         return ((void *)0);
        CLRW      X
        JRA       L:??OSMboxAccept_1
//   49     }
//   50     if (pevent->OSEventType != OS_EVENT_TYPE_MBOX) {      /* Validate event block type                 */
??OSMboxAccept_0:
        LD        A, [S:?w4.w]
        CP        A, #0x1
        JREQ      L:??OSMboxAccept_2
//   51         return ((void *)0);
        CLRW      X
        JRA       L:??OSMboxAccept_1
//   52     }
//   53 #endif
//   54     OS_ENTER_CRITICAL();
??OSMboxAccept_2:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//   55     msg                = pevent->OSEventPtr;
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w5, X
//   56     pevent->OSEventPtr = (void *)0;                       /* Clear the mailbox                         */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//   57     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//   58     return (msg);                                         /* Return the message received (or NULL)     */
        LDW       X, S:?w5
??OSMboxAccept_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//   59 }
//   60 #endif
//   61 /*$PAGE*/
//   62 /*
//   63 *********************************************************************************************************
//   64 *                                        CREATE A MESSAGE MAILBOX
//   65 *
//   66 * Description: This function creates a message mailbox if free event control blocks are available.
//   67 *
//   68 * Arguments  : msg           is a pointer to a message that you wish to deposit in the mailbox.  If
//   69 *                            you set this value to the NULL pointer (i.e. (void *)0) then the mailbox
//   70 *                            will be considered empty.
//   71 *
//   72 * Returns    : != (OS_EVENT *)0  is a pointer to the event control clock (OS_EVENT) associated with the
//   73 *                                created mailbox
//   74 *              == (OS_EVENT *)0  if no event control blocks were available
//   75 *********************************************************************************************************
//   76 */
//   77 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   78 OS_EVENT  *OSMboxCreate (void *msg)
//   79 {
OSMboxCreate:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w5, X
//   80 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//   81     OS_CPU_SR  cpu_sr;
//   82 #endif    
//   83     OS_EVENT  *pevent;
//   84 
//   85 
//   86     if (OSIntNesting > 0) {                      /* See if called from ISR ...                         */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSMboxCreate_0
//   87         return ((OS_EVENT *)0);                  /* ... can't CREATE from an ISR                       */
        CLRW      X
        JRA       L:??OSMboxCreate_1
//   88     }
//   89     OS_ENTER_CRITICAL();
??OSMboxCreate_0:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//   90     pevent = OSEventFreeList;                    /* Get next free event control block                  */
        LDW       X, L:OSEventFreeList
        LDW       S:?w4, X
//   91     if (OSEventFreeList != (OS_EVENT *)0) {      /* See if pool of free ECB pool was empty             */
        LDW       X, L:OSEventFreeList
        TNZW      X
        JREQ      L:??OSMboxCreate_2
//   92         OSEventFreeList = (OS_EVENT *)OSEventFreeList->OSEventPtr;
        LDW       X, L:OSEventFreeList
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       L:OSEventFreeList, X
//   93     }
//   94     OS_EXIT_CRITICAL();
??OSMboxCreate_2:
        LD        A, S:?b12
        CALL      L:CriticalExit
//   95     if (pevent != (OS_EVENT *)0) {
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??OSMboxCreate_3
//   96         pevent->OSEventType = OS_EVENT_TYPE_MBOX;
        LD        A, #0x1
        LD        [S:?w4.w], A
//   97         pevent->OSEventCnt  = 0;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//   98         pevent->OSEventPtr  = msg;               /* Deposit message in event control block             */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, S:?w5
        LDW       (Y), X
//   99         OS_EventWaitListInit(pevent);
        LDW       X, S:?w4
        CALL      L:OS_EventWaitListInit
//  100     }
//  101     return (pevent);                             /* Return pointer to event control block              */
??OSMboxCreate_3:
        LDW       X, S:?w4
??OSMboxCreate_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//  102 }
//  103 /*$PAGE*/
//  104 /*
//  105 *********************************************************************************************************
//  106 *                                         DELETE A MAIBOX
//  107 *
//  108 * Description: This function deletes a mailbox and readies all tasks pending on the mailbox.
//  109 *
//  110 * Arguments  : pevent        is a pointer to the event control block associated with the desired
//  111 *                            mailbox.
//  112 *
//  113 *              opt           determines delete options as follows:
//  114 *                            opt == OS_DEL_NO_PEND   Delete the mailbox ONLY if no task pending
//  115 *                            opt == OS_DEL_ALWAYS    Deletes the mailbox even if tasks are waiting.
//  116 *                                                    In this case, all the tasks pending will be readied.
//  117 *
//  118 *              err           is a pointer to an error code that can contain one of the following values:
//  119 *                            OS_NO_ERR               The call was successful and the mailbox was deleted
//  120 *                            OS_ERR_DEL_ISR          If you attempted to delete the mailbox from an ISR
//  121 *                            OS_ERR_INVALID_OPT      An invalid option was specified
//  122 *                            OS_ERR_TASK_WAITING     One or more tasks were waiting on the mailbox
//  123 *                            OS_ERR_EVENT_TYPE       If you didn't pass a pointer to a mailbox
//  124 *                            OS_ERR_PEVENT_NULL      If 'pevent' is a NULL pointer.
//  125 *
//  126 * Returns    : pevent        upon error
//  127 *              (OS_EVENT *)0 if the mailbox was successfully deleted.
//  128 *
//  129 * Note(s)    : 1) This function must be used with care.  Tasks that would normally expect the presence of
//  130 *                 the mailbox MUST check the return code of OSMboxPend().
//  131 *              2) OSMboxAccept() callers will not know that the intended mailbox has been deleted!
//  132 *              3) This call can potentially disable interrupts for a long time.  The interrupt disable
//  133 *                 time is directly proportional to the number of tasks waiting on the mailbox.
//  134 *              4) Because ALL tasks pending on the mailbox will be readied, you MUST be careful in
//  135 *                 applications where the mailbox is used for mutual exclusion because the resource(s)
//  136 *                 will no longer be guarded by the mailbox.
//  137 *********************************************************************************************************
//  138 */
//  139 
//  140 #if OS_MBOX_DEL_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  141 OS_EVENT  *OSMboxDel (OS_EVENT *pevent, INT8U opt, INT8U *err)
//  142 {
OSMboxDel:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        LDW       S:?w4, X
        LD        S:?b13, A
        LDW       S:?w5, Y
//  143 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  144     OS_CPU_SR  cpu_sr;
//  145 #endif    
//  146     BOOLEAN    tasks_waiting;
//  147 
//  148 
//  149     if (OSIntNesting > 0) {                                /* See if called from ISR ...               */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSMboxDel_0
//  150         *err = OS_ERR_DEL_ISR;                             /* ... can't DELETE from an ISR             */
        LD        A, #0x8c
        LD        [S:?w5.w], A
//  151         return (pevent);
        LDW       X, S:?w4
        JP        L:??OSMboxDel_1
//  152     }
//  153 #if OS_ARG_CHK_EN > 0
//  154     if (pevent == (OS_EVENT *)0) {                         /* Validate 'pevent'                        */
??OSMboxDel_0:
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSMboxDel_2
//  155         *err = OS_ERR_PEVENT_NULL;
        LD        A, #0x4
        LD        [S:?w5.w], A
//  156         return (pevent);
        LDW       X, S:?w4
        JP        L:??OSMboxDel_1
//  157     }
//  158     if (pevent->OSEventType != OS_EVENT_TYPE_MBOX) {       /* Validate event block type                */
??OSMboxDel_2:
        LD        A, [S:?w4.w]
        CP        A, #0x1
        JREQ      L:??OSMboxDel_3
//  159         *err = OS_ERR_EVENT_TYPE;
        LD        A, #0x1
        LD        [S:?w5.w], A
//  160         return (pevent);
        LDW       X, S:?w4
        JP        L:??OSMboxDel_1
//  161     }
//  162 #endif
//  163     OS_ENTER_CRITICAL();
??OSMboxDel_3:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  164     if (pevent->OSEventGrp != 0x00) {                      /* See if any tasks waiting on mailbox      */
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSMboxDel_4
//  165         tasks_waiting = TRUE;                              /* Yes                                      */
        LD        A, #0x1
        LD        S:?b14, A
        JRA       L:??OSMboxDel_5
//  166     } else {
//  167         tasks_waiting = FALSE;                             /* No                                       */
??OSMboxDel_4:
        CLR       A
        LD        S:?b14, A
//  168     }
//  169     switch (opt) {
??OSMboxDel_5:
        LD        A, S:?b13
        TNZ       A
        JREQ      L:??OSMboxDel_6
        DEC       A
        JREQ      L:??OSMboxDel_7
        JRA       L:??OSMboxDel_8
//  170         case OS_DEL_NO_PEND:                               /* Delete mailbox only if no task waiting   */
//  171              if (tasks_waiting == FALSE) {
??OSMboxDel_6:
        TNZ       S:?b14
        JRNE      L:??OSMboxDel_9
//  172                  pevent->OSEventType = OS_EVENT_TYPE_UNUSED;
        CLR       A
        LD        [S:?w4.w], A
//  173                  pevent->OSEventPtr  = OSEventFreeList;    /* Return Event Control Block to free list  */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSEventFreeList
        LDW       (Y), X
//  174                  OSEventFreeList     = pevent;             /* Get next free event control block        */
        LDW       X, S:?w4
        LDW       L:OSEventFreeList, X
//  175                  OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  176                  *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w5.w], A
//  177                  return ((OS_EVENT *)0);                   /* Mailbox has been deleted                 */
        CLRW      X
        JRA       L:??OSMboxDel_1
//  178              } else {
//  179                  OS_EXIT_CRITICAL();
??OSMboxDel_9:
        LD        A, S:?b12
        CALL      L:CriticalExit
//  180                  *err = OS_ERR_TASK_WAITING;
        LD        A, #0x8
        LD        [S:?w5.w], A
//  181                  return (pevent);
        LDW       X, S:?w4
        JRA       L:??OSMboxDel_1
//  182              }
//  183 
//  184         case OS_DEL_ALWAYS:                                /* Always delete the mailbox                */
//  185              while (pevent->OSEventGrp != 0x00) {          /* Ready ALL tasks waiting for mailbox      */
??OSMboxDel_7:
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSMboxDel_10
//  186                  OS_EventTaskRdy(pevent, (void *)0, OS_STAT_MBOX);
        LD        A, #0x2
        CLRW      Y
        LDW       X, S:?w4
        CALL      L:OS_EventTaskRdy
        JRA       L:??OSMboxDel_7
//  187              }
//  188              pevent->OSEventType = OS_EVENT_TYPE_UNUSED;
??OSMboxDel_10:
        CLR       A
        LD        [S:?w4.w], A
//  189              pevent->OSEventPtr  = OSEventFreeList;        /* Return Event Control Block to free list  */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSEventFreeList
        LDW       (Y), X
//  190              OSEventFreeList     = pevent;                 /* Get next free event control block        */
        LDW       X, S:?w4
        LDW       L:OSEventFreeList, X
//  191              OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  192              if (tasks_waiting == TRUE) {                  /* Reschedule only if task(s) were waiting  */
        LD        A, S:?b14
        CP        A, #0x1
        JRNE      L:??OSMboxDel_11
//  193                  OS_Sched();                               /* Find highest priority task ready to run  */
        CALL      L:OS_Sched
//  194              }
//  195              *err = OS_NO_ERR;
??OSMboxDel_11:
        CLR       A
        LD        [S:?w5.w], A
//  196              return ((OS_EVENT *)0);                       /* Mailbox has been deleted                 */
        CLRW      X
        JRA       L:??OSMboxDel_1
//  197 
//  198         default:
//  199              OS_EXIT_CRITICAL();
??OSMboxDel_8:
        LD        A, S:?b12
        CALL      L:CriticalExit
//  200              *err = OS_ERR_INVALID_OPT;
        LD        A, #0x7
        LD        [S:?w5.w], A
//  201              return (pevent);
        LDW       X, S:?w4
??OSMboxDel_1:
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  202     }
//  203 }
//  204 #endif
//  205 
//  206 /*$PAGE*/
//  207 /*
//  208 *********************************************************************************************************
//  209 *                                      PEND ON MAILBOX FOR A MESSAGE
//  210 *
//  211 * Description: This function waits for a message to be sent to a mailbox
//  212 *
//  213 * Arguments  : pevent        is a pointer to the event control block associated with the desired mailbox
//  214 *
//  215 *              timeout       is an optional timeout period (in clock ticks).  If non-zero, your task will
//  216 *                            wait for a message to arrive at the mailbox up to the amount of time
//  217 *                            specified by this argument.  If you specify 0, however, your task will wait
//  218 *                            forever at the specified mailbox or, until a message arrives.
//  219 *
//  220 *              err           is a pointer to where an error message will be deposited.  Possible error
//  221 *                            messages are:
//  222 *
//  223 *                            OS_NO_ERR           The call was successful and your task received a
//  224 *                                                message.
//  225 *                            OS_TIMEOUT          A message was not received within the specified timeout
//  226 *                            OS_ERR_EVENT_TYPE   Invalid event type
//  227 *                            OS_ERR_PEND_ISR     If you called this function from an ISR and the result
//  228 *                                                would lead to a suspension.
//  229 *                            OS_ERR_PEVENT_NULL  If 'pevent' is a NULL pointer
//  230 *
//  231 * Returns    : != (void *)0  is a pointer to the message received
//  232 *              == (void *)0  if no message was received or,
//  233 *                            if 'pevent' is a NULL pointer or,
//  234 *                            if you didn't pass the proper pointer to the event control block.
//  235 *********************************************************************************************************
//  236 */
//  237 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  238 void  *OSMboxPend (OS_EVENT *pevent, INT16U timeout, INT8U *err)
//  239 {
OSMboxPend:
        CALL      L:?push_l2
        CALL      L:?push_w7
        PUSH      S:?b12
        PUSHW     Y
        LDW       S:?w5, X
        CALL      L:?mov_w4_w0
//  240 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  241     OS_CPU_SR  cpu_sr;
//  242 #endif    
//  243     void      *msg;
//  244 
//  245 
//  246     if (OSIntNesting > 0) {                           /* See if called from ISR ...                    */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSMboxPend_0
//  247         *err = OS_ERR_PEND_ISR;                       /* ... can't PEND from an ISR                    */
        LD        A, #0x2
        LD        [S:?w4.w], A
//  248         return ((void *)0);
        CLRW      X
        JP        L:??OSMboxPend_1
//  249     }
//  250 #if OS_ARG_CHK_EN > 0
//  251     if (pevent == (OS_EVENT *)0) {                    /* Validate 'pevent'                             */
??OSMboxPend_0:
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSMboxPend_2
//  252         *err = OS_ERR_PEVENT_NULL;
        LD        A, #0x4
        LD        [S:?w4.w], A
//  253         return ((void *)0);
        CLRW      X
        JP        L:??OSMboxPend_1
//  254     }
//  255     if (pevent->OSEventType != OS_EVENT_TYPE_MBOX) {  /* Validate event block type                     */
??OSMboxPend_2:
        LD        A, [S:?w5.w]
        CP        A, #0x1
        JREQ      L:??OSMboxPend_3
//  256         *err = OS_ERR_EVENT_TYPE;
        LD        A, #0x1
        LD        [S:?w4.w], A
//  257         return ((void *)0);
        CLRW      X
        JP        L:??OSMboxPend_1
//  258     }
//  259 #endif
//  260     OS_ENTER_CRITICAL();
??OSMboxPend_3:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  261     msg = pevent->OSEventPtr;
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w7, X
//  262     if (msg != (void *)0) {                           /* See if there is already a message             */
        LDW       X, S:?w7
        TNZW      X
        JREQ      L:??OSMboxPend_4
//  263         pevent->OSEventPtr = (void *)0;               /* Clear the mailbox                             */
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  264         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  265         *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w4.w], A
//  266         return (msg);                                 /* Return the message received (or NULL)         */
        LDW       X, S:?w7
        JRA       L:??OSMboxPend_1
//  267     }
//  268     OSTCBCur->OSTCBStat |= OS_STAT_MBOX;              /* Message not available, task will pend         */
??OSMboxPend_4:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        LD        A, (X)
        OR        A, #0x2
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        LD        (X), A
//  269     OSTCBCur->OSTCBDly   = timeout;                   /* Load timeout in TCB                           */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x16
        LDW       Y, X
        LDW       X, (0x1,SP)
        LDW       (Y), X
//  270     OS_EventTaskWait(pevent);                         /* Suspend task until event or timeout occurs    */
        LDW       X, S:?w5
        CALL      L:OS_EventTaskWait
//  271     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  272     OS_Sched();                                       /* Find next highest priority task ready to run  */
        CALL      L:OS_Sched
//  273     OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  274     msg = OSTCBCur->OSTCBMsg;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x14
        LDW       X, (X)
        LDW       S:?w7, X
//  275     if (msg != (void *)0) {                           /* See if we were given the message              */
        LDW       X, S:?w7
        TNZW      X
        JREQ      L:??OSMboxPend_5
//  276         OSTCBCur->OSTCBMsg      = (void *)0;          /* Yes, clear message received                   */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x14
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  277         OSTCBCur->OSTCBStat     = OS_STAT_RDY;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        CLR       A
        LD        (X), A
//  278         OSTCBCur->OSTCBEventPtr = (OS_EVENT *)0;      /* No longer waiting for event                   */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x12
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  279         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  280         *err                    = OS_NO_ERR;
        CLR       A
        LD        [S:?w4.w], A
//  281         return (msg);                                 /* Return the message received                   */
        LDW       X, S:?w7
        JRA       L:??OSMboxPend_1
//  282     }
//  283     OS_EventTO(pevent);                               /* Timed out, Make task ready                    */
??OSMboxPend_5:
        LDW       X, S:?w5
        CALL      L:OS_EventTO
//  284     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  285     *err = OS_TIMEOUT;                                /* Indicate that a timeout occured               */
        LD        A, #0xa
        LD        [S:?w4.w], A
//  286     return ((void *)0);                               /* Return a NULL message                         */
        CLRW      X
??OSMboxPend_1:
        ADD       SP, #0x2
        POP       S:?b12
        CALL      L:?pop_w7
        JP        L:?epilogue_l2
//  287 }
//  288 /*$PAGE*/
//  289 /*
//  290 *********************************************************************************************************
//  291 *                                       POST MESSAGE TO A MAILBOX
//  292 *
//  293 * Description: This function sends a message to a mailbox
//  294 *
//  295 * Arguments  : pevent        is a pointer to the event control block associated with the desired mailbox
//  296 *
//  297 *              msg           is a pointer to the message to send.  You MUST NOT send a NULL pointer.
//  298 *
//  299 * Returns    : OS_NO_ERR            The call was successful and the message was sent
//  300 *              OS_MBOX_FULL         If the mailbox already contains a message.  You can can only send one
//  301 *                                   message at a time and thus, the message MUST be consumed before you
//  302 *                                   are allowed to send another one.
//  303 *              OS_ERR_EVENT_TYPE    If you are attempting to post to a non mailbox.
//  304 *              OS_ERR_PEVENT_NULL   If 'pevent' is a NULL pointer
//  305 *              OS_ERR_POST_NULL_PTR If you are attempting to post a NULL pointer
//  306 *********************************************************************************************************
//  307 */
//  308 
//  309 #if OS_MBOX_POST_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  310 INT8U  OSMboxPost (OS_EVENT *pevent, void *msg)
//  311 {
OSMboxPost:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w4, X
        LDW       S:?w5, Y
//  312 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  313     OS_CPU_SR  cpu_sr;
//  314 #endif    
//  315     
//  316     
//  317 #if OS_ARG_CHK_EN > 0
//  318     if (pevent == (OS_EVENT *)0) {                    /* Validate 'pevent'                             */
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSMboxPost_0
//  319         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JRA       L:??OSMboxPost_1
//  320     }
//  321     if (msg == (void *)0) {                           /* Make sure we are not posting a NULL pointer   */
??OSMboxPost_0:
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSMboxPost_2
//  322         return (OS_ERR_POST_NULL_PTR);
        LD        A, #0x3
        JRA       L:??OSMboxPost_1
//  323     }
//  324     if (pevent->OSEventType != OS_EVENT_TYPE_MBOX) {  /* Validate event block type                     */
??OSMboxPost_2:
        LD        A, [S:?w4.w]
        CP        A, #0x1
        JREQ      L:??OSMboxPost_3
//  325         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JRA       L:??OSMboxPost_1
//  326     }
//  327 #endif
//  328     OS_ENTER_CRITICAL();
??OSMboxPost_3:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  329     if (pevent->OSEventGrp != 0x00) {                 /* See if any task pending on mailbox            */
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSMboxPost_4
//  330         OS_EventTaskRdy(pevent, msg, OS_STAT_MBOX);   /* Ready highest priority task waiting on event  */
        LD        A, #0x2
        LDW       Y, S:?w5
        LDW       X, S:?w4
        CALL      L:OS_EventTaskRdy
//  331         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  332         OS_Sched();                                   /* Find highest priority task ready to run       */
        CALL      L:OS_Sched
//  333         return (OS_NO_ERR);
        CLR       A
        JRA       L:??OSMboxPost_1
//  334     }
//  335     if (pevent->OSEventPtr != (void *)0) {            /* Make sure mailbox doesn't already have a msg  */
??OSMboxPost_4:
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       X, (X)
        TNZW      X
        JREQ      L:??OSMboxPost_5
//  336         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  337         return (OS_MBOX_FULL);
        LD        A, #0x14
        JRA       L:??OSMboxPost_1
//  338     }
//  339     pevent->OSEventPtr = msg;                         /* Place message in mailbox                      */
??OSMboxPost_5:
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, S:?w5
        LDW       (Y), X
//  340     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  341     return (OS_NO_ERR);
        CLR       A
??OSMboxPost_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//  342 }
//  343 #endif
//  344 
//  345 /*$PAGE*/
//  346 /*
//  347 *********************************************************************************************************
//  348 *                                       POST MESSAGE TO A MAILBOX
//  349 *
//  350 * Description: This function sends a message to a mailbox
//  351 *
//  352 * Arguments  : pevent        is a pointer to the event control block associated with the desired mailbox
//  353 *
//  354 *              msg           is a pointer to the message to send.  You MUST NOT send a NULL pointer.
//  355 *
//  356 *              opt           determines the type of POST performed:
//  357 *                            OS_POST_OPT_NONE         POST to a single waiting task 
//  358 *                                                     (Identical to OSMboxPost())
//  359 *                            OS_POST_OPT_BROADCAST    POST to ALL tasks that are waiting on the mailbox
//  360 *
//  361 * Returns    : OS_NO_ERR            The call was successful and the message was sent
//  362 *              OS_MBOX_FULL         If the mailbox already contains a message.  You can can only send one
//  363 *                                   message at a time and thus, the message MUST be consumed before you
//  364 *                                   are allowed to send another one.
//  365 *              OS_ERR_EVENT_TYPE    If you are attempting to post to a non mailbox.
//  366 *              OS_ERR_PEVENT_NULL   If 'pevent' is a NULL pointer
//  367 *              OS_ERR_POST_NULL_PTR If you are attempting to post a NULL pointer
//  368 *
//  369 * Warning    : Interrupts can be disabled for a long time if you do a 'broadcast'.  In fact, the 
//  370 *              interrupt disable time is proportional to the number of tasks waiting on the mailbox.
//  371 *********************************************************************************************************
//  372 */
//  373 
//  374 #if OS_MBOX_POST_OPT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  375 INT8U  OSMboxPostOpt (OS_EVENT *pevent, void *msg, INT8U opt)
//  376 {
OSMboxPostOpt:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LDW       S:?w4, X
        LDW       S:?w5, Y
        LD        S:?b12, A
//  377 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  378     OS_CPU_SR  cpu_sr;
//  379 #endif    
//  380     
//  381     
//  382 #if OS_ARG_CHK_EN > 0
//  383     if (pevent == (OS_EVENT *)0) {                    /* Validate 'pevent'                             */
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSMboxPostOpt_0
//  384         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JRA       L:??OSMboxPostOpt_1
//  385     }
//  386     if (msg == (void *)0) {                           /* Make sure we are not posting a NULL pointer   */
??OSMboxPostOpt_0:
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSMboxPostOpt_2
//  387         return (OS_ERR_POST_NULL_PTR);
        LD        A, #0x3
        JRA       L:??OSMboxPostOpt_1
//  388     }
//  389     if (pevent->OSEventType != OS_EVENT_TYPE_MBOX) {  /* Validate event block type                     */
??OSMboxPostOpt_2:
        LD        A, [S:?w4.w]
        CP        A, #0x1
        JREQ      L:??OSMboxPostOpt_3
//  390         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JRA       L:??OSMboxPostOpt_1
//  391     }
//  392 #endif
//  393     OS_ENTER_CRITICAL();
??OSMboxPostOpt_3:
        CALL      L:CriticalEnter
        LD        S:?b13, A
//  394     if (pevent->OSEventGrp != 0x00) {                 /* See if any task pending on mailbox            */
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSMboxPostOpt_4
//  395         if ((opt & OS_POST_OPT_BROADCAST) != 0x00) {  /* Do we need to post msg to ALL waiting tasks ? */
        LD        A, S:?b12
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??OSMboxPostOpt_5
//  396             while (pevent->OSEventGrp != 0x00) {      /* Yes, Post to ALL tasks waiting on mailbox     */           
??OSMboxPostOpt_6:
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSMboxPostOpt_7
//  397                 OS_EventTaskRdy(pevent, msg, OS_STAT_MBOX);    
        LD        A, #0x2
        LDW       Y, S:?w5
        LDW       X, S:?w4
        CALL      L:OS_EventTaskRdy
        JRA       L:??OSMboxPostOpt_6
//  398             }
//  399         } else {
//  400             OS_EventTaskRdy(pevent, msg, OS_STAT_MBOX);    /* No,  Post to HPT waiting on mbox         */
??OSMboxPostOpt_5:
        LD        A, #0x2
        LDW       Y, S:?w5
        LDW       X, S:?w4
        CALL      L:OS_EventTaskRdy
//  401         }
//  402         OS_EXIT_CRITICAL();
??OSMboxPostOpt_7:
        LD        A, S:?b13
        CALL      L:CriticalExit
//  403         OS_Sched();                                        /* Find highest priority task ready to run  */
        CALL      L:OS_Sched
//  404         return (OS_NO_ERR);
        CLR       A
        JRA       L:??OSMboxPostOpt_1
//  405     }
//  406     if (pevent->OSEventPtr != (void *)0) {            /* Make sure mailbox doesn't already have a msg  */
??OSMboxPostOpt_4:
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       X, (X)
        TNZW      X
        JREQ      L:??OSMboxPostOpt_8
//  407         OS_EXIT_CRITICAL();
        LD        A, S:?b13
        CALL      L:CriticalExit
//  408         return (OS_MBOX_FULL);
        LD        A, #0x14
        JRA       L:??OSMboxPostOpt_1
//  409     }
//  410     pevent->OSEventPtr = msg;                         /* Place message in mailbox                      */
??OSMboxPostOpt_8:
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, S:?w5
        LDW       (Y), X
//  411     OS_EXIT_CRITICAL();
        LD        A, S:?b13
        CALL      L:CriticalExit
//  412     return (OS_NO_ERR);
        CLR       A
??OSMboxPostOpt_1:
        JP        L:?epilogue_l2_w6
//  413 }
//  414 #endif
//  415 
//  416 /*$PAGE*/
//  417 /*
//  418 *********************************************************************************************************
//  419 *                                        QUERY A MESSAGE MAILBOX
//  420 *
//  421 * Description: This function obtains information about a message mailbox.
//  422 *
//  423 * Arguments  : pevent        is a pointer to the event control block associated with the desired mailbox
//  424 *
//  425 *              pdata         is a pointer to a structure that will contain information about the message
//  426 *                            mailbox.
//  427 *
//  428 * Returns    : OS_NO_ERR           The call was successful and the message was sent
//  429 *              OS_ERR_EVENT_TYPE   If you are attempting to obtain data from a non mailbox.
//  430 *              OS_ERR_PEVENT_NULL  If 'pevent' is a NULL pointer
//  431 *********************************************************************************************************
//  432 */
//  433 
//  434 #if OS_MBOX_QUERY_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  435 INT8U  OSMboxQuery (OS_EVENT *pevent, OS_MBOX_DATA *pdata)
//  436 {
OSMboxQuery:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0x1
        LDW       S:?w6, X
        LDW       S:?w7, Y
//  437 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  438     OS_CPU_SR  cpu_sr;
//  439 #endif    
//  440     INT8U     *psrc;
//  441     INT8U     *pdest;
//  442 
//  443 
//  444 #if OS_ARG_CHK_EN > 0
//  445     if (pevent == (OS_EVENT *)0) {                         /* Validate 'pevent'                        */
        LDW       X, S:?w6
        TNZW      X
        JRNE      L:??OSMboxQuery_0
//  446         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JP        L:??OSMboxQuery_1
//  447     }
//  448     if (pevent->OSEventType != OS_EVENT_TYPE_MBOX) {       /* Validate event block type                */
??OSMboxQuery_0:
        LD        A, [S:?w6.w]
        CP        A, #0x1
        JREQ      L:??OSMboxQuery_2
//  449         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JP        L:??OSMboxQuery_1
//  450     }
//  451 #endif
//  452     OS_ENTER_CRITICAL();
??OSMboxQuery_2:
        CALL      L:CriticalEnter
        LD        (0x1,SP), A
//  453     pdata->OSEventGrp = pevent->OSEventGrp;                /* Copy message mailbox wait list           */
        LDW       X, S:?w6
        INCW      X
        LD        A, (X)
        LDW       X, S:?w7
        ADDW      X, #0xa
        LD        (X), A
//  454     psrc              = &pevent->OSEventTbl[0];
        LDW       X, S:?w6
        ADDW      X, #0x6
        LDW       S:?w5, X
//  455     pdest             = &pdata->OSEventTbl[0];
        LDW       X, S:?w7
        ADDW      X, #0x2
        LDW       S:?w4, X
//  456 
//  457 #if OS_EVENT_TBL_SIZE > 0
//  458     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  459 #endif
//  460 
//  461 #if OS_EVENT_TBL_SIZE > 1
//  462     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  463 #endif
//  464 
//  465 #if OS_EVENT_TBL_SIZE > 2
//  466     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  467 #endif
//  468 
//  469 #if OS_EVENT_TBL_SIZE > 3
//  470     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  471 #endif
//  472 
//  473 #if OS_EVENT_TBL_SIZE > 4
//  474     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  475 #endif
//  476 
//  477 #if OS_EVENT_TBL_SIZE > 5
//  478     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  479 #endif
//  480 
//  481 #if OS_EVENT_TBL_SIZE > 6
//  482     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  483 #endif
//  484 
//  485 #if OS_EVENT_TBL_SIZE > 7
//  486     *pdest            = *psrc;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
//  487 #endif
//  488     pdata->OSMsg = pevent->OSEventPtr;                     /* Get message from mailbox                 */
        LDW       X, S:?w6
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       [S:?w7.w], X
//  489     OS_EXIT_CRITICAL();
        LD        A, (0x1,SP)
        CALL      L:CriticalExit
//  490     return (OS_NO_ERR);
        CLR       A
??OSMboxQuery_1:
        ADD       SP, #0x1
        JP        L:?epilogue_l2_l3
//  491 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  492 #endif                                                     /* OS_MBOX_QUERY_EN                         */
//  493 #endif                                                     /* OS_MBOX_EN                               */
// 
// 1 085 bytes in section .near_func.text
// 
// 1 085 bytes of CODE memory
//
//Errors: none
//Warnings: 2
