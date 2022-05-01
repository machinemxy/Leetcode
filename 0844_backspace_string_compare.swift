// https://leetcode.com/problems/backspace-string-compare/

class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        parseString(s) == parseString(t)
    }

    private func parseString(_ s: String) -> String {
        var result = ""
        for c in s {
            if c == "#" {
                if result != "" {
                    result.removeLast()
                }
            } else {
                result.append(c)
            }
        }
        return result
    }
}
