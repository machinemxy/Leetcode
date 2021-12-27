// https://leetcode.com/problems/longest-palindromic-substring/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let ca = Array(s)
        var maxLength = 1
        var maxString = String(ca.first!)

        // check situation like "abba"
        if ca.count >= 2 {
            for i in 0..<(ca.count - 1) {
                var l = i
                var r = i + 1
                while l >= 0 && r < ca.count && ca[l] == ca[r] {
                    let length = r - l + 1
                    if length > maxLength {
                        maxLength = length
                        maxString = String(Array(ca[l...r]))
                    }
                    l -= 1
                    r += 1
                }
            }
        }

        // check situation like "abcba"
        if ca.count >= 3 {
            for i in 0..<(ca.count - 2) {
                var l = i
                var r = i + 2
                while l >= 0 && r < ca.count && ca[l] == ca[r] {
                    let length = r - l + 1
                    if length > maxLength {
                        maxLength = length
                        maxString = String(Array(ca[l...r]))
                    }
                    l -= 1
                    r += 1
                }
            }
        }

        return maxString
    }
}
