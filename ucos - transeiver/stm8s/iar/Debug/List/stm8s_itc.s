///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:37 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_itc.c          /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_itc.c -e -Oh   /
//                    --debug --code_model small --data_model medium -o       /
//                    E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\Obj\ --dlib_config   /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.0\stm8\LIB\dlstm8smn.h" -D STM8S207 -lB               /
//                    E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\                /
//                    --diag_suppress pa089 -I E:\HWT\HWT_OS\ucos\stm8s\iar\. /
//                    .\..\ucos_ii\ -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\..\uco /
//                    s_ii\iarstm8\ -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\src\   /
//                    -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\fwlib\inc\ --vregs   /
//                    16                                                      /
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_itc.s     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_itc

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?sll8_a_a_b0
        EXTERN ?srl8_a_a_b0

        PUBLIC ITC_DeInit
        PUBLIC ITC_GetCPUCC
        PUBLIC ITC_GetSoftIntStatus
        PUBLIC ITC_GetSoftwarePriority
        PUBLIC ITC_SetSoftwarePriority

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_itc.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_itc.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the ITC peripheral.
//    8   ******************************************************************************
//    9   * @attention
//   10   *
//   11   * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
//   12   * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
//   13   * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
//   14   * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
//   15   * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
//   16   * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
//   17   *
//   18   * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
//   19   ******************************************************************************
//   20   */
//   21 
//   22 /* Includes ------------------------------------------------------------------*/
//   23 #include "stm8s_itc.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 /* Private functions ---------------------------------------------------------*/
//   34 
//   35 /** @addtogroup ITC_Private_Functions
//   36   * @{
//   37   */
//   38 
//   39 /**
//   40   * @brief  Utility function used to read CC register.
//   41   * @param  None
//   42   * @retval CPU CC register value
//   43   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   44 uint8_t ITC_GetCPUCC(void)
//   45 {
//   46 #ifdef _COSMIC_
//   47   _asm("push cc");
//   48   _asm("pop a");
//   49   return; /* Ignore compiler warning, the returned value is in A register */
//   50 #elif defined _RAISONANCE_ /* _RAISONANCE_ */
//   51   return _getCC_();
//   52 #else /* _IAR_ */
//   53   asm("push cc");
ITC_GetCPUCC:
        push cc
//   54   asm("pop a");
        pop a
//   55   return 0;
        CLR       A
        RET
//   56 #endif /* _COSMIC_*/
//   57 }
//   58 
//   59 
//   60 /**
//   61   * @}
//   62   */
//   63 
//   64 /* Public functions ----------------------------------------------------------*/
//   65 
//   66 /** @addtogroup ITC_Public_Functions
//   67   * @{
//   68   */
//   69 
//   70 /**
//   71   * @brief  Deinitializes the ITC registers to their default reset value.
//   72   * @param  None
//   73   * @retval None
//   74   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   75 void ITC_DeInit(void)
//   76 {
//   77     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
ITC_DeInit:
        MOV       L:0x7f70, #0xff
//   78     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f71, #0xff
//   79     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f72, #0xff
//   80     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f73, #0xff
//   81     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f74, #0xff
//   82     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f75, #0xff
//   83     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f76, #0xff
//   84     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f77, #0xff
//   85 }
        RET
//   86 
//   87 /**
//   88   * @brief  Gets the interrupt software priority bits (I1, I0) value from CPU CC register.
//   89   * @param  None
//   90   * @retval The interrupt software priority bits value.
//   91   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   92 uint8_t ITC_GetSoftIntStatus(void)
//   93 {
//   94     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
ITC_GetSoftIntStatus:
        CALL      L:ITC_GetCPUCC
        AND       A, #0x28
        RET
//   95 }
//   96 
//   97 /**
//   98   * @brief  Gets the software priority of the specified interrupt source.
//   99   * @param  IrqNum : Specifies the peripheral interrupt source.
//  100   * @retval ITC_PriorityLevel_TypeDef : Specifies the software priority of the interrupt source.
//  101   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  102 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
//  103 {
ITC_GetSoftwarePriority:
        LD        S:?b3, A
