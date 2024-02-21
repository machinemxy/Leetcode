// https://leetcode.com/problems/bitwise-and-of-numbers-range/description/

class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        (left...right).reduce(.max, &)
    }
}
