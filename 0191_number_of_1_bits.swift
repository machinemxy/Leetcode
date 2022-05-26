// https://leetcode.com/problems/number-of-1-bits/

class Solution {
	func hammingWeight(_ n: Int) -> Int {
		var number = n
		var result = 0
		while number > 0 {
			result += number % 2
			number /= 2
		}
		return result
	}
}
