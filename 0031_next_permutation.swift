// https://leetcode.com/problems/next-permutation/

class Solution {
	func nextPermutation(_ nums: inout [Int]) {
		if nums.count == 1 { return }
		for i in stride(from: nums.count - 1, through: 1, by: -1) {
			if nums[i] > nums[i - 1] {
				var rest: [Int] = Array(nums[i...])
				var idToSwap = 0
				var l = 0
				var r = rest.count - 1
				var mid = (l + r) / 2
				while l <= r {
					if nums[i - 1] < rest[mid] {
						idToSwap = mid
						l = mid + 1
					} else {
						r = mid - 1
					}

					mid = (l + r) / 2
				}

				// swap
				let temp = nums[i - 1]
				nums[i - 1] = rest[idToSwap]
				rest[idToSwap] = temp

				nums = Array(nums[0...(i - 1)]) + rest.reversed()
				return
			}
		}

		nums.reverse()
	}
}
