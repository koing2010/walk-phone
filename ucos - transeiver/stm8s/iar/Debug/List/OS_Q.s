///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:53 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\ucos_II\OS_Q.C                               /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\ucos_II\OS_Q.C" -e -On --no_cse --no_unroll  /
//                    --no_inline --no_code_motion --no_tbaa --no_cross_call  /
//                    --debug --code_model small --data_model medium -o       /
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
//                    transeiver\stm8s\iar\Debug\List\OS_Q.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OS_Q

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b12
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?mov_w5_w0
        EXTERN ?pop_w7
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w6
        EXTERN ?push_w7
        EXTERN ?w0
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN OSEventFreeList
        EXTERN OSIntNesting
        EXTERN OSQFreeList
        EXTERN OSQTbl
        EXTERN OSTCBCur
        EXTERN OS_EventTO
        EXTERN OS_EventTaskRdy
        EXTERN OS_EventTaskWait
        EXTERN OS_EventWaitListInit
        EXTERN OS_Sched

        PUBLIC OSQAccept
        PUBLIC OSQCreate
        PUBLIC OSQDel
        PUBLIC OSQFlush
        PUBLIC OSQPend
        PUBLIC OSQPost
        PUBLIC OSQPostFront
        PUBLIC OSQPostOpt
        PUBLIC OSQQuery
        PUBLIC OS_QInit

// E:\RDA1846s\walkphone program\ucos - transeiver\ucos_II\OS_Q.C
//    1 /*
//    2 *********************************************************************************************************
//    3 *                                                uC/OS-II
//    4 *                                          The Real-Time Kernel
//    5 *                                        MESSAGE QUEUE MANAGEMENT
//    6 *
//    7 *                          (c) Copyright 1992-2002, Jean J. Labrosse, Weston, FL
//    8 *                                           All Rights Reserved
//    9 *
//   10 * File : OS_Q.C
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
//   19 #if (OS_Q_EN > 0) && (OS_MAX_QS > 0)
//   20 /*
//   21 *********************************************************************************************************
//   22 *                                      ACCEPT MESSAGE FROM QUEUE
//   23 *
//   24 * Description: This function checks the queue to see if a message is available.  Unlike OSQPend(),
//   25 *              OSQAccept() does not suspend the calling task if a message is not available.
//   26 *
//   27 * Arguments  : pevent        is a pointer to the event control block
//   28 *
//   29 * Returns    : != (void *)0  is the message in the queue if one is available.  The message is removed
//   30 *                            from the so the next time OSQAccept() is called, the queue will contain
//   31 *                            one less entry.
//   32 *              == (void *)0  if the queue is empty or,
//   33 *                            if 'pevent' is a NULL pointer or,
//   34 *                            if you passed an invalid event type
//   35 *********************************************************************************************************
//   36 */
//   37 
//   38 #if OS_Q_ACCEPT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   39 void  *OSQAccept (OS_EVENT *pevent)
//   40 {
OSQAccept:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        LDW       S:?w5, X
//   41 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//   42     OS_CPU_SR  cpu_sr;
//   43 #endif
//   44     void      *msg;
//   45     OS_Q      *pq;
//   46 
//   47 
//   48 #if OS_ARG_CHK_EN > 0
//   49     if (pevent == (OS_EVENT *)0) {               /* Validate 'pevent'                                  */
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSQAccept_0
//   50         return ((void *)0);
        CLRW      X
        JRA       L:??OSQAccept_1
//   51     }
//   52     if (pevent->OSEventType != OS_EVENT_TYPE_Q) {/* Validate event block type                          */
??OSQAccept_0:
        LD        A, [S:?w5.w]
        CP        A, #0x2
        JREQ      L:??OSQAccept_2
//   53         return ((void *)0);
        CLRW      X
        JRA       L:??OSQAccept_1
//   54     }
//   55 #endif
//   56     OS_ENTER_CRITICAL();
??OSQAccept_2:
        CALL      L:CriticalEnter
        LD        S:?b14, A
//   57     pq = (OS_Q *)pevent->OSEventPtr;             /* Point at queue control block                       */
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w4, X
//   58     if (pq->OSQEntries > 0) {                    /* See if any messages in the queue                   */
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       X, (X)
        TNZW      X
        JREQ      L:??OSQAccept_3
//   59         msg = *pq->OSQOut++;                     /* Yes, extract oldest message from the queue         */
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        LDW       X, (X)
        LDW       S:?w6, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        INCW      X
        INCW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//   60         pq->OSQEntries--;                        /* Update the number of entries in the queue          */
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       X, (X)
        DECW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//   61         if (pq->OSQOut == pq->OSQEnd) {          /* Wrap OUT pointer if we are at the end of the queue */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        CPW       X, (Y)
        JRNE      L:??OSQAccept_4
//   62             pq->OSQOut = pq->OSQStart;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
        JRA       L:??OSQAccept_4
//   63         }
//   64     } else {
//   65         msg = (void *)0;                         /* Queue is empty                                     */
??OSQAccept_3:
        CLRW      X
        LDW       S:?w6, X
//   66     }
//   67     OS_EXIT_CRITICAL();
??OSQAccept_4:
        LD        A, S:?b14
        CALL      L:CriticalExit
//   68     return (msg);                                /* Return message received (or NULL)                  */
        LDW       X, S:?w6
??OSQAccept_1:
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//   69 }
//   70 #endif
//   71 /*$PAGE*/
//   72 /*
//   73 *********************************************************************************************************
//   74 *                                        CREATE A MESSAGE QUEUE
//   75 *
//   76 * Description: This function creates a message queue if free event control blocks are available.
//   77 *
//   78 * Arguments  : start         is a pointer to the base address of the message queue storage area.  The
//   79 *                            storage area MUST be declared as an array of pointers to 'void' as follows
//   80 *
//   81 *                            void *MessageStorage[size]
//   82 *
//   83 *              size          is the number of elements in the storage area
//   84 *
//   85 * Returns    : != (OS_EVENT *)0  is a pointer to the event control clock (OS_EVENT) associated with the
//   86 *                                created queue
//   87 *              == (OS_EVENT *)0  if no event control blocks were available or an error was detected
//   88 *********************************************************************************************************
//   89 */
//   90 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   91 OS_EVENT  *OSQCreate (void **start, INT16U size)
//   92 {
OSQCreate:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        PUSHW     Y
        LDW       S:?w6, X
//   93 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//   94     OS_CPU_SR  cpu_sr;
//   95 #endif
//   96     OS_EVENT  *pevent;
//   97     OS_Q      *pq;
//   98 
//   99 
//  100     if (OSIntNesting > 0) {                      /* See if called from ISR ...                         */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSQCreate_0
//  101         return ((OS_EVENT *)0);                  /* ... can't CREATE from an ISR                       */
        CLRW      X
        JP        L:??OSQCreate_1
