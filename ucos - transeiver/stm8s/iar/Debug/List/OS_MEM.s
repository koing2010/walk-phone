///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:53 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\ucos_II\OS_MEM.C                             /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\ucos_II\OS_MEM.C" -e -On --no_cse            /
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
//                    transeiver\stm8s\iar\Debug\List\OS_MEM.s                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OS_MEM

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b12
        EXTERN ?dec32_l0_l0
        EXTERN ?dec32_l1_l1
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?inc32_l0_l0
        EXTERN ?inc32_l2_l2
        EXTERN ?load32_0x_l0
        EXTERN ?load32_0x_l1
        EXTERN ?load32_0x_l3
        EXTERN ?load32_l0_0x
        EXTERN ?load32_l0_dbsp
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l1_l3
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?mul16_x_x_w0
        EXTERN ?pop_w7
        EXTERN ?push_l1
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w7
        EXTERN ?sub32_l0_l0_0x
        EXTERN ?ucmp32_c_l0_0x
        EXTERN ?ucmp32_c_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN OSMemFreeList
        EXTERN OSMemTbl

        PUBLIC OSMemCreate
        PUBLIC OSMemGet
        PUBLIC OSMemPut
        PUBLIC OSMemQuery
        PUBLIC OS_MemInit

// E:\RDA1846s\walkphone program\ucos - transeiver\ucos_II\OS_MEM.C
//    1 /*
//    2 *********************************************************************************************************
//    3 *                                                uC/OS-II
//    4 *                                          The Real-Time Kernel
//    5 *                                            MEMORY MANAGEMENT
//    6 *
//    7 *                          (c) Copyright 1992-2002, Jean J. Labrosse, Weston, FL
//    8 *                                           All Rights Reserved
//    9 *
//   10 * File : OS_MEM.C
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
//   19 #if (OS_MEM_EN > 0) && (OS_MAX_MEM_PART > 0)
//   20 /*
//   21 *********************************************************************************************************
//   22 *                                        CREATE A MEMORY PARTITION
//   23 *
//   24 * Description : Create a fixed-sized memory partition that will be managed by uC/OS-II.
//   25 *
//   26 * Arguments   : addr     is the starting address of the memory partition
//   27 *
//   28 *               nblks    is the number of memory blocks to create from the partition.
//   29 *
//   30 *               blksize  is the size (in bytes) of each block in the memory partition.
//   31 *
//   32 *               err      is a pointer to a variable containing an error message which will be set by
//   33 *                        this function to either:
//   34 *
//   35 *                        OS_NO_ERR            if the memory partition has been created correctly.
//   36 *                        OS_MEM_INVALID_ADDR  you are specifying an invalid address for the memory 
//   37 *                                             storage of the partition.
//   38 *                        OS_MEM_INVALID_PART  no free partitions available
//   39 *                        OS_MEM_INVALID_BLKS  user specified an invalid number of blocks (must be >= 2)
//   40 *                        OS_MEM_INVALID_SIZE  user specified an invalid block size
//   41 *                                             (must be greater than the size of a pointer)
//   42 * Returns    : != (OS_MEM *)0  is the partition was created
//   43 *              == (OS_MEM *)0  if the partition was not created because of invalid arguments or, no
//   44 *                              free partition is available.
//   45 *********************************************************************************************************
//   46 */
//   47 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   48 OS_MEM  *OSMemCreate (void *addr, INT32U nblks, INT32U blksize, INT8U *err)
//   49 {
OSMemCreate:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        CALL      L:?push_l1
        PUSHW     Y
        SUB       SP, #0x7
        CALL      L:?mov_l3_l0
//   50 #if OS_CRITICAL_METHOD == 3                           /* Allocate storage for CPU status register      */
//   51     OS_CPU_SR  cpu_sr;
//   52 #endif    
//   53     OS_MEM    *pmem;
//   54     INT8U     *pblk;
//   55     void     **plink;
//   56     INT32U     i;
//   57 
//   58 
//   59 #if OS_ARG_CHK_EN > 0
//   60     if (addr == (void *)0) {                          /* Must pass a valid address for the memory part. */
        LDW       X, (0xe,SP)
        TNZW      X
        JRNE      L:??OSMemCreate_0
//   61         *err = OS_MEM_INVALID_ADDR;
        LDW       X, (0x8,SP)
        LD        A, #0x76
        LD        (X), A
//   62         return ((OS_MEM *)0);
        CLRW      X
        JP        L:??OSMemCreate_1
