// https://leetcode.com/problems/search-a-2d-matrix/

class Solution {
	func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
		if target < matrix.first!.first! || target > matrix.last!.last! {
			return false
		}

		var l = 0
		var r = matrix.count - 1
		while l <= r {
			let mid = (l + r) / 2
			let midVal = matrix[mid]

			if target < midVal.first! {
				r =	mid - 1
			} else if target > midVal.last! {
				l = mid + 1
			} else {
				return binary2(array: midVal, target: target)
			}
		}

		return false
	}

	private func binary2(array: [Int], target: Int) -> Bool {
		var l = 0
		var r = array.count - 1

		while l <= r {
			let mid = (l + r) / 2
			let midVal = array[mid]

			if target == midVal {
				return true
			} else if target < midVal {
				r = mid - 1
			} else {
				l = mid + 1
			}
		}

		return false
	}
}
