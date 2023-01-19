// https://leetcode.com/problems/subarray-sums-divisible-by-k/description/

class Solution {
	func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
		var array = Array(repeating: 0, count: k)
		var result = 0
		for num in nums {
			var modNum = num % k
			if modNum == 0 {
				array[0] += 1
				result += array[0]
				continue
			}
			if modNum < 0 {
				modNum = k + modNum
			}
			array = Array(array[(array.count - modNum)..<array.count] + array[0..<array.count - modNum])
			array[modNum] += 1
			result += array[0]
		}
		return result
	}
}
