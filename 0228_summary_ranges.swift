// https://leetcode.com/problems/summary-ranges/

class Solution {
	func summaryRanges(_ nums: [Int]) -> [String] {
		if nums.count == 0 { return [] }

		var result = [String]()
		var start: Int?
		var end: Int?

		for num in nums {
			if start == nil {
				start = num
				end = num
			} else if num == end! + 1 {
				end = num
			} else if start! == end! {
				result.append("\(start!)")
				start = num
				end = num
			} else {
				let str = "\(start!)->\(end!)"
				result.append(str)
				start = num
				end = num
			}
		}

		if start! == end! {
			result.append("\(start!)")
		} else {
			let str = "\(start!)->\(end!)"
			result.append(str)
		}


		return result
	}
}
