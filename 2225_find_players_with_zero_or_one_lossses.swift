// https://leetcode.com/problems/find-players-with-zero-or-one-losses/

class Solution {
	func findWinners(_ matches: [[Int]]) -> [[Int]] {
		var players = Array(repeating: -1, count: 100001)
		for match in matches {
			let winner = match[0]
			let loser = match[1]
			if players[winner] == -1 {
				players[winner] = 0
			}
			if players[loser] == -1 {
				players[loser] = 1
			} else {
				players[loser] += 1
			}
		}
		var playersNoLose = [Int]()
		var playersLose1 = [Int]()
		for i in 0..<players.count {
			if players[i] == 0 {
				playersNoLose.append(i)
			} else if players[i] == 1 {
				playersLose1.append(i)
			}
		}
		return [playersNoLose, playersLose1]
	}
}
