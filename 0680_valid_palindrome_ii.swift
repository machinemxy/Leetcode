// https://leetcode.com/problems/valid-palindrome-ii/

class Solution {
    var array = [Character]()

    func validPalindrome(_ s: String) -> Bool {
        array = Array(s)
        return isPalindrome(l: 0, r: array.count - 1, deletedChar: false)
    }

    private func isPalindrome(l: Int, r: Int, deletedChar: Bool) -> Bool {
        var l = l
        var r = r
        while l < r {
            if array[l] == array[r] {
                l += 1
                r -= 1
            } else {
                if deletedChar {
                    return false
                } else {
                    if isPalindrome(l: l + 1, r: r, deletedChar: true) {
                        return true
                    } else {
                        return isPalindrome(l: l, r: r - 1, deletedChar: true)
                    }
                }
            }
        }

        return true
    }
}
