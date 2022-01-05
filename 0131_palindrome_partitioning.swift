// https://leetcode.com/problems/palindrome-partitioning/

class Solution {
	func partition(_ s: String) -> [[String]] {
		if s.count <= 1 {
			return [[s]]
		}

		var result = [[String]]()
		for firstPartLength in 1...(s.count) {
			let firstPart = String(s.prefix(firstPartLength))
			if isPartitioning(firstPart) {
				let secondPartLength = s.count - firstPartLength
				if secondPartLength == 0 {
					result.append([firstPart])
				} else {
					let secondPart = String(s.suffix(s.count - firstPartLength))
					let secondPartResult = partition(secondPart)
					let combinedResult = secondPartResult.map { array -> [String] in
						var temp = array
						temp.insert(firstPart, at: 0)
						return temp
					}
					result.append(contentsOf: combinedResult)
				}
			}
		}

		return result
	}

	private func isPartitioning(_ s: String) -> Bool {
		var l = 0
		var r = s.count - 1
		while l < r {
			if s[l] != s[r] {
				return false
			}
			l += 1
			r -= 1
		}
		return true
	}
}

extension StringProtocol {
	subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
}
