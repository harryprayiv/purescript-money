module Data.Finance.Currency where

-- Define the kind by declaring its type
data Currency

-- proxy for Currency types
data CProxy (c :: Currency) = CProxy

-- a class for working with Currency types
class CurrencyClass (c :: Currency) where
  code     :: CProxy c -> String
  decimals :: CProxy c -> Int

-- individual currency types with the Currency kind
foreign import data AED :: Currency
foreign import data AFN :: Currency
foreign import data ALL :: Currency
foreign import data AMD :: Currency
foreign import data ANG :: Currency
foreign import data AOA :: Currency
foreign import data ARS :: Currency
foreign import data AUD :: Currency
foreign import data AWG :: Currency
foreign import data AZN :: Currency
foreign import data BAM :: Currency
foreign import data BBD :: Currency
foreign import data BDT :: Currency
foreign import data BGN :: Currency
foreign import data BHD :: Currency
foreign import data BIF :: Currency
foreign import data BMD :: Currency
foreign import data BND :: Currency
foreign import data BOB :: Currency
foreign import data BOV :: Currency
foreign import data BRL :: Currency
foreign import data BSD :: Currency
foreign import data BTN :: Currency
foreign import data BWP :: Currency
foreign import data BYR :: Currency
foreign import data BZD :: Currency
foreign import data CAD :: Currency
foreign import data CDF :: Currency
foreign import data CHE :: Currency
foreign import data CHF :: Currency
foreign import data CHW :: Currency
foreign import data CLF :: Currency
foreign import data CLP :: Currency
foreign import data CNY :: Currency
foreign import data COP :: Currency
foreign import data COU :: Currency
foreign import data CRC :: Currency
foreign import data CUC :: Currency
foreign import data CUP :: Currency
foreign import data CVE :: Currency
foreign import data CZK :: Currency
foreign import data DJF :: Currency
foreign import data DKK :: Currency
foreign import data DOP :: Currency
foreign import data DZD :: Currency
foreign import data EGP :: Currency
foreign import data ERN :: Currency
foreign import data ETB :: Currency
foreign import data EUR :: Currency
foreign import data FJD :: Currency
foreign import data FKP :: Currency
foreign import data GBP :: Currency
foreign import data GEL :: Currency
foreign import data GHS :: Currency
foreign import data GIP :: Currency
foreign import data GMD :: Currency
foreign import data GNF :: Currency
foreign import data GTQ :: Currency
foreign import data GYD :: Currency
foreign import data HKD :: Currency
foreign import data HNL :: Currency
foreign import data HRK :: Currency
foreign import data HTG :: Currency
foreign import data HUF :: Currency
foreign import data IDR :: Currency
foreign import data ILS :: Currency
foreign import data INR :: Currency
foreign import data IQD :: Currency
foreign import data IRR :: Currency
foreign import data ISK :: Currency
foreign import data JMD :: Currency
foreign import data JOD :: Currency
foreign import data JPY :: Currency
foreign import data KES :: Currency
foreign import data KGS :: Currency
foreign import data KHR :: Currency
foreign import data KMF :: Currency
foreign import data KPW :: Currency
foreign import data KRW :: Currency
foreign import data KWD :: Currency
foreign import data KYD :: Currency
foreign import data KZT :: Currency
foreign import data LAK :: Currency
foreign import data LBP :: Currency
foreign import data LKR :: Currency
foreign import data LRD :: Currency
foreign import data LSL :: Currency
foreign import data LTL :: Currency
foreign import data LYD :: Currency
foreign import data MAD :: Currency
foreign import data MDL :: Currency
foreign import data MGA :: Currency
foreign import data MKD :: Currency
foreign import data MMK :: Currency
foreign import data MNT :: Currency
foreign import data MOP :: Currency
foreign import data MRO :: Currency
foreign import data MUR :: Currency
foreign import data MVR :: Currency
foreign import data MWK :: Currency
foreign import data MXN :: Currency
foreign import data MXV :: Currency
foreign import data MYR :: Currency
foreign import data MZN :: Currency
foreign import data NAD :: Currency
foreign import data NGN :: Currency
foreign import data NIO :: Currency
foreign import data NOK :: Currency
foreign import data NPR :: Currency
foreign import data NZD :: Currency
foreign import data OMR :: Currency
foreign import data PAB :: Currency
foreign import data PEN :: Currency
foreign import data PGK :: Currency
foreign import data PHP :: Currency
foreign import data PKR :: Currency
foreign import data PLN :: Currency
foreign import data PYG :: Currency
foreign import data QAR :: Currency
foreign import data RON :: Currency
foreign import data RSD :: Currency
foreign import data RUB :: Currency
foreign import data RWF :: Currency
foreign import data SAR :: Currency
foreign import data SBD :: Currency
foreign import data SCR :: Currency
foreign import data SDG :: Currency
foreign import data SEK :: Currency
foreign import data SGD :: Currency
foreign import data SHP :: Currency
foreign import data SLL :: Currency
foreign import data SOS :: Currency
foreign import data SRD :: Currency
foreign import data SSP :: Currency
foreign import data STD :: Currency
foreign import data SVC :: Currency
foreign import data SYP :: Currency
foreign import data SZL :: Currency
foreign import data THB :: Currency
foreign import data TJS :: Currency
foreign import data TMT :: Currency
foreign import data TND :: Currency
foreign import data TOP :: Currency
foreign import data TRY :: Currency
foreign import data TTD :: Currency
foreign import data TWD :: Currency
foreign import data TZS :: Currency
foreign import data UAH :: Currency
foreign import data UGX :: Currency
foreign import data USD :: Currency
foreign import data USN :: Currency
foreign import data UYI :: Currency
foreign import data UYU :: Currency
foreign import data UZS :: Currency
foreign import data VEF :: Currency
foreign import data VND :: Currency
foreign import data VUV :: Currency
foreign import data WST :: Currency
foreign import data XAF :: Currency
foreign import data XCD :: Currency
foreign import data XOF :: Currency
foreign import data XPF :: Currency
foreign import data YER :: Currency
foreign import data ZAR :: Currency
foreign import data ZMW :: Currency
foreign import data ZWL :: Currency

