// https://leetcode.com/problems/sum-of-subarray-minimums/

class Solution {
	let modulo = 1000000007

	func sumSubarrayMins(_ arr: [Int]) -> Int {
		var sum = 0

		for i in 0..<arr.count {
			var leftCount = 1
			var leftId = i - 1
			while leftId >= 0 {
				if arr[leftId] < arr[i] { break }
				leftId -= 1
				leftCount += 1
			}

			var rightCount = 1
			var rightId = i + 1
			while rightId < arr.count {
				if arr[rightId] <= arr[i] { break }
				rightId += 1
				rightCount += 1
			}

			sum += leftCount * rightCount * arr[i] % modulo
		}

		return sum % modulo
	}
}
