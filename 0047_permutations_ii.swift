// https://leetcode.com/problems/permutations-ii/

class Solution {
	func permuteUnique(_ nums: [Int]) -> [[Int]] {
		if nums.count == 1 { return [[nums.first!]] }

		var set = Set<[Int]>()
		set.insert([nums.first!])

		for i in 1..<nums.count {
			let num = nums[i]
			var newSet = Set<[Int]>()

			for array in set {
				for j in 0...array.count {
					var newArray = array
					newArray.insert(num, at: j)
					newSet.insert(newArray)
				}
			}

			set = newSet
		}

		return Array(set)
	}
}
