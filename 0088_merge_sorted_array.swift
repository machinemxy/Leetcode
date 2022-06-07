// https://leetcode.com/problems/merge-sorted-array/

class Solution {
	func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
		let uselessNumCount = nums1.count - m
		nums1.removeLast(uselessNumCount)

		var index1 = 0
		var index2 = 0

		while true {
			if index2 >= nums2.count {
				break
			} else if index1 >= nums1.count {
				nums1.append(nums2[index2])
				index2 += 1
			} else if nums1[index1] <= nums2[index2] {
				index1 += 1
			} else {
				nums1.insert(nums2[index2], at: index1)
				index1 += 1
				index2 += 1
			}
		}
	}
}
