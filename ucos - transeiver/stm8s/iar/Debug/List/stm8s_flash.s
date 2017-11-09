///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      17/May/2011  12:15:31 /
// IAR C/C++ Compiler V1.30.1.20036 [Evaluation] for STM8                     /
// Copyright 2010-2011 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_flash.c        /
//    Command line =  E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_flash.c -e     /
//                    -Oh --debug --code_model small --data_model medium -o   /
//                    E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\Obj\ --dlib_config   /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.0\stm8\LIB\dlstm8smn.h" -D STM8S207 -lB               /
//                    E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\                /
//                    --diag_suppress pa089 -I E:\HWT\HWT_OS\ucos\stm8s\iar\. /
//                    .\..\ucos_ii\ -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\..\uco /
//                    s_ii\iarstm8\ -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\src\   /
//                    -I E:\HWT\HWT_OS\ucos\stm8s\iar\..\fwlib\inc\ --vregs   /
//                    16                                                      /
//    List file    =  E:\HWT\HWT_OS\ucos\stm8s\iar\Debug\List\stm8s_flash.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_flash

        EXTERN ?add32_l0_l0_dl
        EXTERN ?add32_l0_l0_l1
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?dec32_l0_l0
        EXTERN ?e0
        EXTERN ?e1
        EXTERN ?mov_e0_e1
        EXTERN ?mov_e1_e0
        EXTERN ?mov_w3_w1
        EXTERN ?push_l1
        EXTERN ?sll32_l0_l0_db
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3

        PUBLIC FLASH_DeInit
        PUBLIC FLASH_EraseBlock
        PUBLIC FLASH_EraseByte
        PUBLIC FLASH_EraseOptionByte
        PUBLIC FLASH_GetBootSize
        PUBLIC FLASH_GetFlagStatus
        PUBLIC FLASH_GetLowPowerMode
        PUBLIC FLASH_GetProgrammingTime
        PUBLIC FLASH_ITConfig
        PUBLIC FLASH_Lock
        PUBLIC FLASH_ProgramBlock
        PUBLIC FLASH_ProgramByte
        PUBLIC FLASH_ProgramOptionByte
        PUBLIC FLASH_ProgramWord
        PUBLIC FLASH_ReadByte
        PUBLIC FLASH_ReadOptionByte
        PUBLIC FLASH_SetLowPowerMode
        PUBLIC FLASH_SetProgrammingTime
        PUBLIC FLASH_Unlock
        PUBLIC FLASH_WaitForLastOperation

// E:\HWT\HWT_OS\ucos\stm8s\fwlib\src\stm8s_flash.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_flash.c
//    4   * @author  MCD Application Team
//    5   * @version V2.0.0
//    6   * @date    25-February-2011
//    7   * @brief   This file contains all the functions for the FLASH peripheral.
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
//   23 #include "stm8s_flash.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /**
//   29 @code
//   30  This driver provides functions to configure and program the Flash memory of all
//   31  STM8S devices.
//   32 
//   33  It includes as well functions that can be either executed from RAM or not, and
//   34  other functions that must be executed from RAM otherwise useless.
//   35 
//   36  The table below lists the functions that can be executed from RAM.
//   37 
//   38  +--------------------------------------------------------------------------------|
//   39  |   Functions prototypes      |    RAM execution            |     Comments       |
//   40  ---------------------------------------------------------------------------------|
//   41  |                             | Mandatory in case of block  | Can be executed    |
//   42  | FLASH_WaitForLastOperation  | Operation:                  | from Flash in case |
//   43  |                             | - Block programming         | of byte and word   |
//   44  |                             | - Block erase               | Operations         |
//   45  |--------------------------------------------------------------------------------|
//   46  | FLASH_ProgramBlock          |       Exclusively           | useless from Flash |
//   47  |--------------------------------------------------------------------------------|
//   48  | FLASH_EraseBlock            |       Exclusively           | useless from Flash |
//   49  |--------------------------------------------------------------------------------|
//   50 
//   51  To be able to execute functions from RAM several steps have to be followed.
//   52  These steps may differ from one toolchain to another.
//   53  A detailed description is available below within this driver.
//   54  You can also refer to the FLASH examples provided within the
//   55  STM8S_StdPeriph_Lib package.
//   56 
//   57 @endcode
//   58 */
//   59 
//   60 
//   61 /* Private typedef -----------------------------------------------------------*/
//   62 /* Private define ------------------------------------------------------------*/
//   63 #define FLASH_CLEAR_BYTE ((uint8_t)0x00)
//   64 #define FLASH_SET_BYTE  ((uint8_t)0xFF)
//   65 #define  OPERATION_TIMEOUT  ((uint32_t)0xFFFFF)
//   66 /* Private macro -------------------------------------------------------------*/
//   67 /* Private variables ---------------------------------------------------------*/
//   68 /* Private function prototypes -----------------------------------------------*/
//   69 /* Private Constants ---------------------------------------------------------*/
//   70 
//   71 /** @addtogroup FLASH_Public_functions
//   72   * @{
//   73   */
//   74 
//   75 /**
//   76   * @brief   Unlocks the program or data EEPROM memory
//   77   * @param  FLASH_MemType : Memory type to unlock
//   78   *         This parameter can be a value of @ref FLASH_MemType_TypeDef
//   79   * @retval None
//   80   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
//   82 {
//   83     /* Check parameter */
//   84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
//   85 
//   86     /* Unlock program memory */
//   87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
FLASH_Unlock:
        CP        A, #0xfd
        JRNE      L:??FLASH_Unlock_0
