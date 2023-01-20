// https://leetcode.com/problems/non-decreasing-subsequences/description/

class Solution {
	func findSubsequences(_ nums: [Int]) -> [[Int]] {
		var dic = [Int: Set<[Int]>]()
		for num in nums {
			var currentSet = dic[num, default: []]
			for (k, v) in dic where k <= num {
				for array in v {
					var newArray = array
					newArray.append(num)
					currentSet.insert(newArray)
				}
				currentSet.insert([k, num])
			}
			dic[num] = currentSet
		}
		var result = [[Int]]()
		for (_, v) in dic {
			for array in v {
				result.append(array)
			}
		}
		return result
	}
}
