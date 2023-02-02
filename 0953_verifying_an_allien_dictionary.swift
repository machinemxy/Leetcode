// https://leetcode.com/problems/verifying-an-alien-dictionary/description/

class Solution {
	func isAlienSorted(_ words: [String], _ order: String) -> Bool {
		guard words.count > 1 else { return true }

		let humanOrder = Array("abcdefghijklmnopqrstuvwxyz")
		var convertDic = [Character: Character]()
		var orderId = 0
		for c in order {
			convertDic[c] = humanOrder[orderId]
			orderId += 1
		}

		let humanWords = words.map { word in
			String(word.map({ c in convertDic[c]! }))
		}
		for i in 0..<(humanWords.count - 1) {
			let word1 = humanWords[i]
			let word2 = humanWords[i + 1]
			if word1 > word2 {
				return false
			}
		}
		return true
	}
}
