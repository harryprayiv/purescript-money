module Data.Finance.Money.Extended where

import Prelude

import Data.Finance.Currency (class CurrencyClass, CProxy(..), Currency, USD)
import Data.Finance.Currency as CurrencyClass
import Data.Finance.Money (Dense(..), Discrete(..), formatDiscrete)
import Data.Finance.Money.Format (numeric, numericC)
import Data.Int as Int
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Data.Number as Number
import Data.Rational (Rational, fromInt, toNumber)
import Data.String (trim)
import Yoga.JSON (class ReadForeign, class WriteForeign, writeImpl, readImpl)

-- Generic newtype wrapper for any Discrete currency
newtype DiscreteMoney (c :: Currency) = DiscreteMoney (Discrete c)

derive instance newtypeDiscreteMoney :: Newtype (DiscreteMoney c) _
derive instance eqDiscreteMoney :: Eq (DiscreteMoney c)
derive instance ordDiscreteMoney :: Ord (DiscreteMoney c)

instance showDiscreteMoney :: CurrencyClass c => Show (DiscreteMoney c) where
  show (DiscreteMoney d) = "(DiscreteMoney " <> formatDiscrete numeric d <> ")"

-- Add JSON instances for the newtype
instance writeForeignDiscreteMoney :: WriteForeign (DiscreteMoney c) where
  writeImpl (DiscreteMoney (Discrete n)) = writeImpl n

instance readForeignDiscreteMoney :: ReadForeign (DiscreteMoney c) where
  readImpl f = do
    n <- readImpl f
    pure $ DiscreteMoney (Discrete n)

-- Add Semiring and Ring instances for DiscreteMoney
instance semiringDiscreteMoney :: Semiring (DiscreteMoney c) where
  add (DiscreteMoney a) (DiscreteMoney b) = DiscreteMoney (a + b)
  zero = DiscreteMoney (Discrete 0)
  mul (DiscreteMoney a) (DiscreteMoney b) = DiscreteMoney (a * b)
  one = DiscreteMoney (Discrete 1)

instance ringDiscreteMoney :: Ring (DiscreteMoney c) where
  sub (DiscreteMoney a) (DiscreteMoney b) = DiscreteMoney (a - b)

-- Generic newtype wrapper for any Dense currency
newtype DenseMoney (c :: Currency) = DenseMoney (Dense c)

derive instance newtypeDenseMoney :: Newtype (DenseMoney c) _
derive instance eqDenseMoney :: Eq (DenseMoney c)
derive instance ordDenseMoney :: Ord (DenseMoney c)

instance showDenseMoney :: CurrencyClass c => Show (DenseMoney c) where
  show (DenseMoney d) = "(DenseMoney " <> show d <> ")"

-- Add JSON instances for DenseMoney
instance writeForeignDenseMoney :: WriteForeign (DenseMoney c) where
  writeImpl (DenseMoney (Dense r)) = writeImpl (toNumber r)

instance readForeignDenseMoney :: ReadForeign (DenseMoney c) where
  readImpl f = do
    n <- readImpl f
    -- Convert number to rational approximation
    let rational = fromNumber n
    pure $ DenseMoney (Dense rational)

-- Add Semiring and Ring instances for DenseMoney
instance semiringDenseMoney :: Semiring (DenseMoney c) where
  add (DenseMoney a) (DenseMoney b) = DenseMoney (a + b)
  zero = DenseMoney (Dense (fromInt 0))
  mul (DenseMoney a) (DenseMoney b) = DenseMoney (a * b)
  one = DenseMoney (Dense (fromInt 1))

instance ringDenseMoney :: Ring (DenseMoney c) where
  sub (DenseMoney a) (DenseMoney b) = DenseMoney (a - b)

-- Helper to convert Number to Rational
-- This is a simplified version - in production you'd want better precision
fromNumber :: Number -> Rational
fromNumber n =
  let
    -- Convert to cents for simplicity
    cents = Int.round (n * 100.0)
  in
    fromInt cents / fromInt 100

-- Conversion functions

-- From Discrete c to DiscreteMoney c
fromDiscrete' :: forall c. Discrete c -> DiscreteMoney c
fromDiscrete' = DiscreteMoney

-- From DiscreteMoney c to Discrete c
toDiscrete :: forall c. DiscreteMoney c -> Discrete c
toDiscrete (DiscreteMoney d) = d

-- From Dense c to DenseMoney c
fromDense' :: forall c. Dense c -> DenseMoney c
fromDense' = DenseMoney

-- From DenseMoney c to Dense c
toDense :: forall c. DenseMoney c -> Dense c
toDense (DenseMoney d) = d

-- Format money values
formatMoney :: forall c. CurrencyClass c => Discrete c -> String
formatMoney d = formatDiscrete numeric d

formatMoneyWithCode :: forall c. CurrencyClass c => Discrete c -> String
formatMoneyWithCode d = formatDiscrete numericC d

-- Generic parsing functions
parseFromNumber :: forall c. CurrencyClass c => Number -> Discrete c
parseFromNumber n = 
  let 
    decimals = CurrencyClass.decimals (CProxy :: CProxy c)
    factor = if decimals == 0 
              then 1.0 -- For currencies like JPY with no decimal places
              else Number.pow 10.0 (Int.toNumber decimals)
  in
    Discrete (Int.floor (n * factor))

parseFromString :: forall c. CurrencyClass c => String -> Maybe (Discrete c)
parseFromString str = do
  n <- Number.fromString (trim str)
  pure $ parseFromNumber n

-- Helper functions
getUnits :: forall c. CurrencyClass c => Discrete c -> Int
getUnits (Discrete units) = units

fromUnits :: forall c. Int -> Discrete c
fromUnits = Discrete

-- Create a negated value
negateDiscrete :: forall c. Discrete c -> Discrete c
negateDiscrete (Discrete n) = Discrete (-n)

-- Specific USD aliases for backward compatibility
type DiscreteUSD = DiscreteMoney USD
type DenseUSD = DenseMoney USD

-- Create currency-aware money with the smallest unit based on CurrencyClass
makeDiscreteMoney :: forall c. CurrencyClass c => Number -> DiscreteMoney c
makeDiscreteMoney amount = fromDiscrete' (parseFromNumber amount)

-- Helper to determine if a currency can be subdivided
canBeSubdivided :: forall c. CurrencyClass c => CProxy c -> Boolean
canBeSubdivided proxy = CurrencyClass.decimals proxy > 0