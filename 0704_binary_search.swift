// https://leetcode.com/problems/binary-search/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1

        while l <= r {
            let mid = (l + r) / 2
            let midValue = nums[mid]
            if midValue == target {
                return mid
            } else if target > midValue {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }

        return -1
    }
}
