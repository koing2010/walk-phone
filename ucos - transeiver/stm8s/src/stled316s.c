
#include "stled316s.h"
//数码管显示字数组
//                  			0 1 2 3 4 5 6 7 8 9 A B C D E F - 灭 N  t L H r o
const uchar SegA[] ={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,
			         0x77,0x7c,0x39,0x5e,0x79,0x71,0x40,0x00,0x37,0x78,0x38,0x76,0x50,0x3E,0x5c};    //段码


/*  STLED316S */
void Delay_STLED316S(void)  //延时
{
 uint i;
 for( i=0;i<10;i++ )
   {;}
}
/****************************************************************************
功能:		串口数据传送
描述: 	    给stled316s发送数据
参数:		data
返回值:		无
备注:		
******************************************************************************/
void SPI_SendData( uchar data )              
{
	uchar i,l;
	for(i=0; i<8 ;i++)
		{
	      CLK=0;
          if(data&0x01==1)			
	      DIN=1;
          else  DIN=0;	
          data>>=1;		
		  for( l=0 ; l<5 ; l++);
		  CLK=1;		
		  for( l=0 ; l<5 ; l++);					
		}
}
/****************************************************************************
功能:		stled316s初始化
描述: 	    对数码管的个数、亮度及led的亮度进行初始化	
参数:		Brightness 
返回值:		无
备注:		
******************************************************************************/
void InitSTLED316( uchar Brightness )   //初始化
{  
	STB=1;	
	Delay_STLED316S();												
	STB=0;
	Delay_STLED316S();					
    SPI_SendData(0x30);
    Delay_STLED316S();		
	STB=1;	
	Delay_STLED316S();												
	STB=0;
	Delay_STLED316S();	
    SPI_SendData(0x30);  //地址
    SPI_SendData(0xE4); //个数设置   E5是6个      
	Delay_STLED316S();												
	STB=1;	
	Delay_STLED316S();												
	STB=0;
	Delay_STLED316S();
  	SPI_SendData(0x11);	       	
	Delay_STLED316S();
   	STB=1;	
	Delay_STLED316S();												
	STB=0;
	Delay_STLED316S();	
    SPI_SendData(0x11);//地址
	SPI_SendData( Brightness );//亮度设置	         
	SPI_SendData( Brightness );							 
    SPI_SendData( Brightness );							 															
	STB=1;	
	Delay_STLED316S();												
	STB=0;
	Delay_STLED316S();
    SPI_SendData(0x18);	       	
	Delay_STLED316S();
    STB=1;	
	Delay_STLED316S();												
	STB=0;
	Delay_STLED316S();	
    SPI_SendData(0x18);     //地址
	SPI_SendData(0x00);					         
	SPI_SendData(0x00);	
    SPI_SendData(0x00);		//亮度设置				 	
}
/****************************************************************************
功能:		写数码管
描述: 	    控制数码的显示状态
参数:		data1,data2,data3,data4,data5,data6
返回值:		无
备注:		
******************************************************************************/
void Write_8LED( uchar oneSecondsFlag,uchar	data1,uchar data2,uchar	data3,uchar	data4)
{
STB=0;
	Delay_STLED316S();					
    SPI_SendData(0x00);		  	
	Delay_STLED316S();
	STB=1; 
	
	Delay_STLED316S();												
	STB=0;
	Delay_STLED316S();				
    SPI_SendData(0x00);   //地址

//点亮数码管*******************
//此处代码可修改
switch(oneSecondsFlag)
{
case 0://小数点全不亮
{	

	SPI_SendData(SegA[data1]);
	SPI_SendData(SegA[data2]);
	SPI_SendData(SegA[data3]);
	SPI_SendData(SegA[data4]);
	break;
}
case 1://中间时钟冒号点亮
{	
	SPI_SendData(SegA[data1]|0x80);
	SPI_SendData(SegA[data2]);
	SPI_SendData(SegA[data3]);
	SPI_SendData(SegA[data4]);

	break;
}

case 2://data1小数点亮
{
	SPI_SendData(SegA[data1]);
	SPI_SendData(SegA[data2]|0x80);
	SPI_SendData(SegA[data3]);
	SPI_SendData(SegA[data4]);

	break;
}
case 3://data2小数点亮
{
        SPI_SendData(SegA[data1]);
	SPI_SendData(SegA[data2]);
	SPI_SendData(SegA[data3]|0x80);
	SPI_SendData(SegA[data4]);

	break;
}

case 4://data4小数点亮
{
	SPI_SendData(SegA[data1]);
	SPI_SendData(SegA[data2]);
	SPI_SendData(SegA[data3]);
	SPI_SendData(SegA[data4]|0x80);

	break;
}
/*
case 5://data5小数点亮
{
	SPI_SendData(SegA[data1]);
	SPI_SendData(SegA[data2]);
	SPI_SendData(SegA[data3]);
	SPI_SendData(SegA[data4]);
	SPI_SendData(SegA[data5]|0x80);
	SPI_SendData(SegA[data6]);
	break;
}

//可在此添加显示程序，例如：
case 6://data6小数点亮
{
	SPI_SendData(SegA[data1]);
	SPI_SendData(SegA[data2]);
	SPI_SendData(SegA[data3]);
	SPI_SendData(SegA[data4]);
	SPI_SendData(SegA[data5]);
 	SPI_SendData(SegA[data6]|0x80);
	break;
}
*/
//注意要在函数参数中添加data6；
}

//**********************************************
    Delay_STLED316S();
    STB=1;
	Delay_STLED316S();														
	STB=0;
	Delay_STLED316S();			 										
	SPI_SendData(0x0d);				//发送显示命令
	Delay_STLED316S();
	STB=1;	
}
/****************************************************************************
功能:		控制led
描述: 	    控制某一位led的状态
参数:		data 
返回值:		无
备注:		
******************************************************************************/
void	Write_LED(uchar	data)
{
		STB=0;
		Delay_STLED316S();
		SPI_SendData(0x28);
		SPI_SendData(data);
		Delay_STLED316S();
		STB=1;
		Delay_STLED316S();
		STB=0;
		Delay_STLED316S();
    	SPI_SendData(0xD);  //Display On
    	Delay_STLED316S();
    	STB=1;
		Delay_STLED316S();		
}