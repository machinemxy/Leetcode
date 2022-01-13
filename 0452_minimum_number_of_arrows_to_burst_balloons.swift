// https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/

class Solution {
	func findMinArrowShots(_ points: [[Int]]) -> Int {
		let sortedPoints = points.sorted { $0[0] <= $1[0] }
		var shooted = 0
		var id = 0

		while id < sortedPoints.count {
			let first = sortedPoints[id]
			var r = first[1]
			id += 1
			shooted += 1

			// check if next can be shooted together
			while id < sortedPoints.count {
				let next = sortedPoints[id]
				if next[0] <= r {
					// can be shooted together
					r = min(r, next[1])
					id += 1
				} else {
					// cannot be shooted together
					break
				}
			}
		}

		return shooted
	}
}
