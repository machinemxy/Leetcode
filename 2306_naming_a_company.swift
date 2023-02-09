https://leetcode.com/problems/naming-a-company/description/

class Solution {
	func distinctNames(_ ideas: [String]) -> Int {
		let alphabets = Array("abcdefghijklmnopqrstuvwxyz")
		var charToIndexMap = [Character: Int]()
		for (i, c) in alphabets.enumerated() {
			charToIndexMap[c] = i
		}
		let dpRow = Array(repeating: 0, count: 26)
		var dp = Array(repeating: dpRow, count: 26)
		let ideasSet = Set(ideas)
		for idea in ideas {
			var idea = idea
			let originalFirstChar = idea.removeFirst()
			let originalFirstCharIndex = charToIndexMap[originalFirstChar]!
			for i in 0...25 where i != originalFirstCharIndex {
				let newWord = String(alphabets[i]) + idea
				if !ideasSet.contains(newWord) {
					dp[originalFirstCharIndex][i] += 1
				}
			}
		}
		var result = 0
		for i in 0...24 {
			for j in (i + 1)...25 {
				result += dp[i][j] * dp[j][i] * 2
			}
		}
		return result
	}
}
