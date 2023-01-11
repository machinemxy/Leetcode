// https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/description/

class Solution {
	var dic = [Int: Set<Int>]()
	var hasApple = [Bool]()
	var visited = [Bool]()
	var result = 0

	func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
		for edge in edges {
			dic[edge[0], default: []].insert(edge[1])
			dic[edge[1], default: []].insert(edge[0])
		}
		self.hasApple = hasApple
		visited = Array(repeating: false, count: n)
		hasAppleInBranch(i: 0)
		return result
	}

	func hasAppleInBranch(i: Int) -> Bool {
		visited[i] = true
		var has = hasApple[i]
		let set = dic[i, default: []]
		for next in set where !visited[next] {
			if hasAppleInBranch(i: next) {
				has = true
			}
		}
		if has && i != 0 {
			result += 2
		}
		return has
	}
}
