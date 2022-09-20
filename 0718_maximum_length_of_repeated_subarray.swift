// https://leetcode.com/problems/maximum-length-of-repeated-subarray/

class Solution {
	func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
		let memoRow = Array(repeating: 0, count: nums2.count)
		var memo = Array(repeating: memoRow, count: nums1.count)
		var result = 0
		for nums1StartIndex in stride(from: nums1.count - 1, through: 0, by: -1) {
			for nums2StartIndex in stride(from: nums2.count - 1, through: 0, by: -1) {
				let num1 = nums1[nums1StartIndex]
				let num2 = nums2[nums2StartIndex]
				if num1 == num2 {
					if nums1StartIndex == nums1.count - 1 || nums2StartIndex == nums2.count - 1 {
						result = max(result, 1)
						memo[nums1StartIndex][nums2StartIndex] = 1
					} else {
						let newResult = memo[nums1StartIndex + 1][nums2StartIndex + 1] + 1
						result = max(result, newResult)
						memo[nums1StartIndex][nums2StartIndex] = newResult
					}
				} else {
					memo[nums1StartIndex][nums2StartIndex] = 0
				}

			}
		}
		return result
	}
}