//  102     }
//  103     OS_ENTER_CRITICAL();
??OSQCreate_0:
        CALL      L:CriticalEnter
        LD        S:?b14, A
//  104     pevent = OSEventFreeList;                    /* Get next free event control block                  */
        LDW       X, L:OSEventFreeList
        LDW       S:?w5, X
//  105     if (OSEventFreeList != (OS_EVENT *)0) {      /* See if pool of free ECB pool was empty             */
        LDW       X, L:OSEventFreeList
        TNZW      X
        JREQ      L:??OSQCreate_2
//  106         OSEventFreeList = (OS_EVENT *)OSEventFreeList->OSEventPtr;
        LDW       X, L:OSEventFreeList
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       L:OSEventFreeList, X
//  107     }
//  108     OS_EXIT_CRITICAL();
??OSQCreate_2:
        LD        A, S:?b14
        CALL      L:CriticalExit
//  109     if (pevent != (OS_EVENT *)0) {               /* See if we have an event control block              */
        LDW       X, S:?w5
        TNZW      X
        JRNE      ??lb_0
        JP        L:??OSQCreate_3
//  110         OS_ENTER_CRITICAL();
??lb_0:
        CALL      L:CriticalEnter
        LD        S:?b14, A
//  111         pq = OSQFreeList;                        /* Get a free queue control block                     */
        LDW       X, L:OSQFreeList
        LDW       S:?w4, X
//  112         if (pq != (OS_Q *)0) {                   /* Were we able to get a queue control block ?        */
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??OSQCreate_4
//  113             OSQFreeList         = OSQFreeList->OSQPtr;    /* Yes, Adjust free list pointer to next free*/
        LDW       X, [L:OSQFreeList.w]
        LDW       L:OSQFreeList, X
//  114             OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  115             pq->OSQStart        = start;                  /*      Initialize the queue                 */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       Y, X
        LDW       X, S:?w6
        LDW       (Y), X
//  116             pq->OSQEnd          = &start[size];
        LDW       X, (0x1,SP)
        SLLW      X
        ADDW      X, S:?w6
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  117             pq->OSQIn           = start;
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       Y, X
        LDW       X, S:?w6
        LDW       (Y), X
//  118             pq->OSQOut          = start;
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       Y, X
        LDW       X, S:?w6
        LDW       (Y), X
//  119             pq->OSQSize         = size;
        LDW       X, S:?w4
        ADDW      X, #0xa
        LDW       Y, X
        LDW       X, (0x1,SP)
        LDW       (Y), X
//  120             pq->OSQEntries      = 0;
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  121             pevent->OSEventType = OS_EVENT_TYPE_Q;
        LD        A, #0x2
        LD        [S:?w5.w], A
//  122             pevent->OSEventCnt  = 0;
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  123             pevent->OSEventPtr  = pq;
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, S:?w4
        LDW       (Y), X
//  124             OS_EventWaitListInit(pevent);                 /*      Initalize the wait list              */
        LDW       X, S:?w5
        CALL      L:OS_EventWaitListInit
        JRA       L:??OSQCreate_3
//  125         } else {
//  126             pevent->OSEventPtr = (void *)OSEventFreeList; /* No,  Return event control block on error  */
??OSQCreate_4:
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSEventFreeList
        LDW       (Y), X
//  127             OSEventFreeList    = pevent;
        LDW       X, S:?w5
        LDW       L:OSEventFreeList, X
//  128             OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  129             pevent = (OS_EVENT *)0;
        CLRW      X
        LDW       S:?w5, X
//  130         }
//  131     }
//  132     return (pevent);
??OSQCreate_3:
        LDW       X, S:?w5
??OSQCreate_1:
        ADD       SP, #0x2
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  133 }
//  134 /*$PAGE*/
//  135 /*
//  136 *********************************************************************************************************
//  137 *                                        DELETE A MESSAGE QUEUE
//  138 *
//  139 * Description: This function deletes a message queue and readies all tasks pending on the queue.
//  140 *
//  141 * Arguments  : pevent        is a pointer to the event control block associated with the desired
//  142 *                            queue.
//  143 *
//  144 *              opt           determines delete options as follows:
//  145 *                            opt == OS_DEL_NO_PEND   Delete the queue ONLY if no task pending
//  146 *                            opt == OS_DEL_ALWAYS    Deletes the queue even if tasks are waiting.
//  147 *                                                    In this case, all the tasks pending will be readied.
//  148 *
//  149 *              err           is a pointer to an error code that can contain one of the following values:
//  150 *                            OS_NO_ERR               The call was successful and the queue was deleted
//  151 *                            OS_ERR_DEL_ISR          If you tried to delete the queue from an ISR
//  152 *                            OS_ERR_INVALID_OPT      An invalid option was specified
//  153 *                            OS_ERR_TASK_WAITING     One or more tasks were waiting on the queue
//  154 *                            OS_ERR_EVENT_TYPE       If you didn't pass a pointer to a queue
//  155 *                            OS_ERR_PEVENT_NULL      If 'pevent' is a NULL pointer.
//  156 *
//  157 * Returns    : pevent        upon error
//  158 *              (OS_EVENT *)0 if the queue was successfully deleted.
//  159 *
//  160 * Note(s)    : 1) This function must be used with care.  Tasks that would normally expect the presence of
//  161 *                 the queue MUST check the return code of OSQPend().
//  162 *              2) OSQAccept() callers will not know that the intended queue has been deleted unless
//  163 *                 they check 'pevent' to see that it's a NULL pointer.
//  164 *              3) This call can potentially disable interrupts for a long time.  The interrupt disable
//  165 *                 time is directly proportional to the number of tasks waiting on the queue.
//  166 *              4) Because ALL tasks pending on the queue will be readied, you MUST be careful in
//  167 *                 applications where the queue is used for mutual exclusion because the resource(s)
//  168 *                 will no longer be guarded by the queue.
//  169 *              5) If the storage for the message queue was allocated dynamically (i.e. using a malloc()
//  170 *                 type call) then your application MUST release the memory storage by call the counterpart
//  171 *                 call of the dynamic allocation scheme used.  If the queue storage was created statically
//  172 *                 then, the storage can be reused.
//  173 *********************************************************************************************************
//  174 */
//  175 
//  176 #if OS_Q_DEL_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  177 OS_EVENT  *OSQDel (OS_EVENT *pevent, INT8U opt, INT8U *err)
//  178 {
OSQDel:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0x1
        LDW       S:?w4, X
        LD        S:?b15, A
        LDW       S:?w5, Y
