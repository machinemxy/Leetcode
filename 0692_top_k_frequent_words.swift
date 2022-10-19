// https://leetcode.com/problems/top-k-frequent-words/

class Solution {
	func topKFrequent(_ words: [String], _ k: Int) -> [String] {
		var dic = Dictionary<String, Int>()
		for word in words {
			dic[word] = dic[word, default: 0] + 1
		}
		var stack = [(key: String, value: Int)]()
		for pair in dic {
			var l = 0
			var r = stack.count - 1
			while l <= r {
				let mid = (l + r) / 2
				let midPair = stack[mid]
				if pair.value == midPair.value {
					if pair.key < midPair.key {
						r = mid - 1
					} else {
						l = mid + 1
					}
				} else if pair.value > midPair.value {
					r = mid - 1
				} else {
					l = mid + 1
				}
			}
			stack.insert(pair, at: l)
			if stack.count > k {
				stack.removeLast()
			}
		}
		return stack.map { $0.key }
	}
}
