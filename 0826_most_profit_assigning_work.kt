// https://leetcode.com/problems/most-profit-assigning-work/description/

class Solution {
    fun maxProfitAssignment(difficulty: IntArray, profit: IntArray, worker: IntArray): Int {
        val jobs = mutableListOf<Job>()
        for (i in difficulty.indices) {
            jobs.add(Job(difficulty[i], profit[i]))
        }
        jobs.sortBy { it.difficulty }
        var bestProfit = 0
        for (job in jobs) {
            if (job.profit >= bestProfit) {
                bestProfit = job.profit
            } else {
                job.profit = bestProfit
            }
        }
        var result = 0
        for (w in worker) {
            var l = 0
            var r = jobs.size - 1
            while (l <= r) {
                val mid = (l + r) / 2
                val midDifficulty = jobs[mid].difficulty
                if (midDifficulty <= w) {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            val selectedJobId = l - 1
            if (selectedJobId >= 0) {
                result += jobs[selectedJobId].profit
            }
        }
        return result
    }
}

data class Job(val difficulty: Int, var profit: Int)
