// https://leetcode.com/problems/add-to-array-form-of-integer/description/

class Solution {
	func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
		let num1r = Array(num.reversed())
		let num2r = intToReversedArray(k)
		var plusOne = false
		var result = [Int]()
		for i in 0..<max(num1r.count, num2r.count) {
			var v1 = 0
			var v2 = 0
			if i < num1r.count {
				v1 = num1r[i]
			}
			if i < num2r.count {
				v2 = num2r[i]
			}
			var vSum = v1 + v2 + (plusOne ? 1 : 0)
			if vSum >= 10 {
				vSum -= 10
				plusOne = true
			} else {
				plusOne = false
			}
			result.append(vSum)
		}
		if plusOne {
			result.append(1)
		}
		return result.reversed()
	}

	func intToReversedArray(_ int: Int) -> [Int] {
		String(int).map({
			Int(String($0))!
		}).reversed()
	}
}
