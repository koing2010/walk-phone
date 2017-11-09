///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:54 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\ucos_II\OS_MUTEX.C                           /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\ucos_II\OS_MUTEX.C" -e -On --no_cse          /
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
//                    transeiver\stm8s\iar\Debug\List\OS_MUTEX.s              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OS_MUTEX

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?mov_w4_w6
        EXTERN ?mov_w6_w0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w6
        EXTERN ?w0
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN OSEventFreeList
        EXTERN OSIntNesting
        EXTERN OSMapTbl
        EXTERN OSRdyGrp
        EXTERN OSRdyTbl
        EXTERN OSTCBCur
        EXTERN OSTCBPrioTbl
        EXTERN OS_EventTO
        EXTERN OS_EventTaskRdy
        EXTERN OS_EventTaskWait
        EXTERN OS_EventWaitListInit
        EXTERN OS_Sched

        PUBLIC OSMutexAccept
        PUBLIC OSMutexCreate
        PUBLIC OSMutexDel
        PUBLIC OSMutexPend
        PUBLIC OSMutexPost
        PUBLIC OSMutexQuery

// E:\RDA1846s\walkphone program\ucos - transeiver\ucos_II\OS_MUTEX.C
//    1 /*
//    2 *********************************************************************************************************
//    3 *                                                uC/OS-II
//    4 *                                          The Real-Time Kernel
//    5 *                                  MUTUAL EXCLUSION SEMAPHORE MANAGEMENT
//    6 *
//    7 *                          (c) Copyright 1992-2002, Jean J. Labrosse, Weston, FL
//    8 *                                           All Rights Reserved
//    9 *
//   10 * File : OS_MUTEX.C
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
//   19 /*
//   20 *********************************************************************************************************
//   21 *                                            LOCAL CONSTANTS
//   22 *********************************************************************************************************
//   23 */
//   24 
//   25 #define  OS_MUTEX_KEEP_LOWER_8   0x00FF
//   26 #define  OS_MUTEX_KEEP_UPPER_8   0xFF00
//   27 
//   28 #define  OS_MUTEX_AVAILABLE      0x00FF
//   29 
//   30 
//   31 #if OS_MUTEX_EN > 0
//   32 /*
//   33 *********************************************************************************************************
//   34 *                                   ACCEPT MUTUAL EXCLUSION SEMAPHORE
//   35 *
//   36 * Description: This  function checks the mutual exclusion semaphore to see if a resource is available.
//   37 *              Unlike OSMutexPend(), OSMutexAccept() does not suspend the calling task if the resource is
//   38 *              not available or the event did not occur.
//   39 *
//   40 * Arguments  : pevent     is a pointer to the event control block
//   41 *
//   42 *              err        is a pointer to an error code which will be returned to your application:
//   43 *                            OS_NO_ERR          if the call was successful.
//   44 *                            OS_ERR_EVENT_TYPE  if 'pevent' is not a pointer to a mutex
//   45 *                            OS_ERR_PEVENT_NULL 'pevent' is a NULL pointer
//   46 *                            OS_ERR_PEND_ISR     if you called this function from an ISR
//   47 *
//   48 * Returns    : == 1       if the resource is available, the mutual exclusion semaphore is acquired
//   49 *              == 0       a) if the resource is not available
//   50 *                         b) you didn't pass a pointer to a mutual exclusion semaphore
//   51 *                         c) you called this function from an ISR
//   52 *
//   53 * Warning(s) : This function CANNOT be called from an ISR because mutual exclusion semaphores are
//   54 *              intended to be used by tasks only.
//   55 *********************************************************************************************************
//   56 */
//   57 
//   58 #if OS_MUTEX_ACCEPT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   59 INT8U  OSMutexAccept (OS_EVENT *pevent, INT8U *err)
//   60 {
OSMutexAccept:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w4, X
        LDW       S:?w5, Y
//   61 #if OS_CRITICAL_METHOD == 3                            /* Allocate storage for CPU status register     */
//   62     OS_CPU_SR  cpu_sr;
//   63 #endif    
//   64     
//   65     
//   66     if (OSIntNesting > 0) {                            /* Make sure it's not called from an ISR        */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSMutexAccept_0
//   67         *err = OS_ERR_PEND_ISR;
        LD        A, #0x2
        LD        [S:?w5.w], A
//   68         return (0);
        CLR       A
        JP        L:??OSMutexAccept_1
//   69     }
//   70 #if OS_ARG_CHK_EN > 0
//   71     if (pevent == (OS_EVENT *)0) {                     /* Validate 'pevent'                            */
??OSMutexAccept_0:
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSMutexAccept_2
//   72         *err = OS_ERR_PEVENT_NULL;
        LD        A, #0x4
        LD        [S:?w5.w], A
//   73         return (0);
        CLR       A
        JP        L:??OSMutexAccept_1
//   74     }
//   75     if (pevent->OSEventType != OS_EVENT_TYPE_MUTEX) {  /* Validate event block type                    */
??OSMutexAccept_2:
        LD        A, [S:?w4.w]
        CP        A, #0x4
        JREQ      L:??OSMutexAccept_3
//   76         *err = OS_ERR_EVENT_TYPE;
        LD        A, #0x1
        LD        [S:?w5.w], A
//   77         return (0);
        CLR       A
        JRA       L:??OSMutexAccept_1
//   78     }
//   79 #endif                                                     
//   80     OS_ENTER_CRITICAL();							   /* Get value (0 or 1) of Mutex                  */
??OSMutexAccept_3:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//   81     if ((pevent->OSEventCnt & OS_MUTEX_KEEP_LOWER_8) == OS_MUTEX_AVAILABLE) {     
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LD        A, XL
        AND       A, #0xff
        CP        A, #0xff
        JRNE      L:??OSMutexAccept_4
