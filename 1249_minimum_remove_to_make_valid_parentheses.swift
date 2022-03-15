// https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/

class Solution {
	func minRemoveToMakeValid(_ s: String) -> String {
		var chars1 = [Character]()
		var leftParentheses = 0
		for c in s {
			if c == "(" {
				chars1.append(c)
				leftParentheses += 1
			} else if c == ")" {
				if leftParentheses > 0 {
					chars1.append(c)
					leftParentheses -= 1
				}
			} else {
				chars1.append(c)
			}
		}

		if chars1.count == 0 { return "" }

		var chars2 = [Character]()
		var rightParentheses = 0
		for i in stride(from: chars1.count - 1, through: 0, by: -1) {
			let c = chars1[i]
			if c == ")" {
				chars2.append(c)
				rightParentheses += 1
			} else if c == "(" {
				if rightParentheses > 0 {
					chars2.append(c)
					rightParentheses -= 1
				}
			} else {
				chars2.append(c)
			}
		}

		return String(chars2.reversed())
	}
}
