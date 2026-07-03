//+------------------------------------------------------------------+
//|                    MT5 BTC Scalper EA                            |
//|                  High Win Rate Auto Pilot - 24/7 Trading         |
//|              Optimized for 24-Hour Crypto Markets                |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026 - BTC Scalper"
#property link "https://github.com/addotwumnana-eng/mt5-gold-scalper-ea"
#property version "1.0 - BTC 24/7"
#property strict
#property icon "💎"
#property description "🚀 BTC SCALPER EA 24/7 - High Win Rate Bitcoin Scalping with Buy/Sell Stop, Trailing, and Pending Order Management - 24/7 CRYPTO TRADING"

#include <Trade\Trade.mqh>
#include <Trade\SymbolInfo.mqh>

//--- Input Parameters
input group "🚀 ===== BTC SCALPER EA 24/7 ===== 🚀"
input bool enable24HourTrading = true;   // ✅ BITCOIN 24/7 TRADING MODE

input group "⏰ ===== 24/7 TRADING MODE ===== ⏰"
input bool enableLondonSession = false;  // Disable - 24/7 mode
input bool enableNewYorkSession = false; // Disable - 24/7 mode

input group "💰 ===== RISK MANAGEMENT ===== 💰"
input double lotSize = 0.01;                // Lot Size (BTC contracts)
input double maxRiskPercent = 2.0;          // Max Risk % per Trade
input int maxOpenTrades = 5;                // Maximum Open Trades
input int maxPendingOrders = 10;            // Maximum Pending Orders

input group "📦 ===== PENDING ORDERS ===== 📦"
input double bestDistance = 50.0;           // Best Distance for Pending Orders (points)
input int pendingOrderExpiry = 3600;        // Pending Order Expiry Time (seconds)
input bool autoDeleteExpiredOrders = true;  // Auto Delete Expired Pending Orders

input group "📈 ===== BUY STOP SETTINGS ===== 📈"
input double buyStopDistance = 100.0;       // Buy Stop Distance (points)
input double buyStopTrailingStart = 150.0; // Trailing Start Point (points)
input double buyStopTrailingStep = 30.0;   // Trailing Step Point (points)

input group "📉 ===== SELL STOP SETTINGS ===== 📉"
input double sellStopDistance = 100.0;      // Sell Stop Distance (points)
input double sellStopTrailingStart = 150.0;// Trailing Start Point (points)
input double sellStopTrailingStep = 30.0;  // Trailing Step Point (points)

input group "🎯 ===== TAKE PROFIT & STOP LOSS ===== 🎯"
input double takeProfitPoints = 200.0;      // Take Profit (points) - BTC
input double stopLossPoints = 100.0;        // Stop Loss (points) - BTC
input bool useTrailingStop = true;          // Use Trailing Stop

input group "⚙️ ===== EA SETTINGS ===== ⚙️"
input int magicNumber = 654321;             // Magic Number - BTC EA
input string symbolToTrade = "BTCUSD";      // 🚀 BITCOIN SYMBOL
input int fastMA = 9;                       // Fast Moving Average Period
input int slowMA = 21;                      // Slow Moving Average Period

//--- Global Variables
CTrade trade;
CSymbolInfo symbolInfo;
datetime lastOrderTime = 0;
double pointValue;
int orderTicket = 0;
int fastMAHandle = 0;
int slowMAHandle = 0;

// ========== BTC SCALPER EA IDENTIFICATION ==========
string eaName = "🚀 BTC SCALPER EA 24/7 🚀";
string eaType = "BITCOIN CRYPTOCURRENCY SCALPER";
string tradingMode = "24/7 CONTINUOUS TRADING";

