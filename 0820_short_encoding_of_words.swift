// https://leetcode.com/problems/short-encoding-of-words/

class Solution {
	func minimumLengthEncoding(_ words: [String]) -> Int {
		let sortedWords = words.sorted(by: { $0.count >= $1.count }).map({ String($0.reversed()) })
		var result = 0
		let rootNode = Node()

		for word in sortedWords {
			var currentNode = rootNode
			var isWordExisted = true

			for char in word {
				if let nextNode = currentNode.next[char] {
					currentNode = nextNode
				} else {
					if isWordExisted {
						isWordExisted = false
					}

					let nextNode = Node()
					currentNode.next[char] = nextNode
					currentNode = nextNode
				}
			}

			if !isWordExisted {
				result += (word.count + 1)
			}
		}

		return result
	}
}

fileprivate class Node {
	var next = Dictionary<Character, Node>()
}
