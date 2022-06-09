// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

class Solution {
	func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
		var l = 0
		var r = numbers.count - 1

		while true {
			let sum = numbers[l] + numbers[r]
			if sum == target {
				break
			} else if sum > target {
				r -= 1
			} else {
				l += 1
			}
		}

		return [l + 1, r + 1]
	}
}
