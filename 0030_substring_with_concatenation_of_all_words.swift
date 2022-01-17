// https://leetcode.com/problems/substring-with-concatenation-of-all-words/

class Solution {
	func findSubstring(_ s: String, _ words: [String]) -> [Int] {
		let wordLength = words[0].count
		let sentenceLength = wordLength * words.count
		let sa = Array(s)
		if sa.count < sentenceLength { return [] }

		var wordsDic = Dictionary<String, Int>()
		for word in words {
			wordsDic[word] = (wordsDic[word] ?? 0) + 1
		}
		let wordsArray = Array(wordsDic)
		let simplifiedWordsArray = wordsArray.map { _, value in value }

		var tempArray = [Int]()
		for i in 0...(sa.count - wordLength) {
			let subS = String(sa[i..<(i + wordLength)])
			let index = wordsArray.firstIndex { key, _ in key == subS }
			tempArray.append(index ?? -1)
		}

		var result = [Int]()
		for i in 0..<(tempArray.count - wordLength * (words.count - 1)) {
			var testArray = Array(repeating: 0, count: simplifiedWordsArray.count)
			for j in 0..<words.count {
				if tempArray[i + j * wordLength] == -1 {
					break
				} else {
					testArray[tempArray[i + j * wordLength]] += 1
				}
			}
			if testArray == simplifiedWordsArray {
				result.append(i)
			}
		}

		return result
	}
}