//   88     {
//   89         FLASH->PUKR = FLASH_RASS_KEY1;
        MOV       L:0x5062, #0x56
//   90         FLASH->PUKR = FLASH_RASS_KEY2;
        MOV       L:0x5062, #0xae
        RET
//   91     }
//   92     /* Unlock data memory */
//   93     else
//   94     {
//   95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
??FLASH_Unlock_0:
        MOV       L:0x5064, #0xae
//   96         FLASH->DUKR = FLASH_RASS_KEY1;
        MOV       L:0x5064, #0x56
//   97     }
//   98 }
        RET
//   99 
//  100 /**
//  101   * @brief   Locks the program or data EEPROM memory
//  102   * @param  FLASH_MemType : Memory type
//  103   *         This parameter can be a value of @ref FLASH_MemType_TypeDef
//  104   * @retval None
//  105   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
//  107 {
//  108     /* Check parameter */
//  109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
//  110 
//  111   /* Lock memory */
//  112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
FLASH_Lock:
        AND       A, L:0x505f
        LD        L:0x505f, A
//  113 }
        RET
//  114 
//  115 /**
//  116   * @brief   Deinitializes the FLASH registers to their default reset values.
//  117   * @param  None
//  118   * @retval None
//  119   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  120 void FLASH_DeInit(void)
//  121 {
//  122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
FLASH_DeInit:
        CLR       L:0x505a
//  123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
        CLR       L:0x505b
//  124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
        MOV       L:0x505c, #0xff
//  125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
        BRES      L:0x505f, #0x3
//  126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
        BRES      L:0x505f, #0x1
//  127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
        LD        A, L:0x505f
//  128 }
        RET
//  129 
//  130 /**
//  131   * @brief   Enables or Disables the Flash interrupt mode
//  132   * @param  NewState : The new state of the flash interrupt mode
//  133   *         This parameter can be a value of @ref FunctionalState enumeration.
//  134   * @retval None
//  135   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  136 void FLASH_ITConfig(FunctionalState NewState)
//  137 {
//  138       /* Check parameter */
//  139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  140   
//  141     if (NewState != DISABLE)
FLASH_ITConfig:
        TNZ       A
        JREQ      L:??FLASH_ITConfig_0
//  142     {
//  143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
        BSET      L:0x505a, #0x1
        RET
//  144     }
//  145     else
//  146     {
//  147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
??FLASH_ITConfig_0:
        BRES      L:0x505a, #0x1
//  148     }
//  149 }
        RET
//  150 
//  151 /**
//  152   * @brief   Erases one byte in the program or data EEPROM memory
//  153   * @note   PointerAttr define is declared in the stm8s.h file to select if 
//  154   *         the pointer will be declared as near (2 bytes) or far (3 bytes).
//  155   * @param  Address : Address of the byte to erase
//  156   * @retval None
//  157   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  158 void FLASH_EraseByte(uint32_t Address)
//  159 {
//  160     /* Check parameter */
//  161     assert_param(IS_FLASH_ADDRESS_OK(Address));
//  162     
//  163     /* Erase byte */
//  164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
FLASH_EraseByte:
        CLR       S:?b1
        CLR       A
        LDF       [S:?e0.e], A
//  165 
//  166 }
        RET
//  167 
//  168 /**
//  169   * @brief   Programs one byte in program or data EEPROM memory
//  170   * @note   PointerAttr define is declared in the stm8s.h file to select if 
//  171   *         the pointer will be declared as near (2 bytes) or far (3 bytes).
//  172   * @param  Address : Address where the byte will be programmed
//  173   * @param  Data : Value to be programmed
//  174   * @retval None
//  175   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
//  177 {
//  178     /* Check parameters */
//  179     assert_param(IS_FLASH_ADDRESS_OK(Address));
//  180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
FLASH_ProgramByte:
        CLR       S:?b1
        LDF       [S:?e0.e], A
