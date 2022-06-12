// https://leetcode.com/problems/maximum-erasure-value/

class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var maxScore = 0
        var l = 0
        var r = 0
        var sum = 0
        var set = Set<Int>()

        while r < nums.count {
            if set.contains(nums[r]) {
                maxScore = max(maxScore, sum)
                while nums[l] != nums[r] {
                    set.remove(nums[l])
                    sum -= nums[l]
                    l += 1
                }
                l += 1
            } else {
                set.insert(nums[r])
                sum += nums[r]
            }

            r += 1
        }

        maxScore = max(maxScore, sum)
        return maxScore
    }
}
