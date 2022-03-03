// https://leetcode.com/problems/arithmetic-slices/

class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else { return 0 }
        var result = 0

        for i in 0..<(nums.count - 2) {
            let diff = nums[i + 1] - nums[i]
            var x = 2
            while i + x < nums.count {
                if nums[i + x] - nums[i + x - 1] == diff {
                    result += 1
                    x += 1
                } else {
                    break
                }
            }
        }

        return result
    }
}