//  181 }
        RET
//  182 
//  183 /**
//  184   * @brief   Reads any byte from flash memory
//  185   * @note   PointerAttr define is declared in the stm8s.h file to select if 
//  186   *         the pointer will be declared as near (2 bytes) or far (3 bytes).
//  187   * @param  Address : Address to read
//  188   * @retval Value of the byte
//  189   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  190 uint8_t FLASH_ReadByte(uint32_t Address)
//  191 {
//  192     /* Check parameter */
//  193     assert_param(IS_FLASH_ADDRESS_OK(Address));
//  194     
//  195     /* Read byte */
//  196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
FLASH_ReadByte:
        CLR       S:?b1
        LDF       A, [S:?e0.e]
        RET
//  197 
//  198 }

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine1:
        CALL      L:?mov_e1_e0
        REQUIRE ??Subroutine5_0
        ;               // Fall through to label ??Subroutine5_0
//  199 /**
//  200   * @brief   Programs one word (4 bytes) in program or data EEPROM memory
//  201   * @note   PointerAttr define is declared in the stm8s.h file to select if 
//  202   *         the pointer will be declared as near (2 bytes) or far (3 bytes).
//  203   * @param  Address : The address where the data will be programmed
//  204   * @param  Data : Value to be programmed
//  205   * @retval None
//  206   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine5_0:
        ADDW      X, S:?w3
        LDW       S:?w3, X
        LDF       [S:?e1.e], A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
//  208 {
FLASH_ProgramWord:
        CALL      L:?push_l1
//  209     /* Check parameters */
//  210     assert_param(IS_FLASH_ADDRESS_OK(Address));
//  211 
//  212     /* Enable Word Write Once */
//  213     FLASH->CR2 |= FLASH_CR2_WPRG;
        BSET      L:0x505b, #0x6
//  214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
        BRES      L:0x505c, #0x6
//  215 
//  216     /* Write one byte - from lowest address*/
//  217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
        CLR       S:?b5
        CALL      L:?mov_w3_w1
        LD        A, (0x1,SP)
        LDF       [S:?e1.e], A
//  218     /* Write one byte*/
//  219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
        LD        A, (0x2,SP)
        CLRW      X
        INCW      X
        CALL      L:?Subroutine0
//  220     /* Write one byte*/    
//  221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
??CrossCallReturnLabel_10:
        LD        A, (0x3,SP)
        LDW       X, #0x2
        CALL      L:?Subroutine0
//  222     /* Write one byte - from higher address*/
//  223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
??CrossCallReturnLabel_11:
        LD        A, (0x4,SP)
        LDW       X, #0x3
        CALL      L:??Subroutine5_0
//  224 }
??CrossCallReturnLabel_6:
        ADD       SP, #0x4
        RET

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine0:
        CALL      L:?mov_e0_e1
        REQUIRE ??Subroutine6_0
        ;               // Fall through to label ??Subroutine6_0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine6_0:
        ADDW      X, S:?w1
        LDW       S:?w1, X
        LDF       [S:?e0.e], A
        RET
//  225 
//  226 /**
//  227   * @brief   Programs option byte
//  228   * @param  Address : option byte address to program
//  229   * @param  Data : Value to write
//  230   * @retval None
//  231   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
//  233 {
//  234     /* Check parameter */
//  235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
//  236 
//  237     /* Enable write access to option bytes */
//  238     FLASH->CR2 |= FLASH_CR2_OPT;
FLASH_ProgramOptionByte:
        CALL      L:?Subroutine4
//  239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
//  240 
//  241     /* check if the option byte to program is ROP*/
//  242     if (Address == 0x4800)
??CrossCallReturnLabel_5:
        JRNE      L:??FLASH_ProgramOptionByte_0
//  243     {
//  244        /* Program option byte*/
//  245        *((NEAR uint8_t*)Address) = Data;
        LD        L:0x4800, A
        JRA       L:??FLASH_ProgramOptionByte_1
//  246     }
//  247     else
//  248     {
//  249        /* Program option byte and his complement */
//  250        *((NEAR uint8_t*)Address) = Data;
??FLASH_ProgramOptionByte_0:
        LD        (X), A
//  251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
        INCW      X
        CPL       A
        LD        (X), A
//  252     }
//  253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
??FLASH_ProgramOptionByte_1:
        CALL      L:?Subroutine3
//  254 
//  255     /* Disable write access to option bytes */
//  256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
//  257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
//  258 }
??CrossCallReturnLabel_3:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine4:
        BSET      L:0x505b, #0x7
        BRES      L:0x505c, #0x7
        CPW       X, #0x4800
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine3:
        LD        A, #0xfd
        CALL      L:FLASH_WaitForLastOperation
        BRES      L:0x505b, #0x7
        BSET      L:0x505c, #0x7
        RET