//  104 
//  105     uint8_t Value = 0;
        CLR       S:?b2
//  106     uint8_t Mask = 0;
//  107 
//  108     /* Check function parameters */
//  109     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
//  110 
//  111     /* Define the mask corresponding to the bits position in the SPR register */
//  112     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
        CALL      L:?Subroutine0
??CrossCallReturnLabel_1:
        LD        S:?b0, A
//  113 
//  114     switch (IrqNum)
        LD        A, S:?b3
        JREQ      L:??ITC_GetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        SUB       A, #0x3
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_6
        JRA       L:??ITC_GetSoftwarePriority_7
//  115     {
//  116     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
//  117     case ITC_IRQ_AWU:
//  118     case ITC_IRQ_CLK:
//  119     case ITC_IRQ_PORTA:
//  120         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_0:
        LD        A, S:?b0
        AND       A, L:0x7f70
        JRA       L:??ITC_GetSoftwarePriority_8
//  121         break;
//  122     case ITC_IRQ_PORTB:
//  123     case ITC_IRQ_PORTC:
//  124     case ITC_IRQ_PORTD:
//  125     case ITC_IRQ_PORTE:
//  126         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_1:
        LD        A, S:?b0
        AND       A, L:0x7f71
        JRA       L:??ITC_GetSoftwarePriority_8
//  127         break;
//  128 #if defined(STM8S208) || defined(STM8AF52Ax)
//  129     case ITC_IRQ_CAN_RX:
//  130     case ITC_IRQ_CAN_TX:
//  131 #endif /*STM8S208 or STM8AF52Ax */
//  132 
//  133 #ifdef STM8S903
//  134     case ITC_IRQ_PORTF:
//  135 #endif /*STM8S903*/
//  136 
//  137     case ITC_IRQ_SPI:
//  138     case ITC_IRQ_TIM1_OVF:
//  139         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_2:
        LD        A, S:?b0
        AND       A, L:0x7f72
        JRA       L:??ITC_GetSoftwarePriority_8
//  140         break;
//  141     case ITC_IRQ_TIM1_CAPCOM:
//  142 #ifdef STM8S903
//  143     case ITC_IRQ_TIM5_OVFTRI:
//  144     case ITC_IRQ_TIM5_CAPCOM:
//  145 #else
//  146     case ITC_IRQ_TIM2_OVF:
//  147     case ITC_IRQ_TIM2_CAPCOM:
//  148 #endif /*STM8S903*/
//  149 
//  150     case ITC_IRQ_TIM3_OVF:
//  151         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_3:
        LD        A, S:?b0
        AND       A, L:0x7f73
        JRA       L:??ITC_GetSoftwarePriority_8
//  152         break;
//  153     case ITC_IRQ_TIM3_CAPCOM:
//  154     case ITC_IRQ_UART1_TX:
//  155     case ITC_IRQ_UART1_RX:
//  156     case ITC_IRQ_I2C:
//  157         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_4:
        LD        A, S:?b0
        AND       A, L:0x7f74
        JRA       L:??ITC_GetSoftwarePriority_8
//  158         break;
//  159 #if defined(STM8S105) || defined(STM8AF626x)
//  160     case ITC_IRQ_UART2_TX:
//  161     case ITC_IRQ_UART2_RX:
//  162 #endif /*STM8S105 or STM8AF626x*/
//  163 
//  164 #if defined(STM8S208) || defined(STM8S207) || defined(STM8AF52Ax) || defined(STM8AF62Ax)
//  165     case ITC_IRQ_UART3_TX:
//  166     case ITC_IRQ_UART3_RX:
//  167     case ITC_IRQ_ADC2:
//  168 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
//  169 
//  170 #if defined(STM8S105) ||defined(STM8S103) ||defined(STM8S905) || defined(STM8AF626x)
//  171     case ITC_IRQ_ADC1:
//  172 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
//  173 
//  174 #ifdef STM8S903
//  175     case ITC_IRQ_TIM6_OVFTRI:
//  176 #else
//  177     case ITC_IRQ_TIM4_OVF:
//  178 #endif /*STM8S903*/
//  179         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_5:
        LD        A, S:?b0
        AND       A, L:0x7f75
        JRA       L:??ITC_GetSoftwarePriority_8
