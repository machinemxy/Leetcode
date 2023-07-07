// https://leetcode.com/problems/maximize-the-confusion-of-an-exam/description/

import kotlin.math.max

class Solution {
    fun maxConsecutiveAnswers(answerKey: String, k: Int): Int {
        var l = 0
        var countT = 0
        var countF = 0
        var result = 0
        for (r in answerKey.indices) {
            if (answerKey[r] == 'T') {
                countT++
            } else {
                countF++
            }
            
            while (countT > k && countF > k) {
                if (answerKey[l] == 'T') {
                    countT--
                } else {
                    countF--
                }
                l++
            }
            
            result = max(result, r - l + 1)
        }
        return result
    }
}
