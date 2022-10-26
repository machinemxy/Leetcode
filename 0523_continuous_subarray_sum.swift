// https://leetcode.com/problems/continuous-subarray-sum/

class Solution {
	func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
		guard nums.count > 1 else { return false }
		var dic = [0: -1]
		var rest = 0
		for (i, num) in nums.enumerated() {
			rest = (rest + num) % k
			if let prevIndex = dic[rest] {
				if i - prevIndex > 1 {
					return true
				}
			} else {
				dic[rest] = i
			}
		}
		return false
	}
}
