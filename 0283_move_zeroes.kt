// https://leetcode.com/problems/move-zeroes/description/

class Solution {
    fun moveZeroes(nums: IntArray): Unit {
        val n = nums.size
        if (n == 1) { return }
        var lastIdThatIsNot0 = -1
        for (i in n - 1 downTo 0) {
            if (nums[i] != 0) {
                lastIdThatIsNot0 = i
                break
            }
        }
        if (lastIdThatIsNot0 == -1) { return }
        var theIdBeforeLastIdThatIsNot0 = lastIdThatIsNot0 - 1
        for (i in theIdBeforeLastIdThatIsNot0 downTo 0) {
            if (nums[i] == 0) {
                for (j in i .. theIdBeforeLastIdThatIsNot0) {
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                }
                theIdBeforeLastIdThatIsNot0--
            }
        }
    }
}
