// https://leetcode.com/problems/132-pattern/

class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else { return false }

        var stack = [Int]()
        var midNum = Int.min

        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            let num = nums[i]

            if num < midNum {
                return true
            }

            while !stack.isEmpty && num > stack.last! {
                midNum = stack.removeLast()
            }
            stack.append(num)
        }

        return false
    }
}
