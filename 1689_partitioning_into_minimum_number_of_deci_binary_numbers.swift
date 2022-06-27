// https://leetcode.com/problems/partitioning-into-minimum-number-of-deci-binary-numbers/

class Solution {
	func minPartitions(_ n: String) -> Int {
		var maxDigit = 0
		for char in n {
			if let digit = Int(String(char)) {
				maxDigit = max(maxDigit, digit)
			}
		}
		return maxDigit
	}
}
