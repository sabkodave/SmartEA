#include "indicators.mq5"

string GetSignal()
  {
   double rsi = GetRSI();
   double ma_fast = GetMA50();
   double ma_slow = GetMA200();
   double macd_main = GetMACDMain();
   double macd_signal = GetMACDSignal();
   double senkouA = GetSenkouA();
   double senkouB = GetSenkouB();
   double price = SymbolInfoDouble(_Symbol, SYMBOL_BID);

   string signal = "NEUTRAL";
   if(rsi < 30 && price > senkouA && price > senkouB && macd_main > macd_signal && ma_fast > ma_slow)
     signal = "BUY";
   else if(rsi > 70 && price < senkouA && price < senkouB && macd_main < macd_signal && ma_fast < ma_slow)
     signal = "SELL";
   return signal;
  }
