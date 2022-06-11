// https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/

class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        let target = nums.reduce(0) { $0 + $1 } - x
        if target < 0 { return -1 }
        var maxLength = -1
        var l = 0
        var r = -1
        var sum = 0
        while l < nums.count {
            if sum < target {
                r += 1
                if r >= nums.count { break }
                sum += nums[r]
            } else if sum == target {
                maxLength = max(maxLength, r - l + 1)
                sum -= nums[l]
                l += 1
            } else {
                sum -= nums[l]
                l += 1
            }
        }

        if maxLength == -1 {
            return -1
        } else {
            return nums.count - maxLength
        }
    }
}