instance currencyAED :: CurrencyClass AED where
  code     _ = "AED"
  decimals _ = 2

instance currencyAFN :: CurrencyClass AFN where
  code     _ = "AFN"
  decimals _ = 2

instance currencyALL :: CurrencyClass ALL where
  code     _ = "ALL"
  decimals _ = 2

instance currencyAMD :: CurrencyClass AMD where
  code     _ = "AMD"
  decimals _ = 2

instance currencyANG :: CurrencyClass ANG where
  code     _ = "ANG"
  decimals _ = 2

instance currencyAOA :: CurrencyClass AOA where
  code     _ = "AOA"
  decimals _ = 2

instance currencyARS :: CurrencyClass ARS where
  code     _ = "ARS"
  decimals _ = 2

instance currencyAUD :: CurrencyClass AUD where
  code     _ = "AUD"
  decimals _ = 2

instance currencyAWG :: CurrencyClass AWG where
  code     _ = "AWG"
  decimals _ = 2

instance currencyAZN :: CurrencyClass AZN where
  code     _ = "AZN"
  decimals _ = 2

instance currencyBAM :: CurrencyClass BAM where
  code     _ = "BAM"
  decimals _ = 2

instance currencyBBD :: CurrencyClass BBD where
  code     _ = "BBD"
  decimals _ = 2

instance currencyBDT :: CurrencyClass BDT where
  code     _ = "BDT"
  decimals _ = 2

instance currencyBGN :: CurrencyClass BGN where
  code     _ = "BGN"
  decimals _ = 2

instance currencyBHD :: CurrencyClass BHD where
  code     _ = "BHD"
  decimals _ = 3

instance currencyBIF :: CurrencyClass BIF where
  code     _ = "BIF"
  decimals _ = 0

instance currencyBMD :: CurrencyClass BMD where
  code     _ = "BMD"
  decimals _ = 2

instance currencyBND :: CurrencyClass BND where
  code     _ = "BND"
  decimals _ = 2

