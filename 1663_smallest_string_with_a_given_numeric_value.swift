class Solution {
	func getSmallestString(_ n: Int, _ k: Int) -> String {
		var target = k - n
		var array: [Character] = Array(repeating: "a", count: n)
		var index = n - 1

		while target > 25 {
			array[index] = "z"
			target -= 25
			index -= 1
		}

		array[index] = intToChar(int: target)

		return String(array)
	}

	private func intToChar(int: Int) -> Character {
		return Character(UnicodeScalar(int + 97)!)
	}
}
