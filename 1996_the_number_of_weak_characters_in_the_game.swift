// https://leetcode.com/problems/the-number-of-weak-characters-in-the-game/

class Solution {
	func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
		let properties = properties.sorted { pair1, pair2 in
			if pair1[0] == pair2[0] {
				return pair1[1] >= pair2[1]
			} else {
				return pair1[0] > pair2[0]
			}
		}

		var result = 0
		var strongestPair = [Int.max, 0]
		var reservedStrongestPair = [Int.max, 0]
		var currentAttack = Int.max
		for i in 0..<properties.count {
			let pair = properties[i]
			if pair[0] == currentAttack {
				if pair[1] < strongestPair[1] {
					result += 1
				}
			} else {
				currentAttack = pair[0]
				strongestPair = reservedStrongestPair
				if pair[1] < strongestPair[1] {
					result += 1
				} else {
					reservedStrongestPair = pair
				}
			}
		}
		return result
	}
}
