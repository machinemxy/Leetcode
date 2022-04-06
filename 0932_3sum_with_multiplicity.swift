// https://leetcode.com/problems/3sum-with-multiplicity/

class Solution {
	func threeSumMulti(_ arr: [Int], _ target: Int) -> Int {
		let modnum = 1000000007
		let maximum = max(100, target)
		var frequencyArray = Array(repeating: 0, count: maximum + 1)
		for int in arr {
			frequencyArray[int] += 1
		}

		var result = 0
		for mid in 0...maximum {
			for l in 0...mid {
				let r = target - mid - l
				if r < mid || r > maximum {
					continue
				}

				if l == r {
					let frequency = frequencyArray[mid]
					if frequency >= 3 {
						result += frequency * (frequency - 1) * (frequency - 2) / 6 % modnum
					}
				} else if l == mid {
					let frequency = frequencyArray[mid]
					if frequency >= 2 {
						result += frequencyArray[r] * frequency * (frequency - 1) / 2 % modnum
					}
				} else if mid == r {
					let frequency = frequencyArray[mid]
					if frequency >= 2 {
						result += frequencyArray[l] * frequency * (frequency - 1) / 2 % modnum
					}
				} else {
					result += frequencyArray[l] * frequencyArray[mid] * frequencyArray[r] % modnum
				}
			}
		}

		return result % modnum
	}
}