//  180         break;
//  181     case ITC_IRQ_EEPROM_EEC:
//  182         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_6:
        LD        A, S:?b0
        AND       A, L:0x7f76
??ITC_GetSoftwarePriority_8:
        LD        S:?b2, A
//  183         break;
//  184     default:
//  185         break;
//  186     }
//  187 
//  188     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
//  189 
//  190     return((ITC_PriorityLevel_TypeDef)Value);
??ITC_GetSoftwarePriority_7:
        MOV       S:?b0, S:?b1
        LD        A, S:?b2
        JP        L:?srl8_a_a_b0
//  191 
//  192 }

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        AND       A, #0x3
        SLL       A
        LD        S:?b1, A
        LD        A, #0x3
        MOV       S:?b0, S:?b1
        JP        L:?sll8_a_a_b0
//  193 
//  194 /**
//  195   * @brief  Sets the software priority of the specified interrupt source.
//  196   * @note   - The modification of the software priority is only possible when
//  197   *         the interrupts are disabled.
//  198   *         - The normal behavior is to disable the interrupt before calling
//  199   *         this function, and re-enable it after.
//  200   *         - The priority level 0 cannot be set (see product specification
//  201   *         for more details).
//  202   * @param  IrqNum : Specifies the peripheral interrupt source.
//  203   * @param  PriorityValue : Specifies the software priority value to set,
//  204   *         can be a value of @ref  ITC_PriorityLevel_TypeDef .
//  205   * @retval None
//  206 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  207 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
//  208 {
ITC_SetSoftwarePriority:
        LD        S:?b3, A
        MOV       S:?b4, S:?b0
//  209 
//  210     uint8_t Mask = 0;
//  211     uint8_t NewPriority = 0;
//  212 
//  213     /* Check function parameters */
//  214     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
//  215     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
//  216 
//  217     /* Check if interrupts are disabled */
//  218     assert_param(IS_ITC_INTERRUPTS_DISABLED);
//  219 
//  220     /* Define the mask corresponding to the bits position in the SPR register */
//  221     /* The mask is reversed in order to clear the 2 bits after more easily */
//  222     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
        CALL      L:?Subroutine0
??CrossCallReturnLabel_0:
        LD        S:?b2, A
        CPL       S:?b2
//  223 
//  224     /* Define the new priority to write */
//  225     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
        MOV       S:?b0, S:?b1
        LD        A, S:?b4
        CALL      L:?sll8_a_a_b0
        LD        S:?b0, A
//  226 
//  227     switch (IrqNum)
        LD        A, S:?b3
        JREQ      L:??ITC_SetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_1
        SUB       A, #0x3
        JREQ      L:??ITC_SetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        RET
//  228     {
//  229 
//  230     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
//  231     case ITC_IRQ_AWU:
//  232     case ITC_IRQ_CLK:
//  233     case ITC_IRQ_PORTA:
//  234         ITC->ISPR1 &= Mask;
??ITC_SetSoftwarePriority_0:
        LD        A, S:?b2
        AND       A, L:0x7f70
        LD        L:0x7f70, A
//  235         ITC->ISPR1 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f70
        LD        L:0x7f70, A
//  236         break;
        RET
//  237 
//  238     case ITC_IRQ_PORTB:
//  239     case ITC_IRQ_PORTC:
//  240     case ITC_IRQ_PORTD:
//  241     case ITC_IRQ_PORTE:
//  242         ITC->ISPR2 &= Mask;
??ITC_SetSoftwarePriority_1:
        LD        A, S:?b2
        AND       A, L:0x7f71
        LD        L:0x7f71, A
//  243         ITC->ISPR2 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f71
        LD        L:0x7f71, A
//  244         break;
        RET
