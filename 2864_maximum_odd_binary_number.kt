// https://leetcode.com/problems/maximum-odd-binary-number/description/

class Solution {
    fun maximumOddBinaryNumber(s: String): String {
        val list = s.toList().sorted().reversed().toMutableList()
        list.removeFirst()
        list.add('1')
        return list.joinToString("")
    }
}
