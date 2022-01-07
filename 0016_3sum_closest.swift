// https://leetcode.com/problems/3sum-closest/

class Solution {
	func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
		let sortedArray = nums.sorted()

		var result = Int.min
		var smallestDiff = Int.max

		for i in 0..<(sortedArray.count - 2) {
			let restTwoSum = getRestTwoSum(arr: sortedArray, firstIndex: i, target: target)
			let threeSum = sortedArray[i] + restTwoSum
			let diff = abs(threeSum - target)
			if diff == 0 {
				return target
			}
			if diff < smallestDiff {
				smallestDiff = diff
				result = threeSum
			}
		}

		return result
	}

	private func getRestTwoSum(arr: [Int], firstIndex: Int, target: Int) -> Int {
		let twoSumTarget = target - arr[firstIndex]
		var bestTwoSum = Int.min
		var smallestDiff = Int.max
		var l = firstIndex + 1
		var r = arr.count - 1
		while l < r {
			let twoSum = arr[l] + arr[r]
			let diff = abs(twoSum - twoSumTarget)
			if diff < smallestDiff {
				smallestDiff = diff
				bestTwoSum = twoSum
			}
			if twoSum == twoSumTarget {
				return twoSum
			} else if twoSum < twoSumTarget {
				l += 1
			} else {
				r -= 1
			}
		}

		return bestTwoSum
	}
}
