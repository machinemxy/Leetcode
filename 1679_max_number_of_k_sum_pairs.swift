// https://leetcode.com/problems/max-number-of-k-sum-pairs/

class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        let sortedNums = nums.sorted()
        var l = 0
        var r = nums.count - 1
        var result = 0

        while l < r {
            let lVal = sortedNums[l]
            let rVal = sortedNums[r]

            if lVal + rVal == k {
                l += 1
                r -= 1
                result += 1
            } else if lVal + rVal < k {
                l += 1
            } else {
                r -= 1
            }
        }

        return result
    }
}
