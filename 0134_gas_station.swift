// https://leetcode.com/problems/gas-station/submissions/

class Solution {
	private var gasChanges = [Int]()

	func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
		gasChanges = Array(repeating: 0, count: gas.count)
		var all0 = true
		for i in 0..<gasChanges.count {
			let gasChange = gas[i] - cost[i]
			if gasChange != 0 {
				all0 = false
			}
			gasChanges[i] = gasChange
		}
		if all0 { return 0 }
		let totalChange = gasChanges.reduce(0) { $0 + $1 }
		if totalChange < 0 { return -1 }

		for i in 0..<gasChanges.count {
			if gasChanges[i] > 0 {
				if isPossibleToTravel(start: i) {
					return i
				}
			}
		}

		return -1
	}

	private func isPossibleToTravel(start: Int) -> Bool {
		var gas = 0
		var position = start
		for _ in 0..<gasChanges.count {
			gas += gasChanges[position]
			if gas < 0 { return false }
			position = (position + 1) % gasChanges.count
		}
		return true
	}
}


// Better Solution
class Solution2 {
	func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
		var gasSum = 0
		var maxGasShortage = 0
		var canCompleteIfStartFrom = 0

		for i in 0..<gas.count {
			gasSum += gas[i] - cost[i]
			if gasSum < maxGasShortage {
				canCompleteIfStartFrom = (i + 1) % gas.count
				maxGasShortage = gasSum
			}
		}

		if gasSum >= 0 {
			return canCompleteIfStartFrom
		} else {
			return -1
		}
	}
}
