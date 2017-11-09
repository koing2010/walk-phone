/**********************************************************************************

File_name:      init_peripher.c
Version:		   0.0
Revised:        $Date:2014-7-  ; $
Description:    the main file of this project.
Notes:          This version targets the stm8
Editor:		    Mr.Kong

**********************************************************************************/


/*================================================================================
@ Include files
*/
#include "init_peripher.h"


/*================================================================================
@ Global variable
*/


/*================================================================================
@ All functions  as follow
*/

/*********************************************************************************
Function:  void Delay_Ms(u16 z)
Description:
delay 1ms @  8MHz

Input:        ByteData you want to send.
Output:       None
Return:       None
Others:
*********************************************************************************/
void Delay_Ms(u16 z)
{
  u16 x,y;
  for(x=z;x>0;x--)
  { for(y=1600;y>0;y--);}
  
  
}

/*********************************************************************************
**名称：void EEPROM_WriteByte(uchar EEPROM_Data,uint EEPROM_Add)
**
**功能：向EEPROM 写入一字节
**
**说明：存储一字节数据 0-639
**
**时间：2013.5.6
**********************************************************************************/
void EEPROM_WriteByte(uchar EEPROM_Data,u16 EEPROM_Add)
{
  uchar *Address;
  Address=(uchar *)(EEPROM_Add+0x4000);
  do
  {
    FLASH_DUKR=0xae; // 写入第一个密钥
    FLASH_DUKR=0x56; // 写入第二个密钥
  }
  while((FLASH_IAPSR&0x08)==0); // 若解锁未成功，则重新再来
  *Address =EEPROM_Data;     // 写入第一个字节
  while((FLASH_IAPSR&0x04)==0); // 等待写操作成功
}




/*********************************************************************************
**名称：uchar EEPROM_ReadByte(uint EEPROM_Add)
**
**功能：从EEPROM 读取一字节
**
**说明：读取一字节数据
**
**时间：2013.5.6
*********************************************************************************/
uchar EEPROM_ReadByte(u16 EEPROM_Add)
{
  uchar EEPROM_Data;
  EEPROM_Data = *((uchar*) (EEPROM_Add+0x4000));
  
  return EEPROM_Data;
}


/********************************************************************************
Function:  void UART2_SendBytE
Description:
send a byte by UART2
Input:        ByteData you want to send.
Output:       None
Return:       None
Others:
*********************************************************************************/
void UART2_SendByte(uchar ByteData)
{
  
  while(!UART2_SR_TXE);
  UART2_DR=ByteData;     //向USART1发送一字节数据
  
  while(!UART2_SR_TC);   //是否发送完毕
  
}

/********************************************************************************
Function:       TIM1_PWM_Init
Description:
configurate PWM generator
Input:        CarrierFrq  you set
Output:       None
Return:       None
Others:
*********************************************************************************/
void TIM1_PWM_Init(u8 CarrierFrq)

{
  
  u16  TIM1_ARR;
  
  TIM1_CCMR1=TIM1_CCMR1|0x70;
  TIM1_CCER1=TIM1_CCER1|0x03;
  
  TIM1_ARR  = ( 16000 / CarrierFrq ) -1 ;// calculate the timer1 count.
  TIM1_ARRH =( TIM1_ARR >> 8) & 0xFF;//
  TIM1_ARRL = TIM1_ARR & 0XFF;
  
  
  TIM1_ARR = (TIM1_ARR +1 )/ 3 -1 ;//calculate the timer1 compare data.
  TIM1_CCR1H = (TIM1_ARR >> 8) & 0xFF;//
  TIM1_CCR1L = TIM1_ARR & 0xFF;
  
  TIM1_PSCRH = 0x00;
  TIM1_PSCRL = 0x00;
  //TIM1_CCMR1_OC1M = 100;
  // TIM1_CR1=TIM1_CR1|0X01;
  TIM1_BKR=0x80;
  DISABLE_TIM1_PWM;
  
  
  
}
/********************************************************************************
Function: void SendFrame(u8 *data,u8 Length)
Description: send a frame of data by UART2

Input:     u8 *data    pointer  of a series of data you want to send.
u8 Length  the number of this series of

data.
Output:       None
Return:       None
Others:
*********************************************************************************/
void SendFrame(u8 *data,u8 Length)
{
  
  while( Length>0 )
  {
    
    UART2_SendByte(*data);
    data++;
    Length--;
    
  }
}

/********************************************************************************
**名称：void TIM4_Init(void)
**
**功能：定时器4 初始化
**
**说明：定时器4 用于模拟串口  波特率为9600
**
**时间：2013.04.26
*********************************************************************************/
void TIM4_Init(void)
{
  TIM4_IER=0x00; // 禁止中断
  TIM4_EGR=0x01; // 允许产生更新事件 // 设置控制器，启动定时器
  
  TIM4_PSCR = 0x00;//0.0625us
  
  TIM4_ARR  = 0xEF; // 15us
  TIM4_CNTR = 0XEF;
  
  //TIM4_CR1=0x01; // b0=1,允许计数器工作
  TIM4_IER=0x01; // 允许中断
  DISABLE_TIM4 ;
  
  
}
/********************************************************************************
**名称：void IWDG_Init(void)
**
**功能：独立看门狗初始化
**
**说明：
**
**时间：2013.09.27
*********************************************************************************/
void IWDG_Init(void)
{
  
  IWDG_KR=0xcc;
  IWDG_KR=0x55;
  IWDG_PR=0x06;
  IWDG_RLR=0xff;
  IWDG_KR=0xaa;
  
}




