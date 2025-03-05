module Test.Data.Finance.Money
  ( main
  ) where

import Prelude

import Control.Monad.Free (Free)
import Data.Finance.Currency (GBP, JPY)
import Data.Finance.Money (Dense(..), Discrete(..), Rounding(..), fromDense, formatDense, formatDiscrete)
import Data.Finance.Money (fromDiscrete) as Money
import Data.Finance.Money.Format (numeric)
import Data.Rational (fromInt)
import Test.Unit (TestF, suite, test)
import Test.Unit.Assert as Assert

type IGBP = Discrete GBP
type IJPY = Discrete JPY

type EGBP = Dense GBP
type EJPY = Dense JPY

main :: Free TestF Unit
main = suite "Date.Finance.Money" do
  test "formatDiscrete" do
    let gbp s n = Assert.equal s $ formatDiscrete numeric (Discrete n :: IGBP)
    let jpy s n = Assert.equal s $ formatDiscrete numeric (Discrete n :: IJPY)

    gbp "0.00" 0
    gbp "2.56" 256
    gbp "−2.56" (-256)
    gbp "21474836.47" top
    gbp "−21474836.48" bottom

    jpy "0" 0
    jpy "256" 256
    jpy "−256" (-256)
    jpy "2147483647" top
    jpy "−2147483647" bottom

  test "formatDense" do
    let gbp s n = Assert.equal s $ formatDense Nearest numeric (Dense n :: EGBP)
    let jpy s n = Assert.equal s $ formatDense Nearest numeric (Dense n :: EJPY)

    -- Use fromInt to create Rational values
    gbp "0.00" (fromInt 0)
    gbp "2.56" (fromInt 256 / fromInt 100)
    gbp "−2.56" (fromInt (-256) / fromInt 100)

    jpy "0" (fromInt 0)
    jpy "3" (fromInt 256 / fromInt 100)
    jpy "−3" (fromInt (-256) / fromInt 100)

  test "fromDiscrete" do
    -- Use fully qualified module name for fromDiscrete
    Assert.equal (Dense (fromInt 1 / fromInt 2)) (Money.fromDiscrete (Discrete 50 :: IGBP))
    Assert.equal (Dense (fromInt 50)) (Money.fromDiscrete (Discrete 50 :: IJPY))

  test "fromDense" do
    -- Use fully qualified names if necessary
    Assert.equal (Discrete 34 :: IGBP) (fromDense Up (Dense (fromInt 1 / fromInt 3)))
    Assert.equal (Discrete 33 :: IGBP) (fromDense Down (Dense (fromInt 1 / fromInt 3)))
    Assert.equal (Discrete 33 :: IGBP) (fromDense ToZero (Dense (fromInt 1 / fromInt 3)))
    Assert.equal (Discrete 34 :: IGBP) (fromDense FromZero (Dense (fromInt 1 / fromInt 3)))
    Assert.equal (Discrete (-33) :: IGBP) (fromDense ToZero (Dense (fromInt (-1) / fromInt 3)))
    Assert.equal (Discrete (-34) :: IGBP) (fromDense FromZero (Dense (fromInt (-1) / fromInt 3)))
    Assert.equal (Discrete 33 :: IGBP) (fromDense Nearest (Dense (fromInt 1 / fromInt 3)))
    Assert.equal (Discrete (-33) :: IGBP) (fromDense Nearest (Dense (fromInt (-1) / fromInt 3)))

    Assert.equal (Discrete 1 :: IJPY) (fromDense Up (Dense (fromInt 1 / fromInt 3)))
    Assert.equal (Discrete 0 :: IJPY) (fromDense Down (Dense (fromInt 1 / fromInt 3)))
    Assert.equal (Discrete 0 :: IJPY) (fromDense ToZero (Dense (fromInt 1 / fromInt 3)))
    Assert.equal (Discrete 1 :: IJPY) (fromDense FromZero (Dense (fromInt 1 / fromInt 3)))
    Assert.equal (Discrete (-0) :: IJPY) (fromDense ToZero (Dense (fromInt (-1) / fromInt 3)))
    Assert.equal (Discrete (-1) :: IJPY) (fromDense FromZero (Dense (fromInt (-1) / fromInt 3)))
    Assert.equal (Discrete 0 :: IJPY) (fromDense Nearest (Dense (fromInt 1 / fromInt 3)))
    Assert.equal (Discrete (-0) :: IJPY) (fromDense Nearest (Dense (fromInt (-1) / fromInt 3)))