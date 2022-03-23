// https://leetcode.com/problems/broken-calculator/submissions/

class Solution {
	func brokenCalc(_ startValue: Int, _ target: Int) -> Int {
		var steps = 0
		var startValue = startValue
		var target = target
		while startValue != target {
			if target > startValue {
				if target % 2 == 0 {
					target /= 2
          steps += 1
				} else {
					target = (target + 1) / 2
          steps += 2
				}
			} else {
				startValue -= 1
        steps += 1
			}
		}
		return steps
	}
}
