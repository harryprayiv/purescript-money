# purescript-money

Types and operations on monetary amounts.

## Overview

The library provides two main types for handling monetary values:

1. **Discrete** - For integer-based monetary values (e.g., cents, pence)
2. **Dense** - For rational-based monetary values (e.g., dollars with decimal points)

Additionally, the library provides a comprehensive set of currency definitions with proper decimal handling, formatting utilities, and conversion functions.

## Installation

Add to your project using Spago:

```bash
spago install money
```

Or add it to your `spago.yaml`:

```yaml
package:
  dependencies:
    # ... your other dependencies
    - money
```

## Project Structure

```
.
├── src
│   └── Data
│       └── Finance
│           ├── Currency.purs
│           ├── Money
│           │   └── Format.purs
│           └── Money.purs
└── test
    ├── Data
    │   └── Finance
    │       └── Money.purs
    └── Main.purs
```

## Usage

```purescript
import Data.Finance.Currency (USD, EUR, GBP, JPY)
import Data.Finance.Money (Dense(..), Discrete(..), fromDense, fromDiscrete, formatDense, formatDiscrete)
import Data.Finance.Money.Format (numeric, numericC)
import Data.Rational (fromInt)

-- Create monetary values
let tenDollars = Discrete 1000 :: Discrete USD  -- $10.00
let tenEuros = Dense (fromInt 10) :: Dense EUR  -- €10.00

-- Format values
formatDiscrete numeric (Discrete 1234 :: Discrete USD)  -- "12.34"
formatDiscrete numericC (Discrete 1234 :: Discrete USD) -- "USD 12.34"

-- Convert between dense and discrete
let discreteDollars = fromDense Nearest (Dense (fromInt 12) :: Dense USD)  -- Discrete 1200
let denseEuros = fromDiscrete (Discrete 1050 :: Discrete EUR)              -- Dense 10.5
```

## API Reference

### Types

#### `Currency` and `CurrencyClass`

```purescript
-- Define the Currency kind
data Currency

-- Proxy for Currency types
data CProxy (c :: Currency) = CProxy

-- Class for working with Currency types
class CurrencyClass (c :: Currency) where
  code :: CProxy c -> String
  decimals :: CProxy c -> Int
```

The library provides instances for all ISO 4217 currency codes, each with the correct number of decimal places:

```purescript
instance currencyUSD :: CurrencyClass USD where
  code _ = "USD"
  decimals _ = 2

instance currencyJPY :: CurrencyClass JPY where
  code _ = "JPY"
  decimals _ = 0

instance currencyGBP :: CurrencyClass GBP where
  code _ = "GBP"
  decimals _ = 2
```

#### `Discrete`

```purescript
newtype Discrete (c :: Currency) = Discrete Int
```

Represents a monetary value in the smallest unit for a given currency (e.g., cents for USD, pence for GBP).

Examples:
- `Discrete 256 :: Discrete GBP` represents £2.56
- `Discrete 256 :: Discrete JPY` represents ¥256

#### `Dense`

```purescript
newtype Dense (c :: Currency) = Dense Rational
```

Represents a monetary value as a rational number, allowing for precise decimal representation without rounding errors.

#### `Rounding`

```purescript
data Rounding = Up | Down | ToZero | FromZero | Nearest
```

Specifies how to round when converting between Dense and Discrete values:
- `Up`: Always round up (ceiling)
- `Down`: Always round down (floor)
- `ToZero`: Round towards zero
- `FromZero`: Round away from zero
- `Nearest`: Round to nearest value

### Format Module

#### Types

```purescript
type Format = List FormatF

data FormatF
  = IfNegative Format
  | Literal String
  | CurrencyCode
  | Absolute
```

Parts of a format specification:
- `IfNegative`: Apply a format only if the value is negative
- `Literal`: Insert a literal string
- `CurrencyCode`: Insert the currency code
- `Absolute`: Insert the absolute value of the amount

#### Pre-defined Formats

```purescript
numeric :: Format
```
Numeric format with a minus sign for negative amounts and no currency indicator.

```purescript
numericC :: Format
```
Numeric format with a minus sign for negative amounts and a currency code.

```purescript
accountant :: Format
```
Accountant format with negative amounts parenthesized and no currency indicator.

```purescript
accountantC :: Format
```
Accountant format with negative amounts parenthesized and a currency code.

### Functions

#### Formatting

```purescript
formatDiscrete :: forall c. CurrencyClass c => Format -> Discrete c -> String
```
Format a discrete monetary value according to the specified format.

