// https://leetcode.com/problems/running-sum-of-1d-array/

class Solution {
	func runningSum(_ nums: [Int]) -> [Int] {
		var sum = 0
		var result = [Int]()
		for num in nums {
			sum += num
			result.append(sum)
		}
		return result
	}
}
