void I2C_init(void);
void I2C_start(void);
void I2C_address(uint8_t mode);
void I2C_write(uint8_t data);
void I2C_stop(void);

---------------cấu hình cho mpu6050---------

I2C_start(0x68);		//switch on the low-pass filter
I2C_write(0x1A);
I2C_write(0x05);
I2C_stop();

I2C_start(0x68);		//configure the accel-erometer output
I2C_write(0x1C);		//in register 28 ACCEL_CONFIG, bit 3 4
I2C_write(0x10);		//
I2C_stop();

//accelerometer are located in the register with hexadecimal numbers 3B
//thanh ghi 59 den 64

I2C_start(0x68);
I2C_write(0x3B);
I2C_stop();

I2C_start(0x68);

AccXLSB = I2C_read() << 8 | I2C_read();
AccYLSB = I2C_read() << 8 | I2C_read();
AccZLSB = I2C_read() << 8 | I2C_read();

-------------Start communication with mpu6050---------
SetClock 400000;
I2C_init();
delay(250);
I2C_start(0x68);
I2C_write(0x6B);
I2C_write(0x00);
I2C_stop();

-----------------------------------------------------------------
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

const int xpin = A1;

const int ypin = A2;

const int zpin = A3;

byte p[8] = {

  0x1F,

  0x1F,

  0x1F,

  0x1F,

  0x1F,

  0x1F,

  0x1F,

  0x1F

};

float threshold = 6;

float xval[100] = {0};

float yval[100] = {0};

float zval[100] = {0};

float xavg, yavg, zavg;

int steps, flag = 0;

void setup()

{

  Serial.begin(9600);

  lcd.begin();

  lcd.backlight();

  lcd.clear();

  calibrate();

}

void loop()

{

  for (int w = 0; w < 16; w++) {

    lcd.write(byte(0));

    delay(500);

  }

  int acc = 0;

  float totvect[100] = {0};

  float totave[100] = {0};

  float xaccl[100] = {0};

  float yaccl[100] = {0};

  float zaccl[100] = {0};

  for (int a = 0; a < 100; a++)

  {

    xaccl[a] = float(analogRead(xpin) - 345);

    delay(1);

    yaccl[a] = float(analogRead(ypin) - 346);

    delay(1);

    zaccl[a] = float(analogRead(zpin) - 416);

    delay(1);

    totvect[a] = sqrt(((xaccl[a] - xavg) * (xaccl[a] - xavg)) + ((yaccl[a] - yavg) * (yaccl[a] - yavg)) + ((zval[a] - zavg) * (zval[a] - zavg)));

    totave[a] = (totvect[a] + totvect[a - 1]) / 2 ;

    Serial.println("totave[a]");

    Serial.println(totave[a]);

    delay(100);

    if (totave[a] > threshold && flag == 0)

    {

      steps = steps + 1;

      flag = 1;

    }

    else if (totave[a] > threshold && flag == 1)

    {

      // Don't Count

    }

    if (totave[a] < threshold   && flag == 1)

    {

      flag = 0;

    }

    if (steps < 0) {

      steps = 0;

    }

    Serial.println('\n');

    Serial.print("steps: ");

    Serial.println(steps);

    lcd.print("Steps: ");

    lcd.print(steps);

    delay(1000);

    lcd.clear();

  }

  delay(1000);

}

void calibrate()

{

  float sum = 0;

  float sum1 = 0;

  float sum2 = 0;

  for (int i = 0; i < 100; i++) {

    xval[i] = float(analogRead(xpin) - 345);

    sum = xval[i] + sum;

  }

  delay(100);

  xavg = sum / 100.0;

  Serial.println(xavg);

  for (int j = 0; j < 100; j++)

  {

    yval[j] = float(analogRead(ypin) - 346);

    sum1 = yval[j] + sum1;

  }

  yavg = sum1 / 100.0;

  Serial.println(yavg);

  delay(100);

  for (int q = 0; q < 100; q++)

  {

    zval[q] = float(analogRead(zpin) - 416);

    sum2 = zval[q] + sum2;

  }

  zavg = sum2 / 100.0;

  delay(100);

  Serial.println(zavg);

}


