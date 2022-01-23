// https://leetcode.com/problems/count-elements-with-strictly-smaller-and-greater-elements/

class Solution {
    func countElements(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else { return 0 }
        let smallest = nums.min()!
        let greatest = nums.max()!
        var count = 0
        for num in nums {
            if num != smallest && num != greatest {
                count += 1
            }
        }
        return count
    }
}
