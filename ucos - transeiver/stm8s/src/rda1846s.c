/***************************************************************************/
#include <iostm8s105k4.h>
#include <intrinsics.h>
#include "includes.h"

#define NOP          for(u8 i = 0;i < 16 ; i ++) {asm("NOP");asm("NOP"); asm("NOP"); asm("NOP");}

  
   


unsigned char rda1846TX[3] @0x60 = {0x00,0x48,0x26};          //发射频率
unsigned char rda1846RX[3] @0X63 = {0x00,0x48,0x26};          //接收频率
unsigned char rdaCTCSSTX[2] @0X66 = {0x22,0x68};         //发射模拟哑音
unsigned int  rdaCTCSSRX @0X68;            //接收模拟哑音
unsigned char rdaDTCTX[3] @0X6A ;          //发射数字哑音
unsigned int  rdaDTCRX    @0X6D;              //接收数字哑音
unsigned char rda1846r30r @0x6f;           //接收专用寄存器
unsigned char rda1846r58r @0x70 = 0x00;            //接收CTCSS(rda1846r58r=0x03)CDCSS(rda1846r58r=0x00)
unsigned char rda1846r45r @0x71 = 0x86;            //接收CTCSS(rda1846r45r=0x85)CDCSS(rda1846r58r=0x86)
unsigned char rda1846r45t @0x72 = 0x80;            //发射亚音控制寄存器
unsigned char rda1846rt05lt @0x73;           //特殊频率发射专用寄存器
unsigned char rda1846rt05ht @0x74;           //特殊频率发射专用寄存器
unsigned char rda1846rt64lt @0x75;           //特殊频率发射专用寄存器
unsigned char txpram @0x76 = 0x3F;//发射功率调整寄存器
unsigned char BZRAM @0x77;//接收步长寄存器

unsigned char V8RAM1 = 0;//收音机专用寄存器；

//unsigned char rda1846r05t ;           //发射控制寄存器

//unsigned char rda1846r64t[2] @0x6f;         //发射控制寄存器


/***************************************************************************/
#define RDASQ        PC_ODR_ODR1
#define RDA1846_O    PD_ODR_ODR3 
#define RDA1846_I    PD_IDR_IDR3 
#define RDA1846CLK   PD_ODR_ODR2
#define RDA1846SEN   PD_ODR_ODR0
#define RDA1846IOC   PC_ODR_ODR4 //不清楚这个 IOC 是啥意思

//#define RDA1846PDN   _pa2 
/***************************************************************************/        

/*
void Delays4ms(unsigned char number)                        //延时4MS程序
{
unsigned char temp,temp1;
for(;number!=0;number--)        //循环
{ 
for(temp=80;temp!=0;temp--)                //空循环
{
for(temp1=10;temp1!=0;temp1--)
{
                }
                }
        }
}*/
void rda_spi_write_Bytes( unsigned char wdata)
{
   //set the IO input
   PD_DDR_DDR3 = 1;
   
  for(unsigned char i = 8; i !=0 ; i--)
  {
    if (wdata & 0x80)
    {
      RDA1846_O = 1;
    }
    else 
    {
      RDA1846_O = 0;
    }
    
    RDA1846CLK = 1;
    
    NOP 
    RDA1846CLK=0;
    wdata <<= 1;
  }

}

unsigned char rda_spi_read_Bytes()
{
  unsigned char  rdaRead = 0;
  //set the IO input
    //SDIO 
  PD_DDR_DDR3 = 0;
  PD_CR1_C13  = 1;
  PD_CR2_C23  = 0; 
  
  for(unsigned char i= 8;i!=0;i--)
  {
    rdaRead =rdaRead<< 1;
    RDA1846CLK=1;
    
    NOP

    if(RDA1846_I) 
    {
      rdaRead|= 0x1;
    }
    RDA1846CLK=0;
  }

  return rdaRead;
}
unsigned int Readrda1846(unsigned char rdarom) //读出RDA寄存器程序
{
  unsigned  int rdaRead;

  RDA1846SEN=1;
//  RDA1846IOC=0;
  RDA1846CLK=0;
  RDA1846SEN=0;
  rdarom|=0x80;
  rda_spi_write_Bytes(rdarom);
  rdaRead = rda_spi_read_Bytes();
  rdaRead <<= 8;
  rdaRead |= rda_spi_read_Bytes();
  
  RDA1846IOC=0;
  RDA1846SEN=1;
  RDA1846_O=0;
  return rdaRead;
}        

