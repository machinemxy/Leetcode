// https://leetcode.com/problems/is-subsequence/

class Solution {
	func isSubsequence(_ s: String, _ t: String) -> Bool {
		let s = Array(s)
		var si = 0

		for ts in t {
			if si >= s.count {
				return true
			}

			if s[si] == ts {
				si += 1
			}
		}

		return si >= s.count
	}
}
