// https://leetcode.com/problems/utf-8-validation/

class Solution {
	func validUtf8(_ data: [Int]) -> Bool {
		let binaryArrays = data.map { $0.toBinaryArray() }
		var i = 0
		while i < binaryArrays.count {
			let binaryArray = binaryArrays[i]
			if binaryArray[0] == false {
				i += 1
				continue
			}
			var followingCount = 0
			for j in 1...7 {
				if binaryArray[j] == true {
					followingCount += 1
				} else {
					break
				}
			}
			if followingCount == 0 || followingCount > 3 || i + followingCount >= binaryArrays.count {
				return false
			}
			for j in 1...followingCount {
				let binaryArray = binaryArrays[i + j]
				if binaryArray[0] == true && binaryArray[1] == false {
					continue
				}
				return false
			}
			i = i + followingCount + 1
		}
		return true
	}
}

extension Int {
	func toBinaryArray() -> [Bool] {
		var number = self
		var divider = 128
		var result = Array(repeating: false, count: 8)
		for digit in 0..<8 {
			if number >= divider {
				result[digit] = true
				number -= divider
			}
			divider /= 2
		}
		return result
	}
}
