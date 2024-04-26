// https://leetcode.com/problems/minimum-falling-path-sum-ii/description/

class Solution {
    fun minFallingPathSum(grid: Array<IntArray>): Int {
        val n = grid.size
        if (n == 1) {
            return grid[0][0]
        }
        var smallest = Int.MAX_VALUE
        var smallestId = -1
        var secondSmallest = Int.MAX_VALUE
        for (i in 0 until n) {
            val num = grid[0][i]
            if (num < smallest) {
                secondSmallest = smallest
                smallest = num
                smallestId = i
            } else if (num < secondSmallest) {
                secondSmallest = num
            }
        }

        for (y in 1 until n) {
            var newSmallest = Int.MAX_VALUE
            var newSmallestId = -1
            var newSecondSmallest = Int.MAX_VALUE

            for (x in 0 until n) {
                var num = grid[y][x]
                if (x == smallestId) {
                    num += secondSmallest
                } else {
                    num += smallest
                }
                if (num < newSmallest) {
                    newSecondSmallest = newSmallest
                    newSmallest = num
                    newSmallestId = x
                } else if (num < newSecondSmallest) {
                    newSecondSmallest = num
                }
            }

            smallest = newSmallest
            smallestId = newSmallestId
            secondSmallest = newSecondSmallest
        }
        return smallest
    }
}
