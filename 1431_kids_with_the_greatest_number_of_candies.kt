// https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/description/

class Solution {
    fun kidsWithCandies(candies: IntArray, extraCandies: Int): List<Boolean> {
        val max = candies.max()!!
        return candies.map { it + extraCandies >= max }
    }
}
