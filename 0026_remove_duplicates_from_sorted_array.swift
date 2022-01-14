// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

class Solution {
	func removeDuplicates(_ nums: inout [Int]) -> Int {
		var set = Set<Int>()
		for (i, num) in nums.enumerated() {
			if !set.contains(num) {
				set.insert(num)
			} else {
				nums[i] = Int.min
			}
		}

		nums = nums.compactMap { $0 == Int.min ? nil : $0 }
		return set.count
	}
}
