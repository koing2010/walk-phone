
#ifndef __STLED316S_H__
#define __STLED316S_H__
#include <iostm8s105k4.h>
#define		uchar	unsigned	char
#define		uint	unsigned	int
#define DIN  PF_ODR_ODR4
#define CLK  PA_ODR_ODR2
#define STB  PA_ODR_ODR1

#define key_up     PB_IDR_IDR1
#define key_down   PD_IDR_IDR7

extern void InitSTLED316( uchar Brightness ) ;
extern void Write_8LED( uchar oneSecondsFlag,uchar	data1,uchar	data2,uchar	data3,uchar	data4);
extern void Write_LED(uchar	data);


#endif