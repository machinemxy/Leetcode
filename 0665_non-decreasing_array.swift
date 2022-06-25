// https://leetcode.com/problems/non-decreasing-array/

class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        var twoBefore = Int.min
        var oneBefore = Int.min
        var modified = false

        for num in nums {
            if num < oneBefore {
                if modified {
                    return false
                }

                if num >= twoBefore {
                    oneBefore = num
                }
                modified = true
            } else {
                twoBefore = oneBefore
                oneBefore = num
            }
        }

        return true
    }
}
