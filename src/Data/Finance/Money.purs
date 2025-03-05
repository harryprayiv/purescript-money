module Data.Finance.Money
  ( Discrete(..)
  , formatDiscrete
  , showDiscrete
  , Dense(..)
  , formatDense
  , Rounding(..)
  , fromDiscrete
  , fromDense
  ) where

import Prelude

import Currency (class CurrencyClass, CProxy(..), Currency)
import Currency as Currency
import Data.Array (replicate)
import Data.Generic.Rep (class Generic)
import Data.Int (ceil, floor, round, toNumber) as Int
import Data.List (foldMap)
import Data.Newtype (class Newtype)
import Data.Number (abs, floor, pow, round) as Number
import Data.String (length)
import Data.String.CodeUnits (fromCharArray)
import Money.Format (Format, FormatF(..), ifNegative, literal, absolute)

newtype Discrete (c :: Currency) = Discrete Int
derive newtype instance eqDiscrete  :: Eq (Discrete c)
derive newtype instance ordDiscrete :: Ord (Discrete c)
derive instance genericDiscrete     :: Generic (Discrete c) _
derive instance newtypeDiscrete     :: Newtype (Discrete c) _

instance showDiscreteInstance :: CurrencyClass c => Show (Discrete c) where 
  show = showDiscrete

formatDiscrete :: forall c. CurrencyClass c => Format -> Discrete c -> String
formatDiscrete f (Discrete n) = foldMap go f
  where
  go (IfNegative s) = if n < 0 then foldMap go s else ""
  go (Literal s)    = s
  go CurrencyCode   = Currency.code (CProxy :: CProxy c)
  go Absolute       =
    toFixedString d (Number.abs $ Int.toNumber n / Number.pow 10.0 (Int.toNumber d))
    where
    d = Currency.decimals (CProxy :: CProxy c)

-- Pure PureScript implementation of toFixed
toFixedString :: Int -> Number -> String
toFixedString decimals num =
  let
    -- Calculate the multiplier factor
    factor = Number.pow 10.0 (Int.toNumber decimals)
    
    -- Round the number to the specified decimals
    multiplied = Number.round (num * factor)
    rounded = multiplied / factor
    
    -- Extract the integer and fractional parts
    intPart = Number.floor rounded
    intPartStr = show (Int.floor intPart)
    
    -- Calculate the fractional part
    fracPart = Number.abs (rounded - intPart)
    
    -- Format the fractional part if needed
    fracString = 
      if decimals <= 0 
      then ""
      else
        let
          -- Scale the fractional part
          scaledFrac = fracPart * factor
          -- Get digits as integer, then as string
          fracDigits = Int.floor (scaledFrac + 0.5) -- Add 0.5 to handle rounding
          fracStr = show fracDigits
          padded = padStart decimals fracStr
        in
          "." <> padded
  in
    intPartStr <> fracString

-- Helper function to pad a string with leading zeros
padStart :: Int -> String -> String
padStart targetLength str =
  let
    currentLength = length str
    paddingLength = max 0 (targetLength - currentLength)
    padding = if paddingLength <= 0 
              then "" 
              else fromCharArray (replicate paddingLength '0')
  in
    padding <> str

showDiscrete :: forall c. CurrencyClass c => Discrete c -> String
showDiscrete = formatDiscrete $ ifNegative (literal "-") <> absolute

newtype Dense (c :: Currency) = Dense Number
derive newtype instance eqDense  :: Eq (Dense c)
derive newtype instance ordDense :: Ord (Dense c)
derive instance newtypeDense     :: Newtype (Dense c) _
instance showDense :: CurrencyClass c => Show (Dense c) where
  show (Dense r) = "(Dense " <> show r <> ")"

formatDense :: forall c. CurrencyClass c => Rounding -> Format -> Dense c -> String
formatDense r f d = formatDiscrete f $ fromDense r d

data Rounding = Up | Down | ToZero | FromZero | Nearest
derive instance eqRounding  :: Eq Rounding
derive instance ordRounding :: Ord Rounding

fromDiscrete :: forall c. CurrencyClass c => Discrete c -> Dense c
fromDiscrete (Discrete n) = Dense $ Int.toNumber n / Number.pow 10.0 (Int.toNumber d)
  where d = Currency.decimals (CProxy :: CProxy c)

fromDense :: forall c. CurrencyClass c => Rounding -> Dense c -> Discrete c
fromDense r (Dense n) = Discrete case r of
  Up       -> Int.ceil n'
  Down     -> Int.floor n'
  ToZero   -> if n < 0.0 then Int.ceil n' else Int.floor n'
  FromZero -> if n > 0.0 then Int.ceil n' else Int.floor n'
  Nearest  -> Int.round n'
  where 
    n' = n * Number.pow 10.0 (Int.toNumber d)
    d  = Currency.decimals (CProxy :: CProxy c)

-- For basic arithmetic operations on Discrete and Dense types
instance semiringDiscrete :: Semiring (Discrete c) where
  add (Discrete a) (Discrete b) = Discrete (a + b)
  zero = Discrete 0
  mul (Discrete a) (Discrete b) = Discrete (a * b)
  one = Discrete 1

instance ringDiscrete :: Ring (Discrete c) where
  sub (Discrete a) (Discrete b) = Discrete (a - b)

instance semiringDense :: Semiring (Dense c) where
  add (Dense a) (Dense b) = Dense (a + b)
  zero = Dense 0.0
  mul (Dense a) (Dense b) = Dense (a * b)
  one = Dense 1.0

instance ringDense :: Ring (Dense c) where
  sub (Dense a) (Dense b) = Dense (a - b)
