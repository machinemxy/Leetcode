// https://leetcode.com/problems/check-if-a-string-contains-all-binary-codes-of-size-k/

class Solution {
	func hasAllCodes(_ s: String, _ k: Int) -> Bool {
		let arr = Array(s)
		if arr.count < k { return false }
		var set = Set<String>()

		for i in 0...(arr.count - k) {
			var str = ""
			for j in i..<(i + k) {
				str.append(arr[j])
			}
			set.insert(str)
		}

		return set.count == pow(k)
	}

	private func pow(_ k: Int) -> Int
	{
		var result = 1
		for _ in 1...k {
			result *= 2
		}
		return result
	}
}
