// https://leetcode.com/problems/find-the-difference/

class Solution {
	func findTheDifference(_ s: String, _ t: String) -> Character {
		var dic = Dictionary<Character, Int>()
		for c in s {
			dic[c] = (dic[c] ?? 0) + 1
		}
		for c in t {
			if let count = dic[c] {
				if count == 1 {
					dic.removeValue(forKey: c)
				} else {
					dic[c] = count - 1
				}
			} else {
				return c
			}
		}
		return "."
	}
}
