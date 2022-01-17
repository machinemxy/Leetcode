// https://leetcode.com/problems/word-pattern/

class Solution {
	func wordPattern(_ pattern: String, _ s: String) -> Bool {
		let patternArray = Array(pattern)
		let sArray = s.split(separator: " ")

		guard patternArray.count == sArray.count else { return false }
		var dic = Dictionary<Character, String>()
		var set = Set<String>()

		for i in 0..<patternArray.count {
			let p = patternArray[i]
			let str = String(sArray[i])
			if dic.keys.contains(p) {
				if dic[p] != str { return false }
			} else {
				if set.contains(str) { return false }
				set.insert(str)
				dic[p] = str
			}
		}

		return true
	}
}
