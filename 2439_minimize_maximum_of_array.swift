// https://leetcode.com/problems/minimize-maximum-of-array/description/

class Solution {
    func minimizeArrayValue(_ nums: [Int]) -> Int {
        let n = nums.count
        var sum = 0
        var maxNum = 0
        for num in nums {
            sum += num
            maxNum = max(maxNum, num)
        }
        let avg = (sum % n == 0) ? (sum / n) : (sum / n + 1)
        
        var l = avg
        var r = maxNum
        var result = r
        while l <= r {
            let mid = (l + r) / 2
            if isPossible(nums: nums, ceiling: mid) {
                result = mid
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return result
    }

    func isPossible(nums: [Int], ceiling: Int) -> Bool {
        var nums = nums
        for i in stride(from: nums.count - 1, through: 1, by: -1) {
            if nums[i] > ceiling {
                let gap = nums[i] - ceiling
                nums[i] = ceiling
                nums[i - 1] += gap
            }
        }
        return nums[0] <= ceiling
    }
}
