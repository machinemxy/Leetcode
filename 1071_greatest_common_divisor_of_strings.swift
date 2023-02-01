// https://leetcode.com/problems/greatest-common-divisor-of-strings/description/

class Solution {
	func gcdOfStrings(_ str1: String, _ str2: String) -> String {
		let a1 = Array(str1)
		let a2 = Array(str2)
		let startCount = min(a1.count, a2.count)
		for substrCount in stride(from: startCount, through: 1, by: -1) {
			guard a1.count % substrCount == 0 && a2.count % substrCount == 0 else { continue }
			if check(a1: a1, a2: a2, substrCount: substrCount) {
				return String(a1[0..<substrCount])
			}
		}
		return ""
	}

	func check(a1: [Character], a2: [Character], substrCount: Int) -> Bool {
		let subArray = Array(a1[0..<substrCount])
		var subArrayId = 0
		for c in a1 {
			if c != subArray[subArrayId] {
				return false
			}
			subArrayId += 1
			if subArrayId == substrCount {
				subArrayId = 0
			}
		}
		subArrayId = 0
		for c in a2 {
			if c != subArray[subArrayId] {
				return false
			}
			subArrayId += 1
			if subArrayId == substrCount {
				subArrayId = 0
			}
		}
		return true
	}
}
