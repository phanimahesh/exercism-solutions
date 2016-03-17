module Sublist (Sublist(Equal, Sublist, Superlist, Unequal), sublist)
where

data Sublist = Equal | Sublist | Superlist | Unequal
  deriving (Show, Eq)

{-
  Technically xn==yn is not needed, but since we calculate lengths anyway,
  comparing them is cheap and we may avoid potentially expensive list comparision

  This is optimised for worst case. 2 traversals at most instead of 3 without length
  if they are equal, removing `xn==yn` gives one traversal bestcase but 3 worstcase
-}
sublist :: (Eq a) => [a] -> [a] -> Sublist
sublist xs ys
  | xn == yn && xs == ys       = Equal
  | xn < yn && isSublist xs ys = Sublist
  | yn < xn && isSublist ys xs = Superlist
  | otherwise                  = Unequal
  where xn = length xs
        yn = length ys

isSublist :: (Eq a) => [a] -> [a] -> Bool
isSublist xs ys
  | ys `startsWith` xs = True
  | ys == []           = xs == []
  | otherwise          = isSublist xs (tail ys)


startsWith :: (Eq a) => [a] -> [a] -> Bool
_  `startsWith` [] = True
[] `startsWith` _  = False
(x:xs) `startsWith` (y:ys)
  | x == y        = xs `startsWith` ys
  | otherwise     = False
