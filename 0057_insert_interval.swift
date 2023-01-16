// https://leetcode.com/problems/insert-interval/description/

class Solution {
	func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
		var i = 0
		var intervals = intervals
		var newInterval = newInterval
		while i < intervals.count {
			let interval = intervals[i]
			if newInterval[1] < interval[0] {
				intervals.insert(newInterval, at: i)
				return intervals
			} else if newInterval[1] <= interval[1] {
				if newInterval[0] < interval[0] {
					intervals[i][0] = newInterval[0]
				}
				return intervals
			} else {
				if newInterval[0] <= interval[0] {
					intervals.remove(at: i)
				} else if newInterval[0] <= interval[1] {
					newInterval[0] = interval[0]
					intervals.remove(at: i)
				} else {
					i += 1
				}
			}
		}
		intervals.append(newInterval)
		return intervals
	}
}
