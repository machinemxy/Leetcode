// https://leetcode.com/problems/valid-parentheses/

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()

        for c in s {
            switch c {
                case "(", "{", "[":
                    stack.append(c)
                case ")":
                    if let last = stack.last, last == "(" {
                        stack.removeLast()
                    } else {
                        return false
                    }
                case "}":
                    if let last = stack.last, last == "{" {
                        stack.removeLast()
                    } else {
                        return false
                    }
                default:
                    if let last = stack.last, last == "[" {
                        stack.removeLast()
                    } else {
                        return false
                    }
            }
        }

        return stack.isEmpty
    }
}