instance currencyBOB :: CurrencyClass BOB where
  code     _ = "BOB"
  decimals _ = 2

instance currencyBOV :: CurrencyClass BOV where
  code     _ = "BOV"
  decimals _ = 2

instance currencyBRL :: CurrencyClass BRL where
  code     _ = "BRL"
  decimals _ = 2

instance currencyBSD :: CurrencyClass BSD where
  code     _ = "BSD"
  decimals _ = 2

instance currencyBTN :: CurrencyClass BTN where
  code     _ = "BTN"
  decimals _ = 2

instance currencyBWP :: CurrencyClass BWP where
  code     _ = "BWP"
  decimals _ = 2

instance currencyBYR :: CurrencyClass BYR where
  code     _ = "BYR"
  decimals _ = 0

instance currencyBZD :: CurrencyClass BZD where
  code     _ = "BZD"
  decimals _ = 2

instance currencyCAD :: CurrencyClass CAD where
  code     _ = "CAD"
  decimals _ = 2

instance currencyCDF :: CurrencyClass CDF where
  code     _ = "CDF"
  decimals _ = 2

instance currencyCHE :: CurrencyClass CHE where
  code     _ = "CHE"
  decimals _ = 2

instance currencyCHF :: CurrencyClass CHF where
  code     _ = "CHF"
  decimals _ = 2

instance currencyCHW :: CurrencyClass CHW where
  code     _ = "CHW"
  decimals _ = 2

instance currencyCLF :: CurrencyClass CLF where
  code     _ = "CLF"
  decimals _ = 4

instance currencyCLP :: CurrencyClass CLP where
  code     _ = "CLP"
  decimals _ = 0

instance currencyCNY :: CurrencyClass CNY where
  code     _ = "CNY"
  decimals _ = 2

instance currencyCOP :: CurrencyClass COP where
  code     _ = "COP"
  decimals _ = 2

instance currencyCOU :: CurrencyClass COU where
  code     _ = "COU"
  decimals _ = 2

instance currencyCRC :: CurrencyClass CRC where
  code     _ = "CRC"
  decimals _ = 2

instance currencyCUC :: CurrencyClass CUC where
  code     _ = "CUC"
  decimals _ = 2

instance currencyCUP :: CurrencyClass CUP where
  code     _ = "CUP"
  decimals _ = 2

instance currencyCVE :: CurrencyClass CVE where
  code     _ = "CVE"
  decimals _ = 2

instance currencyCZK :: CurrencyClass CZK where
  code     _ = "CZK"
  decimals _ = 2

instance currencyDJF :: CurrencyClass DJF where
  code     _ = "DJF"
  decimals _ = 0

instance currencyDKK :: CurrencyClass DKK where
  code     _ = "DKK"
  decimals _ = 2

instance currencyDOP :: CurrencyClass DOP where
  code     _ = "DOP"
  decimals _ = 2

instance currencyDZD :: CurrencyClass DZD where
  code     _ = "DZD"
  decimals _ = 2

instance currencyEGP :: CurrencyClass EGP where
  code     _ = "EGP"
  decimals _ = 2

instance currencyERN :: CurrencyClass ERN where
  code     _ = "ERN"
  decimals _ = 2

instance currencyETB :: CurrencyClass ETB where
  code     _ = "ETB"
  decimals _ = 2

instance currencyEUR :: CurrencyClass EUR where
  code     _ = "EUR"
  decimals _ = 2

instance currencyFJD :: CurrencyClass FJD where
  code     _ = "FJD"
  decimals _ = 2

instance currencyFKP :: CurrencyClass FKP where
  code     _ = "FKP"
  decimals _ = 2

instance currencyGBP :: CurrencyClass GBP where
  code     _ = "GBP"
  decimals _ = 2

instance currencyGEL :: CurrencyClass GEL where
  code     _ = "GEL"
  decimals _ = 2

instance currencyGHS :: CurrencyClass GHS where
  code     _ = "GHS"
  decimals _ = 2

instance currencyGIP :: CurrencyClass GIP where
  code     _ = "GIP"
  decimals _ = 2

