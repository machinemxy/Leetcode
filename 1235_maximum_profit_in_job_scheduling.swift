// https://leetcode.com/problems/maximum-profit-in-job-scheduling/

struct Job {
    let startTime: Int
    let endTime: Int
    let profit: Int
}

class Solution {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let jobs = startTime.indices.map { i in
            Job(startTime: startTime[i], endTime: endTime[i], profit: profit[i])
        }.sorted { j1, j2 in
            if j1.endTime == j2.endTime {
                return j1.startTime <= j2.startTime
            } else {
                return j1.endTime < j2.endTime
            }
        }
        
        var dp = Array(repeating: jobs.first!.profit, count: jobs.count)
        guard jobs.count > 1 else { return dp[0] }
        
        for i in 1..<dp.count {
            var l = 0
            var r = i - 1
            var maxPrevJobId = -1
            while l <= r {
                let mid = (l + r) / 2
                let midJobEndTime = jobs[mid].endTime
                if midJobEndTime <= jobs[i].startTime {
                    maxPrevJobId = mid
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            if maxPrevJobId == -1 {
                dp[i] = max(dp[i - 1], jobs[i].profit)
            } else {
                dp[i] = max(dp[i - 1], jobs[i].profit + dp[maxPrevJobId])
            }
        }
        
        return dp[jobs.count - 1]
    }
}
