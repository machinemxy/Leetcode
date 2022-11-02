// https://leetcode.com/problems/minimum-genetic-mutation/

class Solution {
	func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
		if start == end { return 0 }

		let start = Array(start)
		let end = Array(end)
		var bank = Set(bank.map { Array($0) })
		if bank.contains(start) {
			bank.remove(start)
		}
		var pool = [start]
		var steps = 1
		while !pool.isEmpty {
			let poolCount = pool.count
			for _ in 0..<poolCount {
				let current = pool.removeFirst()
				for next in bank {
					guard canChange(from: current, to: next) else { continue }
					if next == end { return steps }
					bank.remove(next)
					pool.append(next)
				}
			}
			steps += 1
		}
		return -1
	}

	func canChange(from: [Character], to: [Character]) -> Bool {
		var changed = false
		for i in 0..<from.count {
			if from[i] != to[i] {
				if !changed {
					changed = true
				} else {
					return false
				}
			}
		}
		return true
	}
}
