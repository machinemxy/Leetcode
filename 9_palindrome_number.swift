// https://leetcode.com/problems/palindrome-number/

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        guard x >= 10 else { return true }
        var tx = x
        var list = [Int]()
        while tx >= 10 {
            list.append(tx % 10)
            tx = tx / 10
        }
        list.append(tx)

        var l = 0
        var r = list.count - 1
        while l < r {
            if list[l] != list[r] {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }
}