//   82         pevent->OSEventCnt &= OS_MUTEX_KEEP_UPPER_8;   /*      Mask off LSByte (Acquire Mutex)         */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//   83         pevent->OSEventCnt |= OSTCBCur->OSTCBPrio;     /*      Save current task priority in LSByte    */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//   84         pevent->OSEventPtr  = (void *)OSTCBCur;        /*      Link TCB of task owning Mutex           */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSTCBCur
        LDW       (Y), X
//   85         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//   86         *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w5.w], A
//   87         return (1);
        LD        A, #0x1
        JRA       L:??OSMutexAccept_1
//   88     }
//   89     OS_EXIT_CRITICAL();
??OSMutexAccept_4:
        LD        A, S:?b12
        CALL      L:CriticalExit
//   90     *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w5.w], A
//   91     return (0);
        CLR       A
??OSMutexAccept_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//   92 }
//   93 #endif                                                     
//   94 
//   95 /*$PAGE*/
//   96 /*
//   97 *********************************************************************************************************
//   98 *                                  CREATE A MUTUAL EXCLUSION SEMAPHORE
//   99 *
//  100 * Description: This function creates a mutual exclusion semaphore.
//  101 *
//  102 * Arguments  : prio          is the priority to use when accessing the mutual exclusion semaphore.  In
//  103 *                            other words, when the semaphore is acquired and a higher priority task
//  104 *                            attempts to obtain the semaphore then the priority of the task owning the
//  105 *                            semaphore is raised to this priority.  It is assumed that you will specify
//  106 *                            a priority that is LOWER in value than ANY of the tasks competing for the
//  107 *                            mutex.
//  108 *
//  109 *              err           is a pointer to an error code which will be returned to your application:
//  110 *                               OS_NO_ERR           if the call was successful.
//  111 *                               OS_ERR_CREATE_ISR   if you attempted to create a MUTEX from an ISR
//  112 *                               OS_PRIO_EXIST       if a task at the priority inheritance priority
//  113 *                                                   already exist.
//  114 *                               OS_ERR_PEVENT_NULL  No more event control blocks available.
//  115 *                               OS_PRIO_INVALID     if the priority you specify is higher that the 
//  116 *                                                   maximum allowed (i.e. > OS_LOWEST_PRIO)
//  117 *
//  118 * Returns    : != (void *)0  is a pointer to the event control clock (OS_EVENT) associated with the
//  119 *                            created mutex.
//  120 *              == (void *)0  if an error is detected.
//  121 *
//  122 * Note(s)    : 1) The LEAST significant 8 bits of '.OSEventCnt' are used to hold the priority number
//  123 *                 of the task owning the mutex or 0xFF if no task owns the mutex.
//  124 *              2) The MOST  significant 8 bits of '.OSEventCnt' are used to hold the priority number
//  125 *                 to use to reduce priority inversion.
//  126 *********************************************************************************************************
//  127 */
//  128 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  129 OS_EVENT  *OSMutexCreate (INT8U prio, INT8U *err)
//  130 {
OSMutexCreate:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LD        S:?b12, A
        LDW       S:?w4, X
//  131 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  132     OS_CPU_SR  cpu_sr;
//  133 #endif    
//  134     OS_EVENT  *pevent;
//  135 
//  136 
//  137     if (OSIntNesting > 0) {                                /* See if called from ISR ...               */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSMutexCreate_0
//  138         *err = OS_ERR_CREATE_ISR;                          /* ... can't CREATE mutex from an ISR       */
        LD        A, #0x8d
        LD        [S:?w4.w], A
//  139         return ((OS_EVENT *)0);
        CLRW      X
        JP        L:??OSMutexCreate_1
//  140     }
//  141 #if OS_ARG_CHK_EN > 0
//  142     if (prio >= OS_LOWEST_PRIO) {                          /* Validate PIP                             */
??OSMutexCreate_0:
        LD        A, S:?b12
        CP        A, #0x3f
        JRC       L:??OSMutexCreate_2
//  143         *err = OS_PRIO_INVALID;
        LD        A, #0x2a
        LD        [S:?w4.w], A
//  144         return ((OS_EVENT *)0);
        CLRW      X
        JP        L:??OSMutexCreate_1
//  145     }
//  146 #endif
//  147     OS_ENTER_CRITICAL();
??OSMutexCreate_2:
        CALL      L:CriticalEnter
        LD        S:?b13, A
//  148     if (OSTCBPrioTbl[prio] != (OS_TCB *)0) {               /* Mutex priority must not already exist    */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        TNZW      X
        JREQ      L:??OSMutexCreate_3
//  149         OS_EXIT_CRITICAL();                                /* Task already exist at priority ...       */
        LD        A, S:?b13
        CALL      L:CriticalExit
//  150         *err = OS_PRIO_EXIST;                              /* ... inheritance priority                 */
        LD        A, #0x28
        LD        [S:?w4.w], A
//  151         return ((OS_EVENT *)0);                            
        CLRW      X
        JRA       L:??OSMutexCreate_1
//  152     }
//  153     OSTCBPrioTbl[prio] = (OS_TCB *)1;                      /* Reserve the table entry                  */
??OSMutexCreate_3:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        SLLW      X
        LDW       S:?w0, X
        CLRW      X
        INCW      X
        LDW       Y, X
        LDW       X, S:?w0
        LDW       (L:OSTCBPrioTbl,X), Y
//  154     pevent             = OSEventFreeList;                  /* Get next free event control block        */
        LDW       X, L:OSEventFreeList
        LDW       S:?w5, X
//  155     if (pevent == (OS_EVENT *)0) {                         /* See if an ECB was available              */
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSMutexCreate_4
//  156         OSTCBPrioTbl[prio] = (OS_TCB *)0;                  /* No, Release the table entry              */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        SLLW      X
        CLRW      Y
        LDW       (L:OSTCBPrioTbl,X), Y
//  157         OS_EXIT_CRITICAL();
        LD        A, S:?b13
        CALL      L:CriticalExit
//  158         *err               = OS_ERR_PEVENT_NULL;           /* No more event control blocks             */
        LD        A, #0x4
        LD        [S:?w4.w], A
