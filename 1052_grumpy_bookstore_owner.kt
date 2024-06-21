// https://leetcode.com/problems/grumpy-bookstore-owner/description/

import kotlin.math.max

class Solution {
    fun maxSatisfied(customers: IntArray, grumpy: IntArray, minutes: Int): Int {
        var controlStart = 0
        var controlEnd = minutes - 1
        var satisfied = 0
        for (i in customers.indices) {
            if ((i >= controlStart && i <= controlEnd) || grumpy[i] == 0) {
                satisfied += customers[i]
            }
        }
        var result = satisfied
        while (true) {
            controlEnd++
            if (controlEnd >= customers.size) {
                break
            }
            if (grumpy[controlStart] == 1) {
                satisfied -= customers[controlStart]
            }
            controlStart++
            if (grumpy[controlEnd] == 1) {
                satisfied += customers[controlEnd]
            }
            result = max(result, satisfied)
        }
        return result
    }
}
