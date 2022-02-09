// https://leetcode.com/problems/k-diff-pairs-in-an-array/

class Solution {
	func findPairs(_ nums: [Int], _ k: Int) -> Int {
		if k == 0 {
			return findDuplicated(nums)
		}

		var set = Set<Int>()
		for num in nums {
			set.insert(num)
		}
		let sortedNums = Array(set).sorted()
		if sortedNums.count < 2 { return 0 }
		var result = 0
		for i in 0..<sortedNums.count - 1 {
			// binary search
			let target = sortedNums[i] + k
			var l = i + 1
			var r = sortedNums.count - 1
			if target < sortedNums[l] || target > sortedNums[r] {
				continue
			}
			while l <= r {
				let mid = (l + r) / 2
				let midVal = sortedNums[mid]
				if target == midVal {
					result += 1
					break
				} else if target < midVal {
					r = mid - 1
				} else if target > midVal {
					l = mid + 1
				}
			}
		}
		return result
	}

	private func findDuplicated(_ nums: [Int]) -> Int {
		var dic = Dictionary<Int, Int>()
		for num in nums {
			dic[num] = (dic[num] ?? 0) + 1
		}
		var result = 0
		for count in dic.values {
			if count > 1 {
				result += 1
			}
		}
		return result
	}
}
