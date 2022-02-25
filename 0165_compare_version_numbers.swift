// https://leetcode.com/problems/compare-version-numbers/

class Solution {
	func compareVersion(_ version1: String, _ version2: String) -> Int {
		let versions1 = version1.split(separator: ".")
		let versions2 = version2.split(separator: ".")
		let count1 = versions1.count
		let count2 = versions2.count
		let largerCount = max(count1, count2)

		for i in 0..<largerCount {
			let subVersion1: Int
			let subVersion2: Int

			if i < count1 {
				subVersion1 = Int(versions1[i]) ?? 0
			} else {
				subVersion1 = 0
			}

			if i < count2 {
				subVersion2 = Int(versions2[i]) ?? 0
			} else {
				subVersion2 = 0
			}

			if subVersion1 > subVersion2 {
				return 1
			} else if subVersion1 < subVersion2 {
				return -1
			}
		}

		return 0
	}
}
