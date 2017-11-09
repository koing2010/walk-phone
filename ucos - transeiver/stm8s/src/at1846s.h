/*******************************************************************************

File_name:       Model.h
Description:    the header file of  Model_c .

*******************************************************************************/
#ifndef     __AT1846S_H__
#define     __AT1846S_H__

/*==============================================================================
@ Include files
*/

#include "includes.h"

typedef unsigned char     BOOL;

/*==============================================================================
@ Typedefs
*/
typedef struct INFO_
{
  u16  Chip_ID;  //register 00h default value = 0x1846
  u16  Mr_ID;  //register 01h default value = 0x003F
}ATINFO,*PATINFO;


/******************************************************************************/

/* set some infomation about 30H */

#define RESET_AT_CMD          0x0001

#define ENABLE                1
#define DISABLE               0
#define ON                    1
#define OFF                   0

//band mode
#define BAND_MODE_25KHZ            1
#define BAND_MODE_12_5KHZ          0

#define XTAL_26_OR_13MZh           1
#define XTAL_25_6_OR_12_8_MHZ      0

typedef struct REG_30H_
{
  u16 soft_reset      : 1; // 1 = reset, then all the registers are reset to default value,0 = normal
  u16 chip_cal_en     : 1; // 1 = cal enable, 0 = cal disable 
  u16 pdn_reg         : 1; // 1 = enable, 0 = disable,the same as pdn pin
  u16 sq_on           : 1; // 1 = on, then chip auto sq, 0 = off
  u16 vox_on          : 1; // 1 = on, enable 1846s Vox detect, 0 = off
  u16 rx_on           : 1; // 1 = on, 0 = off
  u16 tx_on           : 1; // 1 = on, 0 = off
  u16 mute            : 1; // 1 = mute when rxno,0 = no mute
  u16 others          : 2; // none
  u16 direct_reg      : 1; // 1 = enable direct_reg,0 = disable direct_reg
  u16 tail_elim_en    : 1; // 1= on ,enable 1846s tail elimination function,0 = off disable
  u16 band_mode_sel   : 1; // Dsp band mode select: 1 = 25khz band mode , 0 = 12.5Khz band mode
  u16 filter_band_sel : 1; // Analog filter band select: 1 = 25Khz band mode ,0 = 12.5Khz band mode
  u16 xtal_mode       : 1; // 1: 26/13Mhz   0: 25.6/12.8Mhz
  u16 other           : 1;
}REG_30H,*PREG_30H;



/** 03h defalt value = 0x2B51 **/
typedef struct REG_03H_
{   
  u16 other1             : 11; //
  u16 tx_adc_reset_reg   : 1; // 1 = enable direct reg,0 = disable direct reg
  u16 tx_adc_reset_dr    : 1; // 1 = enable reset adc,0 = disable direct reg
  //bit13
  u8 other              : 2;   
}REG_03H,*PREG_03H;

/* define some information about 04H */
#define CLK_MODE_12_8_OR_13_MHZ    1
#define CLK_MODE_25_6_OR_26_MHZ    0

/** 04h default value = 0x0FD1 **/
typedef struct REG_04H_
{
  u16 clk_mode             : 1 ;// 1 = 12.8/13Mhz, 0 = 25.6/26Mhz
  u16 others              : 15;// 
  
}REG_04H,*PREG_04H;

/** 08h default value = 0x02A0 **/
typedef struct REG_08H_
{
  u16 others              : 14;// 
  u16 ldo_master_bypass    : 1 ;// 1 = bypass all LODs inside RDA1846s
  u16 others1              : 1 ;
  
}REG_08H,*PREG_08H;

/** 09h default value = 0x03C2 **/
typedef struct REG_09H_
{
  u16 others               : 7;// 
  u16 ldo_dig_vbit         : 3;// If 08H[14]=0， control LDO Vout for digital.
  u16 others1              : 6 ;
  
}REG_09H,*PREG_09H;

/** 0ah default value = 0x7C20 **/
typedef struct REG_0AH_
{
  u16 pabias_voltage       : 6;// pga_gain<4:0>
  u16 pga_gain             : 5;// voice analog gain.
  u16 padrv_ibit           : 4;//output of RF power control
  u16 otehr                : 1;
}REG_0AH,*PREG_0AH;


/** 15h default value = 0x1100 **/
typedef struct REG_15H_
{
  u16 other2              : 8;// 
  u16 others              : 1;// 
  u16 tuning_bit           : 4;// Tuning IF filter center frequency and bw
  u16 others1              : 3;//
}REG_15H,*PREG_15H;