//   63     }
//   64     if (nblks < 2) {                                  /* Must have at least 2 blocks per partition      */
??OSMemCreate_0:
        LDW       X, S:?w6
        CPW       X, #0x0
        JRNE      L:??OSMemCreate_2
        LDW       X, S:?w7
        CPW       X, #0x2
??OSMemCreate_2:
        JRNC      L:??OSMemCreate_3
//   65         *err = OS_MEM_INVALID_BLKS;
        LDW       X, (0x8,SP)
        LD        A, #0x6f
        LD        (X), A
//   66         return ((OS_MEM *)0);
        CLRW      X
        JP        L:??OSMemCreate_1
//   67     }
//   68     if (blksize < sizeof(void *)) {                   /* Must contain space for at least a pointer      */
??OSMemCreate_3:
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0xa
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??OSMemCreate_4
        LDW       X, S:?w1
        CPW       X, #0x2
??OSMemCreate_4:
        JRNC      L:??OSMemCreate_5
//   69         *err = OS_MEM_INVALID_SIZE;
        LDW       X, (0x8,SP)
        LD        A, #0x70
        LD        (X), A
//   70         return ((OS_MEM *)0);
        CLRW      X
        JP        L:??OSMemCreate_1
//   71     }
//   72 #endif
//   73     OS_ENTER_CRITICAL();
??OSMemCreate_5:
        CALL      L:CriticalEnter
        LD        (0x5,SP), A
//   74     pmem = OSMemFreeList;                             /* Get next free memory partition                */
        LDW       X, L:OSMemFreeList
        LDW       (0x1,SP), X
//   75     if (OSMemFreeList != (OS_MEM *)0) {               /* See if pool of free partitions was empty      */
        LDW       X, L:OSMemFreeList
        TNZW      X
        JREQ      L:??OSMemCreate_6
//   76         OSMemFreeList = (OS_MEM *)OSMemFreeList->OSMemFreeList;
        LDW       X, L:OSMemFreeList
        INCW      X
        INCW      X
        LDW       X, (X)
        LDW       L:OSMemFreeList, X
//   77     }
//   78     OS_EXIT_CRITICAL();
??OSMemCreate_6:
        LD        A, (0x5,SP)
        CALL      L:CriticalExit
//   79     if (pmem == (OS_MEM *)0) {                        /* See if we have a memory partition             */
        LDW       X, (0x1,SP)
        TNZW      X
        JRNE      L:??OSMemCreate_7
//   80         *err = OS_MEM_INVALID_PART;
        LDW       X, (0x8,SP)
        LD        A, #0x6e
        LD        (X), A
//   81         return ((OS_MEM *)0);
        CLRW      X
        JRA       L:??OSMemCreate_1
//   82     }
//   83     plink = (void **)addr;                            /* Create linked list of free memory blocks      */
??OSMemCreate_7:
        LDW       X, (0xe,SP)
        LDW       (0x6,SP), X
//   84     pblk  = (INT8U *)addr + blksize;
        LDW       X, (0xc,SP)
        ADDW      X, (0xe,SP)
        LDW       (0x3,SP), X
//   85     for (i = 0; i < (nblks - 1); i++) {
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
        CALL      L:?mov_l2_l0
??OSMemCreate_8:
        CALL      L:?mov_l1_l3
        CALL      L:?dec32_l1_l1
        CALL      L:?mov_l0_l2
        CALL      L:?ucmp32_c_l0_l1
        JRNC      L:??OSMemCreate_9
//   86         *plink = (void *)pblk;
        LDW       Y, (0x3,SP)
        LDW       X, (0x6,SP)
        LDW       (X), Y
//   87         plink  = (void **)pblk;
        LDW       X, (0x3,SP)
        LDW       (0x6,SP), X
//   88         pblk   = pblk + blksize;
        LDW       X, (0xc,SP)
        ADDW      X, (0x3,SP)
        LDW       (0x3,SP), X
//   89     }
        CALL      L:?inc32_l2_l2
        JRA       L:??OSMemCreate_8
//   90     *plink              = (void *)0;                  /* Last memory block points to NULL              */
??OSMemCreate_9:
        LDW       Y, (0x6,SP)
        CLRW      X
        LDW       (Y), X
//   91     pmem->OSMemAddr     = addr;                       /* Store start address of memory partition       */
        LDW       Y, (0xe,SP)
        LDW       X, (0x1,SP)
        LDW       (X), Y
