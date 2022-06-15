// https://leetcode.com/problems/longest-string-chain/

class Solution {
	func longestStrChain(_ words: [String]) -> Int {
		let array = words.map { Array($0) }.sorted { $0.count <= $1.count }
		var dic = Dictionary<[Character], Int>()
		var result = 1

		for word in array {
			var record = 1
			for i in 0..<word.count {
				var prev = word
				prev.remove(at: i)
				let length = (dic[prev] ?? 0) + 1
				record = max(record, length)
			}
			dic[word] = record
			result = max(result, record)
		}

		return result
	}
}