instance currencyGMD :: CurrencyClass GMD where
  code     _ = "GMD"
  decimals _ = 2

instance currencyGNF :: CurrencyClass GNF where
  code     _ = "GNF"
  decimals _ = 0

instance currencyGTQ :: CurrencyClass GTQ where
  code     _ = "GTQ"
  decimals _ = 2

instance currencyGYD :: CurrencyClass GYD where
  code     _ = "GYD"
  decimals _ = 2

instance currencyHKD :: CurrencyClass HKD where
  code     _ = "HKD"
  decimals _ = 2

instance currencyHNL :: CurrencyClass HNL where
  code     _ = "HNL"
  decimals _ = 2

instance currencyHRK :: CurrencyClass HRK where
  code     _ = "HRK"
  decimals _ = 2

instance currencyHTG :: CurrencyClass HTG where
  code     _ = "HTG"
  decimals _ = 2

instance currencyHUF :: CurrencyClass HUF where
  code     _ = "HUF"
  decimals _ = 2

instance currencyIDR :: CurrencyClass IDR where
  code     _ = "IDR"
  decimals _ = 2

instance currencyILS :: CurrencyClass ILS where
  code     _ = "ILS"
  decimals _ = 2

instance currencyINR :: CurrencyClass INR where
  code     _ = "INR"
  decimals _ = 2

instance currencyIQD :: CurrencyClass IQD where
  code     _ = "IQD"
  decimals _ = 3

instance currencyIRR :: CurrencyClass IRR where
  code     _ = "IRR"
  decimals _ = 2

instance currencyISK :: CurrencyClass ISK where
  code     _ = "ISK"
  decimals _ = 0

instance currencyJMD :: CurrencyClass JMD where
  code     _ = "JMD"
  decimals _ = 2

instance currencyJOD :: CurrencyClass JOD where
  code     _ = "JOD"
  decimals _ = 3

instance currencyJPY :: CurrencyClass JPY where
  code     _ = "JPY"
  decimals _ = 0

instance currencyKES :: CurrencyClass KES where
  code     _ = "KES"
  decimals _ = 2

instance currencyKGS :: CurrencyClass KGS where
  code     _ = "KGS"
  decimals _ = 2

instance currencyKHR :: CurrencyClass KHR where
  code     _ = "KHR"
  decimals _ = 2

instance currencyKMF :: CurrencyClass KMF where
  code     _ = "KMF"
  decimals _ = 0

instance currencyKPW :: CurrencyClass KPW where
  code     _ = "KPW"
  decimals _ = 2

instance currencyKRW :: CurrencyClass KRW where
  code     _ = "KRW"
  decimals _ = 0

instance currencyKWD :: CurrencyClass KWD where
  code     _ = "KWD"
  decimals _ = 3

instance currencyKYD :: CurrencyClass KYD where
  code     _ = "KYD"
  decimals _ = 2

instance currencyKZT :: CurrencyClass KZT where
  code     _ = "KZT"
  decimals _ = 2

instance currencyLAK :: CurrencyClass LAK where
  code     _ = "LAK"
  decimals _ = 2

instance currencyLBP :: CurrencyClass LBP where
  code     _ = "LBP"
  decimals _ = 2

instance currencyLKR :: CurrencyClass LKR where
  code     _ = "LKR"
  decimals _ = 2

instance currencyLRD :: CurrencyClass LRD where
  code     _ = "LRD"
  decimals _ = 2

instance currencyLSL :: CurrencyClass LSL where
  code     _ = "LSL"
  decimals _ = 2

instance currencyLTL :: CurrencyClass LTL where
  code     _ = "LTL"
  decimals _ = 2

instance currencyLYD :: CurrencyClass LYD where
  code     _ = "LYD"
  decimals _ = 3

instance currencyMAD :: CurrencyClass MAD where
  code     _ = "MAD"
  decimals _ = 2

instance currencyMDL :: CurrencyClass MDL where
  code     _ = "MDL"
  decimals _ = 2

instance currencyMGA :: CurrencyClass MGA where
  code     _ = "MGA"
  decimals _ = 2

