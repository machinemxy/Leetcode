// https://leetcode.com/problems/min-cost-to-connect-all-points/

class Solution {
	func minCostConnectPoints(_ points: [[Int]]) -> Int {
		guard points.count > 1 else { return 0 }

		var lines = [Line]()
		for i in 0..<(points.count - 1) {
			let iPoint = points[i]
			for j in (i + 1)..<points.count {
				let jPoint = points[j]
				let length = abs(iPoint[0] - jPoint[0]) + abs(iPoint[1] - jPoint[1])
				lines.append(Line(start: i, end: j, length: length))
			}
		}

		lines.sort { l, r in
			l.length <= r.length
		}

		var groups = [Set<Int>]()
		for i in 0..<points.count {
			let set: Set<Int> = [i]
			groups.append(set)
		}

		var result = 0
		var linesIndex = 0

		while groups.count > 1 {
			let line = lines[linesIndex]

			outerLoop: for i in 0..<groups.count {
				if groups[i].contains(line.start) {
					if groups[i].contains(line.end) {
						// they already in the same group, no need to add it
						break outerLoop
					}

					for j in 0..<groups.count {
						if groups[j].contains(line.end) {
							groups[i] = groups[i].union(groups[j])
							groups.remove(at: j)
							result += line.length
							break outerLoop
						}
					}
				}
			}

			linesIndex += 1
		}

		return result
	}
}

fileprivate struct Line {
	let start: Int
	let end: Int
	let length: Int
}