//  245 
//  246 #if defined(STM8S208) || defined(STM8AF52Ax)
//  247     case ITC_IRQ_CAN_RX:
//  248     case ITC_IRQ_CAN_TX:
//  249 #endif /*STM8S208 or STM8AF52Ax */
//  250 
//  251 #ifdef STM8S903
//  252     case ITC_IRQ_PORTF:
//  253 #endif /*STM8S903*/
//  254     case ITC_IRQ_SPI:
//  255     case ITC_IRQ_TIM1_OVF:
//  256         ITC->ISPR3 &= Mask;
??ITC_SetSoftwarePriority_2:
        LD        A, S:?b2
        AND       A, L:0x7f72
        LD        L:0x7f72, A
//  257         ITC->ISPR3 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f72
        LD        L:0x7f72, A
//  258         break;
        RET
//  259 
//  260     case ITC_IRQ_TIM1_CAPCOM:
//  261 #ifdef STM8S903
//  262     case ITC_IRQ_TIM5_OVFTRI:
//  263     case ITC_IRQ_TIM5_CAPCOM:
//  264 #else
//  265     case ITC_IRQ_TIM2_OVF:
//  266     case ITC_IRQ_TIM2_CAPCOM:
//  267 #endif /*STM8S903*/
//  268 
//  269     case ITC_IRQ_TIM3_OVF:
//  270         ITC->ISPR4 &= Mask;
??ITC_SetSoftwarePriority_3:
        LD        A, S:?b2
        AND       A, L:0x7f73
        LD        L:0x7f73, A
//  271         ITC->ISPR4 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f73
        LD        L:0x7f73, A
//  272         break;
        RET
//  273 
//  274     case ITC_IRQ_TIM3_CAPCOM:
//  275     case ITC_IRQ_UART1_TX:
//  276     case ITC_IRQ_UART1_RX:
//  277     case ITC_IRQ_I2C:
//  278         ITC->ISPR5 &= Mask;
??ITC_SetSoftwarePriority_4:
        LD        A, S:?b2
        AND       A, L:0x7f74
        LD        L:0x7f74, A
//  279         ITC->ISPR5 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f74
        LD        L:0x7f74, A
//  280         break;
        RET
//  281 
//  282 #if defined(STM8S105) || defined(STM8AF626x)
//  283     case ITC_IRQ_UART2_TX:
//  284     case ITC_IRQ_UART2_RX:
//  285 #endif /*STM8S105 or STM8AF626x */
//  286 
//  287 #if defined(STM8S208) || defined(STM8S207) || defined(STM8AF52Ax) || defined(STM8AF62Ax)
//  288     case ITC_IRQ_UART3_TX:
//  289     case ITC_IRQ_UART3_RX:
//  290     case ITC_IRQ_ADC2:
//  291 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
//  292 
//  293 #if defined(STM8S105) ||defined(STM8S103) ||defined(STM8S905) || defined(STM8AF626x)
//  294     case ITC_IRQ_ADC1:
//  295 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
//  296 
//  297 #ifdef STM8S903
//  298     case ITC_IRQ_TIM6_OVFTRI:
//  299 #else
//  300     case ITC_IRQ_TIM4_OVF:
//  301 #endif /*STM8S903*/
//  302         ITC->ISPR6 &= Mask;
??ITC_SetSoftwarePriority_5:
        LD        A, S:?b2
        AND       A, L:0x7f75
        LD        L:0x7f75, A
//  303         ITC->ISPR6 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f75
        LD        L:0x7f75, A
//  304         break;
        RET
//  305 
//  306     case ITC_IRQ_EEPROM_EEC:
//  307         ITC->ISPR7 &= Mask;
??ITC_SetSoftwarePriority_6:
        LD        A, S:?b2
        AND       A, L:0x7f76
        LD        L:0x7f76, A
//  308         ITC->ISPR7 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f76
        LD        L:0x7f76, A
//  309         break;
//  310 
//  311     default:
//  312         break;
//  313 
//  314     }
//  315 
//  316 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  317 
//  318 /**
//  319   * @}
//  320   */
//  321   
//  322 /**
//  323   * @}
//  324   */
//  325   
//  326 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 408 bytes in section .near_func.text
// 
// 408 bytes of CODE memory
//
//Errors: none
//Warnings: none
