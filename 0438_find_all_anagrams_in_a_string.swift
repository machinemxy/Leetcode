// https://leetcode.com/problems/find-all-anagrams-in-a-string/

class Solution {
	func findAnagrams(_ s: String, _ p: String) -> [Int] {
		let s = Array(s)
		let p = Array(p)
		guard s.count >= p.count else { return [] }
		var pDic = Dictionary<Character, Int>()
		for c in p {
			pDic[c] = (pDic[c] ?? 0) + 1
		}
		var sDic = Dictionary<Character, Int>()
		for i in 0..<p.count {
			let c = s[i]
			sDic[c] = (sDic[c] ?? 0) + 1
		}
		var result = [Int]()
		if sDic == pDic {
			result.append(0)
		}
		if s.count == p.count { return result }
		for i in 0..<(s.count - p.count) {
			if s[i] == s[i + p.count] {
				// don't need to edit sDic
			} else {
				// remove s[i] from sDic, add s[i + p.count] to sDic
				let charToRemove = s[i]
				let charToAdd = s[i + p.count]
				if let count = sDic[charToRemove] {
					if count == 1 {
						sDic.removeValue(forKey: charToRemove)
					} else {
						sDic[charToRemove] = count - 1
					}
				}
				sDic[charToAdd] = (sDic[charToAdd] ?? 0) + 1
			}

			if sDic == pDic {
				result.append(i + 1)
			}
		}

		return result
	}
}
