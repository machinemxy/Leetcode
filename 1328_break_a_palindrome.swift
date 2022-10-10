// https://leetcode.com/problems/break-a-palindrome/

class Solution {
    func breakPalindrome(_ palindrome: String) -> String {
        var palindrome = Array(palindrome)
        if palindrome.count == 1 { return "" }
        for i in 0..<(palindrome.count / 2) {
            if palindrome[i] != "a" {
                palindrome[i] = "a"
                return String(palindrome)
            }
        }
        palindrome[palindrome.count - 1] = "b"
        return String(palindrome)
    }
}
