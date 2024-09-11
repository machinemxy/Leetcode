// https://leetcode.com/problems/minimum-bit-flips-to-convert-number/description/

class Solution {
    fun minBitFlips(start: Int, goal: Int): Int {
        return (start xor goal).countOneBits()
    }
}
