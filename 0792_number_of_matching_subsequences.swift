// https://leetcode.com/problems/number-of-matching-subsequences/

class Solution {
	func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
		let rootNode = Node()
		for word in words {
			var node = rootNode
			for char in word {
				if let nextNode = node.nexts[char] {
					node = nextNode
				} else {
					let newNode = Node()
					node.nexts[char] = newNode
					node = newNode
				}
			}
			node.count += 1
		}

		var nodes = [rootNode]
		var result = rootNode.count
		for c in s {
			for i in stride(from: nodes.count - 1, through: 0, by: -1) {
				let node = nodes[i]
				if let nextNode = node.nexts[c] {
					result += nextNode.count
					node.nexts.removeValue(forKey: c)
					if node.nexts.isEmpty {
						nodes.remove(at: i)
					}
					if !nextNode.nexts.isEmpty {
						nodes.append(nextNode)
					}
				}
			}
		}

		return result
	}
}

fileprivate class Node {
	var count = 0
	var nexts = Dictionary<Character, Node>()
}
