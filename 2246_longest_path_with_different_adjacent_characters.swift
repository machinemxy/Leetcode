// https://leetcode.com/problems/longest-path-with-different-adjacent-characters/description/

class Solution {
	var result = 0

	func longestPath(_ parent: [Int], _ s: String) -> Int {
		guard parent.count > 1 else { return 1 }

		let a = Array(s)
		var nodes = [Node]()
		for c in a {
			nodes.append(Node(val: c))
		}
		for i in 1..<parent.count {
			nodes[parent[i]].nexts.append(nodes[i])
		}
		check(node: nodes[0])
		return result
	}

	func check(node: Node) -> Int {
		var first2 = [0, 0]
		for next in node.nexts {
			let length = check(node: next)
			if next.val != node.val {
				if length > first2[0] {
					first2[1] = first2[0]
					first2[0] = length
				} else if length > first2[1] {
					first2[1] = length
				}
			}
		}
		result = max(result, first2[0] + first2[1] + 1)
		return first2[0] + 1
	}
}

class Node {
	let val: Character
	var nexts: [Node]

	init(val: Character) {
		self.val = val
		self.nexts = []
	}
}