//  179 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  180     OS_CPU_SR  cpu_sr;
//  181 #endif
//  182     BOOLEAN    tasks_waiting;
//  183     OS_Q      *pq;
//  184 
//  185 
//  186     if (OSIntNesting > 0) {                                /* See if called from ISR ...               */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSQDel_0
//  187         *err = OS_ERR_DEL_ISR;                             /* ... can't DELETE from an ISR             */
        LD        A, #0x8c
        LD        [S:?w5.w], A
//  188         return ((OS_EVENT *)0);
        CLRW      X
        JP        L:??OSQDel_1
//  189     }
//  190 #if OS_ARG_CHK_EN > 0
//  191     if (pevent == (OS_EVENT *)0) {                         /* Validate 'pevent'                        */
??OSQDel_0:
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSQDel_2
//  192         *err = OS_ERR_PEVENT_NULL;
        LD        A, #0x4
        LD        [S:?w5.w], A
//  193         return (pevent);
        LDW       X, S:?w4
        JP        L:??OSQDel_1
//  194     }
//  195     if (pevent->OSEventType != OS_EVENT_TYPE_Q) {          /* Validate event block type                */
??OSQDel_2:
        LD        A, [S:?w4.w]
        CP        A, #0x2
        JREQ      L:??OSQDel_3
//  196         *err = OS_ERR_EVENT_TYPE;
        LD        A, #0x1
        LD        [S:?w5.w], A
//  197         return (pevent);
        LDW       X, S:?w4
        JP        L:??OSQDel_1
//  198     }
//  199 #endif
//  200     OS_ENTER_CRITICAL();
??OSQDel_3:
        CALL      L:CriticalEnter
        LD        S:?b14, A
//  201     if (pevent->OSEventGrp != 0x00) {                      /* See if any tasks waiting on queue        */
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSQDel_4
//  202         tasks_waiting = TRUE;                              /* Yes                                      */
        LD        A, #0x1
        LD        (0x1,SP), A
        JRA       L:??OSQDel_5
//  203     } else {
//  204         tasks_waiting = FALSE;                             /* No                                       */
??OSQDel_4:
        CLR       A
        LD        (0x1,SP), A
//  205     }
//  206     switch (opt) {
??OSQDel_5:
        LD        A, S:?b15
        TNZ       A
        JREQ      L:??OSQDel_6
        DEC       A
        JREQ      L:??OSQDel_7
        JP        L:??OSQDel_8
//  207         case OS_DEL_NO_PEND:                               /* Delete queue only if no task waiting     */
//  208              if (tasks_waiting == FALSE) {
??OSQDel_6:
        TNZ       (0x1,SP)
        JRNE      L:??OSQDel_9
//  209                  pq                  = (OS_Q *)pevent->OSEventPtr;  /* Return OS_Q to free list        */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w6, X
//  210                  pq->OSQPtr          = OSQFreeList;
        LDW       X, L:OSQFreeList
        LDW       [S:?w6.w], X
//  211                  OSQFreeList         = pq;
        LDW       X, S:?w6
        LDW       L:OSQFreeList, X
//  212                  pevent->OSEventType = OS_EVENT_TYPE_UNUSED;
        CLR       A
        LD        [S:?w4.w], A
//  213                  pevent->OSEventPtr  = OSEventFreeList;    /* Return Event Control Block to free list  */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSEventFreeList
        LDW       (Y), X
//  214                  OSEventFreeList     = pevent;             /* Get next free event control block        */
        LDW       X, S:?w4
        LDW       L:OSEventFreeList, X
//  215                  OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  216                  *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w5.w], A
//  217                  return ((OS_EVENT *)0);                   /* Queue has been deleted                   */
        CLRW      X
        JRA       L:??OSQDel_1
//  218              } else {
//  219                  OS_EXIT_CRITICAL();
??OSQDel_9:
        LD        A, S:?b14
        CALL      L:CriticalExit
//  220                  *err = OS_ERR_TASK_WAITING;
        LD        A, #0x8
        LD        [S:?w5.w], A
//  221                  return (pevent);
        LDW       X, S:?w4
        JRA       L:??OSQDel_1
//  222              }
//  223 
//  224         case OS_DEL_ALWAYS:                                /* Always delete the queue                  */
//  225              while (pevent->OSEventGrp != 0x00) {          /* Ready ALL tasks waiting for queue        */
??OSQDel_7:
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSQDel_10
//  226                  OS_EventTaskRdy(pevent, (void *)0, OS_STAT_Q);
        LD        A, #0x4
        CLRW      Y
        LDW       X, S:?w4
        CALL      L:OS_EventTaskRdy
        JRA       L:??OSQDel_7
//  227              }
//  228              pq                  = (OS_Q *)pevent->OSEventPtr;      /* Return OS_Q to free list        */
??OSQDel_10:
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w6, X
//  229              pq->OSQPtr          = OSQFreeList;
        LDW       X, L:OSQFreeList
        LDW       [S:?w6.w], X
//  230              OSQFreeList         = pq;
        LDW       X, S:?w6
        LDW       L:OSQFreeList, X
//  231              pevent->OSEventType = OS_EVENT_TYPE_UNUSED;
        CLR       A
        LD        [S:?w4.w], A
//  232              pevent->OSEventPtr  = OSEventFreeList;        /* Return Event Control Block to free list  */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSEventFreeList
        LDW       (Y), X
//  233              OSEventFreeList     = pevent;                 /* Get next free event control block        */
        LDW       X, S:?w4
        LDW       L:OSEventFreeList, X
//  234              OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  235              if (tasks_waiting == TRUE) {                  /* Reschedule only if task(s) were waiting  */
        LD        A, (0x1,SP)
        CP        A, #0x1
        JRNE      L:??OSQDel_11
//  236                  OS_Sched();                               /* Find highest priority task ready to run  */
        CALL      L:OS_Sched
//  237              }
//  238              *err = OS_NO_ERR;
??OSQDel_11:
        CLR       A
        LD        [S:?w5.w], A
//  239              return ((OS_EVENT *)0);                       /* Queue has been deleted                   */
        CLRW      X
        JRA       L:??OSQDel_1
//  240 
//  241         default:
//  242              OS_EXIT_CRITICAL();
??OSQDel_8:
        LD        A, S:?b14
        CALL      L:CriticalExit
//  243              *err = OS_ERR_INVALID_OPT;
        LD        A, #0x7
        LD        [S:?w5.w], A
//  244              return (pevent);
        LDW       X, S:?w4
??OSQDel_1:
        ADD       SP, #0x1
        JP        L:?epilogue_l2_l3
