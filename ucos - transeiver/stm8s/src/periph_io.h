#ifndef __PERIPH_IO_H__
#define __PERIPH_IO_H__

#include "iostm8s105k4.h"

#define  LED0_ON   PD_ODR_ODR0 = 1
#define  LED0_OFF  PD_ODR_ODR0 = 0
#define  LED1_ON   PD_ODR_ODR3 = 1
#define  LED1_OFF  PD_ODR_ODR3 = 0


#endif