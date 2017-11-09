/************************************************************************************

File_name:      init_peripher.h
Description:    the header file of  init_peripher_c .

************************************************************************************/
#ifndef     __INIT_PERIPHER_H__
#define     __INIT_PERIPHER_H__

/*==================================================================================
@ Include files
*/
#include <iostm8s105k4.h>
#include <intrinsics.h>

/*==================================================================================
@ Typedefs
*/
typedef unsigned char   uchar;
typedef unsigned char   u8;
typedef unsigned int   u16;
typedef unsigned long int   u32;

/*==================================================================================
@ Constants and defines
*/
#define ENABLE_UART1_IRQ            UART1_CR2 = 0x2c //允许接收，发送，开接收中断
#define DISABLE_UART1_IRQ           UART1_CR2=0x0c   //关闭接受中断
#define ENABLE_TIM2_IRQ             TIM2_IER=0x01    // 使能中断
#define DISABLE_TIM2_IRQ            TIM2_IER=0x00    // 禁止中断

#define DISABLE_TIM4                TIM4_CR1=0x00  //停止 TIM4
#define ENABLE_TIM4                 TIM4_CR1=0x01  //启动 TIM4

#define DISABLE_TIM1_PWM      TIM1_CR1 &= 0xFE//;TIM1_CCMR1_OC1M = 0x05
#define ENABLE_TIM1_PWM       TIM1_CR1 |= 0x01;TIM1_CCMR1_OC1M = 0x06
#define Clear_Wait_Dog        IWDG_KR=0xAA

#define RxPowerEN  PD_ODR_ODR6
#define TxPowerEN  PB_ODR_ODR0
#define SQL         PF_ODR_ODR4


void Delay_Ms(u16 z);
void IWDG_Init(void);               // init wait dog
void All_Init(void);                // init MCU peripher
void UART1_SendByte(u8 ByteData);   //send a bytes
u8   EEPROM_ReadByte(u16 EEPROM_Add);
void EEPROM_WriteByte(u8 EEPROM_Data,u16 EEPROM_Add);
void SendFrame(u8 *data,u8 Length);





#endif
/*@*****************************end of file**************************************@*/