//  159         return (pevent);
        LDW       X, S:?w5
        JRA       L:??OSMutexCreate_1
//  160     }
//  161     OSEventFreeList     = (OS_EVENT *)OSEventFreeList->OSEventPtr;   /* Adjust the free list           */
??OSMutexCreate_4:
        LDW       X, L:OSEventFreeList
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       L:OSEventFreeList, X
//  162     OS_EXIT_CRITICAL();
        LD        A, S:?b13
        CALL      L:CriticalExit
//  163     pevent->OSEventType = OS_EVENT_TYPE_MUTEX;
        LD        A, #0x4
        LD        [S:?w5.w], A
//  164     pevent->OSEventCnt  = (prio << 8) | OS_MUTEX_AVAILABLE;/* Resource is available                    */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        CLR       A
        RLWA      X, A
        RLWA      X, A
        OR        A, #0x0
        RLWA      X, A
        OR        A, #0xff
        RLWA      X, A
        LDW       Y, X
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  165     pevent->OSEventPtr  = (void *)0;                       /* No task owning the mutex                 */
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  166     OS_EventWaitListInit(pevent);
        LDW       X, S:?w5
        CALL      L:OS_EventWaitListInit
//  167     *err                = OS_NO_ERR;
        CLR       A
        LD        [S:?w4.w], A
//  168     return (pevent);
        LDW       X, S:?w5
??OSMutexCreate_1:
        JP        L:?epilogue_l2_w6
//  169 }
//  170 
//  171 /*$PAGE*/
//  172 /*
//  173 *********************************************************************************************************
//  174 *                                          DELETE A MUTEX
//  175 *
//  176 * Description: This function deletes a mutual exclusion semaphore and readies all tasks pending on the it.
//  177 *
//  178 * Arguments  : pevent        is a pointer to the event control block associated with the desired mutex.
//  179 *
//  180 *              opt           determines delete options as follows:
//  181 *                            opt == OS_DEL_NO_PEND   Delete mutex ONLY if no task pending
//  182 *                            opt == OS_DEL_ALWAYS    Deletes the mutex even if tasks are waiting.
//  183 *                                                    In this case, all the tasks pending will be readied.
//  184 *
//  185 *              err           is a pointer to an error code that can contain one of the following values:
//  186 *                            OS_NO_ERR               The call was successful and the mutex was deleted
//  187 *                            OS_ERR_DEL_ISR          If you attempted to delete the MUTEX from an ISR
//  188 *                            OS_ERR_INVALID_OPT      An invalid option was specified
//  189 *                            OS_ERR_TASK_WAITING     One or more tasks were waiting on the mutex
//  190 *                            OS_ERR_EVENT_TYPE       If you didn't pass a pointer to a mutex
//  191 *                            OS_ERR_PEVENT_NULL      If 'pevent' is a NULL pointer.
//  192 *
//  193 * Returns    : pevent        upon error
//  194 *              (OS_EVENT *)0 if the mutex was successfully deleted.
//  195 *
//  196 * Note(s)    : 1) This function must be used with care.  Tasks that would normally expect the presence of
//  197 *                 the mutex MUST check the return code of OSMutexPend().
//  198 *              2) This call can potentially disable interrupts for a long time.  The interrupt disable
//  199 *                 time is directly proportional to the number of tasks waiting on the mutex.
//  200 *              3) Because ALL tasks pending on the mutex will be readied, you MUST be careful because the
//  201 *                 resource(s) will no longer be guarded by the mutex.
//  202 *********************************************************************************************************
//  203 */
//  204 
//  205 #if OS_MUTEX_DEL_EN

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  206 OS_EVENT  *OSMutexDel (OS_EVENT *pevent, INT8U opt, INT8U *err)
//  207 {
OSMutexDel:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LDW       S:?w4, X
        LD        S:?b14, A
        LDW       S:?w5, Y
//  208 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  209     OS_CPU_SR  cpu_sr;
//  210 #endif    
//  211     BOOLEAN    tasks_waiting;
//  212     INT8U      pip;
//  213 
//  214 
//  215     if (OSIntNesting > 0) {                                /* See if called from ISR ...               */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSMutexDel_0
//  216         *err = OS_ERR_DEL_ISR;                             /* ... can't DELETE from an ISR             */
        LD        A, #0x8c
        LD        [S:?w5.w], A
//  217         return (pevent);
        LDW       X, S:?w4
        JP        L:??OSMutexDel_1
//  218     }
//  219 #if OS_ARG_CHK_EN > 0
//  220     if (pevent == (OS_EVENT *)0) {                         /* Validate 'pevent'                        */
??OSMutexDel_0:
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSMutexDel_2
//  221         *err = OS_ERR_PEVENT_NULL;
        LD        A, #0x4
        LD        [S:?w5.w], A
//  222         return ((OS_EVENT *)0);
        CLRW      X
        JP        L:??OSMutexDel_1
//  223     }
//  224     if (pevent->OSEventType != OS_EVENT_TYPE_MUTEX) {      /* Validate event block type                */
??OSMutexDel_2:
        LD        A, [S:?w4.w]
        CP        A, #0x4
        JREQ      L:??OSMutexDel_3
//  225         *err = OS_ERR_EVENT_TYPE;
        LD        A, #0x1
        LD        [S:?w5.w], A
//  226         return (pevent);
        LDW       X, S:?w4
        JP        L:??OSMutexDel_1
