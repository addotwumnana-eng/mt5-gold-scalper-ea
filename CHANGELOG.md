# Changelog

All notable changes to the Gold Scalper EA will be documented in this file.

## [1.0] - 2026-07-03

### Added
- Initial release of Gold Scalper EA
- Buy Stop and Sell Stop order functionality
- Trailing start point and trailing step point implementation
- Best distance pending order management
- Pending order expiry time management
- Moving Average Crossover (9/21) signal generation
- London Session trading support (08:00-17:00 GMT)
- New York Session trading support (13:00-22:00 GMT)
- Risk management features:
  - Maximum open trades limit
  - Maximum pending orders limit
  - Fixed lot sizing with risk percentage
  - Stop loss on every position
  - Take profit levels
  - Trailing stop management
- Session-based trading filters
- Pending order auto-deletion on expiry
- Comprehensive documentation:
  - README.md with installation guide
  - CONFIG.md with preset configurations
  - STRATEGY.md with detailed trading logic
  - BACKTESTING_GUIDE.md with testing procedures
  - LICENSE with MIT license and trading disclaimer
  - CHANGELOG.md (this file)

### Features Details

#### Order Management
- Buy Stop orders placed above current bid price
- Sell Stop orders placed below current ask price
- Configurable order distance (default: 20 pips)
- Automatic trailing stop adjustment
- Pending order expiry (default: 1 hour)

#### Session Optimization
- Filtered trading during high-liquidity periods
- London and New York session support
- Customizable session times
- Overlap period optimization (13:00-17:00 GMT recommended)

#### Risk Controls
- Maximum position limit (default: 5 trades)
- Maximum pending orders limit (default: 10)
- Stop loss on every trade (default: 15 pips)
- Take profit targets (default: 30 pips)
- Trailing stop mechanism for profit protection

### Technical Details
- Language: MQL5 (MetaTrader 5)
- Symbol: XAUUSD (Gold)
- Timeframe: M5 (5-minute) recommended
- Magic Number: 123456 (configurable)
- EA Version: 1.0

### Known Limitations
- Optimized for XAUUSD only
- Requires MetaTrader 5 platform
- Demo/Live account with proper permissions
- Minimum account size recommended: $500

### Testing Recommendations
- Backtest minimum 6-12 months data
- Test during London/NY overlap hours
- Verify win rate > 55% before live trading
- Start with 0.01 lot size
- Monitor first 2 weeks closely

## Future Roadmap

### v1.1 (Planned)
- [ ] Multi-symbol support
- [ ] Advanced RSI filter
- [ ] Volume-based confirmation
- [ ] News filter integration
- [ ] Performance statistics panel
- [ ] Better logging system

### v1.2 (Planned)
- [ ] Machine learning optimization
- [ ] Break-even logic
- [ ] Scalping level identification
- [ ] Discord notifications
- [ ] Telegram alerts

### v2.0 (Planned)
- [ ] Multi-pair scalping
- [ ] Advanced volatility filters
- [ ] Correlation analysis
- [ ] Economic calendar integration
- [ ] Performance dashboard widget

## Support

For bug reports, feature requests, or questions:
- Open an issue: https://github.com/addotwumnana-eng/mt5-gold-scalper-ea/issues
- Check documentation: See README.md, CONFIG.md, and STRATEGY.md

## Version Information

- Current Version: 1.0
- Release Date: July 3, 2026
- Last Updated: July 3, 2026
- Stability: STABLE
- Status: Production Ready
