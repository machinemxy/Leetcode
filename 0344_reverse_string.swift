// https://leetcode.com/problems/reverse-string/

class Solution {
	func reverseString(_ s: inout [Character]) {
		guard s.count > 1 else { return }

		for i in stride(from: s.count - 2, through: 0, by: -1) {
			let c = s.remove(at: i)
			s.append(c)
		}
	}
}
