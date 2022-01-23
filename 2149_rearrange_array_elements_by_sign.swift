// https://leetcode.com/problems/rearrange-array-elements-by-sign/

class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var positiveId = -1
        var negativeId = -1
        var nextIsPositive = true
        var result = [Int]()

        while result.count < nums.count {
            if nextIsPositive {
                while true {
                    positiveId += 1
                    if nums[positiveId] > 0 {
                        result.append(nums[positiveId])
                        nextIsPositive = false
                        break
                    }
                }
            } else {
                while true {
                    negativeId += 1
                    if nums[negativeId] < 0 {
                        result.append(nums[negativeId])
                        nextIsPositive = true
                        break
                    }
                }
            }
        }

        return result
    }
}
