// https://leetcode.com/problems/minimum-time-to-make-rope-colorful/

class Solution {
	func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
		var prevColor: Character = " "
		var longestTime = 0
		var result = 0
		for (i, color) in colors.enumerated() {
			if color == prevColor {
				let time = neededTime[i]
				if time < longestTime {
					result += time
				} else {
					result += longestTime
					longestTime = time
				}
			} else {
				prevColor = color
				longestTime = neededTime[i]
			}
		}
		return result
	}
}
