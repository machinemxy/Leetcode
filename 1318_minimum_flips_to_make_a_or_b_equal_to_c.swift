// https://leetcode.com/problems/minimum-flips-to-make-a-or-b-equal-to-c/description/

class Solution {
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        let x = (a | b) ^ c
        let y = x & (a & b)
        return x.nonzeroBitCount + y.nonzeroBitCount
    }
}