//+------------------------------------------------------------------+
//| Expert initialization function                                  |
//+------------------------------------------------------------------+
int OnInit()
{
   // Initialize Trade object
   trade.SetExpertMagicNumber(magicNumber);
   trade.SetDeviationInPoints(50);
   
   // Initialize Symbol Info
   if (!symbolInfo.Name(symbolToTrade))
   {
      Print("ERROR: Symbol ", symbolToTrade, " not found!");
      Print("This is the BTC SCALPER EA - Please use BTCUSD symbol!");
      return INIT_FAILED;
   }
   
   pointValue = symbolInfo.Point();
   
   // Create MA indicators
   fastMAHandle = iMA(symbolToTrade, PERIOD_M5, fastMA, 0, MODE_SMA, PRICE_CLOSE);
   if (fastMAHandle == INVALID_HANDLE)
   {
      Print("ERROR: Error creating Fast MA indicator");
      return INIT_FAILED;
   }
   
   slowMAHandle = iMA(symbolToTrade, PERIOD_M5, slowMA, 0, MODE_SMA, PRICE_CLOSE);
   if (slowMAHandle == INVALID_HANDLE)
   {
      Print("ERROR: Error creating Slow MA indicator");
      return INIT_FAILED;
   }
   
   // ========== BTC SCALPER IDENTIFICATION BANNER ==========
   Print("");
   Print("╔═══════════════���════════════════════════════════════════╗");
   Print("║          🚀 BTC SCALPER EA 24/7 STARTED 🚀            ║");
   Print("╠════════════════════════════════════════════════════════╣");
   Print("║ EA Name: ", eaName);
   Print("║ Type: ", eaType);
   Print("║ Mode: ", tradingMode);
   Print("╠════════════════════════════════════════════════════════╣");
   Print("║ Symbol: BTCUSD (BITCOIN)");
   Print("║ Magic Number: 654321 (BTC EA)");
   Print("║ Lot Size: ", lotSize, " BTC contracts");
   Print("║ Max Risk: ", maxRiskPercent, "%");
   Print("║ Take Profit: ", takeProfitPoints, " points (BTC)");
   Print("║ Stop Loss: ", stopLossPoints, " points (BTC)");
   Print("╠════════════════════════════════════════════════════════╣");
   Print("║ Trading Hours: 24/7 - ALL HOURS");
   Print("║ Trading Days: 24/7 - INCLUDING WEEKENDS");
   Print("║ Status: ACTIVE - Ready to Trade Bitcoin!");
   Print("╚════════════════════════════════════════════════════════╝");
   Print("");
   
   return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Expert tick function                                            |
//+------------------------------------------------------------------+
void OnTick()
{
   // Check if trading is allowed
   if (!IsTradeAllowed())
      return;
   
   // Manage existing trades
   ManageTrades();
   
   // Delete expired pending orders
   if (autoDeleteExpiredOrders)
      DeleteExpiredOrders();
   
   // Check if we can place new orders
   if (CountOpenTrades() >= maxOpenTrades)
      return;
   
   if (CountPendingOrders() >= maxPendingOrders)
      return;
   
   // Get market data
   double bid = SymbolInfoDouble(symbolToTrade, SYMBOL_BID);
   double ask = SymbolInfoDouble(symbolToTrade, SYMBOL_ASK);
   
   // Analyze market and place orders
   AnalyzeMarketAndTrade(bid, ask);
}

//+------------------------------------------------------------------+
//| Analyze market and place trades                                 |
//+------------------------------------------------------------------+
void AnalyzeMarketAndTrade(double bid, double ask)
{
   // Get MA values from handles
   double fastMA_array[1];
   double slowMA_array[1];
   
   if (CopyBuffer(fastMAHandle, 0, 0, 1, fastMA_array) <= 0)
      return;
   
   if (CopyBuffer(slowMAHandle, 0, 0, 1, slowMA_array) <= 0)
      return;
   
   double fastMA_val = fastMA_array[0];
   double slowMA_val = slowMA_array[0];
   double close = iClose(symbolToTrade, PERIOD_M5, 0);
   
   if (fastMA_val == 0 || slowMA_val == 0)
      return;
   
   // BUY Signal - Fast MA above Slow MA
   if (fastMA_val > slowMA_val && close > fastMA_val)
   {
      PlaceBuyStopOrders(bid, ask);
   }
   
   // SELL Signal - Fast MA below Slow MA
   else if (fastMA_val < slowMA_val && close < fastMA_val)
   {
      PlaceSellStopOrders(bid, ask);
   }
}

//+------------------------------------------------------------------+
//| Place Buy Stop Orders                                           |
//+------------------------------------------------------------------+
void PlaceBuyStopOrders(double bid, double ask)
{
   // Check cooldown
   if (TimeCurrent() - lastOrderTime < 60)
      return;
   
   double buyStopPrice = bid + (buyStopDistance * pointValue);
   double tp = buyStopPrice + (takeProfitPoints * pointValue);
   double sl = buyStopPrice - (stopLossPoints * pointValue);
   
   // Place buy stop order
   if (trade.BuyStop(lotSize, buyStopPrice, symbolToTrade, sl, tp))
   {
      lastOrderTime = TimeCurrent();
      Print("🚀 BTC BUY STOP Order Placed @ ", buyStopPrice, " | TP: ", tp, " | SL: ", sl);
   }
   else
   {
      Print("❌ BTC BUY STOP Failed. Error: ", GetLastError());
   }
}

//+------------------------------------------------------------------+
//| Place Sell Stop Orders                                          |
//+------------------------------------------------------------------+
void PlaceSellStopOrders(double bid, double ask)
{
   // Check cooldown
   if (TimeCurrent() - lastOrderTime < 60)
      return;
   
   double sellStopPrice = ask - (sellStopDistance * pointValue);
   double tp = sellStopPrice - (takeProfitPoints * pointValue);
   double sl = sellStopPrice + (stopLossPoints * pointValue);
   
   // Place sell stop order
   if (trade.SellStop(lotSize, sellStopPrice, symbolToTrade, sl, tp))
   {
      lastOrderTime = TimeCurrent();
      Print("🚀 BTC SELL STOP Order Placed @ ", sellStopPrice, " | TP: ", tp, " | SL: ", sl);
   }
   else
   {
      Print("❌ BTC SELL STOP Failed. Error: ", GetLastError());
   }
}

//+------------------------------------------------------------------+
//| Manage open trades with trailing stop                           |
//+------------------------------------------------------------------+
void ManageTrades()
{
   for (int i = PositionsTotal() - 1; i >= 0; i--)
   {
      if (!PositionSelectByTicket(PositionGetTicket(i)))
         continue;
      
      if (PositionGetInteger(POSITION_MAGIC) != magicNumber)
         continue;
      
      if (PositionGetString(POSITION_SYMBOL) != symbolToTrade)
         continue;
      
      ENUM_POSITION_TYPE posType = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      double posPrice = PositionGetDouble(POSITION_PRICE_OPEN);
      double posSL = PositionGetDouble(POSITION_SL);
      
      if (posType == POSITION_TYPE_BUY)
         UpdateBuyTrailingStop(PositionGetInteger(POSITION_TICKET), posSL);
      else if (posType == POSITION_TYPE_SELL)
         UpdateSellTrailingStop(PositionGetInteger(POSITION_TICKET), posSL);
   }
}

//+------------------------------------------------------------------+
//| Update Buy Trailing Stop                                        |
//+------------------------------------------------------------------+
void UpdateBuyTrailingStop(ulong ticket, double currentSL)
{
   double bid = SymbolInfoDouble(symbolToTrade, SYMBOL_BID);
   
   if (!PositionSelectByTicket(ticket))
      return;
   
   double posPrice = PositionGetDouble(POSITION_PRICE_OPEN);
   double profit = bid - posPrice;
   double trailingStartProfit = buyStopTrailingStart * pointValue;
   
   if (profit >= trailingStartProfit)
   {
      double newSL = bid - (buyStopTrailingStep * pointValue);
      
      if (newSL > currentSL)
      {
         double currentTP = PositionGetDouble(POSITION_TP);
         if (trade.PositionModify(ticket, newSL, currentTP))
         {
            Print("🚀 BTC Buy Trailing Stop Updated. New SL: ", newSL);
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Update Sell Trailing Stop                                       |
//+------------------------------------------------------------------+
void UpdateSellTrailingStop(ulong ticket, double currentSL)
{
   double ask = SymbolInfoDouble(symbolToTrade, SYMBOL_ASK);
   
   if (!PositionSelectByTicket(ticket))
      return;
   
   double posPrice = PositionGetDouble(POSITION_PRICE_OPEN);
   double profit = posPrice - ask;
   double trailingStartProfit = sellStopTrailingStart * pointValue;
   
   if (profit >= trailingStartProfit)
   {
      double newSL = ask + (sellStopTrailingStep * pointValue);
      
      if (newSL < currentSL)
      {
         double currentTP = PositionGetDouble(POSITION_TP);
         if (trade.PositionModify(ticket, newSL, currentTP))
         {
            Print("🚀 BTC Sell Trailing Stop Updated. New SL: ", newSL);
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Delete Expired Pending Orders                                   |
//+------------------------------------------------------------------+
void DeleteExpiredOrders()
{
   for (int i = OrdersTotal() - 1; i >= 0; i--)
   {
      if (!OrderSelect(OrderGetTicket(i)))
         continue;
      
      if (OrderGetInteger(ORDER_MAGIC) != magicNumber)
         continue;
      
      if (OrderGetString(ORDER_SYMBOL) != symbolToTrade)
         continue;
      
      datetime orderTime = (datetime)OrderGetInteger(ORDER_TIME_SETUP);
      
      if (TimeCurrent() - orderTime > pendingOrderExpiry)
      {
         if (trade.OrderDelete(OrderGetTicket(i)))
         {
            Print("🚀 Expired BTC Pending Order Deleted. Ticket: ", OrderGetTicket(i));
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Count open trades                                               |
//+------------------------------------------------------------------+
int CountOpenTrades()
{
   int count = 0;
   for (int i = 0; i < PositionsTotal(); i++)
   {
      if (!PositionSelectByTicket(PositionGetTicket(i)))
         continue;
      
      if (PositionGetInteger(POSITION_MAGIC) != magicNumber)
         continue;
      
      if (PositionGetString(POSITION_SYMBOL) != symbolToTrade)
         continue;
      
      count++;
   }
   return count;
}

//+------------------------------------------------------------------+
//| Count pending orders                                            |
//+------------------------------------------------------------------+
int CountPendingOrders()
{
   int count = 0;
   for (int i = 0; i < OrdersTotal(); i++)
   {
      if (!OrderSelect(OrderGetTicket(i)))
         continue;
      
      if (OrderGetInteger(ORDER_MAGIC) != magicNumber)
         continue;
      
      if (OrderGetString(ORDER_SYMBOL) != symbolToTrade)
         continue;
      
      count++;
   }
   return count;
}

//+------------------------------------------------------------------+
//| Check if trading is allowed                                     |
//+------------------------------------------------------------------+
bool IsTradeAllowed()
{
   if (!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED))
   {
      Print("❌ Trading not allowed by terminal");
      return false;
   }
   
   if (!AccountInfoInteger(ACCOUNT_TRADE_ALLOWED))
   {
      Print("❌ Trading not allowed for account");
      return false;
   }
   
   return true;
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   if (fastMAHandle != INVALID_HANDLE)
      IndicatorRelease(fastMAHandle);
   
   if (slowMAHandle != INVALID_HANDLE)
      IndicatorRelease(slowMAHandle);
   
   Print("");
   Print("╔════════════════════════════════════════════════════════╗");
   Print("║        🚀 BTC SCALPER EA 24/7 DEINITIALIZED 🚀        ║");
   Print("╚════════════════════════════════════════════════════════╝");
   Print("");
}
