// https://leetcode.com/problems/decoded-string-at-index/description/

class Solution {
    fun decodeAtIndex(s: String, k: Int): String {
        var decodedLength = 0L
        var k = k.toLong()

        for (c in s) {
            if (c.isDigit()) {
                decodedLength *= c.toString().toInt()
            } else {
                decodedLength++
            }
        }

        for (c in s.reversed()) {
            k %= decodedLength
            if (k == 0L && c.isLetter()) {
                return c.toString()
            } else if (c.isDigit()) {
                decodedLength /= c.toString().toInt()
            } else {
                decodedLength--
            }
        }

        return ""
    }
}
