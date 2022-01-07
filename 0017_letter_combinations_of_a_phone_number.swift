// https://leetcode.com/problems/letter-combinations-of-a-phone-number/

class Solution {
	func letterCombinations(_ digits: String) -> [String] {
		let arrDigits = Array(digits)
		if arrDigits.count == 0 { return [] }
		return possibleStrings(arrDigits: arrDigits)
	}

	private func possibleStrings(arrDigits: [Character]) -> [String] {
		if arrDigits.count == 1 {
			return charToStrings(arrDigits[0])
		}

		var newArrDigits = arrDigits
		let first = newArrDigits.removeFirst()
		var result = [String]()
		let firstStrings = charToStrings(first)
		for firstString in firstStrings {
			let restStrings = possibleStrings(arrDigits: newArrDigits)
			for restString in restStrings {
				result.append(firstString + restString)
			}
		}

		return result
	}

	private func charToStrings(_ c: Character) -> [String] {
		switch c {
			case "2":
				return ["a","b","c"]
			case "3":
				return ["d","e","f"]
			case "4":
				return ["g","h","i"]
			case "5":
				return ["j","k","l"]
			case "6":
				return ["m","n","o"]
			case "7":
				return ["p","q","r","s"]
			case "8":
				return ["t","u","v"]
			default:
				return ["w","x","y","z"]
		}
	}
}
