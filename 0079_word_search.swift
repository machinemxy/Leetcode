// https://leetcode.com/problems/word-search/

class Solution {
	let visitedPlaceholder: Character = "@"
	var rowCount = 0
	var colCount = 0

	func exist(_ board: [[Character]], _ word: String) -> Bool {
		rowCount = board.count
		colCount = board.first!.count
		var restWord = word
		let letter = restWord.removeFirst()
		for y in 0..<rowCount {
			for x in 0..<colCount {
				if board[y][x] == letter {
					let result = check(board: board, word: restWord, position: [y, x])
					if result {
						return true
					}
				}
			}
		}
		return false
	}

	func check(board: [[Character]], word: String, position: [Int]) -> Bool {
		guard !word.isEmpty else { return true }
		var restWord = word
		let letter = restWord.removeFirst()
		let y = position[0]
		let x = position[1]
		var newBoard = board
		newBoard[y][x] = visitedPlaceholder
		if y - 1 >= 0 && newBoard[y - 1][x] == letter {
			let result = check(board: newBoard, word: restWord, position: [y - 1, x])
			if result {
				return true
			}
		}
		if y + 1 < rowCount && newBoard[y + 1][x] == letter {
			let result = check(board: newBoard, word: restWord, position: [y + 1, x])
			if result {
				return true
			}
		}
		if x - 1 >= 0 && newBoard[y][x - 1] == letter {
			let result = check(board: newBoard, word: restWord, position: [y, x - 1])
			if result {
				return true
			}
		}
		if x + 1 < colCount && newBoard[y][x + 1] == letter {
			let result = check(board: newBoard, word: restWord, position: [y, x + 1])
			if result {
				return true
			}
		}
		return false
	}
}