/********************************************************************************
Function:  All_Iint
Description:  external device will be configurated in this sector.
Input:        None
Output:       None
Return:       None
Others:
*********************************************************************************/
void All_Init(void)
{
  
  
  /***************MCU clock config*********/
  CLK_CKDIVR = 0x00;     //RC振荡器不分频   CPU分频 M
  CLK_SWCR = 0x00;      //禁止时钟切换
  // CLK_ICKR_LSIEN = 1;   //开启看门狗时钟；
  //  while(!CLK_ICKR_LSIRDY);
  
  
  //  IWDG_Init();//in
  
  
  //Rx Power ennable
  PD_DDR_DDR6 = 1;
  PD_CR1_C16  = 1;
  PD_CR2_C26  = 0;
  
  //SQL
  PF_DDR_DDR4 = 1;
  PF_CR1_C14  = 1;
  PF_CR2_C24  = 0;
  //Tx Power ennable
  PB_DDR_DDR0 = 1;
  PB_CR1_C10  = 1;
  PB_CR2_C20  = 0;
  
  
  //SDIO 
  PD_DDR_DDR3 = 1;
  PD_CR1_C13  = 1;
  PD_CR2_C23  = 0; 
  
  //SCLK
  PD_DDR_DDR2 = 1;
  PD_CR1_C12  = 1;
  PD_CR2_C22  = 0; 
  
  //SEBN
  PD_DDR_DDR0 = 1;
  PD_CR1_C10  = 1;
  PD_CR2_C20  = 0; 
  PD_ODR_ODR0 = 1;
//  //stled316s IO all is pp out
//  PA_DDR_DDR2 = 1;
//  PA_CR1_C12  = 1;
//  PA_CR2_C22  = 0;
//  
//  PA_DDR_DDR1 = 1;
//  PA_CR1_C11  = 1;
//  PA_CR2_C21  = 0;
//  
//  PF_DDR_DDR4 = 1;
//  PF_CR1_C14  = 1;
//  PF_CR2_C24  = 0; 
  
  //key input
  PB_DDR_DDR1 = 0;
  PB_CR1_C11  = 1;
  PB_CR2_C21  = 0;
  PB_ODR_ODR1 = 1;
  
  PD_DDR_DDR7 = 0;//
  PD_CR1_C17  = 1;
  PD_CR2_C27  = 0;
  PD_ODR_ODR7 = 1;
  
  //MB1504 IO
//  PD_DDR_DDR5 = 1 ;
//  PD_CR1_C15 =  1 ;
//  PD_CR2_C25 =  0 ;
//  
//  PD_DDR_DDR6 = 1 ;
//  PD_CR1_C16 =  1 ;
//  PD_CR2_C26 =  0 ;
//  
//  PD_DDR_DDR7 = 1 ;
//  PD_CR1_C17 =  1 ;
//  PD_CR2_C27 =  0 ;
//  
//  PC_DDR_DDR7 = 1 ;
//  PC_CR1_C17 =  1 ;
//  PC_CR2_C27 =  0 ;
//  
//  PB_DDR_DDR5 = 1 ;
//  PB_CR1_C15 =  1 ;
//  PB_CR2_C25 =  0 ;
  /*******serial_port_config************/
  
  //   UART2_BRR2= 0x01;
  //   UART2_BRR1= 0x34;
  //   UART2_CR2 = 0x2c;//允许接收，发送，开接收中断
  
  //UART2_CR2=0x0c;//关闭接受中断
  
  /*************TIM2_config************/
  
  //主要用于50ms计时
  TIM2_IER = 0x00; // 禁止中断
  TIM2_EGR = 0x01; // 允许产生更新事件 // 设置控制器，启动定时器
  
  TIM2_PSCR = 0x08;//计数器时钟=主时钟/2^8相当于计数器周期为32us
  
  TIM2_ARRH = 0x02; // 设定重装载时的寄存器值，
  TIM2_ARRL = 0x70;
  TIM2_CNTRH = 0x02;// 设定计数器的初值
  TIM2_CNTRL = 0x70;// 定时周期=(ARR+1)*32uS=125mS;
  TIM2_CR1 = 0x01; // b0=1,允许计数器工作
  TIM2_IER = 0x01; // 允许中断
  //TIM1_PWM_Init( CarrierFreqency);
  
  
  
  /*************TIM4_config***********/
  //主要为接收数据计时用
  //   TIM4_CR1=0x01;//使能计数器
  //
  //   TIM4_IER=0x01;//更新中断使能
  //   TIM4_EGR=0x01;
  //   TIM4_CNTR=255;//计数器值
  //   TIM4_ARR=255;//自动重装的值
  //   TIM4_PSCR=0x07;//128分频值
  //   TIM4_CR1=0x01;  //启动 TIM4;
  
}




/*@*****************************end of file*************************************@*/
