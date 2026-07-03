# BTC Scalper EA - Quick Start Guide

A professional MetaTrader 5 Expert Advisor designed for high-frequency Bitcoin (BTCUSD) scalping with optimized performance for London and New York trading sessions.

## 🎯 Key Features

### Trading Strategy
- **Buy Stop & Sell Stop Orders**: Automatically placed based on Moving Average crossover signals
- **Trailing Start Point**: Activates profit protection when price reaches specified distance
- **Trailing Step Point**: Gradual stop loss adjustment to lock in profits
- **Best Distance Pending Orders**: Optimal placement distance for order execution
- **Pending Order Expiry**: Auto-delete old pending orders to prevent ghost trades

### Session Optimization
- **London Session**: 08:00 - 17:00 GMT (medium volatility)
- **New York Session**: 13:00 - 22:00 GMT (high volatility for BTC)
- **Recommended**: Trade during overlap (13:00-17:00 GMT)

### Risk Management
- Maximum open trades limit
- Maximum pending orders limit
- Scalable lot size with risk percentage
- Stop loss and take profit on every trade
- Individual position trailing stop management

## 🔑 Key Differences from Gold EA

| Feature | Gold | BTC |
|---------|------|-----|
| **Symbol** | XAUUSD | BTCUSD |
| **Lot Size** | 0.1 | 0.01 |
| **Magic Number** | 123456 | 654321 |
| **Trailing Start** | 25 pips | 150 points |
| **Take Profit** | 30 pips | 200 points |
| **Stop Loss** | 15 pips | 100 points |
| **Order Distance** | 20 pips | 100 points |

## 📋 Installation

### Step 1: Copy EA File
1. Copy `BTCScalperEA.mq5` to your MetaTrader 5 directory:
   - **Windows**: `C:\Users\YourUsername\AppData\Roaming\MetaQuotes\Terminal\[TerminalID]\MQL5\Experts`
   - **Mac**: `~/Library/Application Support/MetaTrader 5/MQL5/Experts`

### Step 2: Compile
1. Open MetaTrader 5
2. Go to **File → Open Data Folder**
3. Navigate to **MQL5/Experts**
4. Right-click `BTCScalperEA.mq5` → **Compile**

### Step 3: Attach to Chart
1. Open BTCUSD chart (M5 timeframe)
2. Drag `BTCScalperEA` from Navigator onto chart
3. Configure input parameters
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
lotSize = 0.01                          // Lot size (BTC contracts)
maxRiskPercent = 2.0                    // Risk per trade (%)
maxOpenTrades = 5                       // Maximum simultaneous trades
maxPendingOrders = 10                   // Maximum pending orders
```

### Pending Orders
```
bestDistance = 100.0                    // Distance for order placement (points)
pendingOrderExpiry = 3600               // Expiry time (seconds = 1 hour)
autoDeleteExpiredOrders = true          // Auto-delete expired orders
```

### Buy Stop Settings
```
buyStopDistance = 100.0                 // Buy stop placement distance (points)
buyStopTrailingStart = 150.0            // Profit level to start trailing (points)
buyStopTrailingStep = 30.0              // Trailing step increment (points)
```

### Sell Stop Settings
```
sellStopDistance = 100.0                // Sell stop placement distance (points)
sellStopTrailingStart = 150.0           // Profit level to start trailing (points)
sellStopTrailingStep = 30.0             // Trailing step increment (points)
```

### Take Profit & Stop Loss
```
takeProfitPoints = 200.0                // Target profit (points)
stopLossPoints = 100.0                  // Maximum loss (points)
useTrailingStop = true                  // Enable trailing stops
```

### EA Settings
```
magicNumber = 654321                    // Unique EA identifier
symbolToTrade = "BTCUSD"                // Trading symbol
fastMA = 9                              // Fast MA period
slowMA = 21                             // Slow MA period
```

## 📊 Recommended Backtesting Settings

### Optimal Parameters for High Win Rate:
```
Session: London & New York overlap (13:00-17:00 GMT)
Timeframe: M5 (5-minute)
Lot Size: 0.001 - 0.01 (scale based on account size)
Take Profit: 150-250 points
Stop Loss: 75-100 points
Buy Stop Distance: 80-120 points
Sell Stop Distance: 80-120 points
Trailing Start: 120-200 points
Trailing Step: 25-40 points
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

- **Position Sizing**: Scalable lot size with configurable risk percentage
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
5. **Account Size**: Use proper lot sizing (0.001-0.01 contracts per 1000 USD)
6. **Spread Monitoring**: Avoid trading during high-spread periods
7. **BTC Volatility**: Adjust stops during high IV periods

## 🔧 Troubleshooting

### EA Not Trading
- Check if EA is enabled (green face icon in corner)
- Verify trading is allowed (Tools → Options → Trading)
- Check magic number for duplicate EAs
- Review logs for specific errors

### Poor Performance
- Adjust trailing parameters for BTC volatility
- Change session times to peak volatility hours
- Increase/decrease take profit levels
- Test different MA periods

### Pending Orders Not Triggering
- Check bid/ask spread (wide spreads prevent fills)
- Verify pending order distance is realistic
- Ensure account has sufficient margin
- Review pending order expiry settings

## 📝 BTC-Specific Considerations

1. **Volatility**: BTC is more volatile than Gold - use smaller lot sizes
2. **Spreads**: BTC spreads vary by broker - check your broker's spreads
3. **Liquidity**: Trade during overlapping sessions for best fills
4. **News**: Avoid major crypto news events
5. **Leverage**: Be careful with leverage on volatile BTC
6. **Symbol Name**: Verify your broker's BTC symbol (may not be BTCUSD)

## 🔗 Version Information

- **EA Name**: BTC Scalper EA
- **Version**: 1.0
- **Release Date**: July 2026
- **Status**: Production Ready
- **Stability**: STABLE
- **Compatibility**: MetaTrader 5

## 📞 Support

For issues or improvements:
- Check BTC_CONFIG.md for detailed settings
- Review STRATEGY.md for trading logic
- See BACKTESTING_GUIDE.md for testing procedures
- Open an issue on GitHub

## ⚠️ Disclaimer

This EA is provided for educational and research purposes. Cryptocurrency trading carries substantial risk of loss. Past performance does not guarantee future results. Always trade with capital you can afford to lose. Test thoroughly on demo accounts before live trading.

---

**Happy BTC Scalping! 🚀📈**
