// https://leetcode.com/problems/majority-element/

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var majority = Int.min
        var count = 0

        for num in nums {
            if num == majority {
                count += 1
            } else {
                if count > 0 {
                    count -= 1
                } else {
                    majority = num
                    count = 1
                }
            }
        }

        return majority
    }
}
