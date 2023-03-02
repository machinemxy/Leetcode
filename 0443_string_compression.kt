// https://leetcode.com/problems/string-compression/description/

class Solution {
    fun compress(chars: CharArray): Int {
        var result = ""
        var prevChar = ' '
        var count = 1
        for (char in chars) {
            if (char == prevChar) {
                count ++
            } else {
                if (count > 1) {
                    result += count.toString()
                }
                prevChar = char
                result += char
                count = 1
            }
        }
        if (count > 1) {
            result += count.toString()
        }
        var i = 0
        for (char in result) {
            chars[i] = char
            i ++
        }
        return result.count()
    }
}