//  259 
//  260 /**
//  261   * @brief   Erases option byte
//  262   * @param  Address : Option byte address to erase
//  263   * @retval None
//  264   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  265 void FLASH_EraseOptionByte(uint16_t Address)
//  266 {
//  267     /* Check parameter */
//  268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
//  269 
//  270     /* Enable write access to option bytes */
//  271     FLASH->CR2 |= FLASH_CR2_OPT;
FLASH_EraseOptionByte:
        CALL      L:?Subroutine4
//  272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
//  273 
//  274      /* check if the option byte to erase is ROP */
//  275      if (Address == 0x4800)
??CrossCallReturnLabel_4:
        JRNE      L:??FLASH_EraseOptionByte_0
//  276     {
//  277        /* Erase option byte */
//  278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
        CLR       L:0x4800
        JRA       L:??FLASH_EraseOptionByte_1
//  279     }
//  280     else
//  281     {
//  282        /* Erase option byte and his complement */
//  283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
??FLASH_EraseOptionByte_0:
        CLR       A
        LD        (X), A
//  284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
        INCW      X
        LD        A, #0xff
        LD        (X), A
//  285     }
//  286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
??FLASH_EraseOptionByte_1:
        CALL      L:?Subroutine3
//  287 
//  288     /* Disable write access to option bytes */
//  289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
//  290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
//  291 }
??CrossCallReturnLabel_2:
        RET
//  292 /**
//  293   * @brief   Reads one option byte
//  294   * @param  Address  option byte address to read.
//  295   * @retval Option byte read value + its complement
//  296   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
//  298 {
//  299     uint8_t value_optbyte, value_optbyte_complement = 0;
//  300     uint16_t res_value = 0;
//  301 
//  302     /* Check parameter */
//  303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
//  304 
//  305 
//  306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
FLASH_ReadOptionByte:
        LD        A, (X)
        LD        S:?b1, A
//  307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
        LDW       Y, X
        INCW      Y
        LD        A, (Y)
        LD        S:?b0, A
//  308 
//  309     /* Read-out protection option byte */
//  310     if (Address == 0x4800)	 
        CPW       X, #0x4800
        JRNE      L:??FLASH_ReadOptionByte_0
//  311     {
//  312         res_value =	 value_optbyte;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        RET
//  313     }
//  314     else
//  315     {
//  316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
??FLASH_ReadOptionByte_0:
        CPL       A
        CP        A, S:?b1
        JRNE      L:??FLASH_ReadOptionByte_1
//  317         {
//  318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
//  319             res_value = res_value | (uint16_t)value_optbyte_complement;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        CLRW      Y
        LD        A, S:?b0
        EXG       A, YL
        LDW       S:?w0, Y
        OR        A, S:?b1
        RLWA      X, A
        RET
//  320         }
//  321         else
//  322         {
//  323             res_value = FLASH_OPTIONBYTE_ERROR;
??FLASH_ReadOptionByte_1:
        LDW       X, #0x5555
//  324         }
//  325     }
//  326     return(res_value);
        RET
//  327 }
//  328 
//  329 /**
//  330   * @brief   Select the Flash behaviour in low power mode
//  331   * @param  FLASH_LPMode Low power mode selection
//  332   *         This parameter can be any of the @ref FLASH_LPMode_TypeDef values.
//  333   * @retval None
//  334   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
//  336 {
FLASH_SetLowPowerMode:
        LD        S:?b0, A
//  337     /* Check parameter */
//  338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
//  339 
//  340     /* Clears the two bits */
//  341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
        LD        A, L:0x505a
        AND       A, #0xf3
        LD        L:0x505a, A
//  342     
//  343     /* Sets the new mode */
//  344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
        LD        A, S:?b0
        OR        A, L:0x505a
        LD        L:0x505a, A
//  345 }
        RET
//  346 
//  347 /**
//  348   * @brief   Sets the fixed programming time
//  349   * @param  FLASH_ProgTime Indicates the programming time to be fixed
//  350   *         This parameter can be any of the @ref FLASH_ProgramTime_TypeDef values.
//  351   * @retval None
//  352   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
//  354 {
//  355     /* Check parameter */
//  356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
//  357 
//  358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
FLASH_SetProgrammingTime:
        BRES      L:0x505a, #0x0
//  359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
        OR        A, L:0x505a
        LD        L:0x505a, A
//  360 }
        RET
