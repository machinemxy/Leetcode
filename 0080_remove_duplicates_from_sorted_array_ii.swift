// https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var prev = Int.min
        var appearCount = 0
        var i = 0

        while i < nums.count {
            if nums[i] == prev {
                if appearCount == 2 {
                    nums.remove(at: i)
                } else {
                    appearCount += 1
                    i += 1
                }
            } else {
                prev = nums[i]
                appearCount = 1
                i += 1
            }
        }

        return nums.count
    }
}