//  227     }
//  228 #endif
//  229     OS_ENTER_CRITICAL();
??OSMutexDel_3:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  230     if (pevent->OSEventGrp != 0x00) {                      /* See if any tasks waiting on mutex        */
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSMutexDel_4
//  231         tasks_waiting = TRUE;                              /* Yes                                      */
        LD        A, #0x1
        LD        S:?b15, A
        JRA       L:??OSMutexDel_5
//  232     } else {
//  233         tasks_waiting = FALSE;                             /* No                                       */
??OSMutexDel_4:
        CLR       A
        LD        S:?b15, A
//  234     }
//  235     switch (opt) {
??OSMutexDel_5:
        LD        A, S:?b14
        TNZ       A
        JREQ      L:??OSMutexDel_6
        DEC       A
        JREQ      L:??OSMutexDel_7
        JP        L:??OSMutexDel_8
//  236         case OS_DEL_NO_PEND:                               /* Delete mutex only if no task waiting     */
//  237              if (tasks_waiting == FALSE) {
??OSMutexDel_6:
        TNZ       S:?b15
        JRNE      L:??OSMutexDel_9
//  238                  pip                 = (INT8U)(pevent->OSEventCnt >> 8);
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        S:?b13, A
//  239                  OSTCBPrioTbl[pip]   = (OS_TCB *)0;        /* Free up the PIP                          */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b13
        EXG       A, XL
        SLLW      X
        CLRW      Y
        LDW       (L:OSTCBPrioTbl,X), Y
//  240                  pevent->OSEventType = OS_EVENT_TYPE_UNUSED;
        CLR       A
        LD        [S:?w4.w], A
//  241                  pevent->OSEventPtr  = OSEventFreeList;    /* Return Event Control Block to free list  */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSEventFreeList
        LDW       (Y), X
//  242                  OSEventFreeList     = pevent;
        LDW       X, S:?w4
        LDW       L:OSEventFreeList, X
//  243                  OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  244                  *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w5.w], A
//  245                  return ((OS_EVENT *)0);                   /* Mutex has been deleted                   */
        CLRW      X
        JRA       L:??OSMutexDel_1
//  246              } else {
//  247                  OS_EXIT_CRITICAL();
??OSMutexDel_9:
        LD        A, S:?b12
        CALL      L:CriticalExit
//  248                  *err = OS_ERR_TASK_WAITING;
        LD        A, #0x8
        LD        [S:?w5.w], A
//  249                  return (pevent);
        LDW       X, S:?w4
        JRA       L:??OSMutexDel_1
//  250              }
//  251 
//  252         case OS_DEL_ALWAYS:                                /* Always delete the mutex                  */
//  253              while (pevent->OSEventGrp != 0x00) {          /* Ready ALL tasks waiting for mutex        */
??OSMutexDel_7:
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSMutexDel_10
//  254                  OS_EventTaskRdy(pevent, (void *)0, OS_STAT_MUTEX);
        LD        A, #0x10
        CLRW      Y
        LDW       X, S:?w4
        CALL      L:OS_EventTaskRdy
        JRA       L:??OSMutexDel_7
//  255              }
//  256              pip                 = (INT8U)(pevent->OSEventCnt >> 8);
??OSMutexDel_10:
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        S:?b13, A
//  257              OSTCBPrioTbl[pip]   = (OS_TCB *)0;            /* Free up the PIP                          */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b13
        EXG       A, XL
        SLLW      X
        CLRW      Y
        LDW       (L:OSTCBPrioTbl,X), Y
//  258              pevent->OSEventType = OS_EVENT_TYPE_UNUSED;
        CLR       A
        LD        [S:?w4.w], A
//  259              pevent->OSEventPtr  = OSEventFreeList;        /* Return Event Control Block to free list  */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSEventFreeList
        LDW       (Y), X
//  260              OSEventFreeList     = pevent;                 /* Get next free event control block        */
        LDW       X, S:?w4
        LDW       L:OSEventFreeList, X
//  261              OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  262              if (tasks_waiting == TRUE) {                  /* Reschedule only if task(s) were waiting  */
        LD        A, S:?b15
        CP        A, #0x1
        JRNE      L:??OSMutexDel_11
//  263                  OS_Sched();                               /* Find highest priority task ready to run  */
        CALL      L:OS_Sched
//  264              }
//  265              *err = OS_NO_ERR;
??OSMutexDel_11:
        CLR       A
        LD        [S:?w5.w], A
//  266              return ((OS_EVENT *)0);                       /* Mutex has been deleted                   */
        CLRW      X
        JRA       L:??OSMutexDel_1
//  267 
//  268         default:
//  269              OS_EXIT_CRITICAL();
??OSMutexDel_8:
        LD        A, S:?b12
        CALL      L:CriticalExit
//  270              *err = OS_ERR_INVALID_OPT;
        LD        A, #0x7
        LD        [S:?w5.w], A
//  271              return (pevent);
        LDW       X, S:?w4
??OSMutexDel_1:
        JP        L:?epilogue_l2_l3
//  272     }
//  273 }
//  274 #endif
//  275 
//  276 /*$PAGE*/
//  277 /*
//  278 *********************************************************************************************************
//  279 *                                  PEND ON MUTUAL EXCLUSION SEMAPHORE
//  280 *
//  281 * Description: This function waits for a mutual exclusion semaphore.
//  282 *
//  283 * Arguments  : pevent        is a pointer to the event control block associated with the desired
//  284 *                            mutex.
//  285 *
//  286 *              timeout       is an optional timeout period (in clock ticks).  If non-zero, your task will
//  287 *                            wait for the resource up to the amount of time specified by this argument.
//  288 *                            If you specify 0, however, your task will wait forever at the specified
//  289 *                            mutex or, until the resource becomes available.
//  290 *
//  291 *              err           is a pointer to where an error message will be deposited.  Possible error
//  292 *                            messages are:
//  293 *                               OS_NO_ERR          The call was successful and your task owns the mutex
//  294 *                               OS_TIMEOUT         The mutex was not available within the specified time.
//  295 *                               OS_ERR_EVENT_TYPE  If you didn't pass a pointer to a mutex
//  296 *                               OS_ERR_PEVENT_NULL 'pevent' is a NULL pointer
//  297 *                               OS_ERR_PEND_ISR    If you called this function from an ISR and the result
//  298 *                                                  would lead to a suspension.
//  299 *
//  300 * Returns    : none
//  301 *
//  302 * Note(s)    : 1) The task that owns the Mutex MUST NOT pend on any other event while it owns the mutex.
//  303 *              2) You MUST NOT change the priority of the task that owns the mutex
//  304 *********************************************************************************************************
//  305 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  306 void  OSMutexPend (OS_EVENT *pevent, INT16U timeout, INT8U *err)
//  307 {
OSMutexPend:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     Y
        SUB       SP, #0x2
        LDW       S:?w5, X
        CALL      L:?mov_w6_w0
//  308 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  309     OS_CPU_SR  cpu_sr;
//  310 #endif    
//  311     INT8U      pip;                                        /* Priority Inheritance Priority (PIP)      */
//  312     INT8U      mprio;                                      /* Mutex owner priority                     */
//  313     BOOLEAN    rdy;                                        /* Flag indicating task was ready           */
//  314     OS_TCB    *ptcb;
//  315 
//  316 
//  317     if (OSIntNesting > 0) {                                /* See if called from ISR ...               */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSMutexPend_0
//  318         *err = OS_ERR_PEND_ISR;                            /* ... can't PEND from an ISR               */
        LD        A, #0x2
        LD        [S:?w6.w], A
//  319         return;
        JP        L:??OSMutexPend_1
//  320     }
//  321 #if OS_ARG_CHK_EN > 0
//  322     if (pevent == (OS_EVENT *)0) {                         /* Validate 'pevent'                        */
??OSMutexPend_0:
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSMutexPend_2
//  323         *err = OS_ERR_PEVENT_NULL;
        LD        A, #0x4
        LD        [S:?w6.w], A
//  324         return;
        JP        L:??OSMutexPend_1
//  325     }
//  326     if (pevent->OSEventType != OS_EVENT_TYPE_MUTEX) {      /* Validate event block type                */
??OSMutexPend_2:
        LD        A, [S:?w5.w]
        CP        A, #0x4
        JREQ      L:??OSMutexPend_3
//  327         *err = OS_ERR_EVENT_TYPE;
        LD        A, #0x1
        LD        [S:?w6.w], A
//  328         return;
        JP        L:??OSMutexPend_1
//  329     }
//  330 #endif
//  331     OS_ENTER_CRITICAL();								   /* Is Mutex available?                      */
??OSMutexPend_3:
        CALL      L:CriticalEnter
        LD        S:?b14, A
//  332     if ((INT8U)(pevent->OSEventCnt & OS_MUTEX_KEEP_LOWER_8) == OS_MUTEX_AVAILABLE) {
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       X, (X)
        LD        A, XL
        CP        A, #0xff
        JRNE      L:??OSMutexPend_4
//  333         pevent->OSEventCnt &= OS_MUTEX_KEEP_UPPER_8;       /* Yes, Acquire the resource                */
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       X, (X)
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        LDW       Y, X
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  334         pevent->OSEventCnt |= OSTCBCur->OSTCBPrio;         /*      Save priority of owning task        */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       X, (X)
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       Y, X
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  335         pevent->OSEventPtr  = (void *)OSTCBCur;            /*      Point to owning task's OS_TCB       */
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSTCBCur
        LDW       (Y), X
//  336         OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  337         *err  = OS_NO_ERR;
        CLR       A
        LD        [S:?w6.w], A
//  338         return;
        JP        L:??OSMutexPend_1
//  339     }
//  340     pip   = (INT8U)(pevent->OSEventCnt >> 8);                     /* No, Get PIP from mutex            */
??OSMutexPend_4:
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       X, (X)
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        S:?b15, A
//  341     mprio = (INT8U)(pevent->OSEventCnt & OS_MUTEX_KEEP_LOWER_8);  /*     Get priority of mutex owner   */
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       X, (X)
        LD        A, XL
        LD        (0x2,SP), A
//  342     ptcb  = (OS_TCB *)(pevent->OSEventPtr);                       /*     Point to TCB of mutex owner   */
        LDW       X, S:?w5
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       S:?w4, X
//  343     if (ptcb->OSTCBPrio != pip && mprio > OSTCBCur->OSTCBPrio) {  /*     Need to promote prio of owner?*/
        LDW       X, S:?w4
        ADDW      X, #0x19
        LD        A, S:?b15
        CP        A, (X)
        JRNE      ??lb_1
        JP        L:??OSMutexPend_5
??lb_1:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, (X)
        CP        A, (0x2,SP)
        JRC       ??lb_2
        JP        L:??OSMutexPend_5
//  344         if ((OSRdyTbl[ptcb->OSTCBY] & ptcb->OSTCBBitX) != 0x00) { /*     See if mutex owner is ready   */
??lb_2:
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSRdyTbl,X)
        LDW       X, S:?w4
        ADDW      X, #0x1c
        AND       A, (X)
        CP        A, #0x0
        JREQ      L:??OSMutexPend_6