//  361 
//  362 /**
//  363   * @brief  Returns the Flash behaviour type in low power mode
//  364   * @param  None
//  365   * @retval FLASH_LPMode_TypeDef Flash behaviour type in low power mode
//  366   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
//  368 {
//  369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
FLASH_GetLowPowerMode:
        LD        A, L:0x505a
        AND       A, #0xc
        RET
//  370 }
//  371 
//  372 /**
//  373   * @brief  Returns the fixed programming time
//  374   * @param  None
//  375   * @retval FLASH_ProgramTime_TypeDef Fixed programming time value
//  376   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
//  378 {
//  379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
FLASH_GetProgrammingTime:
        LD        A, L:0x505a
        AND       A, #0x1
        RET
//  380 }
//  381 
//  382 /**
//  383   * @brief  Returns the Boot memory size in bytes
//  384   * @param  None
//  385   * @retval Boot memory size in bytes
//  386   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  387 uint32_t FLASH_GetBootSize(void)
//  388 {
//  389     uint32_t temp = 0;
//  390 
//  391     /* Calculates the number of bytes */
//  392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
FLASH_GetBootSize:
        LD        A, L:0x505d
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x9
        CODE
//  393 
//  394     /* Correction because size of 127.5 kb doesn't exist */
//  395     if (FLASH->FPR == 0xFF)
        LD        A, L:0x505d
        CP        A, #0xff
        JRNE      L:??FLASH_GetBootSize_0
//  396     {
//  397         temp += 512;
        CALL      L:?add32_l0_l0_dl
        DATA
        DC32      0x200
        CODE
//  398     }
//  399 
//  400     /* Return value */
//  401     return(temp);
??FLASH_GetBootSize_0:
        RET
//  402 }
//  403 
//  404 /**
//  405   * @brief  Checks whether the specified SPI flag is set or not.
//  406   * @param  FLASH_FLAG : Specifies the flag to check.
//  407   *         This parameter can be any of the @ref FLASH_Flag_TypeDef enumeration.
//  408   * @retval FlagStatus : Indicates the state of FLASH_FLAG.
//  409   *         This parameter can be any of the @ref FlagStatus enumeration.
//  410   * @note   This function can clear the EOP, WR_PG_DIS flags in the IAPSR register.
//  411   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
//  413 {
//  414     FlagStatus status = RESET;
//  415     /* Check parameters */
//  416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
//  417 
//  418     /* Check the status of the specified FLASH flag */
//  419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
FLASH_GetFlagStatus:
        BCP       A, L:0x505f
        JREQ      L:??FLASH_GetFlagStatus_0
//  420     {
//  421         status = SET; /* FLASH_FLAG is set */
        LD        A, #0x1
        RET
//  422     }
//  423     else
//  424     {
//  425         status = RESET; /* FLASH_FLAG is reset*/
??FLASH_GetFlagStatus_0:
        CLR       A
//  426     }
//  427 
//  428     /* Return the FLASH_FLAG status */
//  429     return status;
        RET
