// https://leetcode.com/problems/longest-subsequence-with-limited-sum/description/

class Solution {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        var sums = nums.sorted()
        if sums.count > 1 {
            for i in 1..<nums.count {
                sums[i] += sums[i - 1]
            }
        }
        var result = Array(repeating: 0, count: queries.count)
        for (i, query) in queries.enumerated() {
            var j = 0
            while j < sums.count && sums[j] <= query {
                j += 1
            }
            result[i] = j
        }
        return result
    }
}
