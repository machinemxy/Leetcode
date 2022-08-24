// https://leetcode.com/problems/power-of-two/

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
		var t = 1
		while t < n {
			t *= 2
		}
		return t == n
    }
}
