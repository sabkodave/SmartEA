string FormatDouble(double value, int digits=2) { return DoubleToString(value, digits); }

string GetFormattedTime() { return TimeToString(TimeCurrent(), TIME_DATE | TIME_MINUTES); }

bool EnsureWebRequestPermission(string url)
  {
   string allowed = TerminalInfoString(TERMINAL_API_URL);
   if(StringFind(allowed, url) < 0)
     {
      Print("[Utils] WebRequest to ", url, " may be blocked. Please allow it in Tools > Options > Expert Advisors.");
      return false;
     }
   return true;
  }
