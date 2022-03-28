// https://leetcode.com/problems/search-in-rotated-sorted-array-ii/

class Solution {
	func search(_ nums: [Int], _ target: Int) -> Bool {
		var distinctNums = [Int]()
		var previous = Int.min
		for num in nums {
			if num == previous { continue }
			distinctNums.append(num)
			previous = num
		}
		while distinctNums.count >= 2 && distinctNums.first! == distinctNums.last! {
			distinctNums.removeLast()
		}

		var l = 0
		var r = distinctNums.count - 1

		while l <= r {
			let mid = (l + r) / 2

			if distinctNums[mid] == target {
				return true
			} else if target < distinctNums[mid] {
				if distinctNums[l] > distinctNums[mid] {
					r = mid - 1
				} else {
					if target >= distinctNums[l] {
						r = mid - 1
					} else {
						l = mid + 1
					}
				}
			} else {
				if distinctNums[r] < distinctNums[mid] {
					l = mid + 1
				} else {
					if target <= distinctNums[r] {
						l = mid + 1
					} else {
						r = mid - 1
					}
				}
			}
		}

		return false
	}
}
