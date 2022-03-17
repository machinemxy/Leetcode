// https://leetcode.com/problems/score-of-parentheses/

class Solution {
	private var chars = [Character]()
	func scoreOfParentheses(_ s: String) -> Int {
		let s = "(" + s + ")"
		chars = Array(s)
		let result = Parenthese()
		_ = addSons(to: result, i: 1)
		return result.score / 2
	}

	private func addSons(to parent: Parenthese, i: Int) -> Int {
		var i = i
		while chars[i] == "(" {
			let son = Parenthese()
			parent.sons.append(son)
			i = addSons(to: son, i: i + 1)
		}
		return i + 1
	}
}

class Parenthese {
	init() { }
	var sons = [Parenthese]()
	var score: Int {
		if sons.count == 0 {
			return 1
		} else {
			let sonsScore = sons.reduce(0) { $0 + $1.score }
			return sonsScore * 2
		}
	}
}