void Writerda1846(unsigned char rdarom,unsigned char a,unsigned char b)
{

  RDA1846SEN=1;
 // RDA1846IOC=0;
  RDA1846CLK=0;
  RDA1846SEN=0;
  rda_spi_write_Bytes(rdarom);
  rda_spi_write_Bytes(a);
  rda_spi_write_Bytes(b);
  RDA1846SEN=1;
  RDA1846_O=0;
  
}        
/*25KHZ初始化RDA程序*/
void RDA1846_Init(void)
{
  //_clrwdt();//清除看门狗
  Writerda1846(0x30,0x00,0x01);
  
 //  unsigned int data = Readrda1846(0x01);
//  data = Readrda1846(0x01);
//  data = Readrda1846(0x03);
//  data = Readrda1846(0x04);
//  data = Readrda1846(0x08);
//  data = Readrda1846(0x09);
//  data = Readrda1846(0x0a);

  Writerda1846(0x30,0x00,0x04);
  unsigned int data = Readrda1846(0x30);
  //Writerda1846(0x04,0x0f,0xd1);//13M或12.8M
  Writerda1846(0x04,0x0f,0xd0);//26M或25.6M
  Writerda1846(0x08,0x02,0xA0);
  Writerda1846(0x09,0x03,0xAC);
  //Writerda1846(0x08,0x42,0xA0);
  //Writerda1846(0x09,0x03,0x2C);
  Writerda1846(0x0B,0x1A,0x10);
  //Writerda1846(0x0F,0x00,0x24);//400m=0X0024;200m=0X00A4;100m=0X00E4;
  Writerda1846(0x0F,0x00,0xE4);
  Writerda1846(0x11,0x3E,0x37);//立信科技提供参考增加
  Writerda1846(0x2B,0x32,0xc8);//26M
  //Writerda1846(0x2B,0x32,0x00);//12.8M或25.6M
  Writerda1846(0x2C,0x19,0x64);//26M
  //Writerda1846(0x2C,0x19,0x00);//12.8M或25.6M
  //Writerda1846(0x32,0x62,0x7C);//UHF
  Writerda1846(0x32,0x62,0xBC);//VHF
  Writerda1846(0x33,0x0A,0xF2);
  //Writerda1846(0x41,r[1],r[0]);//声控开启
  //Writerda1846(0x42,r[3],r[2]);//声控关闭
  Writerda1846(0x47,0x2C,0x2F);
  Writerda1846(0x4E,0x29,0x3A);
  Writerda1846(0x54,0x1D,0x4C);
  Writerda1846(0x56,0x06,0x52);
  Writerda1846(0x6E,0x06,0x2D);
  Writerda1846(0x70,0x10,0x29);
  Writerda1846(0x7F,0x00,0x01);
  Writerda1846(0x05,0x00,0x1F);
  Writerda1846(0x7F,0x00,0x00);
  Writerda1846(0x30,0x30,0xA4);
  Writerda1846(0x30,0x30,0xA6);
  //_clrwdt();//清除看门狗
  OSTimeDly(10);//10*10ms 延时100MS
  Writerda1846(0x30,0x30,0x06);
  //_clrwdt();//清除看门狗
  OSTimeDly(10);;//延时100MS
}



