module Test.LehmerRNG where

import Prelude
import Test.Unit.Assert as Assert
import Data.Array ((:))
import Test.Unit (TestSuite, suite, test)

import PRNG.LehmerRNG (LehmerRNG)
import PRNG.LehmerRNG as Lehmer

prSequence :: Int -> Lehmer.LehmerRNG -> Array Int
prSequence 0 _ = []
prSequence x gen = rnd.value : prSequence (x-1) rnd.state
  where
  rnd = Lehmer.generate gen

generator1 :: LehmerRNG
generator1 = Lehmer.initialize [1]
firstThirty1 :: Array Int
firstThirty1 = [16807, 282475249, 1622650073, 984943658, 1144108930,
  470211272, 101027544, 1457850878, 1458777923, 2007237709, 823564440,
  1115438165, 1784484492, 74243042, 114807987, 1137522503, 1441282327,
  16531729, 823378840, 143542612, 896544303, 1474833169, 1264817709,
  1998097157, 1817129560, 1131570933, 197493099, 1404280278, 893351816,
  1505795335]

generator1568 :: LehmerRNG
generator1568 = Lehmer.initialize [1568]
firstThirty1568 :: Array Int
firstThirty1568 = [26353376, 539559150, 1694676416, 350913551, 813956995,
  704383575, 1644882761, 987576296, 293699209, 1285184857, 711370073,
  955354062, 2047975062, 448972918, 1777780915, 1223857694, 777892092,
  151947308, 420349273, 1736516328, 1327161966, 1846004820, 1106761531,
  1985184850, 1695834158, 481730522, 431534064, 740737729, 616309644,
  1002557227]


generator16541684 :: LehmerRNG
generator16541684 = Lehmer.initialize [16541684]
firstThirty16541684 :: Array Int
firstThirty16541684 = [990692525, 1128552484, 1006028284, 1178616357,
  615952171, 1436959457, 376499637, 1342574997, 1047295550, 1120338038,
  384787770, 1054789273, 365805326, 1991916368, 1015823893, 457176001,
  60559841, 2069482656, 1149852580, 366972707, 137252365, 403061677,
  1094182701, 1026186446, 674428865, 707245189, 347905378, 1795200912,
  1943971281, 509114309]

all :: forall e. TestSuite e
all = suite "LehmerRNG " do
  test "For seed 1" do
    Assert.equal firstThirty1
      (prSequence 30 generator1)
  test "For seed 1568" do
    Assert.equal firstThirty1568
      (prSequence 30 generator1568)
  test "For seed 16541684" do
    Assert.equal firstThirty16541684
      (prSequence 30 generator16541684)