instance currencyMKD :: CurrencyClass MKD where
  code     _ = "MKD"
  decimals _ = 2

instance currencyMMK :: CurrencyClass MMK where
  code     _ = "MMK"
  decimals _ = 2

instance currencyMNT :: CurrencyClass MNT where
  code     _ = "MNT"
  decimals _ = 2

instance currencyMOP :: CurrencyClass MOP where
  code     _ = "MOP"
  decimals _ = 2

instance currencyMRO :: CurrencyClass MRO where
  code     _ = "MRO"
  decimals _ = 2

instance currencyMUR :: CurrencyClass MUR where
  code     _ = "MUR"
  decimals _ = 2

instance currencyMVR :: CurrencyClass MVR where
  code     _ = "MVR"
  decimals _ = 2

instance currencyMWK :: CurrencyClass MWK where
  code     _ = "MWK"
  decimals _ = 2

instance currencyMXN :: CurrencyClass MXN where
  code     _ = "MXN"
  decimals _ = 2

instance currencyMXV :: CurrencyClass MXV where
  code     _ = "MXV"
  decimals _ = 2

instance currencyMYR :: CurrencyClass MYR where
  code     _ = "MYR"
  decimals _ = 2

instance currencyMZN :: CurrencyClass MZN where
  code     _ = "MZN"
  decimals _ = 2

instance currencyNAD :: CurrencyClass NAD where
  code     _ = "NAD"
  decimals _ = 2

instance currencyNGN :: CurrencyClass NGN where
  code     _ = "NGN"
  decimals _ = 2

instance currencyNIO :: CurrencyClass NIO where
  code     _ = "NIO"
  decimals _ = 2

instance currencyNOK :: CurrencyClass NOK where
  code     _ = "NOK"
  decimals _ = 2

instance currencyNPR :: CurrencyClass NPR where
  code     _ = "NPR"
  decimals _ = 2

instance currencyNZD :: CurrencyClass NZD where
  code     _ = "NZD"
  decimals _ = 2

instance currencyOMR :: CurrencyClass OMR where
  code     _ = "OMR"
  decimals _ = 3

instance currencyPAB :: CurrencyClass PAB where
  code     _ = "PAB"
  decimals _ = 2

instance currencyPEN :: CurrencyClass PEN where
  code     _ = "PEN"
  decimals _ = 2

instance currencyPGK :: CurrencyClass PGK where
  code     _ = "PGK"
  decimals _ = 2

instance currencyPHP :: CurrencyClass PHP where
  code     _ = "PHP"
  decimals _ = 2

instance currencyPKR :: CurrencyClass PKR where
  code     _ = "PKR"
  decimals _ = 2

instance currencyPLN :: CurrencyClass PLN where
  code     _ = "PLN"
  decimals _ = 2

instance currencyPYG :: CurrencyClass PYG where
  code     _ = "PYG"
  decimals _ = 0

instance currencyQAR :: CurrencyClass QAR where
  code     _ = "QAR"
  decimals _ = 2

instance currencyRON :: CurrencyClass RON where
  code     _ = "RON"
  decimals _ = 2

instance currencyRSD :: CurrencyClass RSD where
  code     _ = "RSD"
  decimals _ = 2

instance currencyRUB :: CurrencyClass RUB where
  code     _ = "RUB"
  decimals _ = 2

instance currencyRWF :: CurrencyClass RWF where
  code     _ = "RWF"
  decimals _ = 0

instance currencySAR :: CurrencyClass SAR where
  code     _ = "SAR"
  decimals _ = 2

instance currencySBD :: CurrencyClass SBD where
  code     _ = "SBD"
  decimals _ = 2

instance currencySCR :: CurrencyClass SCR where
  code     _ = "SCR"
  decimals _ = 2

instance currencySDG :: CurrencyClass SDG where
  code     _ = "SDG"
  decimals _ = 2

instance currencySEK :: CurrencyClass SEK where
  code     _ = "SEK"
  decimals _ = 2

instance currencySGD :: CurrencyClass SGD where
  code     _ = "SGD"
  decimals _ = 2

