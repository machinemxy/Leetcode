// https://leetcode.com/problems/remove-palindromic-subsequences/

class Solution {
	func removePalindromeSub(_ s: String) -> Int {
		let arr = Array(s)
		var l = 0
		var r = arr.count - 1
		while l < r {
			if arr[l] != arr[r] {
				return 2
			}
			l += 1
			r -= 1
		}
		return 1
	}
}
