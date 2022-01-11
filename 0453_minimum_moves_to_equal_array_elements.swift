// https://leetcode.com/problems/minimum-moves-to-equal-array-elements/

class Solution {
	func minMoves(_ nums: [Int]) -> Int {
		guard let minNum = nums.min() else { return 0 }
		var steps = 0
		for num in nums {
			steps += num - minNum
		}
		return steps
	}
}

/* if use reduce, just need two lines
class Solution {
	func minMoves(_ nums: [Int]) -> Int {
		guard let minNum = nums.min() else { return 0 }
		return nums.reduce(0) { $0 + $1 - minNum }
	}
}
*/
