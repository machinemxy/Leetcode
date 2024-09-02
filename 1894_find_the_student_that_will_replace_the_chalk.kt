// https://leetcode.com/problems/find-the-student-that-will-replace-the-chalk/description/

class Solution {
    fun chalkReplacer(chalk: IntArray, k: Int): Int {
        var sum = 0L
        for (c in chalk) {
            sum += c
        }
        var restK = k % sum
        for (i in chalk.indices) {
            val usage = chalk[i]
            if (restK < usage) {
                return i
            } else {
                restK -= usage
            }
        }
        return 0
    }
}