/** 24h default value = 0x0001 **/
typedef struct REG_24H_
{
  u16 others                 : 6;// 
  u16 dsp_resetn_reg         : 1;//1=enable reset dsp,0=disable reset dsp
  u16 dsp_resetn_dr          : 1;//1=enable direct reg,0=disable direct reg
  u16 others1                : 5;//
  u16 reset_pll_lock_delay   : 2;//
  u16 pll_lock_det_sel       : 1;//1: bypass pll lock det function
  
}REG_24H,*PREG_24H;

/** 29h default value = 0x2486 **/
typedef struct REG_29H_
{
  u16 freqH                   : 14;//Freq high value (unit 1khz/16)
}REG_29H,*PREG_29H;

/** 2ah default value = 0x3A84 **/
typedef struct REG_2AH_
{
  u16 freqL                   : 16;//Freq low value (unit 1khz/16)
}REG_2AH,*PREG_2AH;

/** 32h default value = 0x7497 **/
typedef struct REG_32H_
{
  u16 others                 : 6;//
  u16 agc_target_pwr         : 6;//AGC target power, unit 2dB
  u16 others1                : 4;//
}REG_32H,*PREG_32H;

/**/
#define FROM_MIC               0x04//0B100 //Tx signal from microphone
#define FROM_TONE1_ADN_TONE2   0x03//0B011 //Tx signal from frequency of tone1 and tone2
#define FROM_TONE1             0x02//0B010//Tx signal from frequency of tone1
#define FROM_TONE2             0x01//0B001//Tx signal from frequency of tone2
#define TX_NOTHING             0x00//0B000//Tx nothing
/** 3ah default value = 0x40C3 **/
typedef struct REG_3AH_
{
  u16 ctcss_cdcss_dten       : 5;//Select Ctcss/Cdcss detect mode for rx
  u16 agc_target_pwr         : 1;//Select Ctcss/Cdcss mode for rx
  u16 sq_dten                : 5;//sq condition enable
  u16 sq_out_sel             : 1;//1=output of gpio6=sq_cmp & sub_audio_cmp; 0=output of gpio6= sq_cmp .
  u16 voice_sel              : 3;// voice path select
  u16 code_out_sel           : 1;//1=output code sample signal via GPIO3, 0=output dtmf_sample/dtmf_idle signal via GPIO3
}REG_3AH,*PREG_3AH;

/** 41h default value = 0x4006 **/
typedef struct REG_41H_
{
  u16 voice_gain_tx          : 7;//Voice digital gain
  u16 other                 : 9;//         
}REG_41H,*PREG_41H;


/** 44h default value = 0x00FF **/
typedef struct REG_44_
{
  u16 volume          : 4;//Digital Voice gain
  u16 dac_vgain_      : 4;//Analog DAC gain
  u16 gain_tx         : 4;//Voice digital gain after tx ADC down sample
  u16 other           : 4;//         
}REG_44H,*PREG_44H;

/** 4eh default value = 0x20C2 **/
typedef struct REG_4E_
{
  u16 other                   : 6;// 
  u16 cdcss_sel               : 3;//Select cdcss mode for tx
  u16 ctcss_or_cdcss_sel      : 2;//Select Ctcss/Cdcss mode for tx
  u16 other1                  : 3;//
  u16 shift_sel               : 2;//shift phase for tx and rx tail elimination
}REG_4EH,*PREG_4EH;




/*==============================================================================
@ Constants and defines
*/
#define NOP          for(u8 i = 0;i < 16 ; i ++) {asm("NOP");asm("NOP");\
asm("NOP"); asm("NOP");}
#define  SET_SDIO_IN   PD_DDR_DDR3 = 0;
#define  SET_SDIO_OUT  PD_DDR_DDR3 = 1;

/** pin function **/					 
#define RDASQ        PC_ODR_ODR1
#define RDA1846_O    PD_ODR_ODR3 
#define RDA1846_I    PD_IDR_IDR3 
#define RDA1846CLK   PD_ODR_ODR2
#define RDA1846SEN   PD_ODR_ODR0
#define RDA1846IOC   PC_ODR_ODR4 //不清楚这个 IOC 是啥意思



//#define RDA1846PDN   _pa2 

void At1846sOPenTx();
void At1846sOPenRx();
BOOL IntAt1846s( void );

void TestInit(void);


#endif
/*@*****************************end of file**********************************@*/