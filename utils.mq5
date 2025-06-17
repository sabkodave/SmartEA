string FormatDouble(double value, int digits=2) { return DoubleToString(value, digits); }

string GetFormattedTime() { return TimeToString(TimeCurrent(), TIME_DATE | TIME_MINUTES); }

bool EnsureWebRequestPermission(string url)
  {
   // In many cases the terminal restricts WebRequest calls to predefined URLs.
   // This helper simply warns the user without blocking execution.
   Print("[Utils] Ensure that WebRequest permissions include: ", url);
   return true;
  }