instance currencySHP :: CurrencyClass SHP where
  code     _ = "SHP"
  decimals _ = 2

instance currencySLL :: CurrencyClass SLL where
  code     _ = "SLL"
  decimals _ = 2

instance currencySOS :: CurrencyClass SOS where
  code     _ = "SOS"
  decimals _ = 2

instance currencySRD :: CurrencyClass SRD where
  code     _ = "SRD"
  decimals _ = 2

instance currencySSP :: CurrencyClass SSP where
  code     _ = "SSP"
  decimals _ = 2

instance currencySTD :: CurrencyClass STD where
  code     _ = "STD"
  decimals _ = 2

instance currencySVC :: CurrencyClass SVC where
  code     _ = "SVC"
  decimals _ = 2

instance currencySYP :: CurrencyClass SYP where
  code     _ = "SYP"
  decimals _ = 2

instance currencySZL :: CurrencyClass SZL where
  code     _ = "SZL"
  decimals _ = 2

instance currencyTHB :: CurrencyClass THB where
  code     _ = "THB"
  decimals _ = 2

instance currencyTJS :: CurrencyClass TJS where
  code     _ = "TJS"
  decimals _ = 2

instance currencyTMT :: CurrencyClass TMT where
  code     _ = "TMT"
  decimals _ = 2

instance currencyTND :: CurrencyClass TND where
  code     _ = "TND"
  decimals _ = 3

instance currencyTOP :: CurrencyClass TOP where
  code     _ = "TOP"
  decimals _ = 2

instance currencyTRY :: CurrencyClass TRY where
  code     _ = "TRY"
  decimals _ = 2

instance currencyTTD :: CurrencyClass TTD where
  code     _ = "TTD"
  decimals _ = 2

instance currencyTWD :: CurrencyClass TWD where
  code     _ = "TWD"
  decimals _ = 2

instance currencyTZS :: CurrencyClass TZS where
  code     _ = "TZS"
  decimals _ = 2

instance currencyUAH :: CurrencyClass UAH where
  code     _ = "UAH"
  decimals _ = 2

instance currencyUGX :: CurrencyClass UGX where
  code     _ = "UGX"
  decimals _ = 0

instance currencyUSD :: CurrencyClass USD where
  code     _ = "USD"
  decimals _ = 2

instance currencyUSN :: CurrencyClass USN where
  code     _ = "USN"
  decimals _ = 2

instance currencyUYI :: CurrencyClass UYI where
  code     _ = "UYI"
  decimals _ = 0

instance currencyUYU :: CurrencyClass UYU where
  code     _ = "UYU"
  decimals _ = 2

instance currencyUZS :: CurrencyClass UZS where
  code     _ = "UZS"
  decimals _ = 2

instance currencyVEF :: CurrencyClass VEF where
  code     _ = "VEF"
  decimals _ = 2

instance currencyVND :: CurrencyClass VND where
  code     _ = "VND"
  decimals _ = 0

instance currencyVUV :: CurrencyClass VUV where
  code     _ = "VUV"
  decimals _ = 0

instance currencyWST :: CurrencyClass WST where
  code     _ = "WST"
  decimals _ = 2

instance currencyXAF :: CurrencyClass XAF where
  code     _ = "XAF"
  decimals _ = 0

instance currencyXCD :: CurrencyClass XCD where
  code     _ = "XCD"
  decimals _ = 2

instance currencyXOF :: CurrencyClass XOF where
  code     _ = "XOF"
  decimals _ = 0

instance currencyXPF :: CurrencyClass XPF where
  code     _ = "XPF"
  decimals _ = 0

instance currencyYER :: CurrencyClass YER where
  code     _ = "YER"
  decimals _ = 2

instance currencyZAR :: CurrencyClass ZAR where
  code     _ = "ZAR"
  decimals _ = 2

instance currencyZMW :: CurrencyClass ZMW where
  code     _ = "ZMW"
  decimals _ = 2

instance currencyZWL :: CurrencyClass ZWL where
  code     _ = "ZWL"
  decimals _ = 2
