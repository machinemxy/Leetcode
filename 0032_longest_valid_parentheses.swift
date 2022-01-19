// https://leetcode.com/problems/longest-valid-parentheses/

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        let sa = Array(s)
        var longest = 0
        var leftArray = [Int]()
        var startedIndex = -1

        for (i, c) in sa.enumerated() {
            if startedIndex == -1 {
                // not started counting
                if c == ")" {
                    continue
                } else {
                    startedIndex = i
                    leftArray.append(i)
                }
            } else {
                if c == "(" {
                    leftArray.append(i)
                } else {
                    // c == ")"
                    if leftArray.count == 0 {
                        startedIndex = -1
                    } else if leftArray.count == 1 {
                        leftArray.removeLast()
                        let length = i - startedIndex + 1
                        longest = max(longest, length)
                    } else {
                        leftArray.removeLast()
                        let last = leftArray.last!
                        let length = i - last
                        longest = max(longest, length)
                    }
                }
            }
        }

        return longest
    }
}
