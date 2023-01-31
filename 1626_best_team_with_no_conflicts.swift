// https://leetcode.com/problems/best-team-with-no-conflicts/description/

class Solution {
	func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
		var players = scores.enumerated().map { (i, score) in
			Player(score: score, age: ages[i])
		}.sorted { p1, p2 in
			if p1.age == p2.age {
				return p1.score <= p2.score
			} else {
				return p1.age < p2.age
			}
		}
		var dp = Array(repeating: 0, count: players.count)
		for i in 0..<players.count {
			var sum = players[i].score
			for j in 0..<i {
				if players[j].score <= players[i].score {
					sum = max(sum, dp[j] + players[i].score)
				}
			}
			dp[i] = sum
		}
		return dp.reduce(0, max)
	}
}

struct Player {
	let score: Int
	let age: Int
}
