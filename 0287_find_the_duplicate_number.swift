// https://leetcode.com/problems/find-the-duplicate-number/

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var appeared = Array(repeating: false, count: nums.count)
        for num in nums {
            if appeared[num] {
                return num
            } else {
                appeared[num] = true
            }
        }
        return Int.max
    }
}
