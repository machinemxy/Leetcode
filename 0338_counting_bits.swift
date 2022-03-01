// https://leetcode.com/problems/counting-bits/

class Solution {
	func countBits(_ n: Int) -> [Int] {
		var count = 0
		var array = [false]
		var oneCount = 0
		var result = [0]

		while count < n {
			count += 1

			var changedZeroToOne = false
			for i in 0..<array.count {
				if array[i] == false {
					array[i] = true
					oneCount += 1
					changedZeroToOne = true
					break
				} else {
					array[i] = false
					oneCount -= 1
				}
			}

			if changedZeroToOne == false {
				array.append(true)
				oneCount += 1
			}

			result.append(oneCount)
		}

		return result
	}
}
