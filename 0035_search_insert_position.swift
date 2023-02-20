// https://leetcode.com/problems/search-insert-position/

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let mid = (l + r) / 2
            if target <= nums[mid] {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l
    }
}