//  430 }
//  431 
//  432 /**
//  433 @code
//  434  All the functions defined below must be executed from RAM exclusively, except
//  435  for the FLASH_WaitForLastOperation function which can be executed from Flash.
//  436 
//  437  Steps of the execution from RAM differs from one toolchain to another:
//  438  - For Cosmic Compiler:
//  439     1- Define a segment FLASH_CODE by the mean of " #pragma section (FLASH_CODE)".
//  440     This segment is defined in the stm8s_flash.c file.
//  441   2- Uncomment the "#define RAM_EXECUTION  (1)" line in the stm8s.h file,
//  442     or define it in Cosmic compiler preprocessor to enable the FLASH_CODE segment
//  443    definition.
//  444   3- In STVD Select Project\Settings\Linker\Category "input" and in the RAM section
//  445     add the FLASH_CODE segment with "-ic" options.
//  446   4- In main.c file call the _fctcpy() function with first segment character as 
//  447     parameter "_fctcpy('F');" to load the declared moveable code segment
//  448     (FLASH_CODE) in RAM before execution.
//  449   5- By default the _fctcpy function is packaged in the Cosmic machine library,
//  450     so the function prototype "int _fctcopy(char name);" must be added in main.c
//  451     file.
//  452 
//  453   - For Raisonance Compiler
//  454    1- Use the inram keyword in the function declaration to specify that it can be
//  455     executed from RAM.
//  456     This is done within the stm8s_flash.c file, and it's conditioned by 
//  457     RAM_EXECUTION definition.
//  458    2- Uncomment the "#define RAM_EXECUTION  (1)" line in the stm8s.h file, or 
//  459    define it in Raisonance compiler preprocessor to enable the access for the 
//  460    inram functions.
//  461    3- An inram function code is copied from Flash to RAM by the C startup code. 
//  462    In some applications, the RAM area where the code was initially stored may be
//  463    erased or corrupted, so it may be desirable to perform the copy again. 
//  464    Depending on the application memory model, the memcpy() or fmemcpy() functions
//  465    should be used to perform the copy.
//  466       • In case your project uses the SMALL memory model (code smaller than 64K),
//  467        memcpy()function is recommended to perform the copy
//  468       • In case your project uses the LARGE memory model, functions can be 
//  469       everywhenre in the 24-bits address space (not limited to the first 64KB of
//  470       code), In this case, the use of memcpy() function will not be appropriate,
//  471       you need to use the specific fmemcpy() function (which copies objects with
//  472       24-bit addresses).
//  473       - The linker automatically defines 2 symbols for each inram function:
//  474            • __address__functionname is a symbol that holds the Flash address 
//  475            where the given function code is stored.
//  476            • __size__functionname is a symbol that holds the function size in bytes.
//  477      And we already have the function address (which is itself a pointer)
//  478   4- In main.c file these two steps should be performed for each inram function:
//  479      • Import the "__address__functionname" and "__size__functionname" symbols
//  480        as global variables:
//  481          extern int __address__functionname; // Symbol holding the flash address
//  482          extern int __size__functionname;    // Symbol holding the function size
//  483      • In case of SMALL memory model use, Call the memcpy() function to copy the
//  484       inram function to the RAM destination address:
//  485                 memcpy(functionname, // RAM destination address
//  486                       (void*)&__address__functionname, // Flash source address
//  487                       (int)&__size__functionname); // Code size of the function
//  488      • In case of LARGE memory model use, call the fmemcpy() function to copy 
//  489      the inram function to the RAM destination address:
//  490                  memcpy(functionname, // RAM destination address
//  491                       (void @far*)&__address__functionname, // Flash source address
//  492                       (int)&__size__functionname); // Code size of the function
//  493 
//  494  - For IAR Compiler:
//  495     1- Use the __ramfunc keyword in the function declaration to specify that it 
//  496     can be executed from RAM..
//  497     This is done within the stm8s_flash.c file, and it's conditioned by 
//  498     RAM_EXECUTION definition.
//  499     2- Uncomment the "#define RAM_EXECUTION  (1)" line in the stm8s.h file, or 
//  500    define it in IAR compiler preprocessor to enable the access for the 
//  501    __ramfunc functions.
//  502  
//  503  The FLASH examples given within the STM8S_StdPeriph_Lib package, details all 
//  504  the steps described above.
//  505 
//  506 @endcode
//  507 */
//  508 
//  509 /**
//  510   * @brief
//  511   *******************************************************************************
//  512   *                         Execution from RAM enable
//  513   *******************************************************************************
//  514   *
//  515   * To enable execution from RAM you can either uncomment the following define 
//  516   * in the stm8s.h file or define it in your toolchain compiler preprocessor
//  517   * - #define RAM_EXECUTION  (1) 
//  518   */
//  519   
//  520 #if defined (_COSMIC_) && defined (RAM_EXECUTION)
//  521  #pragma section (FLASH_CODE)
//  522 #endif  /* _COSMIC_ && RAM_EXECUTION */
//  523 /**
//  524   * @brief  Wait for a Flash operation to complete.
//  525   * @note   The call and execution of this function must be done from RAM in case
//  526   *         of Block operation, otherwise it can be executed from Flash
//  527   * @param  FLASH_MemType : Memory type
//  528   *         This parameter can be a value of @ref FLASH_MemType_TypeDef
//  529   * @retval FLASH status
//  530   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
//  532 {
//  533     uint8_t flagstatus = 0x00;
//  534     uint32_t timeout = OPERATION_TIMEOUT;
FLASH_WaitForLastOperation:
        CLRW      X
        DECW      X
        LDW       S:?w1, X
        LDW       X, #0xf
        LDW       S:?w0, X
//  535     
//  536     /* Wait until operation completion or write protection page occurred */
//  537 #if defined (STM8S208) || defined(STM8S207) || defined(STM8S105) || defined(STM8AF52Ax) ||\ 
//  538     defined(STM8AF62Ax) || defined(STM8AF626x)  
//  539     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
        CP        A, #0xfd
        JRNE      L:??FLASH_WaitForLastOperation_0
//  540     {
//  541         while ((flagstatus == 0x00) && (timeout != 0x00))
//  542         {
//  543             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
//  544                                               FLASH_IAPSR_WR_PG_DIS));
??FLASH_WaitForLastOperation_1:
        LD        A, L:0x505f
        AND       A, #0x5
//  545             timeout--;
        CALL      L:?dec32_l0_l0
