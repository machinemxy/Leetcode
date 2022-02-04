// https://leetcode.com/problems/count-the-hidden-sequences/

class Solution {
	func numberOfArrays(_ differences: [Int], _ lower: Int, _ upper: Int) -> Int {
		var hiddenLower = 0
		var hiddenUpper = 0
		var t = 0
		for difference in differences {
			t = t + difference
			if difference > 0 {
				hiddenUpper = max(hiddenUpper, t)
			} else if difference < 0 {
				hiddenLower = min(hiddenLower, t)
			}
		}
		let hiddenRange = hiddenUpper - hiddenLower + 1
		let range = upper - lower + 1
		if hiddenRange > range {
			return 0
		} else {
			return range - hiddenRange + 1
		}
	}
}
