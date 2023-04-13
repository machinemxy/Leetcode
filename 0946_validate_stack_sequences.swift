// https://leetcode.com/problems/validate-stack-sequences/

class Solution {
	func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
		var pushed = pushed
		var popped = popped
		var stack = [Int]()

		while !popped.isEmpty {
			if stack.isEmpty {
				if pushed.isEmpty {
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
					if pushed.isEmpty {
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
