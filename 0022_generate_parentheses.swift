// https://leetcode.com/problems/generate-parentheses/

class Solution {
	func generateParenthesis(_ n: Int) -> [String] {
		var memo = Array(repeating: [String](), count: n + 1)

		for i in 0...n {
			if i == 0 {
				memo[i] = [""]
				continue
			} else if i == 1 {
				memo[i] = ["()"]
				continue
			}

			var solution = [String]()
			for j in 0...(i - 1) {
				let insideBraceSolutions = memo[j]
				let outsideBraceSolutions = memo[i - 1 - j]
				for insideBraceSolution in insideBraceSolutions {
					let addBraceForInsideBraceSolution = "(" + insideBraceSolution + ")"
					solution += outsideBraceSolutions.map({ addBraceForInsideBraceSolution + $0 })
				}
			}
			memo[i] = solution
		}

		return memo[n]
	}
}
