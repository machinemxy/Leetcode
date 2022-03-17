// https://leetcode.com/problems/validate-stack-sequences/

class Solution {
	func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
		var pushed = pushed
		var popped = popped
		var stack = [Int]()

		while popped.count > 0 {
			if stack.count == 0 {
				if pushed.count == 0 {
					return false
				} else {
					stack.append(pushed.first!)
					pushed.removeFirst()
				}
			} else {
				if stack.last == popped.first {
					stack.removeLast()
					popped.removeFirst()
				} else {
					if pushed.count == 0 {
						return false
					} else {
						stack.append(pushed.first!)
						pushed.removeFirst()
					}
				}
			}
		}

		return true
	}
}
