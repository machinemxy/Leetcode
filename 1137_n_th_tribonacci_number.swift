// https://leetcode.com/problems/n-th-tribonacci-number/description/

class Solution {
	func tribonacci(_ n: Int) -> Int {
		if n == 0 {
			return 0
		} else if n == 1 {
			return 1
		} else if n == 2 {
			return 1
		}
		var v1 = 0
		var v2 = 1
		var v3 = 1
		var i = 3
		while true {
			let v = v1 + v2 + v3
			if i == n {
				return v
			}
			v1 = v2
			v2 = v3
			v3 = v
			i += 1
		}
	}
}
