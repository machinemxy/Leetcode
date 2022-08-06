// https://leetcode.com/problems/poor-pigs/

class Solution {
	func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
		let test = minutesToTest / minutesToDie + 1
		let minPigs = Int(log(Double(buckets)) / log(Double(test)))
		if pow(Decimal(test), minPigs) < Decimal(buckets) {
			return minPigs + 1
		} else {
			return minPigs
		}
	}
}
