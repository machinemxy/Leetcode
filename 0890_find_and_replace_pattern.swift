// https://leetcode.com/problems/find-and-replace-pattern/

class Solution {
	func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
		var result = [String]()

		for word in words {
			if check(word: word, pattern: pattern) {
				result.append(word)
			}
		}

		return result
	}

	private func check(word: String, pattern: String) -> Bool {
		let wordArray = Array(word)
		let patternArray = Array(pattern)
		var mappingDic = Dictionary<Character, Character>()
		var mappedChars = Set<Character>()

		for i in 0..<wordArray.count {
			let wordChar = wordArray[i]
			let patternChar = patternArray[i]

			if let expectedPatternChar = mappingDic[wordChar] {
				if expectedPatternChar != patternChar {
					return false
				}
			} else {
				if mappedChars.contains(patternChar) {
					return false
				} else {
					mappingDic[wordChar] = patternChar
					mappedChars.insert(patternChar)
				}
			}
		}

		return true
	}
}
