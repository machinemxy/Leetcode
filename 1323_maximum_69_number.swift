// https://leetcode.com/problems/maximum-69-number/

class Solution {
	func maximum69Number (_ num: Int) -> Int {
		var array = Array(String(num))
		for i in 0..<array.count {
			if array[i] == "6" {
				array[i] = "9"
				break
			}
		}
		return Int(String(array))!
	}
}
