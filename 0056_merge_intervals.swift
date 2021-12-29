// https://leetcode.com/problems/merge-intervals/
/*
My solution may looks wierd.
At frist I think just use a bool array to record all the included points,
but it has a problem that for example [1, 4] and [5, 6] will be merged as [1, 6].
In order to solve it quickly, I just multiply all points to 2 and then do the calculation.
Before output the result, divide all points by 2.
*/
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var lastIndex = 0
        for pair in intervals {
            lastIndex = max(lastIndex, pair[1])
        }

        var stations = Array.init(repeating: false, count: lastIndex * 2 + 1)

        for pair in intervals {
            for i in (pair[0] * 2)...(pair[1] * 2) {
                stations[i] = true
            }
        }

        var start = -1
        var resultArray = [[Int]]()
        for i in 0..<stations.count {
            if stations[i] {
                if start == -1 {
                    start = i
                }
            } else {
                if start != -1 {
                    resultArray.append([start, i - 1])
                    start = -1
                }
            }
        }

        resultArray.append([start, lastIndex * 2])
        let realResultArray = resultArray.map { $0.map { $0 / 2 } }
        return realResultArray
    }
}
