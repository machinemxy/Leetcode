// https://leetcode.com/problems/minimum-string-length-after-removing-substrings/description/

class Solution {
    fun minLength(s: String): Int {
        var newS = s
        while (true) {
            var removed = false
            for (i in 0 until newS.length - 1) {
                if (newS[i] == 'A' && newS[i + 1] == 'B') {
                    newS = newS.removeRange(i .. i + 1)
                    removed = true
                    break
                } else if (newS[i] == 'C' && newS[i + 1] == 'D') {
                    newS = newS.removeRange(i .. i + 1)
                    removed = true
                    break
                }
            }
            if (!removed) {
                break
            }
        }
        return newS.length
    }
}
