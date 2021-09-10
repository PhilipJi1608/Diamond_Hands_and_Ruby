## Design

### What do we want to achieve?

We want to provide strong, accurate analytics of stocks based on configured inputs.

### How do we want the user to use the gem?

User includes library, gets public interface with basic methods.

For example:

_client code_
```ruby
require 'diamond_hands_and_ruby'

client = DiamondHandsAndRuby::Client.new
client.configure.tickers = %w[PLTR TSLA MSFT]
client.analyse!
=> { 
      pltr: { buy: 'yes', buy_strength: 'very strong', rsi: '90%', moving_average: '100' },
      msft: { buy: 'no', buy_strength: 'very low', rsi: '10%', moving_average: '90' },
      tsla: { buy: 'maybe', buy_strength: 'mediocre', rsi: '50%', moving_average: '10' }
   }
```

### What do we need to do technically?

We need:
  - a class to take inputs
    - a limitation on how many inputs
      - no: we will recommend not too many, but if you are using over 50, please use a proxy. We will not limit the user, it is up to them.
        however: we want to achieve parallelism, which means more tickers = slow processes as it won't be a direct ticker => thread execution. If you only have 6 cores in your computer, but you passed in 12 tickers, you won't achieve true parallelism, so we need an algo to figure out cpu allocation.

    - a validation of the inputs
      - if the input does not match a regex (has to be 3-7 characters, first three-four characters have to be A-Z)

    - a way to store the inputs
      - in memory; if the user inputs too many they shouldn't be using this gem

    - pass inputs on

  - a class to extract data on the stock

  - a logging mechanism, so people can understand what is happening

  - a class to analyze the data
    - class receives the last 30 days of prices from the extractor class
    - class calculates the median uptick / downtrend based on float values
    - class uses algorithms (that we code) to make assertions on strength of position
    - class states the stock is a buy or sell, with a confidence rating

  - a formatter class
    - takes the data from the analyzer and makes it into a unified data structure for machine to read
