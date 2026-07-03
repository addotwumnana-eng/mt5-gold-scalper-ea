# MT5 Gold Scalper EA - High Win Rate Auto Pilot

A professional MetaTrader 5 Expert Advisor designed for high-frequency gold (XAUUSD) scalping with optimized performance for London and New York trading sessions.

## 🎯 Key Features

### Trading Strategy
- **Buy Stop & Sell Stop Orders**: Automatically placed based on Moving Average crossover signals
- **Trailing Start Point**: Activates profit protection when price reaches specified distance
- **Trailing Step Point**: Gradual stop loss adjustment to lock in profits
- **Best Distance Pending Orders**: Optimal placement distance for order execution
- **Pending Order Expiry**: Auto-delete old pending orders to prevent ghost trades

### Session Optimization
- **London Session**: 08:00 - 17:00 GMT (high liquidity period)
- **New York Session**: 13:00 - 22:00 GMT (volatile period with good spreads)
- Configurable session times for different trading preferences

### Risk Management
- Maximum open trades limit
- Maximum pending orders limit
- Fixed lot size with scalable risk percentage
- Stop loss and take profit on every trade
- Individual position trailing stop management

## 📋 Installation

### Step 1: Copy EA File
1. Copy `GoldScalperEA.mq5` to your MetaTrader 5 directory:
   - **Windows**: `C:\Users\YourUsername\AppData\Roaming\MetaQuotes\Terminal\[TerminalID]\MQL5\Experts`
   - **Mac**: `~/Library/Application Support/MetaTrader 5/MQL5/Experts`

### Step 2: Compile
1. Open MetaTrader 5
2. Go to **File → Open Data Folder**
3. Navigate to **MQL5/Experts**
4. Right-click `GoldScalperEA.mq5` → **Compile**

### Step 3: Attach to Chart
1. Open XAUUSD chart (1-minute or 5-minute timeframe recommended)
2. Drag `GoldScalperEA` from the Navigator panel onto the chart
3. Configure input parameters (see below)
4. Click **OK**

## ⚙️ Input Parameters

### Trading Sessions
```
enableLondonSession = true              // Enable London Session
enableNewYorkSession = true             // Enable New York Session
londonStartHour = 8                     // London start (GMT)
londonEndHour = 17                      // London end (GMT)
nyStartHour = 13                        // New York start (GMT)
nyEndHour = 22                          // New York end (GMT)
```

### Risk Management
```
lotSize = 0.1                           // Lot size per trade
maxRiskPercent = 2.0                    // Risk per trade (%)
maxOpenTrades = 5                       // Maximum simultaneous trades
maxPendingOrders = 10                   // Maximum pending orders
```

### Pending Orders
```
bestDistance = 15.0                     // Distance for order placement (pips)
pendingOrderExpiry = 3600               // Expiry time (seconds = 1 hour)
autoDeleteExpiredOrders = true          // Auto-delete expired orders
```

### Buy Stop Settings
```
buyStopDistance = 20.0                  // Buy stop placement distance (pips)
buyStopTrailingStart = 25.0             // Profit level to start trailing (pips)
buyStopTrailingStep = 5.0               // Trailing step increment (pips)
```

### Sell Stop Settings
```
sellStopDistance = 20.0                 // Sell stop placement distance (pips)
sellStopTrailingStart = 25.0            // Profit level to start trailing (pips)
sellStopTrailingStep = 5.0              // Trailing step increment (pips)
```

### Take Profit & Stop Loss
```
takeProfitPips = 30.0                   // Target profit (pips)
stopLossPips = 15.0                     // Maximum loss (pips)
useTrailingStop = true                  // Enable trailing stops
```

### EA Settings
```
magicNumber = 123456                    // Unique EA identifier
symbolToTrade = "XAUUSD"                // Trading symbol
fastMA = 9                              // Fast MA period
slowMA = 21                             // Slow MA period
```

## 📊 Recommended Backtesting Settings

### Optimal Parameters for High Win Rate:
```
Session: London & New York overlap (13:00-17:00 GMT)
Timeframe: M5 (5-minute)
Lot Size: 0.1 - 0.5 (scale based on account size)
Take Profit: 20-30 pips
Stop Loss: 10-15 pips
Buy Stop Distance: 15-20 pips
Sell Stop Distance: 15-20 pips
Trailing Start: 25 pips
Trailing Step: 5 pips
```

## 🔄 Trading Logic

### Signal Generation
1. **Buy Signal**: Fast MA > Slow MA AND Close > Fast MA
   - Places Buy Stop orders at specified distance above current bid
   - Activates trailing stop after reaching profit threshold

2. **Sell Signal**: Fast MA < Slow MA AND Close < Fast MA
   - Places Sell Stop orders at specified distance below current ask
   - Activates trailing stop after reaching profit threshold

### Position Management
- Monitors all open positions with matching magic number
- Updates trailing stops on every tick
- Automatically deletes expired pending orders
- Respects maximum trade and pending order limits

## 🛡️ Risk Management Features

- **Position Sizing**: Fixed lot size with configurable risk percentage
- **Stop Loss Protection**: Every trade has a defined stop loss
- **Trailing Stop**: Automatically locks in profits while protecting downside
- **Maximum Trades**: Prevents over-leveraging with trade limits
- **Order Expiry**: Automatically cleans up old pending orders
- **Session Filtering**: Trades only during high-liquidity periods

## 📈 Performance Tips

1. **Backtest First**: Always backtest with historical data before live trading
2. **Paper Trading**: Use a demo account for 1-2 weeks before going live
3. **Monitor Logs**: Check the Expert Tab in MetaTrader for detailed trade logs
4. **Adjust Parameters**: Fine-tune parameters based on market conditions
5. **Account Size**: Use proper lot sizing (0.01-0.1 lots per 1000 USD)
6. **Spread Monitoring**: Avoid trading during high-spread periods (major news)

## 🔧 Troubleshooting

### EA Not Trading
- Check if EA is enabled (green face icon in corner)
- Verify trading is allowed (Tools → Options → Trading)
- Check magic number for duplicate EAs
- Review logs for specific errors

### Poor Performance
- Adjust trailing parameters
- Change session times to peak volatility hours
- Increase/decrease take profit levels
- Test different MA periods

### Pending Orders Not Triggering
- Check bid/ask spread
- Verify pending order distance is realistic
- Ensure account has sufficient margin
- Review pending order expiry settings

## 📝 Version History

### v1.0 (July 2026)
- Initial release
- Buy Stop & Sell Stop implementation
- Trailing stop functionality
- Pending order management
- Session-based trading filters
- Risk management features

## ⚠️ Disclaimer

This EA is provided for educational and research purposes. Trading forex and commodities carries substantial risk of loss. Past performance does not guarantee future results. Always trade with capital you can afford to lose. Test thoroughly on demo accounts before live trading.

## 📧 Support

For issues, feature requests, or improvements, please open an issue on GitHub:
https://github.com/addotwumnana-eng/mt5-gold-scalper-ea/issues

## 📄 License

MIT License - See LICENSE file for details

---

**Happy Scalping! 🚀**
