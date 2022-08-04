// https://leetcode.com/problems/mirror-reflection/

class Solution {
	func mirrorReflection(_ p: Int, _ q: Int) -> Int {
		var verticalDistance = 0
		for i in 1...Int.max {
			verticalDistance += q
			if verticalDistance % p == 0 {
				if i % 2 == 0 {
					return 2
				} else if verticalDistance / p % 2 == 0 {
					return 0
				} else {
					return 1
				}
			}
		}
		return 0 // won't really reach here
	}
}
