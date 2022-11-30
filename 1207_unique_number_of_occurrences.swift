// https://leetcode.com/problems/unique-number-of-occurrences/

class Solution {
	func uniqueOccurrences(_ arr: [Int]) -> Bool {
		var dic = [Int: Int]()
		for num in arr {
			dic[num, default: 0] += 1
		}
		return dic.count == Set(dic.values).count
	}
}