void RDA1846RX(unsigned char rama)
{
  unsigned char SQRAM;
  SQRAM=BZRAM-0x18;
  // _clrwdt();//清除看门狗
  Writerda1846(0x30,0x30,0x06);//关闭收发
  OSTimeDly(5);//delay 50ms
  Writerda1846(0x05,0x07,0x63);//
  Writerda1846(0x64,0x70,0x3A);//
  Writerda1846(0x29,0x00,rda1846RX[2]);//设定接收频率
  Writerda1846(0x2A,rda1846RX[1],rda1846RX[0]);//设定接收频率
  Writerda1846(0x1F,0x55,0x01);//设定GPIO口
  Writerda1846(0x44,0x00,0xFE);//AF输出大小调整
  Writerda1846(0x48,0x00,BZRAM);//设定开启SQ值
  Writerda1846(0x49,0x00,SQRAM);//设定关闭SQ值= 开启SQ值－0x18
  Writerda1846(0x4A,0X22,0X68);//=0x2268或0x1740
  Writerda1846(0x58,rda1846r58r,0x00);//CDCSS 0x0000  CTCSS时Writerda1846(0x58,0x03,0x00) CTCSS(rda1846r58r=0x03)CDCSS(rda1846r58r=0x00)
  Writerda1846(0x45,0x0A,rda1846r45r);//CDCSS 0x0a86  CTCSS时Writerda1846(0x45,0x0A,0x85) CTCSS(rda1846r45r=0x85)CDCSS(rda1846r58r=0x86)
  //Writerda1846(0x58,0X03,0x00);//CDCSS 0x0000  CTCSS时Writerda1846(0x58,0x03,0x00) CTCSS(rda1846r58r=0x03)CDCSS(rda1846r58r=0x00)
  //Writerda1846(0x45,0x0A,0X85);//CDCSS 0x0a86  CTCSS时Writerda1846(0x45,0x0A,0x85) CTCSS(rda1846r45r=0x85)CDCSS(rda1846r58r=0x86)
  Writerda1846(0x30,0x30,0x06);//宽带模式 窄带时Writerda1846(0x30,0x00,0x06)
  OSTimeDly(3);//delay 30ms
  Writerda1846(0x30,0x30,rama);//宽带模式=0x302e时为信号到达SQ值时AF才能信号输出否则为无信号输出
  // 窄带时Writerda1846(0x30,0x00,0x2E)
  //宽带模式=OX3026时为一直有信号输出
  //宽带模式=0X30A6时为静音模式
}
void RDA1846TX(void)
{
  if(V8RAM1==1)//收音机是否在开启状态
  {        
    unsigned char ram[2];
    unsigned char *p;
    ram[0]=0x82;//0X2H=0x8280时为休眠模式
    ram[1]=0x80;
    p=ram;
    //???    WriteRDA58XX(p,0x02,2);
    
    //txpram=0x3f;
    V8RAM1=0;//清除收音机状态标志
    OSTimeDly(2);;
  }
  //_clrwdt();//清除看门狗
  Writerda1846(0x30,0x30,0x06);//关闭收发
  OSTimeDly(2); //12ms
  Writerda1846(0x05,rda1846rt05ht,rda1846rt05lt);
  Writerda1846(0x64,0x70,rda1846rt64lt);
  Writerda1846(0x29,0x00,rda1846TX[2]);//设定发射频率
  Writerda1846(0x2A,rda1846TX[1],rda1846TX[0]);//设定发射频率
  Writerda1846(0x0A,0x04,txpram);//tx功率电压调整(最大＝0x043f，最小＝0x0400)
  Writerda1846(0x1F,0x55,0x01);//设定GPIO口
  Writerda1846(0x43,0x12,0x0F);//设定发射频偏及亚音幅度大小[12:6]调整话放亚音幅度[5:0]调整亚音幅度
  Writerda1846(0x4A,rdaCTCSSTX[0],rdaCTCSSTX[1]);//设定发射亚音频  4aH[15:0](ctcss_sentreg)=0.0974*(2^16) = 6383   
  //数字亚音时＝＝0X2268;
  Writerda1846(0x4B,0x00,rdaDTCTX[0]);//设定发射数字亚音频
  Writerda1846(0x4C,rdaDTCTX[1],rdaDTCTX[2]);//设定发射数字亚音频
  Writerda1846(0x45,0x0A,rda1846r45t);//设定亚音频控制寄存器(无亚音为0x80;模拟亚音0x81,数字0x82)
  Writerda1846(0x30,0x30,0x06);//宽带模式 窄带时Writerda1846(0x30,0x00,0x06)
  OSTimeDly(3);// 24ms
  Writerda1846(0x30,0x30,0x46);//带VOX时宽带模式 窄带时Writerda1846(0x30,0x00,0x56)                        
}