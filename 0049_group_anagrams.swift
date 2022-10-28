// https://leetcode.com/problems/group-anagrams/

class Solution {
	func groupAnagrams(_ strs: [String]) -> [[String]] {
		var dic = Dictionary<String, [Int]>()
		for (i, str) in strs.enumerated() {
			let sortedStr = String(str.sorted())
			if var arr = dic[sortedStr] {
				arr.append(i)
				dic[sortedStr] = arr
			} else {
				dic[sortedStr] = [i]
			}
		}

		var result = [[String]]()
		for arr in dic.values {
			var subArray = [String]()
			for i in arr {
				subArray.append(strs[i])
			}
			result.append(subArray)
		}
		return result
	}
}
