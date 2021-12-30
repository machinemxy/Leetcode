https://leetcode.com/problems/smallest-integer-divisible-by-k/

class Solution {
    func smallestRepunitDivByK(_ k: Int) -> Int {
        var t = 0
        for i in 1...k {
            t = (t % k * 10 + 1) % k
            if t == 0 {
                return i
            }
        }
        return -1
    }
}
