// https://leetcode.com/problems/valid-mountain-array/

class Solution {
	func validMountainArray(_ arr: [Int]) -> Bool {
		guard arr.count >= 3 else { return false }

		var increasing = true
		var increased = false
		for i in 1..<arr.count {
			if increasing {
				if arr[i] == arr[i - 1] {
					return false
				} else if arr[i] > arr[i - 1] {
					increased = true
				} else {
					if increased {
						increasing = false
					} else {
						return false
					}
				}
			} else {
				if arr[i] >= arr[i - 1] {
					return false
				}
			}
		}

		if increasing == false && increased == true {
			return true
		} else {
			return false
		}
	}
}
