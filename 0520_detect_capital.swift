// https://leetcode.com/problems/detect-capital/

class Solution {
	func detectCapitalUse(_ word: String) -> Bool {
		let wordArray = Array(word)
		guard wordArray.count > 1 else { return true }
		if wordArray[0].isLowercase {
			for i in 1..<wordArray.count {
				if wordArray[i].isUppercase {
					return false
				}
			}
			return true
		} else {
			if wordArray.count == 2 {
				return true
			} else if wordArray[1].isLowercase {
				for i in 2..<wordArray.count {
					if wordArray[i].isUppercase {
						return false
					}
				}
				return true
			} else {
				for i in 2..<wordArray.count {
					if wordArray[i].isLowercase {
						return false
					}
				}
				return true
			}
		}
	}
}