//  546         }
        TNZ       A
        JRNE      L:??FLASH_WaitForLastOperation_2
        LDW       X, S:?w0
        JRNE      L:??FLASH_WaitForLastOperation_3
        LDW       X, S:?w1
??FLASH_WaitForLastOperation_3:
        JRNE      L:??FLASH_WaitForLastOperation_1
        JRA       L:??FLASH_WaitForLastOperation_4
//  547     }
//  548     else
//  549     {
//  550         while ((flagstatus == 0x00) && (timeout != 0x00))
??FLASH_WaitForLastOperation_5:
        LDW       X, S:?w0
        JRNE      L:??FLASH_WaitForLastOperation_6
        LDW       X, S:?w1
??FLASH_WaitForLastOperation_6:
        JREQ      L:??FLASH_WaitForLastOperation_4
//  551         {
//  552             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
//  553                                               FLASH_IAPSR_WR_PG_DIS));
??FLASH_WaitForLastOperation_0:
        LD        A, L:0x505f
        AND       A, #0x41
//  554             timeout--;
        CALL      L:?dec32_l0_l0
//  555         }
        TNZ       A
        JREQ      L:??FLASH_WaitForLastOperation_5
//  556     }
//  557 #else /*STM8S103, STM8S903*/
//  558     while ((flagstatus == 0x00) && (timeout != 0x00))
//  559     {
//  560         flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
//  561         timeout--;
//  562     }
//  563 
//  564 #endif /* STM8S208, STM8S207, STM8S105, STM8AF52Ax, STM8AF62Ax, STM8AF262x */
//  565     
//  566     if (timeout == 0x00 )
??FLASH_WaitForLastOperation_2:
        LDW       X, S:?w0
        JRNE      L:??FLASH_WaitForLastOperation_7
        LDW       X, S:?w1
??FLASH_WaitForLastOperation_7:
        JRNE      L:??FLASH_WaitForLastOperation_8
//  567     {
//  568         flagstatus = FLASH_STATUS_TIMEOUT;
??FLASH_WaitForLastOperation_4:
        LD        A, #0x2
//  569     }
//  570 
//  571     return((FLASH_Status_TypeDef)flagstatus);
??FLASH_WaitForLastOperation_8:
        RET
//  572 }
//  573 
//  574 /**
//  575   * @brief  Erases a block in the program or data memory.
//  576   * @note   This function should be called and executed from RAM.
//  577   * @param  FLASH_MemType :  The type of memory to erase
//  578   * @param  BlockNum : Indicates the block number to erase
//  579   * @retval None.
//  580   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
//  582 {
FLASH_EraseBlock:
        LDW       S:?w1, X
//  583   uint32_t startaddress = 0;
//  584     
//  585 #if defined (STM8S105) || defined (STM8S103) || defined (STM8S903) || defined (STM8AF626x)
//  586   uint32_t PointerAttr  *pwFlash;
//  587 #elif defined (STM8S208) || defined (STM8S207) || defined (STM8AF62Ax) || defined (STM8AF52Ax) 
//  588   uint8_t PointerAttr  *pwFlash;
//  589 #endif
//  590 
//  591   /* Check parameters */
//  592   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
//  593   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
        CP        A, #0xfd
        JRNE      L:??FLASH_EraseBlock_0
//  594   {
//  595       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
//  596       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
        LDW       X, #0x8000
        LDW       S:?w3, X
        SLLW      X
        JRA       L:??FLASH_EraseBlock_1
//  597   }
//  598   else
//  599   {
//  600       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
//  601       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
??FLASH_EraseBlock_0:
        LDW       X, #0x4000
        LDW       S:?w3, X
        CLRW      X
//  602   }
??FLASH_EraseBlock_1:
        CALL      L:?Subroutine2
//  603 
//  604     /* Point to the first block address */
//  605 #if defined (STM8S208) || defined (STM8S207) || defined (STM8AF62Ax) || defined (STM8AF52Ax)
//  606     pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
//  607 #elif defined (STM8S105) || defined (STM8S103) || defined (STM8S903) || defined (STM8AF626x)
//  608     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
//  609 #endif	/* STM8S208, STM8S207 */
//  610 
//  611     /* Enable erase block mode */
//  612     FLASH->CR2 |= FLASH_CR2_ERASE;
??CrossCallReturnLabel_0:
        BSET      L:0x505b, #0x5
//  613     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
        BRES      L:0x505c, #0x5
//  614 
//  615 #if defined (STM8S105) || defined (STM8S103) || defined (STM8S903) || defined (STM8AF626x)
//  616     *pwFlash = (uint32_t)0;
//  617 #elif defined (STM8S208) || defined (STM8S207) || defined (STM8AF62Ax) || defined (STM8AF52Ax)
//  618   *pwFlash = (uint8_t)0;
        CLR       A
        LDF       [S:?e0.e], A
