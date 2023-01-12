// https://leetcode.com/problems/number-of-nodes-in-the-sub-tree-with-the-same-label/description/

class Solution {
	var dic = [Int: Set<Int>]()
	var labels = [Character]()
	var visited = [Bool]()
	var result = [Int]()

	func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
		for edge in edges {
			dic[edge[0], default: []].insert(edge[1])
			dic[edge[1], default: []].insert(edge[0])
		}
		self.labels = Array(labels)
		visited = Array(repeating: false, count: n)
		result = Array(repeating: 0, count: n)
		check(i: 0)
		return result
	}

	func check(i: Int) -> [Character: Int] {
		visited[i] = true
		var returnDic = [Character: Int]()
		returnDic[labels[i]] = 1
		let set = dic[i, default: []]
		for son in set where !visited[son] {
			let sonDic = check(i: son)
			for (k, v) in sonDic {
				returnDic[k, default: 0] += v
			}
		}
		result[i] = returnDic[labels[i], default: 0]
		return returnDic
	}
}
