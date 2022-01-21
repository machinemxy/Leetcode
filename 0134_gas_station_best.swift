// https://leetcode.com/problems/gas-station/submissions/

class Solution {
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
