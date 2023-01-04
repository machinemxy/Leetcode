// https://leetcode.com/problems/minimum-rounds-to-complete-all-tasks/description/

class Solution {
	func minimumRounds(_ tasks: [Int]) -> Int {
		var dic = [Int: Int]()
		for task in tasks {
			dic[task, default: 0] += 1
		}
		var result = 0
		for count in dic.values {
			if count == 1 {
				return -1
			} else {
				result += calcRounds(taskCount: count)
			}
		}
		return result
	}

	func calcRounds(taskCount: Int) -> Int {
		if taskCount % 3 == 0 {
			return taskCount / 3
		} else {
			return taskCount / 3 + 1
		}
	}
}
