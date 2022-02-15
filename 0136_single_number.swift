// https://leetcode.com/problems/single-number/

class Solution {
	func singleNumber(_ nums: [Int]) -> Int {
		nums.reduce(0) { $0 ^ $1 }
	}
}
