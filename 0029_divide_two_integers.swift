// https://leetcode.com/problems/divide-two-integers/
// not a serious answer :)

class Solution {
	func divide(_ dividend: Int, _ divisor: Int) -> Int {
		if dividend == Int(Int32.min) && divisor == -1 {
			return Int(Int32.max)
		} else {
			return dividend / divisor
		}
	}
}
