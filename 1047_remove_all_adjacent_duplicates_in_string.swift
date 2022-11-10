// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/

class Solution {
	func removeDuplicates(_ s: String) -> String {
		var stack = ""
		for c in s {
			guard !stack.isEmpty else {
				stack.append(c)
				continue
			}

			if c == stack.last! {
				stack.removeLast()
			} else {
				stack.append(c)
			}
		}
		return stack
	}
}
