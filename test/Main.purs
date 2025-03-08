module Test.Main
  ( main
  ) where

import Prelude
import Effect (Effect)
import Test.Data.Finance.Money as Data.Finance.Money
import Test.Data.Finance.Money.Extended as Data.Finance.Money.Extended
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  Data.Finance.Money.main
  Data.Finance.Money.Extended.main