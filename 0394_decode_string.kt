// https://leetcode.com/problems/decode-string/description/

class Solution {
    private var i = 0
    private var s = ""

    fun decodeString(s: String): String {
        this.s = "$s]"
        return solve()
    }

    private fun solve(): String {
        var num = 0
        val sb = StringBuilder()
        while (true) {
            val c = s[i]
            i++
            if (c.isDigit()) {
                num = num * 10 + c.toString().toInt()
            } else if (c == '[') {
                val subString = solve()
                for (j in 0 until num) {
                    sb.append(subString)
                }
                num = 0
            } else if (c == ']') {
                return sb.toString()
            } else {
                sb.append(c)
            }
        }
    }
}
