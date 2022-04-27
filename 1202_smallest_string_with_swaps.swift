// https://leetcode.com/problems/smallest-string-with-swaps/

class Solution {
	func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
		let sArr = Array(s)
		var groups: [Group?] = Array(repeating: nil, count: sArr.count)

		for pair in pairs {
			let first = pair[0]
			let second = pair[1]

			if first == second { continue }

			if let firstGroup = groups[first] {
				if let secondGroup = groups[second] {
					if firstGroup !== secondGroup {
						if firstGroup.indexs.count >= secondGroup.indexs.count {
							firstGroup.union(secondGroup)
							for index in secondGroup.indexs {
								groups[index] = firstGroup
							}
						} else {
							secondGroup.union(firstGroup)
							for index in firstGroup.indexs {
								groups[index] = secondGroup
							}
						}
					}
				} else {
					firstGroup.indexs.insert(second)
					firstGroup.chars.append(sArr[second])
					groups[second] = firstGroup
				}
			} else {
				if let secondGroup = groups[second] {
					secondGroup.indexs.insert(first)
					secondGroup.chars.append(sArr[first])
					groups[first] = secondGroup
				} else {
					let group = Group()
					group.indexs = [first, second]
					group.chars = [sArr[first], sArr[second]]
					groups[first] = group
					groups[second] = group
				}
			}
		}

		var result = ""
		for i in 0..<sArr.count {
			if let group = groups[i] {
				let char = group.popChar()
				result.append(char)
			} else {
				result.append(sArr[i])
			}
		}

		return result
	}
}

fileprivate class Group {
	var indexs = Set<Int>()
	var chars = [Character]()
	private var charIndex = 0

	func union(_ another: Group) {
		indexs = indexs.union(another.indexs)
		chars += another.chars
	}

	func popChar() -> Character {
		if charIndex == 0 {
			chars.sort()
		}

		let char = chars[charIndex]
		charIndex += 1
		return char
	}
}