//  245     }
//  246 }
//  247 #endif
//  248 
//  249 /*$PAGE*/
//  250 /*
//  251 *********************************************************************************************************
//  252 *                                           FLUSH QUEUE
//  253 *
//  254 * Description : This function is used to flush the contents of the message queue.
//  255 *
//  256 * Arguments   : none
//  257 *
//  258 * Returns     : OS_NO_ERR           upon success
//  259 *               OS_ERR_EVENT_TYPE   If you didn't pass a pointer to a queue
//  260 *               OS_ERR_PEVENT_NULL  If 'pevent' is a NULL pointer
//  261 *********************************************************************************************************
//  262 */
//  263 
//  264 #if OS_Q_FLUSH_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  265 INT8U  OSQFlush (OS_EVENT *pevent)
//  266 {
OSQFlush:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w5, X
//  267 #if OS_CRITICAL_METHOD == 3                           /* Allocate storage for CPU status register      */
//  268     OS_CPU_SR  cpu_sr;
//  269 #endif
//  270     OS_Q      *pq;
//  271 
//  272 
//  273 #if OS_ARG_CHK_EN > 0
//  274     if (pevent == (OS_EVENT *)0) {                    /* Validate 'pevent'                             */
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSQFlush_0
//  275         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JRA       L:??OSQFlush_1
//  276     }
//  277     if (pevent->OSEventType != OS_EVENT_TYPE_Q) {     /* Validate event block type                     */
??OSQFlush_0:
        LD        A, [S:?w5.w]
        CP        A, #0x2
        JREQ      L:??OSQFlush_2
//  278         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JRA       L:??OSQFlush_1
//  279     }
//  280 #endif
//  281     OS_ENTER_CRITICAL();
??OSQFlush_2:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  282     pq             = (OS_Q *)pevent->OSEventPtr;      /* Point to queue storage structure              */
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w4, X
//  283     pq->OSQIn      = pq->OSQStart;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  284     pq->OSQOut     = pq->OSQStart;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  285     pq->OSQEntries = 0;
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  286     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  287     return (OS_NO_ERR);
        CLR       A
??OSQFlush_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//  288 }
//  289 #endif
//  290 
//  291 /*$PAGE*/
//  292 /*
//  293 *********************************************************************************************************
//  294 *                                     PEND ON A QUEUE FOR A MESSAGE
//  295 *
//  296 * Description: This function waits for a message to be sent to a queue
//  297 *
//  298 * Arguments  : pevent        is a pointer to the event control block associated with the desired queue
//  299 *
//  300 *              timeout       is an optional timeout period (in clock ticks).  If non-zero, your task will
//  301 *                            wait for a message to arrive at the queue up to the amount of time
//  302 *                            specified by this argument.  If you specify 0, however, your task will wait
//  303 *                            forever at the specified queue or, until a message arrives.
//  304 *
//  305 *              err           is a pointer to where an error message will be deposited.  Possible error
//  306 *                            messages are:
//  307 *
//  308 *                            OS_NO_ERR           The call was successful and your task received a
//  309 *                                                message.
//  310 *                            OS_TIMEOUT          A message was not received within the specified timeout
//  311 *                            OS_ERR_EVENT_TYPE   You didn't pass a pointer to a queue
//  312 *                            OS_ERR_PEVENT_NULL  If 'pevent' is a NULL pointer
//  313 *                            OS_ERR_PEND_ISR     If you called this function from an ISR and the result
//  314 *                                                would lead to a suspension.
//  315 *
//  316 * Returns    : != (void *)0  is a pointer to the message received
//  317 *              == (void *)0  if no message was received or,
//  318 *                            if 'pevent' is a NULL pointer or,
//  319 *                            if you didn't pass a pointer to a queue.
//  320 *********************************************************************************************************
//  321 */
//  322 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  323 void  *OSQPend (OS_EVENT *pevent, INT16U timeout, INT8U *err)
//  324 {
OSQPend:
        CALL      L:?push_l2
        CALL      L:?push_w7
        PUSH      S:?b12
        PUSHW     Y
        SUB       SP, #0x2
        LDW       S:?w7, X
        CALL      L:?mov_w5_w0
//  325 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  326     OS_CPU_SR  cpu_sr;
//  327 #endif
//  328     void      *msg;
//  329     OS_Q      *pq;
//  330 
//  331 
//  332     if (OSIntNesting > 0) {                      /* See if called from ISR ...                         */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSQPend_0
//  333         *err = OS_ERR_PEND_ISR;                  /* ... can't PEND from an ISR                         */
        LD        A, #0x2
        LD        [S:?w5.w], A
//  334         return ((void *)0);
        CLRW      X
        JP        L:??OSQPend_1
//  335     }
//  336 #if OS_ARG_CHK_EN > 0
//  337     if (pevent == (OS_EVENT *)0) {               /* Validate 'pevent'                                  */
??OSQPend_0:
        LDW       X, S:?w7
        TNZW      X
        JRNE      L:??OSQPend_2
//  338         *err = OS_ERR_PEVENT_NULL;
        LD        A, #0x4
        LD        [S:?w5.w], A
//  339         return ((void *)0);
        CLRW      X
        JP        L:??OSQPend_1
//  340     }
//  341     if (pevent->OSEventType != OS_EVENT_TYPE_Q) {/* Validate event block type                          */
??OSQPend_2:
        LD        A, [S:?w7.w]
        CP        A, #0x2
        JREQ      L:??OSQPend_3
//  342         *err = OS_ERR_EVENT_TYPE;
        LD        A, #0x1
        LD        [S:?w5.w], A
//  343         return ((void *)0);
        CLRW      X
        JP        L:??OSQPend_1
//  344     }
//  345 #endif
//  346     OS_ENTER_CRITICAL();
??OSQPend_3:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  347     pq = (OS_Q *)pevent->OSEventPtr;             /* Point at queue control block                       */
        LDW       X, S:?w7
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w4, X
//  348     if (pq->OSQEntries > 0) {                    /* See if any messages in the queue                   */
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       X, (X)
        TNZW      X
        JREQ      L:??OSQPend_4
