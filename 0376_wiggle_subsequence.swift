// https://leetcode.com/problems/wiggle-subsequence/

class Solution {
	func wiggleMaxLength(_ nums: [Int]) -> Int {
		if nums.count == 1 { return 1 }

		var sequence = 1
		var previousTrend: Bool? = nil

		for i in 1..<nums.count {
			let currentNum = nums[i]
			let previousNum = nums[i - 1]

			if let unwrappedPreviousTrend = previousTrend {
				if unwrappedPreviousTrend {
					if currentNum < previousNum {
						sequence += 1
						previousTrend = false
					}
				} else {
					if currentNum > previousNum {
						sequence += 1
						previousTrend = true
					}
				}
			} else {
				if currentNum > previousNum {
					sequence += 1
					previousTrend = true
				} else if currentNum < previousNum {
					sequence += 1
					previousTrend = false
				}
			}
		}

		return sequence
	}
}
