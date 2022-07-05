// https://leetcode.com/problems/longest-consecutive-sequence/

class Solution {
	func longestConsecutive(_ nums: [Int]) -> Int {
		if nums.isEmpty { return 0 }
		if nums.count == 1 { return 1 }

		let nums = Array(Set(nums)).sorted()
		var longestConsecutiveSequence = 1
		var sequenceStart = 0
		for i in 1..<nums.count {
			if nums[i] == nums[i - 1] + 1 {
				continue
			} else {
				let consecutiveSequece = i - sequenceStart
				longestConsecutiveSequence = max(longestConsecutiveSequence, consecutiveSequece)
				sequenceStart = i
			}
		}

		let consecutiveSequece = nums.count - sequenceStart
		longestConsecutiveSequence = max(longestConsecutiveSequence, consecutiveSequece)

		return longestConsecutiveSequence
	}
}
