// https://leetcode.com/problems/missing-number/

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let set = Set(nums)
        for i in 0...nums.count {
            if !set.contains(i) {
                return i
            }
        }
        return 0
    }
}
