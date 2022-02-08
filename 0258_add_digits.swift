// https://leetcode.com/problems/add-digits/

class Solution {
	func addDigits(_ num: Int) -> Int {
		var num = num
		while num >= 10 {
			var temp = num
			var sum = 0
			while temp > 0 {
				sum += temp % 10
				temp = temp / 10
			}
			num = sum
		}
		return num
	}
}