//   92     pmem->OSMemFreeList = addr;                       /* Initialize pointer to pool of free blocks     */
        LDW       X, (0x1,SP)
        INCW      X
        INCW      X
        LDW       Y, (0xe,SP)
        LDW       (X), Y
//   93     pmem->OSMemNFree    = nblks;                      /* Store number of free blocks in MCB            */
        LDW       X, (0x1,SP)
        ADDW      X, #0xc
        CALL      L:?load32_0x_l3
//   94     pmem->OSMemNBlks    = nblks;
        LDW       X, (0x1,SP)
        ADDW      X, #0x8
        CALL      L:?load32_0x_l3
//   95     pmem->OSMemBlkSize  = blksize;                    /* Store block size of each memory blocks        */
        LDW       Y, (0x1,SP)
        ADDW      Y, #0x4
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0xa
        CODE
        LDW       X, Y
        CALL      L:?load32_0x_l0
//   96     *err                = OS_NO_ERR;
        LDW       X, (0x8,SP)
        CLR       A
        LD        (X), A
//   97     return (pmem);
        LDW       X, (0x1,SP)
??OSMemCreate_1:
        ADD       SP, #0xf
        JP        L:?epilogue_l2_l3
//   98 }
//   99 /*$PAGE*/
//  100 /*
//  101 *********************************************************************************************************
//  102 *                                          GET A MEMORY BLOCK
//  103 *
//  104 * Description : Get a memory block from a partition
//  105 *
//  106 * Arguments   : pmem    is a pointer to the memory partition control block
//  107 *
//  108 *               err     is a pointer to a variable containing an error message which will be set by this
//  109 *                       function to either:
//  110 *
//  111 *                       OS_NO_ERR           if the memory partition has been created correctly.
//  112 *                       OS_MEM_NO_FREE_BLKS if there are no more free memory blocks to allocate to caller
//  113 *                       OS_MEM_INVALID_PMEM if you passed a NULL pointer for 'pmem'
//  114 *
//  115 * Returns     : A pointer to a memory block if no error is detected
//  116 *               A pointer to NULL if an error is detected
//  117 *********************************************************************************************************
//  118 */
//  119 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  120 void  *OSMemGet (OS_MEM *pmem, INT8U *err)
//  121 {
OSMemGet:
        CALL      L:?push_l2
        CALL      L:?push_w7
        PUSH      S:?b12
        LDW       S:?w4, X
        LDW       S:?w5, Y
//  122 #if OS_CRITICAL_METHOD == 3                           /* Allocate storage for CPU status register      */
//  123     OS_CPU_SR  cpu_sr;
//  124 #endif    
//  125     void      *pblk;
//  126 
//  127 
//  128 #if OS_ARG_CHK_EN > 0
//  129     if (pmem == (OS_MEM *)0) {                        /* Must point to a valid memory partition         */
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSMemGet_0
//  130         *err = OS_MEM_INVALID_PMEM;
        LD        A, #0x74
        LD        [S:?w5.w], A
//  131         return ((OS_MEM *)0);
        CLRW      X
        JRA       L:??OSMemGet_1
