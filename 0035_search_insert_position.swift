// https://leetcode.com/problems/search-insert-position/

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if target <= nums[0] { return 0 }
        if target > nums.last! { return nums.count }

        var l = 0
        var r = nums.count - 1
        while l <= r {
            let mid = (l + r) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l
    }
}
