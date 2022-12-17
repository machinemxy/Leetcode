// https://leetcode.com/problems/evaluate-reverse-polish-notation/description/

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            if token == "+" {
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 + num2)
            } else if token == "-" {
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 - num2)
            } else if token == "*" {
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 * num2)
            } else if token == "/" {
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 / num2)
            } else {
                let num = Int(token)!
                stack.append(num)
            }
        }
        return stack.last!
    }
}