//  349         msg = *pq->OSQOut++;                     /* Yes, extract oldest message from the queue         */
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        LDW       X, (X)
        LDW       (0x1,SP), X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        INCW      X
        INCW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  350         pq->OSQEntries--;                        /* Update the number of entries in the queue          */
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       X, (X)
        DECW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  351         if (pq->OSQOut == pq->OSQEnd) {          /* Wrap OUT pointer if we are at the end of the queue */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        CPW       X, (Y)
        JRNE      L:??OSQPend_5
//  352             pq->OSQOut = pq->OSQStart;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  353         }
//  354         OS_EXIT_CRITICAL();
??OSQPend_5:
        LD        A, S:?b12
        CALL      L:CriticalExit
//  355         *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w5.w], A
//  356         return (msg);                            /* Return message received                            */
        LDW       X, (0x1,SP)
        JRA       L:??OSQPend_1
//  357     }
//  358     OSTCBCur->OSTCBStat |= OS_STAT_Q;            /* Task will have to pend for a message to be posted  */
??OSQPend_4:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        LD        A, (X)
        OR        A, #0x4
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        LD        (X), A
//  359     OSTCBCur->OSTCBDly   = timeout;              /* Load timeout into TCB                              */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x16
        LDW       Y, X
        LDW       X, (0x3,SP)
        LDW       (Y), X
//  360     OS_EventTaskWait(pevent);                    /* Suspend task until event or timeout occurs         */
        LDW       X, S:?w7
        CALL      L:OS_EventTaskWait
//  361     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  362     OS_Sched();                                  /* Find next highest priority task ready to run       */
        CALL      L:OS_Sched
//  363     OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  364     msg = OSTCBCur->OSTCBMsg;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x14
        LDW       X, (X)
        LDW       (0x1,SP), X
//  365     if (msg != (void *)0) {                      /* Did we get a message?                              */
        LDW       X, (0x1,SP)
        TNZW      X
        JREQ      L:??OSQPend_6
//  366         OSTCBCur->OSTCBMsg      = (void *)0;     /* Extract message from TCB (Put there by QPost)      */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x14
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  367         OSTCBCur->OSTCBStat     = OS_STAT_RDY;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        CLR       A
        LD        (X), A
//  368         OSTCBCur->OSTCBEventPtr = (OS_EVENT *)0; /* No longer waiting for event                        */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x12
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  369         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  370         *err                    = OS_NO_ERR;
        CLR       A
        LD        [S:?w5.w], A
//  371         return (msg);                            /* Return message received                            */
        LDW       X, (0x1,SP)
        JRA       L:??OSQPend_1
//  372     }
//  373     OS_EventTO(pevent);                          /* Timed out                                          */
??OSQPend_6:
        LDW       X, S:?w7
        CALL      L:OS_EventTO
//  374     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  375     *err = OS_TIMEOUT;                           /* Indicate a timeout occured                         */
        LD        A, #0xa
        LD        [S:?w5.w], A
//  376     return ((void *)0);                          /* No message received                                */
        CLRW      X
??OSQPend_1:
        ADD       SP, #0x4
        POP       S:?b12
        CALL      L:?pop_w7
        JP        L:?epilogue_l2
//  377 }
//  378 /*$PAGE*/
//  379 /*
//  380 *********************************************************************************************************
//  381 *                                        POST MESSAGE TO A QUEUE
//  382 *
//  383 * Description: This function sends a message to a queue
//  384 *
//  385 * Arguments  : pevent        is a pointer to the event control block associated with the desired queue
//  386 *
//  387 *              msg           is a pointer to the message to send.  You MUST NOT send a NULL pointer.
//  388 *
//  389 * Returns    : OS_NO_ERR             The call was successful and the message was sent
//  390 *              OS_Q_FULL             If the queue cannot accept any more messages because it is full.
//  391 *              OS_ERR_EVENT_TYPE     If you didn't pass a pointer to a queue.
//  392 *              OS_ERR_PEVENT_NULL    If 'pevent' is a NULL pointer
//  393 *              OS_ERR_POST_NULL_PTR  If you are attempting to post a NULL pointer
//  394 *********************************************************************************************************
//  395 */
//  396 
//  397 #if OS_Q_POST_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  398 INT8U  OSQPost (OS_EVENT *pevent, void *msg)
//  399 {
OSQPost:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        LDW       S:?w5, X
        LDW       S:?w6, Y
//  400 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  401     OS_CPU_SR  cpu_sr;
//  402 #endif
//  403     OS_Q      *pq;
//  404 
//  405 
//  406 #if OS_ARG_CHK_EN > 0
//  407     if (pevent == (OS_EVENT *)0) {                    /* Validate 'pevent'                             */
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSQPost_0
//  408         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JP        L:??OSQPost_1
//  409     }
//  410     if (msg == (void *)0) {                           /* Make sure we are not posting a NULL pointer   */
??OSQPost_0:
        LDW       X, S:?w6
        TNZW      X
        JRNE      L:??OSQPost_2
//  411         return (OS_ERR_POST_NULL_PTR);
        LD        A, #0x3
        JP        L:??OSQPost_1
//  412     }
//  413     if (pevent->OSEventType != OS_EVENT_TYPE_Q) {     /* Validate event block type                     */
??OSQPost_2:
        LD        A, [S:?w5.w]
        CP        A, #0x2
        JREQ      L:??OSQPost_3
//  414         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JP        L:??OSQPost_1
//  415     }
//  416 #endif
//  417     OS_ENTER_CRITICAL();
??OSQPost_3:
        CALL      L:CriticalEnter
        LD        S:?b14, A
//  418     if (pevent->OSEventGrp != 0x00) {                 /* See if any task pending on queue              */
        LDW       X, S:?w5
        INCW      X
        TNZ       (X)
        JREQ      L:??OSQPost_4
//  419         OS_EventTaskRdy(pevent, msg, OS_STAT_Q);      /* Ready highest priority task waiting on event  */
        LD        A, #0x4
        LDW       Y, S:?w6
        LDW       X, S:?w5
        CALL      L:OS_EventTaskRdy
//  420         OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  421         OS_Sched();                                   /* Find highest priority task ready to run       */
        CALL      L:OS_Sched
//  422         return (OS_NO_ERR);
        CLR       A
        JRA       L:??OSQPost_1
//  423     }
//  424     pq = (OS_Q *)pevent->OSEventPtr;                  /* Point to queue control block                  */
??OSQPost_4:
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w4, X
//  425     if (pq->OSQEntries >= pq->OSQSize) {              /* Make sure queue is not full                   */
        LDW       X, S:?w4
        ADDW      X, #0xa
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       X, (X)
        CPW       X, (Y)
        JRC       L:??OSQPost_5
//  426         OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  427         return (OS_Q_FULL);
        LD        A, #0x1e
        JRA       L:??OSQPost_1
//  428     }
//  429     *pq->OSQIn++ = msg;                               /* Insert message into queue                     */
??OSQPost_5:
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w6
        LDW       (Y), X
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       X, (X)
        INCW      X
        INCW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  430     pq->OSQEntries++;                                 /* Update the nbr of entries in the queue        */
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       X, (X)
        INCW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  431     if (pq->OSQIn == pq->OSQEnd) {                    /* Wrap IN ptr if we are at end of queue         */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       X, (X)
        CPW       X, (Y)
        JRNE      L:??OSQPost_6
//  432         pq->OSQIn = pq->OSQStart;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  433     }
//  434     OS_EXIT_CRITICAL();
??OSQPost_6:
        LD        A, S:?b14
        CALL      L:CriticalExit
//  435     return (OS_NO_ERR);
        CLR       A
??OSQPost_1:
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  436 }
//  437 #endif
//  438 /*$PAGE*/
//  439 /*
//  440 *********************************************************************************************************
//  441 *                                   POST MESSAGE TO THE FRONT OF A QUEUE
//  442 *
//  443 * Description: This function sends a message to a queue but unlike OSQPost(), the message is posted at
//  444 *              the front instead of the end of the queue.  Using OSQPostFront() allows you to send
//  445 *              'priority' messages.
//  446 *
//  447 * Arguments  : pevent        is a pointer to the event control block associated with the desired queue
//  448 *
//  449 *              msg           is a pointer to the message to send.  You MUST NOT send a NULL pointer.
//  450 *
//  451 * Returns    : OS_NO_ERR             The call was successful and the message was sent
//  452 *              OS_Q_FULL             If the queue cannot accept any more messages because it is full.
//  453 *              OS_ERR_EVENT_TYPE     If you didn't pass a pointer to a queue.
//  454 *              OS_ERR_PEVENT_NULL    If 'pevent' is a NULL pointer
//  455 *              OS_ERR_POST_NULL_PTR  If you are attempting to post to a non queue.
//  456 *********************************************************************************************************
//  457 */
//  458 
//  459 #if OS_Q_POST_FRONT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  460 INT8U  OSQPostFront (OS_EVENT *pevent, void *msg)
//  461 {
OSQPostFront:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        LDW       S:?w5, X
        LDW       S:?w6, Y
//  462 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  463     OS_CPU_SR  cpu_sr;
//  464 #endif
//  465     OS_Q      *pq;
//  466 
//  467 
//  468 #if OS_ARG_CHK_EN > 0
//  469     if (pevent == (OS_EVENT *)0) {                    /* Validate 'pevent'                             */
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSQPostFront_0
//  470         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JP        L:??OSQPostFront_1
//  471     }
//  472     if (msg == (void *)0) {                           /* Make sure we are not posting a NULL pointer   */
??OSQPostFront_0:
        LDW       X, S:?w6
        TNZW      X
        JRNE      L:??OSQPostFront_2
//  473         return (OS_ERR_POST_NULL_PTR);
        LD        A, #0x3
        JP        L:??OSQPostFront_1
//  474     }
//  475     if (pevent->OSEventType != OS_EVENT_TYPE_Q) {     /* Validate event block type                     */
??OSQPostFront_2:
        LD        A, [S:?w5.w]
        CP        A, #0x2
        JREQ      L:??OSQPostFront_3
//  476         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JP        L:??OSQPostFront_1
//  477     }
//  478 #endif
//  479     OS_ENTER_CRITICAL();
??OSQPostFront_3:
        CALL      L:CriticalEnter
        LD        S:?b14, A
//  480     if (pevent->OSEventGrp != 0x00) {                 /* See if any task pending on queue              */
        LDW       X, S:?w5
        INCW      X
        TNZ       (X)
        JREQ      L:??OSQPostFront_4
//  481         OS_EventTaskRdy(pevent, msg, OS_STAT_Q);      /* Ready highest priority task waiting on event  */
        LD        A, #0x4
        LDW       Y, S:?w6
        LDW       X, S:?w5
        CALL      L:OS_EventTaskRdy
//  482         OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  483         OS_Sched();                                   /* Find highest priority task ready to run       */
        CALL      L:OS_Sched
//  484         return (OS_NO_ERR);
        CLR       A
        JRA       L:??OSQPostFront_1
//  485     }
//  486     pq = (OS_Q *)pevent->OSEventPtr;                  /* Point to queue control block                  */
??OSQPostFront_4:
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w4, X
//  487     if (pq->OSQEntries >= pq->OSQSize) {              /* Make sure queue is not full                   */
        LDW       X, S:?w4
        ADDW      X, #0xa
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       X, (X)
        CPW       X, (Y)
        JRC       L:??OSQPostFront_5
//  488         OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  489         return (OS_Q_FULL);
        LD        A, #0x1e
        JRA       L:??OSQPostFront_1
//  490     }
//  491     if (pq->OSQOut == pq->OSQStart) {                 /* Wrap OUT ptr if we are at the 1st queue entry */
??OSQPostFront_5:
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        CPW       X, (Y)
        JRNE      L:??OSQPostFront_6
//  492         pq->OSQOut = pq->OSQEnd;
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  493     }
//  494     pq->OSQOut--;
??OSQPostFront_6:
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        DECW      X
        DECW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  495     *pq->OSQOut = msg;                                /* Insert message into queue                     */
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w6
        LDW       (Y), X
