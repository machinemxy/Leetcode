// https://leetcode.com/problems/count-odd-numbers-in-an-interval-range/description/

class Solution {
	func countOdds(_ low: Int, _ high: Int) -> Int {
		var realLow = low
		var realHigh = high
		if low % 2 == 0 {
			realLow += 1
		}
		if high % 2 == 0 {
			realHigh -= 1
		}
		return (realHigh - realLow) / 2 + 1
	}
}
