input int RSI_Period = 14;
double rsiValue = 0.0;
double ma50 = 0.0;
double ma200 = 0.0;
double macdMain = 0.0;
double macdSignal = 0.0;
double ichimoku_senkouA = 0.0;
double ichimoku_senkouB = 0.0;
double volumeCurrent = 0.0;

bool InitializeIndicators() { return true; }

void UpdateIndicators()
  {
   int shift = 0;
   rsiValue = iRSI(_Symbol, _Period, RSI_Period, PRICE_CLOSE, shift);
   ma50 = iMA(_Symbol, _Period, 50, 0, MODE_SMA, PRICE_CLOSE, shift);
   ma200 = iMA(_Symbol, _Period, 200, 0, MODE_SMA, PRICE_CLOSE, shift);
   macdMain = iMACD(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, shift);
   macdSignal = iMACD(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, shift);
   ichimoku_senkouA = iIchimoku(_Symbol, _Period, 9, 26, 52, MODE_SENKOUSPANA, shift);
   ichimoku_senkouB = iIchimoku(_Symbol, _Period, 9, 26, 52, MODE_SENKOUSPANB, shift);
   volumeCurrent = Volume[shift];
  }

double GetRSI() { return rsiValue; }
double GetMA50() { return ma50; }
double GetMA200() { return ma200; }
double GetMACDMain() { return macdMain; }
double GetMACDSignal() { return macdSignal; }
double GetSenkouA() { return ichimoku_senkouA; }
double GetSenkouB() { return ichimoku_senkouB; }
double GetVolume() { return volumeCurrent; }
