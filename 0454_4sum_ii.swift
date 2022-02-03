// https://leetcode.com/problems/4sum-ii/

class Solution {
	func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
		var dic1 = Dictionary<Int, Int>()
		var dic2 = Dictionary<Int, Int>()

		for i in nums1 {
			for j in nums2 {
				let t = i + j
				dic1[t] = (dic1[t] ?? 0) + 1
			}
		}

		for i in nums3 {
			for j in nums4 {
				let t = i + j
				dic2[t] = (dic2[t] ?? 0) + 1
			}
		}

		var result = 0
		for (key1, value1) in dic1 {
			let key2 = 0 - key1
			if let value2 = dic2[key2] {
				result += value1 * value2
			}
		}
		return result
	}
}
