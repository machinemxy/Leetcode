// https://leetcode.com/problems/count-of-smaller-numbers-after-self/

class Solution {
    func countSmaller(_ nums: [Int]) -> [Int] {
        if nums.count == 1 {
            return [0]
        }

        var array = [nums.last!]
        var reversedResult = [0]

        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            let num = nums[i]
            var l = 0
            var r = array.count - 1
            while l <= r {
                let mid = (l + r) / 2
                let midVal = array[mid]
                if num <= midVal {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            array.insert(num, at: l)
            reversedResult.append(l)
        }

        return reversedResult.reversed()
    }
}
