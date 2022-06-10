class Solution {
	func lengthOfLongestSubstring(_ s: String) -> Int {
		guard !s.isEmpty else { return 0 }

		let arr = Array(s)
		var l = 0
		var r = 1
		var set: Set<Character> = [arr[l]]
		var result = 1

		while r < arr.count {
			let newChar = arr[r]
			if set.contains(newChar) {
				while true {
					if arr[l] == newChar {
						l += 1
						break
					} else {
						set.remove(arr[l])
						l += 1
					}
				}
			} else {
				set.insert(newChar)
				result = max(result, r - l + 1)
			}

			r += 1
		}

		return result
	}
}