```purescript
formatDense :: forall c. CurrencyClass c => Rounding -> Format -> Dense c -> String
```
Format a dense monetary value according to the specified format with rounding.

```purescript
showDiscrete :: forall c. CurrencyClass c => Discrete c -> String
```
Convert a discrete monetary value to a string with default formatting.

#### Conversion

```purescript
fromDiscrete :: forall c. CurrencyClass c => Discrete c -> Dense c
```
Convert a discrete monetary value to a dense monetary value.

```purescript
fromDense :: forall c. CurrencyClass c => Rounding -> Dense c -> Discrete c
```
Convert a dense monetary value to a discrete monetary value using the specified rounding.

#### Format Helpers

```purescript
ifNegative :: Format -> Format
```
Perform a format only if the amount is negative.

```purescript
literal :: String -> Format
```
Insert a literal string.

```purescript
currencyCode :: Format
```
Insert the currency code.

```purescript
absolute :: Format
```
Insert the absolute value of the amount in decimal.

```purescript
sbind :: ∀ a. Semigroup a => a -> (Unit -> a) -> a
```
Utility function for defining formats with do notation.

### Arithmetic Operations

Both `Discrete` and `Dense` types support basic arithmetic operations through Semiring and Ring instances:

```purescript
-- Addition
Discrete 100 + Discrete 200 -- Discrete 300
Dense (fromInt 1) + Dense (fromInt 2) -- Dense 3

-- Subtraction
Discrete 300 - Discrete 100 -- Discrete 200 
Dense (fromInt 3) - Dense (fromInt 1) -- Dense 2

-- Multiplication
Discrete 100 * Discrete 2 -- Discrete 200
Dense (fromInt 1) * Dense (fromInt 2) -- Dense 2
```

## Examples

### Basic Usage

```purescript
import Prelude
import Data.Finance.Currency (USD, GBP, JPY)
import Data.Finance.Money (Dense(..), Discrete(..), formatDiscrete, formatDense, Rounding(..))
import Data.Finance.Money.Format (numeric, numericC)
import Data.Rational (fromInt)

-- US Dollars with 2 decimal places
let dollars = Discrete 1234 :: Discrete USD
formatDiscrete numeric dollars -- "12.34"
formatDiscrete numericC dollars -- "USD 12.34"

-- British Pounds with 2 decimal places
let pounds = Discrete 1234 :: Discrete GBP
formatDiscrete numeric pounds -- "12.34"
formatDiscrete numericC pounds -- "GBP 12.34"

-- Japanese Yen with 0 decimal places
let yen = Discrete 1234 :: Discrete JPY
formatDiscrete numeric yen -- "1234"
formatDiscrete numericC yen -- "JPY 1234"

-- Dense values
let denseDollars = Dense (fromInt 12) :: Dense USD
formatDense Nearest numeric denseDollars -- "12.00"
```

### Custom Formatting

```purescript
import Prelude
import Data.Finance.Currency (USD)
import Data.Finance.Money (Discrete(..))
import Data.Finance.Money.Format (literal, currencyCode, absolute, ifNegative, sbind)

-- Create a custom format with currency symbol
let customFormat = do
  ifNegative $ literal "("
  currencyCode
  literal " "
  absolute
  ifNegative $ literal ")"
  where discard = sbind

formatDiscrete customFormat (Discrete 1234 :: Discrete USD) -- "USD 12.34"
formatDiscrete customFormat (Discrete (-1234) :: Discrete USD) -- "(USD 12.34)"
```

### Currency Conversion

To convert between currencies, you'll need to use exchange rates:

```purescript
import Prelude
import Data.Finance.Currency (USD, EUR)
import Data.Finance.Money (Dense(..), Discrete(..), fromDense, fromDiscrete, Rounding(..))
import Data.Rational (fromInt)

-- Create a function to convert between currencies using an exchange rate
convertCurrency :: 
  forall c1 c2. 
  CurrencyClass c1 => 
  CurrencyClass c2 => 
  Rational -> 
  Dense c1 -> 
  Dense c2
convertCurrency rate (Dense amount) = Dense (amount * rate)

-- Example: Convert USD to EUR with an exchange rate of 0.85
let usdAmount = Dense (fromInt 100) :: Dense USD
let rate = fromInt 85 / fromInt 100 -- 0.85
let eurAmount = convertCurrency rate usdAmount :: Dense EUR

-- Convert to discrete representation if needed
let discreteEUR = fromDense Nearest eurAmount :: Discrete EUR
```

## License

BSD 3-Clause License

Copyright (c) 2017, Tinker.Travel
All rights reserved.
