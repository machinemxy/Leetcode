// https://leetcode.com/problems/find-the-pivot-integer/description/

class Solution {
    fun pivotInteger(n: Int): Int {
        var leftSum = 0
        var rightSum = n
        for (i in 1 .. n) {
            leftSum += i
        }
        var current = n
        if (leftSum == rightSum) {
            return current
        }
        while (leftSum > rightSum) {
            leftSum -= current
            current -= 1
            rightSum += current
            if (leftSum == rightSum) {
                return current
            }
        }
        return -1
    }
}
