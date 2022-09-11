// https://leetcode.com/problems/maximum-performance-of-a-team/

class Solution {
    func maxPerformance(_ n: Int, _ speed: [Int], _ efficiency: [Int], _ k: Int) -> Int {
        var engineers = [Engineer]()
        for i in 0..<n {
            engineers.append(Engineer(speed: speed[i], efficiency: efficiency[i]))
        }
        engineers.sort { e1, e2 in
            (e1.efficiency == e2.efficiency) ? (e1.speed >= e2.speed) : (e1.efficiency > e2.efficiency)
        }
        var bestPerformance = 0
        var maxSpeeds = [Int]()
        for engineer in engineers {
            let performanceIfUseThisEngineer = maxSpeeds.reduce(engineer.speed, +) * engineer.efficiency
            bestPerformance = max(bestPerformance, performanceIfUseThisEngineer)

            let speed = engineer.speed
            if maxSpeeds.isEmpty {
                maxSpeeds.append(speed)
            } else {
                var l = 0
                var r = maxSpeeds.count - 1
                while l <= r {
                    let mid = (l + r) / 2
                    let midVal = maxSpeeds[mid]
                    if speed >= midVal {
                        r = mid - 1
                    } else {
                        l = mid + 1
                    }
                }
                maxSpeeds.insert(speed, at: l)
            }
            if maxSpeeds.count > (k - 1) {
                maxSpeeds.removeLast()
            }
        }

        return bestPerformance % 1000000007
    }
}

struct Engineer {
    let speed: Int
    let efficiency: Int
}
