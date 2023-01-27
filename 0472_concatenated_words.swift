// https://leetcode.com/problems/concatenated-words/description/

class Solution {
	var result = [String]()
	var rootNode = Node()

	func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
		guard words.count > 1 else { return [] }
		let sortedWords = words.map { Array($0) }.sorted { $0.count <= $1.count }
		for word in sortedWords {
			let checkResult = checkWord(word: word, startIndex: 0)
			if checkResult {
				result.append(String(word))
			} else {
				addWordToNode(word: word)
			}
		}
		return result
	}

	func addWordToNode(word: [Character]) {
		var node = rootNode
		for c in word {
			if let next = node.nexts[c] {
				node = next
			} else {
				let newNode = Node()
				node.nexts[c] = newNode
				node = newNode
			}
		}
		let newNode = Node()
		node.nexts["."] = newNode
	}

	func checkWord(word: [Character], startIndex: Int) -> Bool {
		var index = startIndex
		var node = rootNode
		while index < word.count {
			let c = word[index]
			if let nextNode = node.nexts[c] {
				index += 1
				node = nextNode
			} else {
				return false
			}

			if node.nexts.keys.contains(".") {
				if index == word.count {
					return true
				}
				let subStrResult = checkWord(word: word, startIndex: index)
				if subStrResult == true {
					return true
				}
			}
		}
		return false
	}
}

class Node {
	var nexts = [Character: Node]()
	init() {}
}
