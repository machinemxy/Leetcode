// https://leetcode.com/problems/power-of-three/

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
		var t = 1
		while t < n {
			t *= 3
		}
		return t == n
    }
}
