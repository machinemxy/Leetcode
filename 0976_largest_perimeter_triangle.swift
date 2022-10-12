// https://leetcode.com/problems/largest-perimeter-triangle/

class Solution {
	func largestPerimeter(_ nums: [Int]) -> Int {
		let nums = nums.sorted(by: >)
		for i in 0...(nums.count - 3) {
			if nums[i + 1] + nums[i + 2] > nums[i] {
				return nums[i + 1] + nums[i + 2] + nums[i]
			}
		}
		return 0
	}
}