//  496     pq->OSQEntries++;                                 /* Update the nbr of entries in the queue        */
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       X, (X)
        INCW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  497     OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  498     return (OS_NO_ERR);
        CLR       A
??OSQPostFront_1:
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  499 }
//  500 #endif
//  501 /*$PAGE*/
//  502 /*
//  503 *********************************************************************************************************
//  504 *                                        POST MESSAGE TO A QUEUE
//  505 *
//  506 * Description: This function sends a message to a queue.  This call has been added to reduce code size
//  507 *              since it can replace both OSQPost() and OSQPostFront().  Also, this function adds the
//  508 *              capability to broadcast a message to ALL tasks waiting on the message queue.
//  509 *
//  510 * Arguments  : pevent        is a pointer to the event control block associated with the desired queue
//  511 *
//  512 *              msg           is a pointer to the message to send.  You MUST NOT send a NULL pointer.
//  513 *
//  514 *              opt           determines the type of POST performed:
//  515 *                            OS_POST_OPT_NONE         POST to a single waiting task
//  516 *                                                     (Identical to OSQPost())
//  517 *                            OS_POST_OPT_BROADCAST    POST to ALL tasks that are waiting on the queue
//  518 *                            OS_POST_OPT_FRONT        POST as LIFO (Simulates OSQPostFront())
//  519 *
//  520 *                            Below is a list of ALL the possible combination of these flags:
//  521 *
//  522 *                                 1) OS_POST_OPT_NONE
//  523 *                                    identical to OSQPost()
//  524 *
//  525 *                                 2) OS_POST_OPT_FRONT
//  526 *                                    identical to OSQPostFront()
//  527 *
//  528 *                                 3) OS_POST_OPT_BROADCAST
//  529 *                                    identical to OSQPost() but will broadcast 'msg' to ALL waiting tasks
//  530 *
//  531 *                                 4) OS_POST_OPT_FRONT + OS_POST_OPT_BROADCAST  is identical to
//  532 *                                    OSQPostFront() except that will broadcast 'msg' to ALL waiting tasks
//  533 *
//  534 * Returns    : OS_NO_ERR             The call was successful and the message was sent
//  535 *              OS_Q_FULL             If the queue cannot accept any more messages because it is full.
//  536 *              OS_ERR_EVENT_TYPE     If you didn't pass a pointer to a queue.
//  537 *              OS_ERR_PEVENT_NULL    If 'pevent' is a NULL pointer
//  538 *              OS_ERR_POST_NULL_PTR  If you are attempting to post a NULL pointer
//  539 *
//  540 * Warning    : Interrupts can be disabled for a long time if you do a 'broadcast'.  In fact, the
//  541 *              interrupt disable time is proportional to the number of tasks waiting on the queue.
//  542 *********************************************************************************************************
//  543 */
//  544 
//  545 #if OS_Q_POST_OPT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  546 INT8U  OSQPostOpt (OS_EVENT *pevent, void *msg, INT8U opt)
//  547 {
OSQPostOpt:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LDW       S:?w5, X
        LDW       S:?w6, Y
        LD        S:?b14, A
