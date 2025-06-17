#include "indicators.mq5"
#include "signals.mq5"
#include "utils.mq5"

input string ApiURL = "http://localhost:8000/data";

void SendDataToAPI(string signal)
  {
   string json = "{"
                + "\"symbol\":\"" + _Symbol + "\","
                + "\"time\":\"" + TimeToString(TimeCurrent(), TIME_DATE|TIME_MINUTES) + "\","
                + "\"price\":" + DoubleToString(SymbolInfoDouble(_Symbol, SYMBOL_BID), 2) + ","
                + "\"rsi\":" + DoubleToString(GetRSI(), 2) + ","
                + "\"ma50\":" + DoubleToString(GetMA50(), 2) + ","
                + "\"ma200\":" + DoubleToString(GetMA200(), 2) + ","
                + "\"macd_main\":" + DoubleToString(GetMACDMain(), 2) + ","
                + "\"macd_signal\":" + DoubleToString(GetMACDSignal(), 2) + ","
                + "\"senkouA\":" + DoubleToString(GetSenkouA(), 2) + ","
                + "\"senkouB\":" + DoubleToString(GetSenkouB(), 2) + ","
                + "\"volume\":" + DoubleToString(GetVolume(), 0) + ","
                + "\"signal\":\"" + signal + "\""
                + "}";

   char postData[];
   StringToCharArray(json, postData);
   char result[];
   string headers = "Content-Type: application/json\r\n";
   int res = WebRequest("POST", ApiURL, headers, 500, postData, result, NULL);
   if(res != 200)
     Print("[API] WebRequest failed. Code:", res, " | JSON:", json);
   else
     Print("[API] Data sent successfully: ", CharArrayToString(result));
  }
