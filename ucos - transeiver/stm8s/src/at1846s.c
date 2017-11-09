/*******************************************************************************
Copyright: 
File_name:       at1846s.c
Version:	     0.0
Revised:        $Date:2017-1-16  ; $
Description:    the driver of at1846.
Notes:          This version targets the stm8
Editor:		    Mr.kon

*******************************************************************************/


/*==============================================================================
@ Include files
*/
#include "at1846s.h"


/*==============================================================================
@ Global variable
*/



/*==============================================================================
@ All functions  as follow
*/
ATINFO AT1846s;
REG_30H reg30;
REG_03H reg03;
REG_04H reg04;
REG_08H reg08;
REG_09H reg09;
REG_0AH reg0a;
REG_15H reg15;
REG_24H reg24;
REG_29H reg29;
REG_2AH reg2a;
REG_32H reg32;
REG_3AH reg3a;
REG_41H reg41;
REG_44H reg44;
REG_4EH reg4e;


/*******************************************************************************
Function: rda_spi_write_Bytes
Description:
SPI write a bytes, HSB module

Input:        None
Output:       None
Return:       None
Editor:	      Mr.kon
Others:	      2017/1/16
*******************************************************************************/
static void rda_spi_write_Bytes( unsigned char wdata)
{
  //set the IO output
  SET_SDIO_OUT
    
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

/*******************************************************************************
Function: rda_spi_read_Bytes
Description:
SPI read a bytes, HSB module

Input:        None
Output:       None
Return:       the data of readed
Editor:	      Mr.kon
Others:	      2017/1/16
*******************************************************************************/
static unsigned char rda_spi_read_Bytes()
{
  unsigned char  rdaRead = 0;
  //set the IO input
  //SDIO 
  SET_SDIO_IN
    
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

/*******************************************************************************
Function: Readrda1846
Description:
write : rdarom |080  and the read  16bitsvalue value.

Input:        rdarom : the address of register 
Output:       None
Return:       16bits register value
Editor:	      Mr.kon
Others:	      2017/1/16
*******************************************************************************/
static unsigned int Readrda1846(unsigned char rdarom) //读出RDA寄存器程序
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
void ReadReg(unsigned char rdarom, u16* Pdata)
{
  *Pdata = Readrda1846(rdarom);
}
/*******************************************************************************
Function: Writerda1846
Description:
write : rdarom |080  and the read  16bitsvalue value.

Input:        rdarom : the address of register 
Output:       None
Return:       16bits register value
Editor:	      Mr.kon
Others:	      2017/1/16
*******************************************************************************/
static void Writerda1846(unsigned char rdarom, unsigned int * pregvalue)
{
  unsigned char a;unsigned char b;
  unsigned int  Value = *pregvalue;
  a = Value >> 8; 
  b = Value;
  
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
static void Writerda1846s(unsigned char rdarom, unsigned char a,unsigned char b)
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
BOOL IntAt1846s( void )
{
  unsigned int WriteCMD;
  /* reset chip */
  WriteCMD= RESET_AT_CMD;
  Writerda1846(0x30, &WriteCMD);
  OSTimeDly(20);//200ms
  
  /* read chip ID */
  AT1846s.Chip_ID = Readrda1846(0x00);
  if( AT1846s.Chip_ID != 0x1846)
  {
    return 0;
  }
  
  /* read version */
  AT1846s.Mr_ID =  Readrda1846(0x01);
  if(AT1846s.Mr_ID != 0x003F)
  {
    return 0;
  }
  
  /* set basic information int */
  reg30.soft_reset = OFF;
  reg30.chip_cal_en = DISABLE;
  reg30.sq_on = OFF;
  reg30.rx_on = OFF;
  reg30.tx_on = OFF;
  reg30.pdn_reg = ON;
  reg30.mute = OFF;
  reg30.tail_elim_en = OFF;
  reg30.band_mode_sel = BAND_MODE_25KHZ;
  reg30.filter_band_sel = BAND_MODE_25KHZ;
  reg30.xtal_mode = XTAL_26_OR_13MZh;
  Writerda1846(0x30, (u16*)&reg30);
  u16 Int = 0x0;
  ReadReg(0x30, (u16*)&Int);//
  /* set CLK = 26MHZ , 04H */
  reg04.clk_mode = CLK_MODE_25_6_OR_26_MHZ;
  Writerda1846(0x04, (u16*)&reg04);
  
  /* set ldo , 08H */
  reg08.ldo_master_bypass = 0;//Setting RDA1846S in VHF band , 08H[14]must be 0.
  Writerda1846(0x08, (u16*)&reg08);
  
  /* set , 09H */
  reg09.ldo_dig_vbit = 0x7;//3.3v
  Writerda1846(0x09, (u16*)&reg09);
  /* read 0aH */
  //reg0a.pabias_voltage = 63;//<5:0>
  //  reg0a.pga_gain = 31;//pga_gain<4:0>
  //  reg0a.padrv_ibit = 15;//<3:0>

  ReadReg(0x0a, (u16*)&reg0a);//default 0x7C20
  
  
  /* read 15H */
  ReadReg(0x15, (u16*)&reg15);//default 0x1100
  
  /* read 24H  */
  ReadReg(0x24, (u16*)&reg24);//default 0x0001
  
  reg24.pll_lock_det_sel = ENABLE;
  Writerda1846(0x24, (u16*)&reg24); 
   
  /* set RF fre 29H  */
  u32 rf_fre = 156800*16; //uint KHz*16
  
  reg29.freqH = (u16)(rf_fre >> 16);
  reg2a.freqL = (u16)rf_fre;
  Writerda1846(0x29, (u16*)&reg29); 
  Writerda1846(0x2a, (u16*)&reg2a);

  
  /* set  3aH */
  
  reg3a.voice_sel = FROM_MIC;
  reg3a.sq_dten = 0x00;//rssi detect enable
  Writerda1846(0x3a, (u16*)&reg3a);
  
  //reg44.gain_tx = 
  reg44.dac_vgain_ = 0x8;//Analog DAC gain
  reg44.volume = 0x8;//Digital Voice gain
  Writerda1846(0x44, (u16*)&reg44);
  
  
  reg4e.ctcss_or_cdcss_sel = DISABLE;//not Tx ctcss/cdcss
  Writerda1846(0x4e, (u16*)&reg4e);
 
  
  return 1;
}


u8 C_RFIC_R04H_FOSC = CLK_MODE_25_6_OR_26_MHZ;//
u8 C_RFIC_R30H_NARROW = 0x70;
void At1846sOPenTx()
{
//  reg30.rx_on = OFF;
//  reg30.tx_on = ON;
//  Writerda1846(0x30, (u16*)&reg30);
//  OSTimeDly(1000);//10s
//  u16 VoxMic = Readrda1846(0x1a);
//  OSTimeDly(10);//100ms
  Writerda1846s(0x30,0x00,0x04);//关闭收发	
  OSTimeDly(10);//delay_100ms
    /* set RF fre 29H  */
  u32 rf_fre = 156800*16; //uint KHz*16
  
  reg29.freqH = (u16)(rf_fre >> 16);
  reg2a.freqL = (u16)rf_fre;
  Writerda1846(0x29, (u16*)&reg29); 
  Writerda1846(0x2a, (u16*)&reg2a);
  Writerda1846s(0x30,C_RFIC_R30H_NARROW,0x06);
  OSTimeDly(10);//delay_100ms_end
  Writerda1846s(0x30,C_RFIC_R30H_NARROW,0x26);
	
}

void At1846sOPenRx()
{
//  reg30.rx_on = ON;
//  reg30.tx_on = OFF;
//  Writerda1846(0x30, (u16*)&reg30);
//  
//  OSTimeDly(1000);//10s
//  u16 RssiNoise = Readrda1846(0x1b);
//  RssiNoise = Readrda1846(0x2d);
//  OSTimeDly(10);//10s
  Writerda1846s(0x30,0x00,0x04);//关闭收发	
  OSTimeDly(10);//delay_100ms
    /* set RF fre 29H  */
  u32 rf_fre = 156800*16; //uint KHz*16
  
  reg29.freqH = (u16)(rf_fre >> 16);
  reg2a.freqL = (u16)rf_fre;
  Writerda1846(0x29, (u16*)&reg29); 
  Writerda1846s(0x30,C_RFIC_R30H_NARROW,0x06);
  OSTimeDly(10);//delay_100ms_end
  Writerda1846s(0x30,C_RFIC_R30H_NARROW,0x46);
}

/***************************test int *******************************************/
void TestInit(void)
{
        Writerda1846s(0x30,0x00,0x01);		
	OSTimeDly(10);//delay_100ms
	Writerda1846s(0x30,0x00,0x04);		
	Writerda1846s(0x04,0x0F,C_RFIC_R04H_FOSC);		// To set you want 
	Writerda1846s(0x0A,0x43,0xA0);		
	Writerda1846s(0x13,0xA1,0x00);		
	Writerda1846s(0x1F,0x50,0x01);		// To set you want

	Writerda1846s(0x31,0x00,0x31);	
	Writerda1846s(0x33,0x44,0xa5);
	Writerda1846s(0x34,0x2b,0x8e);

	Writerda1846s(0x41,0x06,0x0F);		
	Writerda1846s(0x44,0x0A,0xFF);	
	Writerda1846s(0x47,0x7F,0x2F);		
	Writerda1846s(0x4F,0x2C,0x62);		
	Writerda1846s(0x53,0x00,0x94);		
	Writerda1846s(0x54,0x2A,0x18);		
	Writerda1846s(0x55,0x00,0x81);		
	Writerda1846s(0x56,0x0B,0x22);		
	Writerda1846s(0x57,0x1C,0x00);
	Writerda1846s(0x58,0x80,0x0D);	
	Writerda1846s(0x5A,0x0E,0xDD);		
	Writerda1846s(0x63,0x3F,0xFF);
/***************  Registers in page 1 ***************/
//	Writerda1846s(0x7f,0x00,0x01);
//	Writerda1846s(0x05,0x00,0x0c);
//	Writerda1846s(0x06,0x02,0x0c);
//	Writerda1846s(0x07,0x03,0x0c);
//	Writerda1846s(0x08,0x03,0x24);
//	Writerda1846s(0x09,0x13,0x44);
//	Writerda1846s(0x0a,0x3f,0x44);
//	Writerda1846s(0x0b,0x3f,0x44);
//	Writerda1846s(0x0c,0x3f,0x44);
//	Writerda1846s(0x0d,0x3f,0x44);
//	Writerda1846s(0x0e,0x3f,0x44);
//	Writerda1846s(0x0f,0x3f,0x44);
//
//	Writerda1846s(0x12,0xe0,0xed);
//	Writerda1846s(0x13,0xf2,0xfe);
//	Writerda1846s(0x14,0x0a,0x16);
//	Writerda1846s(0x15,0x24,0x24);
//	Writerda1846s(0x16,0x24,0x24);
//	Writerda1846s(0x17,0x24,0x24);
//	Writerda1846s(0x7f,0x00,0x00);
   
	Writerda1846s(0x30,C_RFIC_R30H_NARROW,0xA4);
	OSTimeDly(10);//delay_100ms
	Writerda1846s(0x30,C_RFIC_R30H_NARROW,0xA6);
	OSTimeDly(10);//delay_100ms
	Writerda1846s(0x30,C_RFIC_R30H_NARROW,0x06);
	OSTimeDly(10);//delay_100ms_end

////窄带设置：
//	Writerda1846s(0x11,0x3d,0x37);	//0x11,0x3d,0x37,
//	Writerda1846s(0x12,0x01,0x00);	//0x12,0x71,0x00,
//	Writerda1846s(0x15,0x11,0x00);	//0x15,0x1f,0x00,
//
//	Writerda1846s(0x32,0x44,0x95);		//agc target power
//	Writerda1846s(0x3A,0x40,0xC3);		//modu_det_sel SQ setting
//	Writerda1846s(0x3C,0x04,0x07);		//pk_det_th SQ setting [08,07]
//	Writerda1846s(0x3F,0x28,0xD0);		//rssi3_th SQ setting [51,50]
//	Writerda1846s(0x48,0x20,0x3E);		//noise1_th
//	Writerda1846s(0x60,0x1B,0xB7);		//noise2_th SQ setting [37,37]
//	Writerda1846s(0x62,0x14,0x25);		//modu_det_th SQ setting
//	Writerda1846s(0x65,0x24,0x94);		//setting th_sif for SQ rssi detect
//	Writerda1846s(0x66,0xEB,0x2E);		//rssi_comp
////宽带设置：
//	Writerda1846s(0x15,0x1F,0x00);		//tuning for sensitivity
//	Writerda1846s(0x32,0x75,0x64);		//agc target power
//	Writerda1846s(0x34,0x2b,0x8c);	
//	Writerda1846s(0x3A,0x44,0xC3);		//modu_det_sel SQ setting
//	Writerda1846s(0x3C,0x19,0x30);		//pk_det_th SQ setting [32,30]
//	Writerda1846s(0x3F,0x29,0xD2);		//rssi3_th SQ setting [53,52]
//	Writerda1846s(0x48,0x20,0x3E);		//noise1_th [40,3E]
//	Writerda1846s(0x60,0x10,0x1E);		//noise2_th SQ setting [20,1E]
//	Writerda1846s(0x62,0x37,0x67);		//modu_det_th SQ setting
//	Writerda1846s(0x65,0x24,0x8A);		//setting th_sif for SQ rssi detect
//	Writerda1846s(0x66,0xFF,0xAE);		//rssi_comp
}

/*@*****************************end of file**********************************@*/
