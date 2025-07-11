#include "indicators.mq5"
#include "signals.mq5"
#include "api_sender.mq5"
#include "utils.mq5"

input bool AutoTrade = false;
input int MagicNumber = 20250610;
input int Slippage = 10;

int OnInit()
  {
   Print("[SmartEA] Initialization started...");
   if(!InitializeIndicators())
     {
      Print("[SmartEA] Indicator initialization failed.");
      return(INIT_FAILED);
     }
   Print("[SmartEA] Initialization complete.");
   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {
   Print("[SmartEA] Deinitialization. Reason:", reason);
  }

void OnTick()
  {
   UpdateIndicators();
   string signal = GetSignal();
   SendDataToAPI(signal);
   if(AutoTrade)
     ExecuteTrade(signal);
  }