//  345                                                                   /*     Yes, Remove owner from Rdy ...*/
//  346                                                                   /*          ... list at current prio */
//  347             if ((OSRdyTbl[ptcb->OSTCBY] &= ~ptcb->OSTCBBitX) == 0x00) {
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x1c
        LD        A, (X)
        CPL       A
        LDW       X, Y
        AND       A, (L:OSRdyTbl,X)
        LD        S:?b0, A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:OSRdyTbl,X), A
        TNZ       S:?b0
        JRNE      L:??OSMutexPend_7
//  348                 OSRdyGrp &= ~ptcb->OSTCBBitY;
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        CPL       A
        AND       A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  349             }
//  350             rdy = TRUE;
??OSMutexPend_7:
        LD        A, #0x1
        LD        (0x1,SP), A
        JRA       L:??OSMutexPend_8
//  351         } else {
//  352             rdy = FALSE;                                          /* No                                */
??OSMutexPend_6:
        CLR       A
        LD        (0x1,SP), A
//  353         }
//  354         ptcb->OSTCBPrio         = pip;                     /* Change owner task prio to PIP            */
??OSMutexPend_8:
        LDW       X, S:?w4
        ADDW      X, #0x19
        LD        A, S:?b15
        LD        (X), A
//  355         ptcb->OSTCBY            = ptcb->OSTCBPrio >> 3;
        LDW       X, S:?w4
        ADDW      X, #0x19
        LD        A, (X)
        SRL       A
        SRL       A
        SRL       A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        (X), A
