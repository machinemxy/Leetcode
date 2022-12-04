// https://leetcode.com/problems/minimum-average-difference/

class Solution {
    func minimumAverageDifference(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        var lSum = 0
        var rSum = sum
        var lCount = 0
        var rCount = nums.count
        var minDiff = Int.max
        var minDiffId = 0
        for i in 0..<nums.count {
            lSum += nums[i]
            rSum -= nums[i]
            lCount += 1
            rCount -= 1
            let lAvg = lSum / lCount
            let rAvg = rSum == 0 ? 0 : (rSum / rCount)
            let diff = abs(lAvg - rAvg)
            if diff < minDiff {
                minDiff = diff
                minDiffId = i
            }
        }
        return minDiffId
    }
}
