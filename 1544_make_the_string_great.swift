// https://leetcode.com/problems/make-the-string-great/

class Solution {
	func makeGood(_ s: String) -> String {
		var pool = [Character]()
		for c in s {
			guard !pool.isEmpty else {
				pool.append(c)
				continue
			}

			let prevC = pool.last!
			if c.isUppercase && prevC.isLowercase {
				if c.lowercased() == String(prevC) {
					pool.removeLast()
				} else {
					pool.append(c)
				}
			} else if c.isLowercase && prevC.isUppercase {
				if c.uppercased() == String(prevC) {
					pool.removeLast()
				} else {
					pool.append(c)
				}
			} else {
				pool.append(c)
			}
		}
		return String(pool)
	}
}