//  132     }
//  133 #endif
//  134     OS_ENTER_CRITICAL();
??OSMemGet_0:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  135     if (pmem->OSMemNFree > 0) {                       /* See if there are any free memory blocks       */
        LDW       X, S:?w4
        ADDW      X, #0xc
        CALL      L:?load32_l0_0x
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??OSMemGet_2
        LDW       X, S:?w1
        CPW       X, #0x0
??OSMemGet_2:
        JREQ      L:??OSMemGet_3
//  136         pblk                = pmem->OSMemFreeList;    /* Yes, point to next free memory block          */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       S:?w7, X
//  137         pmem->OSMemFreeList = *(void **)pblk;         /*      Adjust pointer to new free list          */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       Y, X
        LDW       X, [S:?w7.w]
        LDW       (Y), X
//  138         pmem->OSMemNFree--;                           /*      One less memory block in this partition  */
        LDW       X, S:?w4
        ADDW      X, #0xc
        CALL      L:?load32_l0_0x
        CALL      L:?dec32_l0_l0
        LDW       X, S:?w4
        ADDW      X, #0xc
        CALL      L:?load32_0x_l0
//  139         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  140         *err = OS_NO_ERR;                             /*      No error                                 */
        CLR       A
        LD        [S:?w5.w], A
//  141         return (pblk);                                /*      Return memory block to caller            */
        LDW       X, S:?w7
        JRA       L:??OSMemGet_1
//  142     }
//  143     OS_EXIT_CRITICAL();
??OSMemGet_3:
        LD        A, S:?b12
        CALL      L:CriticalExit
//  144     *err = OS_MEM_NO_FREE_BLKS;                       /* No,  Notify caller of empty memory partition  */
        LD        A, #0x71
        LD        [S:?w5.w], A
//  145     return ((void *)0);                               /*      Return NULL pointer to caller            */
        CLRW      X
??OSMemGet_1:
        POP       S:?b12
        CALL      L:?pop_w7
        JP        L:?epilogue_l2
//  146 }
//  147 /*$PAGE*/
//  148 /*
//  149 *********************************************************************************************************
//  150 *                                         RELEASE A MEMORY BLOCK
//  151 *
//  152 * Description : Returns a memory block to a partition
//  153 *
//  154 * Arguments   : pmem    is a pointer to the memory partition control block
//  155 *
//  156 *               pblk    is a pointer to the memory block being released.
//  157 *
//  158 * Returns     : OS_NO_ERR            if the memory block was inserted into the partition
//  159 *               OS_MEM_FULL          if you are returning a memory block to an already FULL memory 
//  160 *                                    partition (You freed more blocks than you allocated!)
//  161 *               OS_MEM_INVALID_PMEM  if you passed a NULL pointer for 'pmem'
//  162 *               OS_MEM_INVALID_PBLK  if you passed a NULL pointer for the block to release.
//  163 *********************************************************************************************************
//  164 */
//  165 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  166 INT8U  OSMemPut (OS_MEM  *pmem, void *pblk)
//  167 {
OSMemPut:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w4, X
        LDW       S:?w5, Y
//  168 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  169     OS_CPU_SR  cpu_sr;
//  170 #endif    
//  171     
//  172     
//  173 #if OS_ARG_CHK_EN > 0
//  174     if (pmem == (OS_MEM *)0) {                   /* Must point to a valid memory partition             */
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSMemPut_0
//  175         return (OS_MEM_INVALID_PMEM);
        LD        A, #0x74
        JRA       L:??OSMemPut_1
//  176     }
//  177     if (pblk == (void *)0) {                     /* Must release a valid block                         */
??OSMemPut_0:
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSMemPut_2
//  178         return (OS_MEM_INVALID_PBLK);
        LD        A, #0x73
        JRA       L:??OSMemPut_1
//  179     }
//  180 #endif
//  181     OS_ENTER_CRITICAL();
??OSMemPut_2:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  182     if (pmem->OSMemNFree >= pmem->OSMemNBlks) {  /* Make sure all blocks not already returned          */
        LDW       X, S:?w4
        ADDW      X, #0x8
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0xc
        CALL      L:?load32_l0_0x
        LDW       X, Y
        CALL      L:?ucmp32_c_l0_0x
        JRC       L:??OSMemPut_3
//  183         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  184         return (OS_MEM_FULL);
        LD        A, #0x72
        JRA       L:??OSMemPut_1
//  185     }
//  186     *(void **)pblk      = pmem->OSMemFreeList;   /* Insert released block into free block list         */
??OSMemPut_3:
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       [S:?w5.w], X
//  187     pmem->OSMemFreeList = pblk;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       Y, X
        LDW       X, S:?w5
        LDW       (Y), X
//  188     pmem->OSMemNFree++;                          /* One more memory block in this partition            */
        LDW       X, S:?w4
        ADDW      X, #0xc
        CALL      L:?load32_l0_0x
        CALL      L:?inc32_l0_l0
        LDW       X, S:?w4
        ADDW      X, #0xc
        CALL      L:?load32_0x_l0
//  189     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  190     return (OS_NO_ERR);                          /* Notify caller that memory block was released       */
        CLR       A
??OSMemPut_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//  191 }
//  192 /*$PAGE*/
//  193 /*
//  194 *********************************************************************************************************
//  195 *                                          QUERY MEMORY PARTITION
//  196 *
//  197 * Description : This function is used to determine the number of free memory blocks and the number of
//  198 *               used memory blocks from a memory partition.
//  199 *
//  200 * Arguments   : pmem    is a pointer to the memory partition control block
//  201 *
//  202 *               pdata   is a pointer to a structure that will contain information about the memory
//  203 *                       partition.
//  204 *
//  205 * Returns     : OS_NO_ERR            If no errors were found.
//  206 *               OS_MEM_INVALID_PMEM  if you passed a NULL pointer for 'pmem'
//  207 *               OS_MEM_INVALID_PDATA if you passed a NULL pointer for the block to release.
//  208 *********************************************************************************************************
//  209 */
//  210 
//  211 #if OS_MEM_QUERY_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  212 INT8U  OSMemQuery (OS_MEM *pmem, OS_MEM_DATA *pdata)
//  213 {
OSMemQuery:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w5, X
        LDW       S:?w4, Y
//  214 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  215     OS_CPU_SR  cpu_sr;
//  216 #endif    
//  217     
//  218     
//  219 #if OS_ARG_CHK_EN > 0
//  220     if (pmem == (OS_MEM *)0) {                   /* Must point to a valid memory partition             */
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSMemQuery_0
//  221         return (OS_MEM_INVALID_PMEM);
        LD        A, #0x74
        JRA       L:??OSMemQuery_1
//  222     }
//  223     if (pdata == (OS_MEM_DATA *)0) {             /* Must release a valid storage area for the data     */
??OSMemQuery_0:
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSMemQuery_2
//  224         return (OS_MEM_INVALID_PDATA);
        LD        A, #0x75
        JRA       L:??OSMemQuery_1
//  225     }
//  226 #endif
//  227     OS_ENTER_CRITICAL();
??OSMemQuery_2:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  228     pdata->OSAddr     = pmem->OSMemAddr;
        LDW       X, [S:?w5.w]
        LDW       [S:?w4.w], X
//  229     pdata->OSFreeList = pmem->OSMemFreeList;
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  230     pdata->OSBlkSize  = pmem->OSMemBlkSize;
        LDW       X, S:?w5
        ADDW      X, #0x4
        CALL      L:?load32_l0_0x
        LDW       X, S:?w4
        ADDW      X, #0x4
        CALL      L:?load32_0x_l0
//  231     pdata->OSNBlks    = pmem->OSMemNBlks;
        LDW       X, S:?w5
        ADDW      X, #0x8
        CALL      L:?load32_l0_0x
        LDW       X, S:?w4
        ADDW      X, #0x8
        CALL      L:?load32_0x_l0
//  232     pdata->OSNFree    = pmem->OSMemNFree;
        LDW       X, S:?w5
        ADDW      X, #0xc
        CALL      L:?load32_l0_0x
        LDW       X, S:?w4
        ADDW      X, #0xc
        CALL      L:?load32_0x_l0
//  233     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  234     pdata->OSNUsed    = pdata->OSNBlks - pdata->OSNFree;
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x8
        CALL      L:?load32_l0_0x
        LDW       X, Y
        CALL      L:?sub32_l0_l0_0x
        LDW       X, S:?w4
        ADDW      X, #0x10
        CALL      L:?load32_0x_l0
//  235     return (OS_NO_ERR);
        CLR       A
??OSMemQuery_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//  236 }
//  237 #endif                                           /* OS_MEM_QUERY_EN                                    */
//  238 /*$PAGE*/
//  239 /*
//  240 *********************************************************************************************************
//  241 *                                    INITIALIZE MEMORY PARTITION MANAGER
//  242 *
//  243 * Description : This function is called by uC/OS-II to initialize the memory partition manager.  Your
//  244 *               application MUST NOT call this function.
//  245 *
//  246 * Arguments   : none
//  247 *
//  248 * Returns     : none
//  249 *
//  250 * Note(s)    : This function is INTERNAL to uC/OS-II and your application should not call it.
//  251 *********************************************************************************************************
//  252 */
//  253 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  254 void  OS_MemInit (void)
//  255 {
//  256 #if OS_MAX_MEM_PART == 1
//  257     OSMemFreeList                = (OS_MEM *)&OSMemTbl[0]; /* Point to beginning of free list          */
//  258     OSMemFreeList->OSMemFreeList = (void *)0;              /* Initialize last node                     */
//  259     OSMemFreeList->OSMemAddr     = (void *)0;              /* Store start address of memory partition  */
//  260     OSMemFreeList->OSMemNFree    = 0;                      /* No free blocks                           */
//  261     OSMemFreeList->OSMemNBlks    = 0;                      /* No blocks                                */
//  262     OSMemFreeList->OSMemBlkSize  = 0;                      /* Zero size                                */
//  263 #endif
//  264 
//  265 #if OS_MAX_MEM_PART >= 2
//  266     OS_MEM  *pmem;
//  267     INT16U   i;
//  268 
//  269 
//  270     pmem = (OS_MEM *)&OSMemTbl[0];                    /* Point to memory control block (MCB)           */
OS_MemInit:
        LDW       X, #OSMemTbl
        LDW       Y, X
//  271     for (i = 0; i < (OS_MAX_MEM_PART - 1); i++) {     /* Init. list of free memory partitions          */
        CLRW      X
        LDW       S:?w1, X
??OS_MemInit_0:
        LDW       X, S:?w1
        CPW       X, #0x7
        JRNC      L:??OS_MemInit_1
//  272         pmem->OSMemFreeList = (void *)&OSMemTbl[i+1]; /* Chain list of free partitions                 */
        LDW       X, #0x10
        LDW       S:?w0, X
        LDW       X, S:?w1
        CALL      L:?mul16_x_x_w0
        ADDW      X, #OSMemTbl + 16
        LDW       S:?w0, X
        LDW       X, Y
        ADDW      X, #0x2
        LDW       S:?w2, X
        LDW       X, S:?w0
        LDW       [S:?w2.w], X
//  273         pmem->OSMemAddr     = (void *)0;              /* Store start address of memory partition       */
        CLRW      X
        LDW       (Y), X
//  274         pmem->OSMemNFree    = 0;                      /* No free blocks                                */
        LDW       X, Y
        ADDW      X, #0xc
        LDW       S:?w0, X
        CLRW      X
        LDW       S:?w3, X
        LDW       S:?w2, X
        LDW       X, S:?w0
        CALL      L:?load32_0x_l1
//  275         pmem->OSMemNBlks    = 0;                      /* No blocks                                     */
        LDW       X, Y
        ADDW      X, #0x8
        LDW       S:?w0, X
        CLRW      X
        LDW       S:?w3, X
        LDW       S:?w2, X
        LDW       X, S:?w0
        CALL      L:?load32_0x_l1
//  276         pmem->OSMemBlkSize  = 0;                      /* Zero size                                     */
        LDW       X, Y
        ADDW      X, #0x4
        LDW       S:?w0, X
        CLRW      X
        LDW       S:?w3, X
        LDW       S:?w2, X
        LDW       X, S:?w0
        CALL      L:?load32_0x_l1
//  277         pmem++;
        ADDW      Y, #0x10
//  278     }
        LDW       X, S:?w1
        INCW      X
        LDW       S:?w1, X
        JRA       L:??OS_MemInit_0
//  279     pmem->OSMemFreeList = (void *)0;                  /* Initialize last node                          */
??OS_MemInit_1:
        LDW       X, Y
        ADDW      X, #0x2
        LDW       S:?w0, X
        CLRW      X
        LDW       [S:?w0.w], X
//  280     pmem->OSMemAddr     = (void *)0;                  /* Store start address of memory partition       */
        CLRW      X
        LDW       (Y), X
//  281     pmem->OSMemNFree    = 0;                          /* No free blocks                                */
        LDW       X, Y
        ADDW      X, #0xc
        LDW       S:?w0, X
        CLRW      X
        LDW       S:?w3, X
        LDW       S:?w2, X
        LDW       X, S:?w0
        CALL      L:?load32_0x_l1
//  282     pmem->OSMemNBlks    = 0;                          /* No blocks                                     */
        LDW       X, Y
        ADDW      X, #0x8
        LDW       S:?w0, X
        CLRW      X
        LDW       S:?w3, X
        LDW       S:?w2, X
        LDW       X, S:?w0
        CALL      L:?load32_0x_l1
//  283     pmem->OSMemBlkSize  = 0;                          /* Zero size                                     */
        LDW       X, Y
        ADDW      X, #0x4
        LDW       S:?w0, X
        CLRW      X
        LDW       S:?w3, X
        LDW       S:?w2, X
        LDW       X, S:?w0
        CALL      L:?load32_0x_l1
//  284 
//  285     OSMemFreeList       = (OS_MEM *)&OSMemTbl[0];     /* Point to beginning of free list               */
        LDW       X, #OSMemTbl
        LDW       L:OSMemFreeList, X
//  286 #endif
//  287 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  288 #endif                                           /* OS_MEM_EN                                          */
// 
// 814 bytes in section .near_func.text
// 
// 814 bytes of CODE memory
//
//Errors: none
//Warnings: 2
