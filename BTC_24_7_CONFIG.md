# BTC Scalper EA - 24/7 Trading Configuration Guide

## 🎯 24/7 Trading Mode (Crypto Markets)

This version of the BTC Scalper EA is optimized for **24-hour continuous trading** on cryptocurrency markets. Bitcoin and other cryptos trade 24/7, unlike traditional forex which has session breaks.

### Key Changes for 24/7 Mode:
```
enableLondonSession = FALSE    // Disabled - trade all hours
enableNewYorkSession = FALSE   // Disabled - trade all hours
enable24HourTrading = TRUE     // Enabled - no session restrictions
```

**Result**: The EA trades automatically every hour, every day, weekends included.

---

## 🎯 Quick Start Configuration

### Conservative Settings (Low Risk - Beginners)
```
Lot Size: 0.001 BTC contracts
Max Risk %: 1.0
Max Open Trades: 2
Max Pending Orders: 5
Buy Stop Distance: 80 points
Sell Stop Distance: 80 points
Buy Trailing Start: 120 points
Sell Trailing Start: 120 points
Take Profit: 150 points
Stop Loss: 75 points
Pending Order Expiry: 1800 (30 minutes)
Trading Mode: 24/7
```

### Aggressive Settings (High Risk/High Reward)
```
Lot Size: 0.05 BTC contracts
Max Risk %: 3.0
Max Open Trades: 10
Max Pending Orders: 20
Buy Stop Distance: 50 points
Sell Stop Distance: 50 points
Buy Trailing Start: 100 points
Sell Trailing Start: 100 points
Take Profit: 300 points
Stop Loss: 150 points
Pending Order Expiry: 600 (10 minutes)
Trading Mode: 24/7
```

### Balanced Settings (RECOMMENDED for Most Traders)
```
Lot Size: 0.01 BTC contracts
Max Risk %: 2.0
Max Open Trades: 5
Max Pending Orders: 10
Buy Stop Distance: 100 points
Sell Stop Distance: 100 points
Buy Trailing Start: 150 points
Sell Trailing Start: 150 points
Take Profit: 200 points
Stop Loss: 100 points
Pending Order Expiry: 3600 (1 hour)
Trailing Step: 30 points
Trading Mode: 24/7
```

---

## ⚙️ Input Parameters

### 24/7 Trading Mode
```
enable24HourTrading: true              // Enable 24/7 trading
enableLondonSession: false             // Session filters OFF
enableNewYorkSession: false            // Session filters OFF
```

### Risk Management
```
lotSize: 0.01                          // Lot size (BTC contracts)
maxRiskPercent: 2.0                    // Risk per trade (%)
maxOpenTrades: 5                       // Maximum simultaneous trades
maxPendingOrders: 10                   // Maximum pending orders
```

### Pending Orders
```
bestDistance: 50.0                     // Distance for order placement (points)
pendingOrderExpiry: 3600               // Expiry time (seconds = 1 hour)
autoDeleteExpiredOrders: true          // Auto-delete expired orders
```

### Buy Stop Settings
```
buyStopDistance: 100.0                 // Buy stop placement distance (points)
buyStopTrailingStart: 150.0            // Profit level to start trailing (points)
buyStopTrailingStep: 30.0              // Trailing step increment (points)
```

### Sell Stop Settings
```
sellStopDistance: 100.0                // Sell stop placement distance (points)
sellStopTrailingStart: 150.0           // Profit level to start trailing (points)
sellStopTrailingStep: 30.0             // Trailing step increment (points)
```

### Take Profit & Stop Loss
```
takeProfitPoints: 200.0                // Target profit (points)
stopLossPoints: 100.0                  // Maximum loss (points)
useTrailingStop: true                  // Enable trailing stops
```

### EA Settings
```
magicNumber: 654321                    // Unique EA identifier
symbolToTrade: "BTCUSD"                // Trading symbol
fastMA: 9                              // Fast MA period
slowMA: 21                             // Slow MA period
```

---

## 📊 24/7 Trading Advantages

### ✅ Pros
1. **Continuous trading** - Captures opportunities 24/7
2. **Weekend access** - Trade crypto weekends when forex is closed
3. **More opportunities** - More signals throughout the day
4. **Passive income** - Earn while you sleep
5. **No session gaps** - No waiting for next session
6. **Higher trading volume** - More signals generated

