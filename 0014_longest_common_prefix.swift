// https://leetcode.com/problems/longest-common-prefix/

class Solution {
	func longestCommonPrefix(_ strs: [String]) -> String {
		let firstStr = strs[0]
		guard strs.count > 1 else { return firstStr }

		var matchedCount = 0
		while true {
			if matchedCount >= firstStr.count { return firstStr }
			let char = firstStr[matchedCount]
			for i in 1..<strs.count {
				let str = strs[i]
				if matchedCount >= str.count {
					return String(firstStr.prefix(matchedCount))
				} else if str[matchedCount] != char {
					return String(firstStr.prefix(matchedCount))
				}
			}
			matchedCount += 1
		}
	}
}

extension StringProtocol {
	subscript(_ offset: Int) -> Element { self[index(startIndex, offsetBy: offset)] }
}
