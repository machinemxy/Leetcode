// https://leetcode.com/problems/power-of-four/

class Solution {
	func isPowerOfFour(_ n: Int) -> Bool {
		var t = 1
		while t < n {
			t *= 4
		}
		return t == n
	}
}
