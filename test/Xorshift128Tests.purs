module Test.Xorshift128 where

import Prelude (discard, negate)
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Helpers.PRNArray

import PRNG.Xorshift128 (Xorshift128)
import PRNG.PRNG (initialize)

generator1_1_1_1 :: Xorshift128
generator1_1_1_1 =
  initialize [1, 1, 1, 1]
firstThirty1111 :: Array Int
firstThirty1111 = [2056, 1, 2056, 1, 4196417, 4194368, 2056, 1, 131648,
  4210688, 18504, 16449, 268456451, 306335811, 268572747, 302141506, 8423499,
  4194384, 8421459, 16449, 80106202, 75796626, 133705, 33701952, 879006296,
  340038726, 67404997, 336905285, 82993869, 874782897]

generator1568_35181_651_77 :: Xorshift128
generator1568_35181_651_77 =
  initialize [1568, 35181, 651, 77]
firstThirty1568_35181_651_77 :: Array Int
firstThirty1568_35181_651_77 = [3225451, 75406817, 74109887, 73971991,
  -1922343778, 2097826119, 800037490, 1850621585, -1189736342, -1770441090,
  -984198455, -621590972, -747665360, -1929732379, -78817879, -1144197662,
  340647075, 1276667257, -580284082, 18273532, 2076489913, -193451755,
  1695167797, -770917284, -1940662316, -1185515574, -1916707256, 983105008,
  677863424, 579185377]


generatorm15_m8976546_1651981_16541684 :: Xorshift128
generatorm15_m8976546_1651981_16541684 =
  initialize [-15, -8976546, 1651981, 16541684]
firstThirtym15_m8976546_1651981_16541684 :: Array Int
firstThirtym15_m8976546_1651981_16541684 = [16519277, 1207347931, -1903276427,
  1840143255, -1926147785, 2137231928, -2090695097, -1676736673, -1682946816,
  -131992036, 1877346273, -1959280451, -1833562978, 1708169666, 978731926,
  256990793, 765555137, -866196674, 1151091664, -1044709860, -407654253,
  -590350264, 2062262978, 1823996317, 385543088, -1252762465, -1836186299,
  1093041560, -2143241881, -1746420396]

all :: forall e. TestSuite e
all = suite "Xorshift128+ " do
  test "For seed 1 1 1 1" do
    Assert.equal firstThirty1111
      (prnArray 30 generator1_1_1_1)
  test "For seed 1568 35181 651 77" do
    Assert.equal firstThirty1568_35181_651_77
      (prnArray 30 generator1568_35181_651_77)
  test "For seed -15 -8976546 1651981 16541684" do
    Assert.equal firstThirtym15_m8976546_1651981_16541684
      (prnArray 30 generatorm15_m8976546_1651981_16541684)
