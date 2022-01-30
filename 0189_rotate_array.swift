// https://leetcode.com/problems/rotate-array/

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if k == 0 { return }

        for _ in 1...k {
            let last = nums.removeLast()
            nums.insert(last, at: 0)
        }
    }
}
