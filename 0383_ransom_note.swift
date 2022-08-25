// https://leetcode.com/problems/ransom-note/

class Solution {
	func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
		var magazineDic = Dictionary<Character, Int>()

		for c in magazine {
			magazineDic[c] = magazineDic[c, default: 0] + 1
		}

		for c in ransomNote {
			if let count = magazineDic[c] {
				if count == 1 {
					magazineDic.removeValue(forKey: c)
				} else {
					magazineDic[c] = count - 1
				}
			} else {
				return false
			}
		}

		return true
	}
}
