// https://leetcode.com/problems/excel-sheet-column-number/

class Solution {
	func titleToNumber(_ columnTitle: String) -> Int {
		var sum = 0
		for char in columnTitle {
			sum *= 26
			sum += charToInt(char)
		}
		return sum
	}

	private func charToInt(_ char: Character) -> Int {
		guard let ascii = char.asciiValue else { return 0 }
		return Int(ascii) - 64
	}
}
