{-# LANGUAGE ViewPatterns #-}
-- Just for the lulz, I'll use ViewPatterns
module LeapYear(isLeapYear,isLeapYear') where

rem' = flip rem

isLeapYear :: Integer -> Bool
-- If the year is divisible by 400, it is a leap year
isLeapYear (rem' 400 -> 0) = True
-- If it is divisible by 100 but not 400, it isn't
isLeapYear (rem' 100 -> 0) = False
-- If it is divisible by 4 but not 400 or 100, it is
isLeapYear (rem'   4 -> 0) = True
-- In all other cases, it isn't
isLeapYear _              = False

-- Without fancy view patterns, it can be written as
isLeapYear' y
  | y `rem` 400 == 0 = True
  | y `rem` 100 == 0 = False
  | y `rem` 4   == 0 = True
  | otherwise        = False

