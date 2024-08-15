// https://leetcode.com/problems/lemonade-change/description/

class Solution {
    fun lemonadeChange(bills: IntArray): Boolean {
        var fiveCount = 0
        var tenCount = 0
        for (bill in bills) {
            if (bill == 5) {
                fiveCount++
            } else if (bill == 10) {
                if (fiveCount == 0) {
                    return false
                } else {
                    fiveCount--
                    tenCount++
                }
            } else {
                if (tenCount == 0) {
                    if (fiveCount >= 3) {
                        fiveCount -= 3
                    } else {
                        return false
                    }
                } else {
                    if (fiveCount > 0) {
                        fiveCount--
                        tenCount--
                    } else {
                        return false
                    }
                }
            }
        }
        return true
    }
}
