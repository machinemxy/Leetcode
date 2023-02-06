// https://leetcode.com/problems/shuffle-the-array/description/

class Solution {
	func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
		var result = [Int]()
		for i in 0..<n {
			result.append(nums[i])
			result.append(nums[n + i])
		}
		return result
	}
}
