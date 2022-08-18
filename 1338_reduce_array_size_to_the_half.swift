// https://leetcode.com/problems/reduce-array-size-to-the-half/

class Solution {
	func minSetSize(_ arr: [Int]) -> Int {
		var dic = Dictionary<Int, Int>()
		for num in arr {
			dic[num] = dic[num, default: 0] + 1
		}
		let frequencies = dic.values.sorted(by: >)
		var rest = arr.count / 2
		var index = 0
		while rest > 0 {
			rest -= frequencies[index]
			index += 1
		}
		return index
	}
}
