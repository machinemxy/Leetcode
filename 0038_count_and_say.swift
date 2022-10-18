// https://leetcode.com/problems/count-and-say/

class Solution {
	func countAndSay(_ n: Int) -> String {
		if n == 1 { return "1" }
		var s = "1"
		var i = 2
		while true {
			var newS = ""
			var count = 0
			var prevC: Character = "0"
			for c in s {
				if c != prevC {
					if count != 0 {
						newS += String(count)
						newS.append(prevC)
					}
					prevC = c
					count = 1
				} else {
					count += 1
				}
			}
			newS += String(count)
			newS.append(prevC)

			if i == n {
				return newS
			} else {
				i += 1
				s = newS
			}
		}
	}
}
