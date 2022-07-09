// https://leetcode.com/problems/jump-game-vi/

class Solution {
    func maxResult(_ nums: [Int], _ k: Int) -> Int {
        if nums.count == 1 { return nums[0] }

        var stack = [Int]()
        stack.append(nums[0])
        var prevMaxScore = nums[0]

        for i in 1..<nums.count {
            let currentMaxScore = prevMaxScore + nums[i]
            stack.append(currentMaxScore)
            prevMaxScore = max(prevMaxScore, currentMaxScore)
            if stack.count > k {
                if stack.removeFirst() == prevMaxScore {
                    prevMaxScore = stack.reduce(Int.min, max)
                }
            }
        }

        return stack.last!
    }
}