//  548 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  549     OS_CPU_SR  cpu_sr;
//  550 #endif
//  551     OS_Q      *pq;
//  552 
//  553 
//  554 #if OS_ARG_CHK_EN > 0
//  555     if (pevent == (OS_EVENT *)0) {                    /* Validate 'pevent'                             */
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSQPostOpt_0
//  556         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JP        L:??OSQPostOpt_1
//  557     }
//  558     if (msg == (void *)0) {                           /* Make sure we are not posting a NULL pointer   */
??OSQPostOpt_0:
        LDW       X, S:?w6
        TNZW      X
        JRNE      L:??OSQPostOpt_2
//  559         return (OS_ERR_POST_NULL_PTR);
        LD        A, #0x3
        JP        L:??OSQPostOpt_1
//  560     }
//  561     if (pevent->OSEventType != OS_EVENT_TYPE_Q) {     /* Validate event block type                     */
??OSQPostOpt_2:
        LD        A, [S:?w5.w]
        CP        A, #0x2
        JREQ      L:??OSQPostOpt_3
//  562         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JP        L:??OSQPostOpt_1
//  563     }
//  564 #endif
//  565     OS_ENTER_CRITICAL();
??OSQPostOpt_3:
        CALL      L:CriticalEnter
        LD        S:?b15, A
//  566     if (pevent->OSEventGrp != 0x00) {                 /* See if any task pending on queue              */
        LDW       X, S:?w5
        INCW      X
        TNZ       (X)
        JREQ      L:??OSQPostOpt_4
//  567         if ((opt & OS_POST_OPT_BROADCAST) != 0x00) {  /* Do we need to post msg to ALL waiting tasks ? */
        LD        A, S:?b14
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??OSQPostOpt_5
//  568             while (pevent->OSEventGrp != 0x00) {      /* Yes, Post to ALL tasks waiting on queue       */
??OSQPostOpt_6:
        LDW       X, S:?w5
        INCW      X
        TNZ       (X)
        JREQ      L:??OSQPostOpt_7
//  569                 OS_EventTaskRdy(pevent, msg, OS_STAT_Q);
        LD        A, #0x4
        LDW       Y, S:?w6
        LDW       X, S:?w5
        CALL      L:OS_EventTaskRdy
        JRA       L:??OSQPostOpt_6
//  570             }
//  571         } else {
//  572             OS_EventTaskRdy(pevent, msg, OS_STAT_Q);  /* No,  Post to HPT waiting on queue             */
??OSQPostOpt_5:
        LD        A, #0x4
        LDW       Y, S:?w6
        LDW       X, S:?w5
        CALL      L:OS_EventTaskRdy
//  573         }
//  574         OS_EXIT_CRITICAL();
??OSQPostOpt_7:
        LD        A, S:?b15
        CALL      L:CriticalExit
//  575         OS_Sched();                                   /* Find highest priority task ready to run       */
        CALL      L:OS_Sched
//  576         return (OS_NO_ERR);
        CLR       A
        JP        L:??OSQPostOpt_1
//  577     }
//  578     pq = (OS_Q *)pevent->OSEventPtr;                  /* Point to queue control block                  */
??OSQPostOpt_4:
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w4, X
//  579     if (pq->OSQEntries >= pq->OSQSize) {              /* Make sure queue is not full                   */
        LDW       X, S:?w4
        ADDW      X, #0xa
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       X, (X)
        CPW       X, (Y)
        JRC       L:??OSQPostOpt_8
//  580         OS_EXIT_CRITICAL();
        LD        A, S:?b15
        CALL      L:CriticalExit
//  581         return (OS_Q_FULL);
        LD        A, #0x1e
        JP        L:??OSQPostOpt_1
//  582     }
//  583     if ((opt & OS_POST_OPT_FRONT) != 0x00) {          /* Do we post to the FRONT of the queue?         */
??OSQPostOpt_8:
        LD        A, S:?b14
        AND       A, #0x2
        CP        A, #0x0
        JREQ      L:??OSQPostOpt_9
//  584         if (pq->OSQOut == pq->OSQStart) {             /* Yes, Post as LIFO, Wrap OUT pointer if we ... */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        CPW       X, (Y)
        JRNE      L:??OSQPostOpt_10
//  585             pq->OSQOut = pq->OSQEnd;                  /*      ... are at the 1st queue entry           */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  586         }
//  587         pq->OSQOut--;
??OSQPostOpt_10:
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        DECW      X
        DECW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  588         *pq->OSQOut = msg;                            /*      Insert message into queue                */
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w6
        LDW       (Y), X
        JRA       L:??OSQPostOpt_11
//  589     } else {                                          /* No,  Post as FIFO                             */
//  590         *pq->OSQIn++ = msg;                           /*      Insert message into queue                */
??OSQPostOpt_9:
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w6
        LDW       (Y), X
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       X, (X)
        INCW      X
        INCW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  591         if (pq->OSQIn == pq->OSQEnd) {                /*      Wrap IN ptr if we are at end of queue    */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       X, (X)
        CPW       X, (Y)
        JRNE      L:??OSQPostOpt_11
//  592             pq->OSQIn = pq->OSQStart;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x6
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  593         }
//  594     }
//  595     pq->OSQEntries++;                                 /* Update the nbr of entries in the queue        */
??OSQPostOpt_11:
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       X, (X)
        INCW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  596     OS_EXIT_CRITICAL();
        LD        A, S:?b15
        CALL      L:CriticalExit
//  597     return (OS_NO_ERR);
        CLR       A
??OSQPostOpt_1:
        JP        L:?epilogue_l2_l3
