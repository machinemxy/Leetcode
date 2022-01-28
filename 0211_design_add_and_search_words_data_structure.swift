// https://leetcode.com/problems/design-add-and-search-words-data-structure/

class WordDictionary {
	private class WordNode {
		var dic = Dictionary<Character, WordNode>()
	}

	private var wordRoot: WordNode

	init() {
		wordRoot = WordNode()
	}

	func addWord(_ word: String) {
		let word = word + "/"
		var node = wordRoot
		for char in word {
			if let next = node.dic[char] {
				node = next
			} else {
				let next = WordNode()
				node.dic[char] = next
				node = next
			}
		}
	}

	func search(_ word: String) -> Bool {
		let word = word + "/"
		var nodes = [wordRoot]

		for char in word {
			var newNodes = [WordNode]()
			if char == "." {
				for node in nodes {
					for value in node.dic.values {
						newNodes.append(value)
					}
				}
			} else {
				for node in nodes {
					if let next = node.dic[char] {
						newNodes.append(next)
					}
				}
			}

			if newNodes.count == 0 { return false }
			nodes = newNodes
		}

		return true
	}
}
