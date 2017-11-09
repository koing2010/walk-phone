/******************************************************
MB1504 PLL 芯片驱动部分
*******************************************************/
#include <MB1504.h>
/*
//数字锁相环（ MB1504 ）驱动程序
//针对晶体 采用12M  步进采用 100KHz 的驱动程序
// 12M / 100K = 120 = 0x78
// Refer counter   = ( 0x78 << 1 ) | 0x8001   SW = 32
// Refer counter   = ( 0xF0 ) | 0x8001
// Refer counter   = 0x80F1 ;
//针对适用频率范围 为 8M -> 60M
//   Frequence
//  8M    60M
//  800    6000
//  0x0320   0x1770
*/

#define SetData 0x8641// Fre = 10khz


void Send16Bit( unsigned int SendData )

{
  unsigned char i;
  unsigned int SendMiddle;

  SendMiddle = SendData;
   MB1504_LE = 0;  MB1504_CLK = 0;

  for( i = 0; i < 16; i ++ )
  {
   if( SendMiddle & 0x8000 ) MB1504_DATA = 1;
   else  MB1504_DATA = 0;
    _nop_( ); 
    MB1504_CLK = 1;
    _nop_( );
    MB1504_CLK = 0;
    SendMiddle = SendMiddle << 1;

  }

  MB1504_LE = 1;  
  _nop_( ); 
  MB1504_LE = 0;

}



void Send11Bit( unsigned int SendData )

{

  unsigned char i;
 // unsigned int  SendMiddle;

//  SendMiddle = SendData;

  MB1504_LE = 0; MB1504_CLK = 0;
  for( i = 0; i < 11; i ++ )
  {

   if( SendData & 0x8000 )MB1504_DATA = 1;
    else MB1504_DATA = 0;
    _nop_( ); MB1504_CLK = 1;
    _nop_( ); MB1504_CLK = 0;
    SendData = SendData << 1;

  }

}



void Send8Bit( unsigned char SendData )

{

  unsigned char i;
 // unsigned char SendMiddle;
 // SendMiddle = SendData;

  for( i = 0; i < 8; i ++ )

  {

     if( SendData & 0x80 )MB1504_DATA = 1;
     else MB1504_DATA =0;
    _nop_(); MB1504_CLK = 1;
    _nop_(); MB1504_CLK = 0;
    SendData = SendData << 1;

  }

  MB1504_LE = 1; _nop_( ); MB1504_LE = 0;

}



void SendReferF()

{ // 针对晶体 采用12M

  Send16Bit( SetData ); // 12M Crystal

}



void FrequenceToSend( unsigned int FrequenceD )

{

  unsigned char AD = 0 ;
  unsigned int  ND = 0, MiddleF = 2000;
 // FrequenceD = FrequenceD*2;

  if( ( FrequenceD >= 800 ) && ( FrequenceD <= 30000 ) )

  {     // 限制 锁定频率

    MiddleF = FrequenceD;

    ND = ( unsigned int  ) ( MiddleF / 32 );

    AD = ( unsigned char ) ( MiddleF % 32 );

    ND = ND << 5;  AD = AD << 1; AD = AD & 0xef;

    Send11Bit( ND );
    Send8Bit( AD );
  }

}