//  598 }
//  599 #endif
//  600 /*$PAGE*/
//  601 /*
//  602 *********************************************************************************************************
//  603 *                                        QUERY A MESSAGE QUEUE
//  604 *
//  605 * Description: This function obtains information about a message queue.
//  606 *
//  607 * Arguments  : pevent        is a pointer to the event control block associated with the desired queue
//  608 *
//  609 *              pdata         is a pointer to a structure that will contain information about the message
//  610 *                            queue.
//  611 *
//  612 * Returns    : OS_NO_ERR           The call was successful and the message was sent
//  613 *              OS_ERR_EVENT_TYPE   If you are attempting to obtain data from a non queue.
//  614 *              OS_ERR_PEVENT_NULL  If 'pevent' is a NULL pointer
//  615 *********************************************************************************************************
//  616 */
//  617 
//  618 #if OS_Q_QUERY_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  619 INT8U  OSQQuery (OS_EVENT *pevent, OS_Q_DATA *pdata)
//  620 {
OSQQuery:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0x3
        LDW       S:?w7, X
        LDW       S:?w6, Y
//  621 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  622     OS_CPU_SR  cpu_sr;
//  623 #endif
//  624     OS_Q      *pq;
//  625     INT8U     *psrc;
//  626     INT8U     *pdest;
//  627 
//  628 
//  629 #if OS_ARG_CHK_EN > 0
//  630     if (pevent == (OS_EVENT *)0) {                         /* Validate 'pevent'                        */
        LDW       X, S:?w7
        TNZW      X
        JRNE      L:??OSQQuery_0
//  631         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JP        L:??OSQQuery_1
//  632     }
//  633     if (pevent->OSEventType != OS_EVENT_TYPE_Q) {          /* Validate event block type                */
??OSQQuery_0:
        LD        A, [S:?w7.w]
        CP        A, #0x2
        JREQ      L:??OSQQuery_2
//  634         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JP        L:??OSQQuery_1
//  635     }
//  636 #endif
//  637     OS_ENTER_CRITICAL();
??OSQQuery_2:
        CALL      L:CriticalEnter
        LD        (0x3,SP), A
//  638     pdata->OSEventGrp = pevent->OSEventGrp;                /* Copy message queue wait list           */
        LDW       X, S:?w7
        INCW      X
        LD        A, (X)
        LDW       X, S:?w6
        ADDW      X, #0xe
        LD        (X), A
//  639     psrc              = &pevent->OSEventTbl[0];
        LDW       X, S:?w7
        ADDW      X, #0x6
        LDW       S:?w5, X
//  640     pdest             = &pdata->OSEventTbl[0];
        LDW       X, S:?w6
        ADDW      X, #0x6
        LDW       S:?w4, X
//  641 #if OS_EVENT_TBL_SIZE > 0
//  642     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  643 #endif
//  644 
//  645 #if OS_EVENT_TBL_SIZE > 1
//  646     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  647 #endif
//  648 
//  649 #if OS_EVENT_TBL_SIZE > 2
//  650     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  651 #endif
//  652 
//  653 #if OS_EVENT_TBL_SIZE > 3
//  654     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  655 #endif
//  656 
//  657 #if OS_EVENT_TBL_SIZE > 4
//  658     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  659 #endif
//  660 
//  661 #if OS_EVENT_TBL_SIZE > 5
//  662     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  663 #endif
//  664 
//  665 #if OS_EVENT_TBL_SIZE > 6
//  666     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  667 #endif
//  668 
//  669 #if OS_EVENT_TBL_SIZE > 7
//  670     *pdest            = *psrc;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
//  671 #endif
//  672     pq = (OS_Q *)pevent->OSEventPtr;
        LDW       X, S:?w7
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       (0x1,SP), X
//  673     if (pq->OSQEntries > 0) {
        LDW       X, (0x1,SP)
        ADDW      X, #0xc
        LDW       X, (X)
        TNZW      X
        JREQ      L:??OSQQuery_3
//  674         pdata->OSMsg = *pq->OSQOut;                        /* Get next message to return if available  */
        LDW       X, (0x1,SP)
        ADDW      X, #0x8
        LDW       X, (X)
        LDW       X, (X)
        LDW       [S:?w6.w], X
        JRA       L:??OSQQuery_4
//  675     } else {
//  676         pdata->OSMsg = (void *)0;
??OSQQuery_3:
        CLRW      X
        LDW       [S:?w6.w], X
//  677     }
//  678     pdata->OSNMsgs = pq->OSQEntries;
??OSQQuery_4:
        LDW       X, (0x1,SP)
        ADDW      X, #0xc
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w6
        ADDW      X, #0x2
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  679     pdata->OSQSize = pq->OSQSize;
        LDW       X, (0x1,SP)
        ADDW      X, #0xa
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w6
        ADDW      X, #0x4
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  680     OS_EXIT_CRITICAL();
        LD        A, (0x3,SP)
        CALL      L:CriticalExit
//  681     return (OS_NO_ERR);
        CLR       A
??OSQQuery_1:
        ADD       SP, #0x3
        JP        L:?epilogue_l2_l3
//  682 }
//  683 #endif                                                     /* OS_Q_QUERY_EN                            */
//  684 
//  685 /*$PAGE*/
//  686 /*
//  687 *********************************************************************************************************
//  688 *                                      QUEUE MODULE INITIALIZATION
//  689 *
//  690 * Description : This function is called by uC/OS-II to initialize the message queue module.  Your
//  691 *               application MUST NOT call this function.
//  692 *
//  693 * Arguments   :  none
//  694 *
//  695 * Returns     : none
//  696 *
//  697 * Note(s)    : This function is INTERNAL to uC/OS-II and your application should not call it.
//  698 *********************************************************************************************************
//  699 */
//  700 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  701 void  OS_QInit (void)
//  702 {
//  703 #if OS_MAX_QS == 1
//  704     OSQFreeList         = &OSQTbl[0];            /* Only ONE queue!                                    */
OS_QInit:
        LDW       X, #OSQTbl
        LDW       L:OSQFreeList, X
//  705     OSQFreeList->OSQPtr = (OS_Q *)0;
        CLRW      X
        LDW       [L:OSQFreeList.w], X
//  706 #endif
//  707 
//  708 #if OS_MAX_QS >= 2
//  709     INT16U  i;
//  710     OS_Q   *pq1;
//  711     OS_Q   *pq2;
//  712 
//  713 
//  714     pq1 = &OSQTbl[0];
//  715     pq2 = &OSQTbl[1];
//  716     for (i = 0; i < (OS_MAX_QS - 1); i++) {      /* Init. list of free QUEUE control blocks            */
//  717         pq1->OSQPtr = pq2;
//  718         pq1++;
//  719         pq2++;
//  720     }
//  721     pq1->OSQPtr = (OS_Q *)0;
//  722     OSQFreeList = &OSQTbl[0];
//  723 #endif
//  724 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  725 #endif                                                     /* OS_Q_EN                                  */
// 
// 2 079 bytes in section .near_func.text
// 
// 2 079 bytes of CODE memory
//
//Errors: none
//Warnings: 2