//  356         ptcb->OSTCBBitY         = OSMapTbl[ptcb->OSTCBY];
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSMapTbl,X)
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        (X), A
//  357         ptcb->OSTCBX            = ptcb->OSTCBPrio & 0x07;
        LDW       X, S:?w4
        ADDW      X, #0x19
        LD        A, (X)
        AND       A, #0x7
        LDW       X, S:?w4
        ADDW      X, #0x1a
        LD        (X), A
//  358         ptcb->OSTCBBitX         = OSMapTbl[ptcb->OSTCBX];
        LDW       X, S:?w4
        ADDW      X, #0x1a
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSMapTbl,X)
        LDW       X, S:?w4
        ADDW      X, #0x1c
        LD        (X), A
//  359         if (rdy == TRUE) {                                 /* If task was ready at owner's priority ...*/
        LD        A, (0x1,SP)
        CP        A, #0x1
        JRNE      L:??OSMutexPend_9
//  360             OSRdyGrp               |= ptcb->OSTCBBitY;     /* ... make it ready at new priority.       */
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        OR        A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  361             OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSRdyTbl,X)
        LDW       X, S:?w4
        ADDW      X, #0x1c
        OR        A, (X)
        LD        S:?b0, A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:OSRdyTbl,X), A
//  362         }
//  363         OSTCBPrioTbl[pip]       = (OS_TCB *)ptcb;
??OSMutexPend_9:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b15
        EXG       A, XL
        SLLW      X
        LDW       Y, S:?w4
        LDW       (L:OSTCBPrioTbl,X), Y
//  364     }
//  365     OSTCBCur->OSTCBStat |= OS_STAT_MUTEX;             /* Mutex not available, pend current task        */
??OSMutexPend_5:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        LD        A, (X)
        OR        A, #0x10
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        LD        (X), A
//  366     OSTCBCur->OSTCBDly   = timeout;                   /* Store timeout in current task's TCB           */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x16
        LDW       Y, X
        LDW       X, (0x3,SP)
        LDW       (Y), X
//  367     OS_EventTaskWait(pevent);                         /* Suspend task until event or timeout occurs    */
        LDW       X, S:?w5
        CALL      L:OS_EventTaskWait
//  368     OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  369     OS_Sched();                                        /* Find next highest priority task ready         */
        CALL      L:OS_Sched
//  370     OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b14, A
//  371     if (OSTCBCur->OSTCBStat & OS_STAT_MUTEX) {        /* Must have timed out if still waiting for event*/
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        LD        A, (X)
        AND       A, #0x10
        CP        A, #0x0
        JREQ      L:??OSMutexPend_10
//  372         OS_EventTO(pevent);
        LDW       X, S:?w5
        CALL      L:OS_EventTO
//  373         OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  374         *err = OS_TIMEOUT;                            /* Indicate that we didn't get mutex within TO   */
        LD        A, #0xa
        LD        [S:?w6.w], A
//  375         return;
        JRA       L:??OSMutexPend_1
//  376     }
//  377     OSTCBCur->OSTCBEventPtr = (OS_EVENT *)0;
??OSMutexPend_10:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x12
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  378     OS_EXIT_CRITICAL();
        LD        A, S:?b14
        CALL      L:CriticalExit
//  379     *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w6.w], A
//  380 }
??OSMutexPend_1:
        ADD       SP, #0x4
        JP        L:?epilogue_l2_l3
//  381 /*$PAGE*/
//  382 /*
//  383 *********************************************************************************************************
//  384 *                                  POST TO A MUTUAL EXCLUSION SEMAPHORE
//  385 *
//  386 * Description: This function signals a mutual exclusion semaphore
//  387 *
//  388 * Arguments  : pevent              is a pointer to the event control block associated with the desired
//  389 *                                  mutex.
//  390 *
//  391 * Returns    : OS_NO_ERR               The call was successful and the mutex was signaled.
//  392 *              OS_ERR_EVENT_TYPE       If you didn't pass a pointer to a mutex
//  393 *              OS_ERR_PEVENT_NULL      'pevent' is a NULL pointer
//  394 *              OS_ERR_POST_ISR         Attempted to post from an ISR (not valid for MUTEXes)
//  395 *              OS_ERR_NOT_MUTEX_OWNER  The task that did the post is NOT the owner of the MUTEX.
//  396 *********************************************************************************************************
//  397 */
//  398 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  399 INT8U  OSMutexPost (OS_EVENT *pevent)
//  400 {
OSMutexPost:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w4, X
//  401 #if OS_CRITICAL_METHOD == 3                           /* Allocate storage for CPU status register      */
//  402     OS_CPU_SR  cpu_sr;
//  403 #endif    
//  404     INT8U      pip;                                   /* Priority inheritance priority                 */
//  405     INT8U      prio;
//  406 
//  407 
//  408     if (OSIntNesting > 0) {                           /* See if called from ISR ...                    */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSMutexPost_0
//  409         return (OS_ERR_POST_ISR);                     /* ... can't POST mutex from an ISR              */
        LD        A, #0x5
        JP        L:??OSMutexPost_1
//  410     }
//  411 #if OS_ARG_CHK_EN > 0
//  412     if (pevent == (OS_EVENT *)0) {                    /* Validate 'pevent'                             */
??OSMutexPost_0:
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSMutexPost_2
//  413         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JP        L:??OSMutexPost_1
//  414     }
//  415     if (pevent->OSEventType != OS_EVENT_TYPE_MUTEX) { /* Validate event block type                     */
??OSMutexPost_2:
        LD        A, [S:?w4.w]
        CP        A, #0x4
        JREQ      L:??OSMutexPost_3
