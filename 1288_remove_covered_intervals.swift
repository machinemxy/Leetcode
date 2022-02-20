// https://leetcode.com/problems/remove-covered-intervals/

class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let sortedIntervals = intervals.sorted { interval1, interval2 in
            let gap1 = interval1[1] - interval1[0]
            let gap2 = interval2[1] - interval2[0]
            return gap1 >= gap2
        }

        var result = [[Int]]()
        for interval in sortedIntervals {
            var shouldInsert = true
            for insertedInterval in result {
                if interval[0] >= insertedInterval[0] && interval[1] <= insertedInterval[1] {
                    shouldInsert = false
                    break
                }
            }
            if shouldInsert {
                result.append(interval)
            }
        }

        return result.count
    }
}
