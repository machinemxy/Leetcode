// https://leetcode.com/problems/sum-of-even-numbers-after-queries/

class Solution {
	func sumEvenAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
		var nums = nums
		var result = [Int]()
		var sum = nums.filter { $0 % 2 == 0 }.reduce(0, +)
		for query in queries {
			let addNum = query[0]
			let i = query[1]
			if nums[i] % 2 == 0 {
				if addNum % 2 == 0 {
					// even -> even
					sum += addNum
				} else {
					// even -> odd
					sum -= nums[i]
				}
			} else {
				if addNum % 2 == 0 {
					// odd -> odd
				} else {
					// odd -> even
					sum = sum + nums[i] + addNum
				}
			}
			nums[i] += addNum
			result.append(sum)
		}
		return result
	}
}
