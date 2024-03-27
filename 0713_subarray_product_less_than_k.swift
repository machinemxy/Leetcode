// https://leetcode.com/problems/subarray-product-less-than-k/description/

class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var list = Array(repeating: 0, count: nums.count)
        for i in nums.indices {
            let num = nums[i]
            if num >= k {
                continue
            }
            list[i] = num
            result += 1
            var j = i - 1
            while j >= 0 && list[j] > 0 {
                let newValue = list[j] * num
                if newValue < k {
                    list[j] = newValue
                    result += 1
                } else {
                    list[j] = 0
                    break
                }
                j -= 1
            }
        }
        return result
    }
}