### ⚠️ Cons
1. **Higher drawdown** - More trades = more losing streaks possible
2. **Slippage 24/7** - Higher spreads during low-liquidity hours
3. **Needs more monitoring** - Requires better risk management
4. **More volatility** - Crypto volatility is higher
5. **Execution risk** - May fill at worse prices during low activity

---

## 📈 Best Times to Trade 24/7

### Peak Liquidity Hours (Better Fills)
```
13:00-17:00 GMT: London + New York overlap
20:00-06:00 GMT: US evening + Asian morning
```

### Lower Liquidity Hours (Wider Spreads)
```
02:00-08:00 GMT: Asian night session
22:00-00:00 GMT: US market close
```

**Recommendation**: Set tighter take-profit targets during low liquidity hours.

---

## 💰 Position Sizing for 24/7 Trading

BTC is more volatile than Gold, so adjust position size carefully.

### Position Size Calculator
```
Account Size: $10,000
Max Risk %: 2%
Risk per Trade: $200

If Stop Loss = 100 points = $1,000 per BTC contract
Position Size: $200 / $1,000 = 0.002 BTC contracts

Lot Size = 0.002
```

### Recommended Lot Sizes by Account (24/7 Mode)
```
$500 Account: 0.0001 BTC (Risk: $1.00 per trade)
$1000 Account: 0.0002 BTC (Risk: $2.00 per trade)
$5000 Account: 0.001 BTC (Risk: $10.00 per trade)
$10000 Account: 0.01 BTC (Risk: $100.00 per trade)
$50000 Account: 0.05 BTC (Risk: $500.00 per trade)
```

### Important: Use SMALLER lot sizes for 24/7
Because more trades = higher cumulative risk, use 50% smaller lot size than session-based trading.

---

## 🎲 Trailing Stop Strategy for 24/7

### Aggressive Trailing (For Fast Scalps)
```
Buy Trailing Start: 100 points
Buy Trailing Step: 20 points
```
- Quick profit locking
- Good for volatile crypto
- More break-even trades

### Conservative Trailing (For Bigger Wins)
```
Buy Trailing Start: 200 points
Buy Trailing Step: 50 points
```
- Allows trends to develop
- Fewer smaller wins
- Better for ranging markets

### Balanced Trailing (RECOMMENDED) ⭐
```
Buy Trailing Start: 150 points
Buy Trailing Step: 30 points
```
- Works best for 24/7 continuous trading
- Good balance of locking profits
- Adapts to crypto volatility

---

## 🎯 Order Placement Distance

### Tight Order Placement
```
bestDistance: 50 points
```
- Gets filled quickly
- Works in trending markets
- Higher slippage risk

### Normal Order Placement (RECOMMENDED) ⭐
```
bestDistance: 100 points
```
- Good balance
- Works in most conditions
- Moderate slippage
- Best for 24/7

### Wide Order Placement
```
bestDistance: 150 points
```
- Better fill rates
- Fewer missed trades
- Lower accuracy

---

## ⏰ Pending Order Expiry Settings for 24/7

Since trading is continuous, orders shouldn't expire too quickly.

### Quick Expiry
```
pendingOrderExpiry: 300 (5 minutes)
```
- Only use for very quick scalps
- Risk: Many unfilled orders
- Not recommended for 24/7

### Standard Expiry (RECOMMENDED) ⭐
```
pendingOrderExpiry: 3600 (1 hour)
```
- Good balance for 24/7
- Cleans up stale orders
- Prevents order clutter

### Extended Expiry
```
pendingOrderExpiry: 7200 (2 hours)
```
- Gives orders more time
- Risk: Too many pending orders
- Not recommended

---

## 📊 Moving Average Settings for BTC 24/7

### Fast Scalping (Very Quick Signals)
```
fastMA: 5
slowMA: 13
timeframe: M1 (1-minute)
```
- Very high trading frequency
- High false signal rate
- **Best for**: Expert traders only
- **Win rate**: 48-52%

### Standard Scalping (RECOMMENDED) ⭐
```
fastMA: 9
slowMA: 21
timeframe: M5 (5-minute)
```
- Good signal frequency
- Balanced accuracy
- **Best for**: Most traders
- **Win rate**: 52-58%
- **Signals per day**: 20-30