//  416         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JP        L:??OSMutexPost_1
//  417     }                                                 
//  418 #endif
//  419     OS_ENTER_CRITICAL();
??OSMutexPost_3:
        CALL      L:CriticalEnter
        LD        S:?b10, A
//  420     pip  = (INT8U)(pevent->OSEventCnt >> 8);          /* Get priority inheritance priority of mutex    */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        S:?b11, A
//  421     prio = (INT8U)(pevent->OSEventCnt & OS_MUTEX_KEEP_LOWER_8);  /* Get owner's original priority      */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LD        A, XL
        LD        S:?b12, A
//  422     if (OSTCBCur->OSTCBPrio != pip && 
//  423         OSTCBCur->OSTCBPrio != prio) {                /* See if posting task owns the MUTEX            */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, S:?b11
        CP        A, (X)
        JREQ      L:??OSMutexPost_4
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, S:?b12
        CP        A, (X)
        JREQ      L:??OSMutexPost_4
//  424         OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
//  425         return (OS_ERR_NOT_MUTEX_OWNER);
        LD        A, #0x78
        JP        L:??OSMutexPost_1
//  426     }
//  427     if (OSTCBCur->OSTCBPrio == pip) {                 /* Did we have to raise current task's priority? */
??OSMutexPost_4:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, S:?b11
        CP        A, (X)
        JREQ      ??lb_0
        JP        L:??OSMutexPost_5
//  428                                                       /* Yes, Return to original priority              */
//  429                                                       /*      Remove owner from ready list at 'pip'    */
//  430         if ((OSRdyTbl[OSTCBCur->OSTCBY] &= ~OSTCBCur->OSTCBBitX) == 0) {
??lb_0:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1c
        LD        A, (X)
        CPL       A
        LDW       X, Y
        AND       A, (L:OSRdyTbl,X)
        LD        S:?b0, A
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:OSRdyTbl,X), A
        TNZ       S:?b0
        JRNE      L:??OSMutexPost_6
//  431             OSRdyGrp &= ~OSTCBCur->OSTCBBitY;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1d
        LD        A, (X)
        CPL       A
        AND       A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  432         }
//  433         OSTCBCur->OSTCBPrio         = prio;
??OSMutexPost_6:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, S:?b12
        LD        (X), A
//  434         OSTCBCur->OSTCBY            = prio >> 3;
        LD        A, S:?b12
        SRL       A
        SRL       A
        SRL       A
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        (X), A
//  435         OSTCBCur->OSTCBBitY         = OSMapTbl[OSTCBCur->OSTCBY];
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSMapTbl,X)
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1d
        LD        (X), A
//  436         OSTCBCur->OSTCBX            = prio & 0x07;
        LD        A, S:?b12
        AND       A, #0x7
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1a
        LD        (X), A
//  437         OSTCBCur->OSTCBBitX         = OSMapTbl[OSTCBCur->OSTCBX];
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1a
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSMapTbl,X)
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1c
        LD        (X), A
//  438         OSRdyGrp                   |= OSTCBCur->OSTCBBitY;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1d
        LD        A, (X)
        OR        A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  439         OSRdyTbl[OSTCBCur->OSTCBY] |= OSTCBCur->OSTCBBitX;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSRdyTbl,X)
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1c
        OR        A, (X)
        LD        S:?b0, A
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:OSRdyTbl,X), A
//  440         OSTCBPrioTbl[prio]          = (OS_TCB *)OSTCBCur;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        SLLW      X
        LDW       S:?w0, X
        LDW       X, L:OSTCBCur
        LDW       Y, X
        LDW       X, S:?w0
        LDW       (L:OSTCBPrioTbl,X), Y
//  441     }
//  442     OSTCBPrioTbl[pip] = (OS_TCB *)1;                  /* Reserve table entry                           */
??OSMutexPost_5:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        SLLW      X
        LDW       S:?w0, X
        CLRW      X
        INCW      X
        LDW       Y, X
        LDW       X, S:?w0
        LDW       (L:OSTCBPrioTbl,X), Y
//  443     if (pevent->OSEventGrp != 0x00) {                 /* Any task waiting for the mutex?               */
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSMutexPost_7
//  444                                                       /* Yes, Make HPT waiting for mutex ready         */
//  445         prio                = OS_EventTaskRdy(pevent, (void *)0, OS_STAT_MUTEX);
        LD        A, #0x10
        CLRW      Y
        LDW       X, S:?w4
        CALL      L:OS_EventTaskRdy
        LD        S:?b12, A
//  446         pevent->OSEventCnt &= OS_MUTEX_KEEP_UPPER_8;  /*      Save priority of mutex's new owner       */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       (X), Y
//  447         pevent->OSEventCnt |= prio;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       S:?w0, X
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       Y, X
        LDW       X, S:?w0
        LDW       (Y), X
//  448         pevent->OSEventPtr  = OSTCBPrioTbl[prio];     /*      Link to mutex owner's OS_TCB             */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       (X), Y
//  449         OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
//  450         OS_Sched();                                   /*      Find highest priority task ready to run  */
        CALL      L:OS_Sched
//  451         return (OS_NO_ERR);
        CLR       A
        JRA       L:??OSMutexPost_1
//  452     }
//  453     pevent->OSEventCnt |= OS_MUTEX_AVAILABLE;         /* No,  Mutex is now available                   */
??OSMutexPost_7:
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        RLWA      X, A
        OR        A, #0x0
        RLWA      X, A
        OR        A, #0xff
        RLWA      X, A
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       (X), Y
//  454     pevent->OSEventPtr  = (void *)0;
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  455     OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
//  456     return (OS_NO_ERR);
        CLR       A
