// https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/description/

class Solution {
	func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
		var sumWeight = 0
		var maxWeight = 0
		for weight in weights {
			sumWeight += weight
			maxWeight = max(maxWeight, weight)
		}
		var l = maxWeight
		var r = sumWeight
		var result = Int.max
		while l <= r {
			let mid = (l + r) / 2
			if isPossible(weights: weights, days: days, capacity: mid) {
				result = mid
				r = mid - 1
			} else {
				l = mid + 1
			}
		}
		return result
	}

	func isPossible(weights: [Int], days: Int, capacity: Int) -> Bool {
		var day = 1
		var weightId = 0
		var restCapacity = capacity
		while day <= days {
			if weightId >= weights.count {
				return true
			}
			let weight = weights[weightId]
			if weight <= restCapacity {
				weightId += 1
				restCapacity -= weight
			} else {
				day += 1
				restCapacity = capacity
			}
		}
		return false
	}
}