//  619   *(pwFlash + 1) = (uint8_t)0;
        CLRW      X
        INCW      X
        CALL      L:?Subroutine1
//  620   *(pwFlash + 2) = (uint8_t)0;
??CrossCallReturnLabel_7:
        LDW       X, #0x2
        CALL      L:?Subroutine1
//  621   *(pwFlash + 3) = (uint8_t)0;    
??CrossCallReturnLabel_8:
        LDW       X, #0x3
        CALL      L:??Subroutine6_0
//  622 #endif
//  623 }
??CrossCallReturnLabel_9:
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        LDW       S:?w2, X
        LDW       S:?w0, X
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x7
        CODE
        JP        L:?add32_l0_l0_l1
//  624 
//  625 /**
//  626   * @brief  Programs a memory block
//  627   * @note   This function should be called and executed from RAM.
//  628   * @param  FLASH_MemType : The type of memory to program
//  629   * @param  BlockNum : The block number
//  630   * @param  FLASH_ProgMode : The programming mode.
//  631   * @param  Buffer : Pointer to buffer containing source data.
//  632   * @retval None.
//  633   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  634 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
//  635                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
//  636 {
FLASH_ProgramBlock:
        PUSH      S:?b8
        LDW       S:?w1, X
        MOV       S:?b8, S:?b0
//  637     uint16_t Count = 0;
//  638     uint32_t startaddress = 0;
//  639 
//  640     /* Check parameters */
//  641     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
//  642     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
//  643     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
        CP        A, #0xfd
        JRNE      L:??FLASH_ProgramBlock_0
//  644     {
//  645         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
//  646         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
        LDW       X, #0x8000
        LDW       S:?w3, X
        SLLW      X
        JRA       L:??FLASH_ProgramBlock_1
//  647     }
//  648     else
//  649     {
//  650         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
//  651         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
??FLASH_ProgramBlock_0:
        LDW       X, #0x4000
        LDW       S:?w3, X
        CLRW      X
//  652     }
??FLASH_ProgramBlock_1:
        CALL      L:?Subroutine2
//  653 
//  654     /* Point to the first block address */
//  655     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
//  656 
//  657     /* Selection of Standard or Fast programming mode */
//  658     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
??CrossCallReturnLabel_1:
        TNZ       S:?b8
        JRNE      L:??FLASH_ProgramBlock_2
//  659     {
//  660         /* Standard programming mode */ /*No need in standard mode */
//  661         FLASH->CR2 |= FLASH_CR2_PRG;
        BSET      L:0x505b, #0x0
//  662         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
        BRES      L:0x505c, #0x0
        JRA       L:??FLASH_ProgramBlock_3
//  663     }
//  664     else
//  665     {
//  666         /* Fast programming mode */
//  667         FLASH->CR2 |= FLASH_CR2_FPRG;
??FLASH_ProgramBlock_2:
        BSET      L:0x505b, #0x4
//  668         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
        BRES      L:0x505c, #0x4
//  669     }
//  670 
//  671     /* Copy data bytes from RAM to FLASH memory */
//  672     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
??FLASH_ProgramBlock_3:
        CLR       S:?b1
        MOV       S:?b0, #0x80
//  673     {
//  674 #if defined (STM8S208) || defined(STM8S207) || defined(STM8S105) || defined (STM8AF62Ax) ||\ 
//  675     defined (STM8AF52Ax) || defined (STM8AF626x)
//  676   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
??FLASH_ProgramBlock_4:
        LD        A, (Y)
        LDF       [S:?e0.e], A
//  677 #elif defined (STM8S103) || defined (STM8S903)
//  678   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
//  679 #endif       
//  680     }
        INCW      Y
        CLRW      X
        INCW      X
        ADDW      X, S:?w1
        LDW       S:?w1, X
        LD        A, S:?b0
        DEC       A
        LD        S:?b0, A
        JRNE      L:??FLASH_ProgramBlock_4
//  681 }
        POP       S:?b8
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  682 
//  683 #if defined (_COSMIC_) && defined (RAM_EXECUTION)
//  684  /* End of FLASH_CODE section */
//  685  #pragma section ()
//  686 #endif /* _COSMIC_ && RAM_EXECUTION */
//  687 
//  688 
//  689 /**
//  690   * @}
//  691   */
//  692   
//  693 /**
//  694   * @}
//  695   */
//  696   
//  697 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 571 bytes in section .near_func.text
// 
// 571 bytes of CODE memory
//
//Errors: none
//Warnings: none