??OSMutexPost_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//  457 }
//  458 /*$PAGE*/
//  459 /*
//  460 *********************************************************************************************************
//  461 *                                     QUERY A MUTUAL EXCLUSION SEMAPHORE
//  462 *
//  463 * Description: This function obtains information about a mutex
//  464 *
//  465 * Arguments  : pevent        is a pointer to the event control block associated with the desired mutex
//  466 *
//  467 *              pdata         is a pointer to a structure that will contain information about the mutex
//  468 *
//  469 * Returns    : OS_NO_ERR            The call was successful and the message was sent
//  470 *              OS_ERR_QUERY_ISR     If you called this function from an ISR
//  471 *              OS_ERR_PEVENT_NULL   'pevent' is a NULL pointer
//  472 *              OS_ERR_EVENT_TYPE    If you are attempting to obtain data from a non mutex.
//  473 *********************************************************************************************************
//  474 */
//  475 
//  476 #if OS_MUTEX_QUERY_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  477 INT8U  OSMutexQuery (OS_EVENT *pevent, OS_MUTEX_DATA *pdata)
//  478 {
OSMutexQuery:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0x1
        LDW       S:?w7, X
        LDW       S:?w6, Y
//  479 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  480     OS_CPU_SR  cpu_sr;
//  481 #endif    
//  482     INT8U     *psrc;
//  483     INT8U     *pdest;
//  484 
//  485 
//  486     if (OSIntNesting > 0) {                                /* See if called from ISR ...               */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSMutexQuery_0
//  487         return (OS_ERR_QUERY_ISR);                         /* ... can't QUERY mutex from an ISR        */
        LD        A, #0x6
        JP        L:??OSMutexQuery_1
//  488     }
//  489 #if OS_ARG_CHK_EN > 0
//  490     if (pevent == (OS_EVENT *)0) {                         /* Validate 'pevent'                        */
??OSMutexQuery_0:
        LDW       X, S:?w7
        TNZW      X
        JRNE      L:??OSMutexQuery_2
//  491         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JP        L:??OSMutexQuery_1
//  492     }
//  493     if (pevent->OSEventType != OS_EVENT_TYPE_MUTEX) {      /* Validate event block type                */
??OSMutexQuery_2:
        LD        A, [S:?w7.w]
        CP        A, #0x4
        JREQ      L:??OSMutexQuery_3
//  494         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JP        L:??OSMutexQuery_1
//  495     }
//  496 #endif
//  497     OS_ENTER_CRITICAL();
??OSMutexQuery_3:
        CALL      L:CriticalEnter
        LD        (0x1,SP), A
//  498     pdata->OSMutexPIP  = (INT8U)(pevent->OSEventCnt >> 8);
        LDW       X, S:?w7
        ADDW      X, #0x2
        LDW       X, (X)
        CLR       A
        RRWA      X, A
        LD        A, XL
        LDW       X, S:?w6
        ADDW      X, #0xb
        LD        (X), A
//  499     pdata->OSOwnerPrio = (INT8U)(pevent->OSEventCnt & OS_MUTEX_KEEP_LOWER_8);
        LDW       X, S:?w7
        ADDW      X, #0x2
        LDW       X, (X)
        LD        A, XL
        LDW       X, S:?w6
        ADDW      X, #0xa
        LD        (X), A
//  500     if (pdata->OSOwnerPrio == 0xFF) {
        LDW       X, S:?w6
        ADDW      X, #0xa
        LD        A, (X)
        CP        A, #0xff
        JRNE      L:??OSMutexQuery_4
//  501         pdata->OSValue = 1;
        LDW       X, S:?w6
        ADDW      X, #0x9
        LD        A, #0x1
        LD        (X), A
        JRA       L:??OSMutexQuery_5
//  502     } else {
//  503         pdata->OSValue = 0;
??OSMutexQuery_4:
        LDW       X, S:?w6
        ADDW      X, #0x9
        CLR       A
        LD        (X), A
//  504     }
//  505     pdata->OSEventGrp  = pevent->OSEventGrp;               /* Copy wait list                           */
??OSMutexQuery_5:
        LDW       X, S:?w7
        INCW      X
        LD        A, (X)
        LDW       X, S:?w6
        ADDW      X, #0x8
        LD        (X), A
//  506     psrc               = &pevent->OSEventTbl[0];
        LDW       X, S:?w7
        ADDW      X, #0x6
        LDW       S:?w5, X
//  507     pdest              = &pdata->OSEventTbl[0];
        CALL      L:?mov_w4_w6
//  508 #if OS_EVENT_TBL_SIZE > 0
//  509     *pdest++           = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  510 #endif
//  511 
//  512 #if OS_EVENT_TBL_SIZE > 1
//  513     *pdest++           = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  514 #endif
//  515 
//  516 #if OS_EVENT_TBL_SIZE > 2
//  517     *pdest++           = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  518 #endif
//  519 
//  520 #if OS_EVENT_TBL_SIZE > 3
//  521     *pdest++           = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  522 #endif
//  523 
//  524 #if OS_EVENT_TBL_SIZE > 4
//  525     *pdest++           = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  526 #endif
//  527 
//  528 #if OS_EVENT_TBL_SIZE > 5
//  529     *pdest++           = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  530 #endif
//  531 
//  532 #if OS_EVENT_TBL_SIZE > 6
//  533     *pdest++           = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  534 #endif
//  535 
//  536 #if OS_EVENT_TBL_SIZE > 7
//  537     *pdest             = *psrc;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
//  538 #endif
//  539     OS_EXIT_CRITICAL();
        LD        A, (0x1,SP)
        CALL      L:CriticalExit
//  540     return (OS_NO_ERR);
        CLR       A
??OSMutexQuery_1:
        ADD       SP, #0x1
        JP        L:?epilogue_l2_l3
//  541 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  542 #endif                                                     /* OS_MUTEX_QUERY_EN                        */
//  543 #endif                                                     /* OS_MUTEX_EN                              */
// 
// 1 906 bytes in section .near_func.text
// 
// 1 906 bytes of CODE memory
//
//Errors: none
//Warnings: 2