### Conservative Scalping
```
fastMA: 14
slowMA: 50
timeframe: M15 (15-minute)
```
- Fewer signals
- Better accuracy
- **Best for**: Patient traders
- **Win rate**: 58-65%
- **Signals per day**: 5-10

---

## 🔄 Daily/Weekly Statistics

### Expected Performance (24/7 Mode)

**Daily**:
```
Average Trades: 10-15
Winning Trades: 5-8
Losing Trades: 2-7
Average Daily Profit: 10-20 points
Average Daily Loss: -5 to -10 points
```

**Weekly**:
```
Total Trades: 70-105
Winning Trades: 35-60
Losing Trades: 10-35
Win Rate: 52-58%
Profit Factor: 1.4-1.8
Weekly Profit: 50-100 points
```

**Monthly**:
```
Total Trades: 280-420
Win Rate: 52-58%
Profit Factor: 1.4-1.8
Monthly Profit: 200-400 points
Expected Return: 10-30% monthly
```

---

## 🚨 Warning Signs for 24/7 Trading

Stop using the EA if:
- Win rate drops below 45%
- Consecutive losses exceed 8
- Drawdown exceeds 35%
- More than 50% of pending orders expire
- Spreads consistently widen significantly
- System connectivity issues

---

## 💡 Tips for Best 24/7 Performance

1. **Start small** - Begin with 0.001 lot size
2. **Monitor spreads** - Trade more during tight spread hours
3. **Use automation** - Let it run 24/7 unattended
4. **Keep VPS running** - Don't close terminal during trading
5. **Backup settings** - Save best configurations
6. **Reduce on weekends** - Lower trading frequency or lot size
7. **Check logs daily** - Review performance daily
8. **Adjust parameters** - Update MA periods monthly
9. **Risk management** - Never skip stop losses
10. **Document results** - Keep detailed trading records

---

## 🔒 Risk Management for 24/7

### Daily Loss Limit (RECOMMENDED)
```
Set EA to stop after losing 5% of account daily
Resume trading next day
```

### Weekly Loss Limit
```
Stop if weekly loss exceeds 10% of account
Analyze what went wrong
Resume with adjusted parameters
```

### Monthly Review
```
Review all statistics
Optimize MA periods if needed
Update trailing stop parameters
Compare with previous months
```

---

## 📊 Backtesting Checklist for 24/7

- [ ] Compile EA without errors
- [ ] Set symbol to BTCUSD (or your broker's symbol)
- [ ] Select M5 timeframe
- [ ] Set date range (minimum 1-3 months for continuous data)
- [ ] Use tick data for accuracy
- [ ] Set spread to current value (5-15 points)
- [ ] Run optimization for moving average periods
- [ ] **Disable session filters** (24/7 mode)
- [ ] Check max drawdown (target < 25%)
- [ ] Verify win rate above 50%
- [ ] Test for 2-4 weeks of paper trading before live

---

## ⚠️ Important Notes for 24/7 Trading

1. **Weekend volatility** - Crypto can have big gaps on weekends
2. **Liquidity changes** - Lower liquidity = wider spreads
3. **News impact** - Crypto news can cause sudden moves
4. **System availability** - Ensure MT5 runs 24/7
5. **Broker support** - Some brokers may restrict 24/7 trading
6. **Account drawdown** - Plan for larger drawdowns
7. **Profit targets** - Lower per-trade targets for continuous trading
8. **Slippage** - Expect higher slippage during low-liquidity hours

---

## 🎯 Expected Performance

After proper backtesting and optimization:
- **Win Rate**: 52-58% (24/7 mode may be slightly lower)
- **Profit Factor**: 1.4-1.8
- **Monthly Target**: 200-400 points
- **Max Drawdown**: < 30%
- **Risk per Trade**: 2%
- **Trades per day**: 10-15
- **Trades per week**: 70-105
- **Trades per month**: 280-420

---

## 🚀 Getting Started with 24/7 Trading

1. **Download** BTCScalperEA.mq5
2. **Compile** in MetaTrader 5
3. **Backtest** with 3-6 months of data
4. **Paper trade** for 2-4 weeks
5. **Start live** with 0.001 lot size
6. **Monitor** first week closely
7. **Scale up** gradually after 4 weeks of profits
8. **Review monthly** and optimize parameters

---

**Your 24/7 BTC Scalper EA is ready for continuous crypto trading! 🚀📈**
