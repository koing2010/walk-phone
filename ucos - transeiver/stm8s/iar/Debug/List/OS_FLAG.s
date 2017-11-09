///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:53 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\ucos_II\OS_FLAG.C                            /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\ucos_II\OS_FLAG.C" -e -On --no_cse           /
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
//                    transeiver\stm8s\iar\Debug\List\OS_FLAG.s               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OS_FLAG



        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// E:\RDA1846s\walkphone program\ucos - transeiver\ucos_II\OS_FLAG.C
//    1 /*
//    2 *********************************************************************************************************
//    3 *                                                uC/OS-II
//    4 *                                          The Real-Time Kernel
//    5 *                                         EVENT FLAG  MANAGEMENT
//    6 *
//    7 *                          (c) Copyright 2001-2002, Jean J. Labrosse, Weston, FL
//    8 *                                           All Rights Reserved
//    9 *
//   10 * File : OS_FLAG.C
//   11 * By   : Jean J. Labrosse
//   12 *********************************************************************************************************
//   13 */
//   14 
//   15 #ifndef  OS_MASTER_FILE
//   16 #include "INCLUDES.H"
//   17 #endif
//   18 
//   19 #if (OS_VERSION >= 251) && (OS_FLAG_EN > 0) && (OS_MAX_FLAGS > 0)
//   20 /*
//   21 *********************************************************************************************************
//   22 *                                            LOCAL PROTOTYPES
//   23 *********************************************************************************************************
//   24 */
//   25 
//   26 static  void     OS_FlagBlock(OS_FLAG_GRP *pgrp, OS_FLAG_NODE *pnode, OS_FLAGS flags, INT8U wait_type, INT16U timeout);
//   27 static  BOOLEAN  OS_FlagTaskRdy(OS_FLAG_NODE *pnode, OS_FLAGS flags_rdy);
//   28 
//   29 /*$PAGE*/
//   30 /*
//   31 *********************************************************************************************************
//   32 *                              CHECK THE STATUS OF FLAGS IN AN EVENT FLAG GROUP
//   33 *
//   34 * Description: This function is called to check the status of a combination of bits to be set or cleared
//   35 *              in an event flag group.  Your application can check for ANY bit to be set/cleared or ALL
//   36 *              bits to be set/cleared.
//   37 *
//   38 *              This call does not block if the desired flags are not present.
//   39 *
//   40 * Arguments  : pgrp          is a pointer to the desired event flag group.
//   41 *
//   42 *              flags         Is a bit pattern indicating which bit(s) (i.e. flags) you wish to check.
//   43 *                            The bits you want are specified by setting the corresponding bits in
//   44 *                            'flags'.  e.g. if your application wants to wait for bits 0 and 1 then
//   45 *                            'flags' would contain 0x03.
//   46 *
//   47 *              wait_type     specifies whether you want ALL bits to be set/cleared or ANY of the bits
//   48 *                            to be set/cleared.
//   49 *                            You can specify the following argument:
//   50 *
//   51 *                            OS_FLAG_WAIT_CLR_ALL   You will check ALL bits in 'flags' to be clear (0)
//   52 *                            OS_FLAG_WAIT_CLR_ANY   You will check ANY bit  in 'flags' to be clear (0)
//   53 *                            OS_FLAG_WAIT_SET_ALL   You will check ALL bits in 'flags' to be set   (1)
//   54 *                            OS_FLAG_WAIT_SET_ANY   You will check ANY bit  in 'flags' to be set   (1)
//   55 *
//   56 *                            NOTE: Add OS_FLAG_CONSUME if you want the event flag to be 'consumed' by
//   57 *                                  the call.  Example, to wait for any flag in a group AND then clear
//   58 *                                  the flags that are present, set 'wait_type' to:
//   59 *
//   60 *                                  OS_FLAG_WAIT_SET_ANY + OS_FLAG_CONSUME
//   61 *
//   62 *              err           is a pointer to an error code and can be:
//   63 *                            OS_NO_ERR              No error
//   64 *                            OS_ERR_EVENT_TYPE      You are not pointing to an event flag group
//   65 *                            OS_FLAG_ERR_WAIT_TYPE  You didn't specify a proper 'wait_type' argument.
//   66 *                            OS_FLAG_INVALID_PGRP   You passed a NULL pointer instead of the event flag
//   67 *                                                   group handle.
//   68 *                            OS_FLAG_ERR_NOT_RDY    The desired flags you are waiting for are not
//   69 *                                                   available.
//   70 *
//   71 * Returns    : The state of the flags in the event flag group.
//   72 *
//   73 * Called from: Task or ISR
//   74 *********************************************************************************************************
//   75 */
//   76 
//   77 #if OS_FLAG_ACCEPT_EN > 0
//   78 OS_FLAGS  OSFlagAccept (OS_FLAG_GRP *pgrp, OS_FLAGS flags, INT8U wait_type, INT8U *err)
//   79 {
//   80 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//   81     OS_CPU_SR     cpu_sr;
//   82 #endif
//   83     OS_FLAGS      flags_cur;
//   84     OS_FLAGS      flags_rdy;
//   85     BOOLEAN       consume;
//   86 
//   87 
//   88 #if OS_ARG_CHK_EN > 0
//   89     if (pgrp == (OS_FLAG_GRP *)0) {                        /* Validate 'pgrp'                          */
//   90         *err = OS_FLAG_INVALID_PGRP;
//   91         return ((OS_FLAGS)0);
//   92     }
//   93     if (pgrp->OSFlagType != OS_EVENT_TYPE_FLAG) {          /* Validate event block type                */
//   94         *err = OS_ERR_EVENT_TYPE;
//   95         return ((OS_FLAGS)0);
//   96     }
//   97 #endif
//   98     if (wait_type & OS_FLAG_CONSUME) {                     /* See if we need to consume the flags      */
//   99         wait_type &= ~OS_FLAG_CONSUME;
//  100         consume    = TRUE;
//  101     } else {
//  102         consume    = FALSE;
//  103     }
//  104 /*$PAGE*/
//  105     *err = OS_NO_ERR;                                      /* Assume NO error until proven otherwise.  */
//  106     OS_ENTER_CRITICAL();
//  107     switch (wait_type) {
//  108         case OS_FLAG_WAIT_SET_ALL:                         /* See if all required flags are set        */
//  109              flags_rdy = pgrp->OSFlagFlags & flags;        /* Extract only the bits we want            */
//  110              if (flags_rdy == flags) {                     /* Must match ALL the bits that we want     */
//  111                  if (consume == TRUE) {                    /* See if we need to consume the flags      */
//  112                      pgrp->OSFlagFlags &= ~flags_rdy;      /* Clear ONLY the flags that we wanted      */
//  113                  }
//  114              } else {
//  115                  *err  = OS_FLAG_ERR_NOT_RDY;
//  116              }
//  117              flags_cur = pgrp->OSFlagFlags;                /* Will return the state of the group       */
//  118              OS_EXIT_CRITICAL();
//  119              break;
//  120 
//  121         case OS_FLAG_WAIT_SET_ANY:
//  122              flags_rdy = pgrp->OSFlagFlags & flags;        /* Extract only the bits we want            */
//  123              if (flags_rdy != (OS_FLAGS)0) {               /* See if any flag set                      */
//  124                  if (consume == TRUE) {                    /* See if we need to consume the flags      */
//  125                      pgrp->OSFlagFlags &= ~flags_rdy;      /* Clear ONLY the flags that we got         */
//  126                  }
//  127              } else {
//  128                  *err  = OS_FLAG_ERR_NOT_RDY;
//  129              }
//  130              flags_cur = pgrp->OSFlagFlags;                /* Will return the state of the group       */
//  131              OS_EXIT_CRITICAL();
//  132              break;
//  133 
//  134 #if OS_FLAG_WAIT_CLR_EN > 0
//  135         case OS_FLAG_WAIT_CLR_ALL:                         /* See if all required flags are cleared    */
//  136              flags_rdy = ~pgrp->OSFlagFlags & flags;       /* Extract only the bits we want            */
//  137              if (flags_rdy == flags) {                     /* Must match ALL the bits that we want     */
//  138                  if (consume == TRUE) {                    /* See if we need to consume the flags      */
//  139                      pgrp->OSFlagFlags |= flags_rdy;       /* Set ONLY the flags that we wanted        */
//  140                  }
//  141              } else {
//  142                  *err  = OS_FLAG_ERR_NOT_RDY;
//  143              }
//  144              flags_cur = pgrp->OSFlagFlags;                /* Will return the state of the group       */
//  145              OS_EXIT_CRITICAL();
//  146              break;
//  147 
//  148         case OS_FLAG_WAIT_CLR_ANY:
//  149              flags_rdy = ~pgrp->OSFlagFlags & flags;       /* Extract only the bits we want            */
//  150              if (flags_rdy != (OS_FLAGS)0) {               /* See if any flag cleared                  */
//  151                  if (consume == TRUE) {                    /* See if we need to consume the flags      */
//  152                      pgrp->OSFlagFlags |= flags_rdy;       /* Set ONLY the flags that we got           */
//  153                  }
//  154              } else {
//  155                  *err  = OS_FLAG_ERR_NOT_RDY;
//  156              }
//  157              flags_cur = pgrp->OSFlagFlags;                /* Will return the state of the group       */
//  158              OS_EXIT_CRITICAL();
//  159              break;
//  160 #endif
//  161 
//  162         default:
//  163              OS_EXIT_CRITICAL();
//  164              flags_cur = (OS_FLAGS)0;
//  165              *err      = OS_FLAG_ERR_WAIT_TYPE;
//  166              break;
//  167     }
//  168     return (flags_cur);
//  169 }
//  170 #endif
//  171 
//  172 /*$PAGE*/
//  173 /*
//  174 *********************************************************************************************************
//  175 *                                           CREATE AN EVENT FLAG
//  176 *
//  177 * Description: This function is called to create an event flag group.
//  178 *
//  179 * Arguments  : flags         Contains the initial value to store in the event flag group.
//  180 *
//  181 *              err           is a pointer to an error code which will be returned to your application:
//  182 *                               OS_NO_ERR                if the call was successful.
//  183 *                               OS_ERR_CREATE_ISR        if you attempted to create an Event Flag from an
//  184 *                                                        ISR.
//  185 *                               OS_FLAG_GRP_DEPLETED     if there are no more event flag groups
//  186 *
//  187 * Returns    : A pointer to an event flag group or a NULL pointer if no more groups are available.
//  188 *
//  189 * Called from: Task ONLY
//  190 *********************************************************************************************************
//  191 */
//  192 
//  193 OS_FLAG_GRP  *OSFlagCreate (OS_FLAGS flags, INT8U *err)
//  194 {
//  195 #if OS_CRITICAL_METHOD == 3                         /* Allocate storage for CPU status register        */
//  196     OS_CPU_SR    cpu_sr;
//  197 #endif
//  198     OS_FLAG_GRP *pgrp;
//  199 
//  200 
//  201     if (OSIntNesting > 0) {                         /* See if called from ISR ...                      */
//  202         *err = OS_ERR_CREATE_ISR;                   /* ... can't CREATE from an ISR                    */
//  203         return ((OS_FLAG_GRP *)0);
//  204     }
//  205     OS_ENTER_CRITICAL();
//  206     pgrp = OSFlagFreeList;                          /* Get next free event flag                        */
//  207     if (pgrp != (OS_FLAG_GRP *)0) {                 /* See if we have event flag groups available      */
//  208                                                     /* Adjust free list                                */
//  209         OSFlagFreeList       = (OS_FLAG_GRP *)OSFlagFreeList->OSFlagWaitList;
//  210         pgrp->OSFlagType     = OS_EVENT_TYPE_FLAG;  /* Set to event flag group type                    */
//  211         pgrp->OSFlagFlags    = flags;               /* Set to desired initial value                    */
//  212         pgrp->OSFlagWaitList = (void *)0;           /* Clear list of tasks waiting on flags            */
//  213         OS_EXIT_CRITICAL();
//  214         *err                 = OS_NO_ERR;
//  215     } else {
//  216         OS_EXIT_CRITICAL();
//  217         *err                 = OS_FLAG_GRP_DEPLETED;
//  218     }
//  219     return (pgrp);                                  /* Return pointer to event flag group              */
//  220 }
//  221 
//  222 /*$PAGE*/
//  223 /*
//  224 *********************************************************************************************************
//  225 *                                     DELETE AN EVENT FLAG GROUP
//  226 *
//  227 * Description: This function deletes an event flag group and readies all tasks pending on the event flag
//  228 *              group.
//  229 *
//  230 * Arguments  : pgrp          is a pointer to the desired event flag group.
//  231 *
//  232 *              opt           determines delete options as follows:
//  233 *                            opt == OS_DEL_NO_PEND   Deletes the event flag group ONLY if no task pending
//  234 *                            opt == OS_DEL_ALWAYS    Deletes the event flag group even if tasks are
//  235 *                                                    waiting.  In this case, all the tasks pending will be
//  236 *                                                    readied.
//  237 *
//  238 *              err           is a pointer to an error code that can contain one of the following values:
//  239 *                            OS_NO_ERR               The call was successful and the event flag group was
//  240 *                                                    deleted
//  241 *                            OS_ERR_DEL_ISR          If you attempted to delete the event flag group from
//  242 *                                                    an ISR
//  243 *                            OS_FLAG_INVALID_PGRP    If 'pgrp' is a NULL pointer.
//  244 *                            OS_ERR_EVENT_TYPE       If you didn't pass a pointer to an event flag group
//  245 *                            OS_ERR_INVALID_OPT      An invalid option was specified
//  246 *                            OS_ERR_TASK_WAITING     One or more tasks were waiting on the event flag
//  247 *                                                    group.
//  248 *
//  249 * Returns    : pevent        upon error
//  250 *              (OS_EVENT *)0 if the semaphore was successfully deleted.
//  251 *
//  252 * Note(s)    : 1) This function must be used with care.  Tasks that would normally expect the presence of
//  253 *                 the event flag group MUST check the return code of OSFlagAccept() and OSFlagPend().
//  254 *              2) This call can potentially disable interrupts for a long time.  The interrupt disable
//  255 *                 time is directly proportional to the number of tasks waiting on the event flag group.
//  256 *********************************************************************************************************
//  257 */
//  258 
//  259 #if OS_FLAG_DEL_EN > 0
//  260 OS_FLAG_GRP  *OSFlagDel (OS_FLAG_GRP *pgrp, INT8U opt, INT8U *err)
//  261 {
//  262 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  263     OS_CPU_SR     cpu_sr;
//  264 #endif
//  265     BOOLEAN       tasks_waiting;
//  266     OS_FLAG_NODE *pnode;
//  267 
//  268 
//  269     if (OSIntNesting > 0) {                                /* See if called from ISR ...               */
//  270         *err = OS_ERR_DEL_ISR;                             /* ... can't DELETE from an ISR             */
//  271         return (pgrp);
//  272     }
//  273 #if OS_ARG_CHK_EN > 0
//  274     if (pgrp == (OS_FLAG_GRP *)0) {                        /* Validate 'pgrp'                          */
//  275         *err = OS_FLAG_INVALID_PGRP;
//  276         return (pgrp);
//  277     }
//  278     if (pgrp->OSFlagType != OS_EVENT_TYPE_FLAG) {          /* Validate event group type                */
//  279         *err = OS_ERR_EVENT_TYPE;
//  280         return (pgrp);
//  281     }
//  282 #endif
//  283     OS_ENTER_CRITICAL();
//  284     if (pgrp->OSFlagWaitList != (void *)0) {               /* See if any tasks waiting on event flags  */
//  285         tasks_waiting = TRUE;                              /* Yes                                      */
//  286     } else {
//  287         tasks_waiting = FALSE;                             /* No                                       */
//  288     }
//  289     switch (opt) {
//  290         case OS_DEL_NO_PEND:                               /* Delete group if no task waiting          */
//  291              if (tasks_waiting == FALSE) {
//  292                  pgrp->OSFlagType     = OS_EVENT_TYPE_UNUSED;
//  293                  pgrp->OSFlagWaitList = (void *)OSFlagFreeList; /* Return group to free list           */
//  294                  OSFlagFreeList       = pgrp;
//  295                  OS_EXIT_CRITICAL();
//  296                  *err                 = OS_NO_ERR;
//  297                  return ((OS_FLAG_GRP *)0);                /* Event Flag Group has been deleted        */
//  298              } else {
//  299                  OS_EXIT_CRITICAL();
//  300                  *err                 = OS_ERR_TASK_WAITING;
//  301                  return (pgrp);
//  302              }
//  303 
//  304         case OS_DEL_ALWAYS:                                /* Always delete the event flag group       */
//  305              pnode = (OS_FLAG_NODE *)pgrp->OSFlagWaitList;
//  306              while (pnode != (OS_FLAG_NODE *)0) {          /* Ready ALL tasks waiting for flags        */
//  307                  OS_FlagTaskRdy(pnode, (OS_FLAGS)0);
//  308                  pnode = (OS_FLAG_NODE *)pnode->OSFlagNodeNext;
//  309              }
//  310              pgrp->OSFlagType     = OS_EVENT_TYPE_UNUSED;
//  311              pgrp->OSFlagWaitList = (void *)OSFlagFreeList;/* Return group to free list                */
//  312              OSFlagFreeList       = pgrp;
//  313              OS_EXIT_CRITICAL();
//  314              if (tasks_waiting == TRUE) {                  /* Reschedule only if task(s) were waiting  */
//  315                  OS_Sched();                               /* Find highest priority task ready to run  */
//  316              }
//  317              *err = OS_NO_ERR;
//  318              return ((OS_FLAG_GRP *)0);                    /* Event Flag Group has been deleted        */
//  319 
//  320         default:
//  321              OS_EXIT_CRITICAL();
//  322              *err = OS_ERR_INVALID_OPT;
//  323              return (pgrp);
//  324     }
//  325 }
//  326 #endif
//  327 /*$PAGE*/
//  328 /*
//  329 *********************************************************************************************************
//  330 *                                        WAIT ON AN EVENT FLAG GROUP
//  331 *
//  332 * Description: This function is called to wait for a combination of bits to be set in an event flag
//  333 *              group.  Your application can wait for ANY bit to be set or ALL bits to be set.
//  334 *
//  335 * Arguments  : pgrp          is a pointer to the desired event flag group.
//  336 *
//  337 *              flags         Is a bit pattern indicating which bit(s) (i.e. flags) you wish to wait for.
//  338 *                            The bits you want are specified by setting the corresponding bits in
//  339 *                            'flags'.  e.g. if your application wants to wait for bits 0 and 1 then
//  340 *                            'flags' would contain 0x03.
//  341 *
//  342 *              wait_type     specifies whether you want ALL bits to be set or ANY of the bits to be set.
//  343 *                            You can specify the following argument:
//  344 *
//  345 *                            OS_FLAG_WAIT_CLR_ALL   You will wait for ALL bits in 'mask' to be clear (0)
//  346 *                            OS_FLAG_WAIT_SET_ALL   You will wait for ALL bits in 'mask' to be set   (1)
//  347 *                            OS_FLAG_WAIT_CLR_ANY   You will wait for ANY bit  in 'mask' to be clear (0)
//  348 *                            OS_FLAG_WAIT_SET_ANY   You will wait for ANY bit  in 'mask' to be set   (1)
//  349 *
//  350 *                            NOTE: Add OS_FLAG_CONSUME if you want the event flag to be 'consumed' by
//  351 *                                  the call.  Example, to wait for any flag in a group AND then clear
//  352 *                                  the flags that are present, set 'wait_type' to:
//  353 *
//  354 *                                  OS_FLAG_WAIT_SET_ANY + OS_FLAG_CONSUME
//  355 *
//  356 *              timeout       is an optional timeout (in clock ticks) that your task will wait for the
//  357 *                            desired bit combination.  If you specify 0, however, your task will wait
//  358 *                            forever at the specified event flag group or, until a message arrives.
//  359 *
//  360 *              err           is a pointer to an error code and can be:
//  361 *                            OS_NO_ERR              The desired bits have been set within the specified
//  362 *                                                   'timeout'.
//  363 *                            OS_ERR_PEND_ISR        If you tried to PEND from an ISR
//  364 *                            OS_FLAG_INVALID_PGRP   If 'pgrp' is a NULL pointer.
//  365 *                            OS_ERR_EVENT_TYPE      You are not pointing to an event flag group
//  366 *                            OS_TIMEOUT             The bit(s) have not been set in the specified
//  367 *                                                   'timeout'.
//  368 *                            OS_FLAG_ERR_WAIT_TYPE  You didn't specify a proper 'wait_type' argument.
//  369 *
//  370 * Returns    : The new state of the flags in the event flag group when the task is resumed or,
//  371 *              0 if a timeout or an error occurred.
//  372 *
//  373 * Called from: Task ONLY
//  374 *********************************************************************************************************
//  375 */
//  376 
//  377 OS_FLAGS  OSFlagPend (OS_FLAG_GRP *pgrp, OS_FLAGS flags, INT8U wait_type, INT16U timeout, INT8U *err)
//  378 {
//  379 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  380     OS_CPU_SR     cpu_sr;
//  381 #endif
//  382     OS_FLAG_NODE  node;
//  383     OS_FLAGS      flags_cur;
//  384     OS_FLAGS      flags_rdy;
//  385     BOOLEAN       consume;
//  386 
//  387 
//  388     if (OSIntNesting > 0) {                                /* See if called from ISR ...               */
//  389         *err = OS_ERR_PEND_ISR;                            /* ... can't PEND from an ISR               */
//  390         return ((OS_FLAGS)0);
//  391     }
//  392 #if OS_ARG_CHK_EN > 0
//  393     if (pgrp == (OS_FLAG_GRP *)0) {                        /* Validate 'pgrp'                          */
//  394         *err = OS_FLAG_INVALID_PGRP;
//  395         return ((OS_FLAGS)0);
//  396     }
//  397     if (pgrp->OSFlagType != OS_EVENT_TYPE_FLAG) {          /* Validate event block type                */
//  398         *err = OS_ERR_EVENT_TYPE;
//  399         return ((OS_FLAGS)0);
//  400     }
//  401 #endif
//  402     if (wait_type & OS_FLAG_CONSUME) {                     /* See if we need to consume the flags      */
//  403         wait_type &= ~OS_FLAG_CONSUME;
//  404         consume    = TRUE;
//  405     } else {
//  406         consume    = FALSE;
//  407     }
//  408 /*$PAGE*/
//  409     OS_ENTER_CRITICAL();
//  410     switch (wait_type) {
//  411         case OS_FLAG_WAIT_SET_ALL:                         /* See if all required flags are set        */
//  412              flags_rdy = pgrp->OSFlagFlags & flags;        /* Extract only the bits we want            */
//  413              if (flags_rdy == flags) {                     /* Must match ALL the bits that we want     */
//  414                  if (consume == TRUE) {                    /* See if we need to consume the flags      */
//  415                      pgrp->OSFlagFlags &= ~flags_rdy;      /* Clear ONLY the flags that we wanted      */
//  416                  }
//  417                  flags_cur = pgrp->OSFlagFlags;            /* Will return the state of the group       */
//  418                  OS_EXIT_CRITICAL();                       /* Yes, condition met, return to caller     */
//  419                  *err      = OS_NO_ERR;
//  420                  return (flags_cur);
//  421              } else {                                      /* Block task until events occur or timeout */
//  422                  OS_FlagBlock(pgrp, &node, flags, wait_type, timeout);
//  423                  OS_EXIT_CRITICAL();
//  424              }
//  425              break;
//  426 
//  427         case OS_FLAG_WAIT_SET_ANY:
//  428              flags_rdy = pgrp->OSFlagFlags & flags;        /* Extract only the bits we want            */
//  429              if (flags_rdy != (OS_FLAGS)0) {               /* See if any flag set                      */
//  430                  if (consume == TRUE) {                    /* See if we need to consume the flags      */
//  431                      pgrp->OSFlagFlags &= ~flags_rdy;      /* Clear ONLY the flags that we got         */
//  432                  }
//  433                  flags_cur = pgrp->OSFlagFlags;            /* Will return the state of the group       */
//  434                  OS_EXIT_CRITICAL();                       /* Yes, condition met, return to caller     */
//  435                  *err      = OS_NO_ERR;
//  436                  return (flags_cur);
//  437              } else {                                      /* Block task until events occur or timeout */
//  438                  OS_FlagBlock(pgrp, &node, flags, wait_type, timeout);
//  439                  OS_EXIT_CRITICAL();
//  440              }
//  441              break;
//  442 
//  443 #if OS_FLAG_WAIT_CLR_EN > 0
//  444         case OS_FLAG_WAIT_CLR_ALL:                         /* See if all required flags are cleared    */
//  445              flags_rdy = ~pgrp->OSFlagFlags & flags;       /* Extract only the bits we want            */
//  446              if (flags_rdy == flags) {                     /* Must match ALL the bits that we want     */
//  447                  if (consume == TRUE) {                    /* See if we need to consume the flags      */
//  448                      pgrp->OSFlagFlags |= flags_rdy;       /* Set ONLY the flags that we wanted        */
//  449                  }
//  450                  flags_cur = pgrp->OSFlagFlags;            /* Will return the state of the group       */
//  451                  OS_EXIT_CRITICAL();                       /* Yes, condition met, return to caller     */
//  452                  *err      = OS_NO_ERR;
//  453                  return (flags_cur);
//  454              } else {                                      /* Block task until events occur or timeout */
//  455                  OS_FlagBlock(pgrp, &node, flags, wait_type, timeout);
//  456                  OS_EXIT_CRITICAL();
//  457              }
//  458              break;
//  459 
//  460         case OS_FLAG_WAIT_CLR_ANY:
//  461              flags_rdy = ~pgrp->OSFlagFlags & flags;       /* Extract only the bits we want            */
//  462              if (flags_rdy != (OS_FLAGS)0) {               /* See if any flag cleared                  */
//  463                  if (consume == TRUE) {                    /* See if we need to consume the flags      */
//  464                      pgrp->OSFlagFlags |= flags_rdy;       /* Set ONLY the flags that we got           */
//  465                  }
//  466                  flags_cur = pgrp->OSFlagFlags;            /* Will return the state of the group       */
//  467                  OS_EXIT_CRITICAL();                       /* Yes, condition met, return to caller     */
//  468                  *err      = OS_NO_ERR;
//  469                  return (flags_cur);
//  470              } else {                                      /* Block task until events occur or timeout */
//  471                  OS_FlagBlock(pgrp, &node, flags, wait_type, timeout);
//  472                  OS_EXIT_CRITICAL();
//  473              }
//  474              break;
//  475 #endif
//  476 
//  477         default:
//  478              OS_EXIT_CRITICAL();
//  479              flags_cur = (OS_FLAGS)0;
//  480              *err      = OS_FLAG_ERR_WAIT_TYPE;
//  481              return (flags_cur);
//  482     }
//  483     OS_Sched();                                            /* Find next HPT ready to run               */
//  484     OS_ENTER_CRITICAL();
//  485     if (OSTCBCur->OSTCBStat & OS_STAT_FLAG) {              /* Have we timed-out?                       */
//  486         OS_FlagUnlink(&node);
//  487         OSTCBCur->OSTCBStat = OS_STAT_RDY;                 /* Yes, make task ready-to-run              */
//  488         OS_EXIT_CRITICAL();
//  489         flags_cur           = (OS_FLAGS)0;
//  490         *err                = OS_TIMEOUT;                  /* Indicate that we timed-out waiting       */
//  491     } else {
//  492         if (consume == TRUE) {                             /* See if we need to consume the flags      */
//  493             switch (wait_type) {
//  494                 case OS_FLAG_WAIT_SET_ALL:
//  495                 case OS_FLAG_WAIT_SET_ANY:                 /* Clear ONLY the flags we got              */
//  496                      pgrp->OSFlagFlags &= ~OSTCBCur->OSTCBFlagsRdy;
//  497                      break;
//  498 
//  499 #if OS_FLAG_WAIT_CLR_EN > 0
//  500                 case OS_FLAG_WAIT_CLR_ALL:
//  501                 case OS_FLAG_WAIT_CLR_ANY:                 /* Set   ONLY the flags we got              */
//  502                      pgrp->OSFlagFlags |= OSTCBCur->OSTCBFlagsRdy;
//  503                      break;
//  504 #endif
//  505             }
//  506         }
//  507         flags_cur = pgrp->OSFlagFlags;
//  508         OS_EXIT_CRITICAL();
//  509         *err      = OS_NO_ERR;                             /* Event(s) must have occurred              */
//  510     }
//  511     return (flags_cur);
//  512 }
//  513 /*$PAGE*/
//  514 /*
//  515 *********************************************************************************************************
//  516 *                                         POST EVENT FLAG BIT(S)
//  517 *
//  518 * Description: This function is called to set or clear some bits in an event flag group.  The bits to
//  519 *              set or clear are specified by a 'bit mask'.
//  520 *
//  521 * Arguments  : pgrp          is a pointer to the desired event flag group.
//  522 *
//  523 *              flags         If 'opt' (see below) is OS_FLAG_SET, each bit that is set in 'flags' will
//  524 *                            set the corresponding bit in the event flag group.  e.g. to set bits 0, 4
//  525 *                            and 5 you would set 'flags' to:
//  526 *
//  527 *                                0x31     (note, bit 0 is least significant bit)
//  528 *
//  529 *                            If 'opt' (see below) is OS_FLAG_CLR, each bit that is set in 'flags' will
//  530 *                            CLEAR the corresponding bit in the event flag group.  e.g. to clear bits 0,
//  531 *                            4 and 5 you would specify 'flags' as:
//  532 *
//  533 *                                0x31     (note, bit 0 is least significant bit)
//  534 *
//  535 *              opt           indicates whether the flags will be:
//  536 *                                set     (OS_FLAG_SET) or
//  537 *                                cleared (OS_FLAG_CLR)
//  538 *
//  539 *              err           is a pointer to an error code and can be:
//  540 *                            OS_NO_ERR              The call was successfull
//  541 *                            OS_FLAG_INVALID_PGRP   You passed a NULL pointer
//  542 *                            OS_ERR_EVENT_TYPE      You are not pointing to an event flag group
//  543 *                            OS_FLAG_INVALID_OPT    You specified an invalid option
//  544 *
//  545 * Returns    : the new value of the event flags bits that are still set.
//  546 *
//  547 * Called From: Task or ISR
//  548 *
//  549 * WARNING(s) : 1) The execution time of this function depends on the number of tasks waiting on the event
//  550 *                 flag group.
//  551 *              2) The amount of time interrupts are DISABLED depends on the number of tasks waiting on
//  552 *                 the event flag group.
//  553 *********************************************************************************************************
//  554 */
//  555 OS_FLAGS  OSFlagPost (OS_FLAG_GRP *pgrp, OS_FLAGS flags, INT8U opt, INT8U *err)
//  556 {
//  557 #if OS_CRITICAL_METHOD == 3                          /* Allocate storage for CPU status register       */
//  558     OS_CPU_SR     cpu_sr;
//  559 #endif
//  560     OS_FLAG_NODE *pnode;
//  561     BOOLEAN       sched;
//  562     OS_FLAGS      flags_cur;
//  563     OS_FLAGS      flags_rdy;
//  564 
//  565 
//  566 #if OS_ARG_CHK_EN > 0
//  567     if (pgrp == (OS_FLAG_GRP *)0) {                  /* Validate 'pgrp'                                */
//  568         *err = OS_FLAG_INVALID_PGRP;
//  569         return ((OS_FLAGS)0);
//  570     }
//  571     if (pgrp->OSFlagType != OS_EVENT_TYPE_FLAG) {    /* Make sure we are pointing to an event flag grp */
//  572         *err = OS_ERR_EVENT_TYPE;
//  573         return ((OS_FLAGS)0);
//  574     }
//  575 #endif
//  576 /*$PAGE*/
//  577     OS_ENTER_CRITICAL();
//  578     switch (opt) {
//  579         case OS_FLAG_CLR:
//  580              pgrp->OSFlagFlags &= ~flags;            /* Clear the flags specified in the group         */
//  581              break;
//  582 
//  583         case OS_FLAG_SET:
//  584              pgrp->OSFlagFlags |=  flags;            /* Set   the flags specified in the group         */
//  585              break;
//  586 
//  587         default:
//  588              OS_EXIT_CRITICAL();                     /* INVALID option                                 */
//  589              *err = OS_FLAG_INVALID_OPT;
//  590              return ((OS_FLAGS)0);
//  591     }
//  592     sched = FALSE;                                   /* Indicate that we don't need rescheduling       */
//  593     pnode = (OS_FLAG_NODE *)pgrp->OSFlagWaitList;
//  594     while (pnode != (OS_FLAG_NODE *)0) {             /* Go through all tasks waiting on event flag(s)  */
//  595         switch (pnode->OSFlagNodeWaitType) {
//  596             case OS_FLAG_WAIT_SET_ALL:               /* See if all req. flags are set for current node */
//  597                  flags_rdy = pgrp->OSFlagFlags & pnode->OSFlagNodeFlags;
//  598                  if (flags_rdy == pnode->OSFlagNodeFlags) {
//  599                      if (OS_FlagTaskRdy(pnode, flags_rdy) == TRUE) { /* Make task RTR, event(s) Rx'd   */
//  600                          sched = TRUE;                               /* When done we will reschedule   */
//  601                      }
//  602                  }
//  603                  break;
//  604 
//  605             case OS_FLAG_WAIT_SET_ANY:               /* See if any flag set                            */
//  606                  flags_rdy = pgrp->OSFlagFlags & pnode->OSFlagNodeFlags;
//  607                  if (flags_rdy != (OS_FLAGS)0) {
//  608                      if (OS_FlagTaskRdy(pnode, flags_rdy) == TRUE) { /* Make task RTR, event(s) Rx'd   */
//  609                          sched = TRUE;                               /* When done we will reschedule   */
//  610                      }
//  611                  }
//  612                  break;
//  613 
//  614 #if OS_FLAG_WAIT_CLR_EN > 0
//  615             case OS_FLAG_WAIT_CLR_ALL:               /* See if all req. flags are set for current node */
//  616                  flags_rdy = ~pgrp->OSFlagFlags & pnode->OSFlagNodeFlags;
//  617                  if (flags_rdy == pnode->OSFlagNodeFlags) {
//  618                      if (OS_FlagTaskRdy(pnode, flags_rdy) == TRUE) { /* Make task RTR, event(s) Rx'd   */
//  619                          sched = TRUE;                               /* When done we will reschedule   */
//  620                      }
//  621                  }
//  622                  break;
//  623 
//  624             case OS_FLAG_WAIT_CLR_ANY:               /* See if any flag set                            */
//  625                  flags_rdy = ~pgrp->OSFlagFlags & pnode->OSFlagNodeFlags;
//  626                  if (flags_rdy != (OS_FLAGS)0) {
//  627                      if (OS_FlagTaskRdy(pnode, flags_rdy) == TRUE) { /* Make task RTR, event(s) Rx'd   */
//  628                          sched = TRUE;                               /* When done we will reschedule   */
//  629                      }
//  630                  }
//  631                  break;
//  632 #endif
//  633         }
//  634         pnode = (OS_FLAG_NODE *)pnode->OSFlagNodeNext; /* Point to next task waiting for event flag(s) */
//  635     }
//  636     OS_EXIT_CRITICAL();
//  637     if (sched == TRUE) {
//  638         OS_Sched();
//  639     }
//  640     OS_ENTER_CRITICAL();
//  641     flags_cur = pgrp->OSFlagFlags;
//  642     OS_EXIT_CRITICAL();
//  643     *err      = OS_NO_ERR;
//  644     return (flags_cur);
//  645 }
//  646 /*$PAGE*/
//  647 /*
//  648 *********************************************************************************************************
//  649 *                                           QUERY EVENT FLAG
//  650 *
//  651 * Description: This function is used to check the value of the event flag group.
//  652 *
//  653 * Arguments  : pgrp         is a pointer to the desired event flag group.
//  654 *
//  655 *              err           is a pointer to an error code returned to the called:
//  656 *                            OS_NO_ERR              The call was successfull
//  657 *                            OS_FLAG_INVALID_PGRP   You passed a NULL pointer
//  658 *                            OS_ERR_EVENT_TYPE      You are not pointing to an event flag group
//  659 *
//  660 * Returns    : The current value of the event flag group.
//  661 *
//  662 * Called From: Task or ISR
//  663 *********************************************************************************************************
//  664 */
//  665 
//  666 #if OS_FLAG_QUERY_EN > 0
//  667 OS_FLAGS  OSFlagQuery (OS_FLAG_GRP *pgrp, INT8U *err)
//  668 {
//  669 #if OS_CRITICAL_METHOD == 3                       /* Allocate storage for CPU status register          */
//  670     OS_CPU_SR  cpu_sr;
//  671 #endif
//  672     OS_FLAGS   flags;
//  673 
//  674 
//  675 #if OS_ARG_CHK_EN > 0
//  676     if (pgrp == (OS_FLAG_GRP *)0) {               /* Validate 'pgrp'                                   */
//  677         *err = OS_FLAG_INVALID_PGRP;
//  678         return ((OS_FLAGS)0);
//  679     }
//  680     if (pgrp->OSFlagType != OS_EVENT_TYPE_FLAG) { /* Validate event block type                         */
//  681         *err = OS_ERR_EVENT_TYPE;
//  682         return ((OS_FLAGS)0);
//  683     }
//  684 #endif
//  685     OS_ENTER_CRITICAL();
//  686     flags = pgrp->OSFlagFlags;
//  687     OS_EXIT_CRITICAL();
//  688     *err = OS_NO_ERR;
//  689     return (flags);                               /* Return the current value of the event flags       */
//  690 }
//  691 #endif
//  692 
//  693 /*$PAGE*/
//  694 /*
//  695 *********************************************************************************************************
//  696 *                         SUSPEND TASK UNTIL EVENT FLAG(s) RECEIVED OR TIMEOUT OCCURS
//  697 *
//  698 * Description: This function is internal to uC/OS-II and is used to put a task to sleep until the desired
//  699 *              event flag bit(s) are set.
//  700 *
//  701 * Arguments  : pgrp          is a pointer to the desired event flag group.
//  702 *
//  703 *              pnode         is a pointer to a structure which contains data about the task waiting for
//  704 *                            event flag bit(s) to be set.
//  705 *
//  706 *              flags         Is a bit pattern indicating which bit(s) (i.e. flags) you wish to check.
//  707 *                            The bits you want are specified by setting the corresponding bits in
//  708 *                            'flags'.  e.g. if your application wants to wait for bits 0 and 1 then
//  709 *                            'flags' would contain 0x03.
//  710 *
//  711 *              wait_type     specifies whether you want ALL bits to be set/cleared or ANY of the bits
//  712 *                            to be set/cleared.
//  713 *                            You can specify the following argument:
//  714 *
//  715 *                            OS_FLAG_WAIT_CLR_ALL   You will check ALL bits in 'mask' to be clear (0)
//  716 *                            OS_FLAG_WAIT_CLR_ANY   You will check ANY bit  in 'mask' to be clear (0)
//  717 *                            OS_FLAG_WAIT_SET_ALL   You will check ALL bits in 'mask' to be set   (1)
//  718 *                            OS_FLAG_WAIT_SET_ANY   You will check ANY bit  in 'mask' to be set   (1)
//  719 *
//  720 *              timeout       is the desired amount of time that the task will wait for the event flag
//  721 *                            bit(s) to be set.
//  722 *
//  723 * Returns    : none
//  724 *
//  725 * Called by  : OSFlagPend()  OS_FLAG.C
//  726 *
//  727 * Note(s)    : This function is INTERNAL to uC/OS-II and your application should not call it.
//  728 *********************************************************************************************************
//  729 */
//  730 
//  731 static  void  OS_FlagBlock (OS_FLAG_GRP *pgrp, OS_FLAG_NODE *pnode, OS_FLAGS flags, INT8U wait_type, INT16U timeout)
//  732 {
//  733     OS_FLAG_NODE  *pnode_next;
//  734 
//  735 
//  736     OSTCBCur->OSTCBStat      |= OS_STAT_FLAG;
//  737     OSTCBCur->OSTCBDly        = timeout;              /* Store timeout in task's TCB                   */
//  738 #if OS_TASK_DEL_EN > 0
//  739     OSTCBCur->OSTCBFlagNode   = pnode;                /* TCB to link to node                           */
//  740 #endif
//  741     pnode->OSFlagNodeFlags    = flags;                /* Save the flags that we need to wait for       */
//  742     pnode->OSFlagNodeWaitType = wait_type;            /* Save the type of wait we are doing            */
//  743     pnode->OSFlagNodeTCB      = (void *)OSTCBCur;     /* Link to task's TCB                            */
//  744     pnode->OSFlagNodeNext     = pgrp->OSFlagWaitList; /* Add node at beginning of event flag wait list */
//  745     pnode->OSFlagNodePrev     = (void *)0;
//  746     pnode->OSFlagNodeFlagGrp  = (void *)pgrp;         /* Link to Event Flag Group                      */
//  747     pnode_next                = (OS_FLAG_NODE *)pgrp->OSFlagWaitList;
//  748     if (pnode_next != (void *)0) {                    /* Is this the first NODE to insert?             */
//  749         pnode_next->OSFlagNodePrev = pnode;           /* No, link in doubly linked list                */
//  750     }
//  751     pgrp->OSFlagWaitList = (void *)pnode;
//  752                                                       /* Suspend current task until flag(s) received   */
//  753     if ((OSRdyTbl[OSTCBCur->OSTCBY] &= ~OSTCBCur->OSTCBBitX) == 0) {
//  754         OSRdyGrp &= ~OSTCBCur->OSTCBBitY;
//  755     }
//  756 }
//  757 
//  758 /*$PAGE*/
//  759 /*
//  760 *********************************************************************************************************
//  761 *                                    INITIALIZE THE EVENT FLAG MODULE
//  762 *
//  763 * Description: This function is called by uC/OS-II to initialize the event flag module.  Your application
//  764 *              MUST NOT call this function.  In other words, this function is internal to uC/OS-II.
//  765 *
//  766 * Arguments  : none
//  767 *
//  768 * Returns    : none
//  769 *
//  770 * WARNING    : You MUST NOT call this function from your code.  This is an INTERNAL function to uC/OS-II.
//  771 *********************************************************************************************************
//  772 */
//  773 
//  774 void  OS_FlagInit (void)
//  775 {
//  776 #if OS_MAX_FLAGS == 1
//  777     OSFlagFreeList                 = (OS_FLAG_GRP *)&OSFlagTbl[0];  /* Only ONE event flag group!      */
//  778     OSFlagFreeList->OSFlagType     = OS_EVENT_TYPE_UNUSED;
//  779     OSFlagFreeList->OSFlagWaitList = (void *)0;
//  780 #endif
//  781 
//  782 #if OS_MAX_FLAGS >= 2
//  783     INT8U        i;
//  784     OS_FLAG_GRP *pgrp1;
//  785     OS_FLAG_GRP *pgrp2;
//  786 
//  787 
//  788     pgrp1 = &OSFlagTbl[0];
//  789     pgrp2 = &OSFlagTbl[1];
//  790     for (i = 0; i < (OS_MAX_FLAGS - 1); i++) {                      /* Init. list of free EVENT FLAGS  */
//  791         pgrp1->OSFlagType     = OS_EVENT_TYPE_UNUSED;
//  792         pgrp1->OSFlagWaitList = (void *)pgrp2;
//  793         pgrp1++;
//  794         pgrp2++;
//  795     }
//  796     pgrp1->OSFlagWaitList = (void *)0;
//  797     OSFlagFreeList        = (OS_FLAG_GRP *)&OSFlagTbl[0];
//  798 #endif
//  799 }
//  800 
//  801 /*$PAGE*/
//  802 /*
//  803 *********************************************************************************************************
//  804 *                              MAKE TASK READY-TO-RUN, EVENT(s) OCCURRED
//  805 *
//  806 * Description: This function is internal to uC/OS-II and is used to make a task ready-to-run because the
//  807 *              desired event flag bits have been set.
//  808 *
//  809 * Arguments  : pnode         is a pointer to a structure which contains data about the task waiting for
//  810 *                            event flag bit(s) to be set.
//  811 *
//  812 *              flags_rdy     contains the bit pattern of the event flags that cause the task to become
//  813 *                            ready-to-run.
//  814 *
//  815 * Returns    : none
//  816 *
//  817 * Called by  : OSFlagsPost() OS_FLAG.C
//  818 *
//  819 * Note(s)    : 1) This function assumes that interrupts are disabled.
//  820 *              2) This function is INTERNAL to uC/OS-II and your application should not call it.
//  821 *********************************************************************************************************
//  822 */
//  823 
//  824 static  BOOLEAN  OS_FlagTaskRdy (OS_FLAG_NODE *pnode, OS_FLAGS flags_rdy)
//  825 {
//  826     OS_TCB   *ptcb;
//  827     BOOLEAN   sched;
//  828 
//  829 
//  830     ptcb                = (OS_TCB *)pnode->OSFlagNodeTCB;  /* Point to TCB of waiting task             */
//  831     ptcb->OSTCBDly      = 0;
//  832     ptcb->OSTCBFlagsRdy = flags_rdy;
//  833     ptcb->OSTCBStat    &= ~OS_STAT_FLAG;
//  834     if (ptcb->OSTCBStat == OS_STAT_RDY) {                  /* Put task into ready list                 */
//  835         OSRdyGrp               |= ptcb->OSTCBBitY;
//  836         OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
//  837         sched                   = TRUE;
//  838     } else {
//  839         sched                   = FALSE;
//  840     }
//  841     OS_FlagUnlink(pnode);
//  842     return (sched);
//  843 }
//  844 
//  845 /*$PAGE*/
//  846 /*
//  847 *********************************************************************************************************
//  848 *                                  UNLINK EVENT FLAG NODE FROM WAITING LIST
//  849 *
//  850 * Description: This function is internal to uC/OS-II and is used to unlink an event flag node from a
//  851 *              list of tasks waiting for the event flag.
//  852 *
//  853 * Arguments  : pnode         is a pointer to a structure which contains data about the task waiting for
//  854 *                            event flag bit(s) to be set.
//  855 *
//  856 * Returns    : none
//  857 *
//  858 * Called by  : OS_FlagTaskRdy() OS_FLAG.C
//  859 *              OSFlagPend()     OS_FLAG.C
//  860 *              OSTaskDel()      OS_TASK.C
//  861 *
//  862 * Note(s)    : 1) This function assumes that interrupts are disabled.
//  863 *              2) This function is INTERNAL to uC/OS-II and your application should not call it.
//  864 *********************************************************************************************************
//  865 */
//  866 
//  867 void  OS_FlagUnlink (OS_FLAG_NODE *pnode)
//  868 {
//  869 #if OS_TASK_DEL_EN > 0
//  870     OS_TCB       *ptcb;
//  871 #endif
//  872     OS_FLAG_GRP  *pgrp;
//  873     OS_FLAG_NODE *pnode_prev;
//  874     OS_FLAG_NODE *pnode_next;
//  875 
//  876 
//  877     pnode_prev = (OS_FLAG_NODE *)pnode->OSFlagNodePrev;
//  878     pnode_next = (OS_FLAG_NODE *)pnode->OSFlagNodeNext;
//  879     if (pnode_prev == (OS_FLAG_NODE *)0) {                      /* Is it first node in wait list?      */
//  880         pgrp                 = (OS_FLAG_GRP *)pnode->OSFlagNodeFlagGrp;
//  881         pgrp->OSFlagWaitList = (void *)pnode_next;              /*      Update list for new 1st node   */
//  882         if (pnode_next != (OS_FLAG_NODE *)0) {
//  883             pnode_next->OSFlagNodePrev = (OS_FLAG_NODE *)0;     /*      Link new 1st node PREV to NULL */
//  884         }
//  885     } else {                                                    /* No,  A node somewhere in the list   */
//  886         pnode_prev->OSFlagNodeNext = pnode_next;                /*      Link around the node to unlink */
//  887         if (pnode_next != (OS_FLAG_NODE *)0) {                  /*      Was this the LAST node?        */
//  888             pnode_next->OSFlagNodePrev = pnode_prev;            /*      No, Link around current node   */
//  889         }
//  890     }
//  891 #if OS_TASK_DEL_EN > 0
//  892     ptcb                = (OS_TCB *)pnode->OSFlagNodeTCB;
//  893     ptcb->OSTCBFlagNode = (OS_FLAG_NODE *)0;
//  894 #endif
//  895 }
//  896 #endif
// 
//
// 
//
//
//Errors: none
//Warnings: none
