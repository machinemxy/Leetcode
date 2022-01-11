// https://leetcode.com/problems/valid-parentheses/

class Solution {
	func isValid(_ s: String) -> Bool {
		var stack = [Character]()

		for c in s {
			switch c {
				case "(", "{", "[":
					stack.append(c)
				case ")":
					if let last = stack.last {
						if last == "(" {
							stack.removeLast()
						} else {
							return false
						}
					} else {
						return false
					}
				case "}":
					if let last = stack.last {
						if last == "{" {
							stack.removeLast()
						} else {
							return false
						}
					} else {
						return false
					}
				default:
					if let last = stack.last {
						if last == "[" {
							stack.removeLast()
						} else {
							return false
						}
					} else {
						return false
					}
			}
		}

		if stack.count == 0 {
			return true
		} else {
			return false
		}
	}
}
