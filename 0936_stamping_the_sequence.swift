// https://leetcode.com/problems/stamping-the-sequence/

class Solution {
	var stampArr = [Character]()
	var targetArr = [Character]()
	var result = [Int]()

	func movesToStamp(_ stamp: String, _ target: String) -> [Int] {
		stampArr = Array(stamp)
		targetArr = Array(target)

		while !isAllQuestionMark(startIndex: 0, length: targetArr.count) {
			if result.count > targetArr.count * 10 {
				return []
			}

			var found = false
			for i in 0...(targetArr.count - stampArr.count) {
				if isAllQuestionMark(startIndex: i, length: stampArr.count) { continue }

				if isStamp(startIndex: i) {
					changeWordToQuestionMark(startIndex: i)
					result.insert(i, at: 0)
					found = true
					break
				}
			}
			if !found {
				return []
			}
		}

		return result
	}

	func isAllQuestionMark(startIndex: Int, length: Int) -> Bool {
		for i in 0..<length {
			if targetArr[startIndex + i] != "?" {
				return false
			}
		}
		return true
	}

	func isStamp(startIndex: Int) -> Bool {
		for i in 0..<stampArr.count {
			if targetArr[startIndex + i] == "?" { continue }

			if targetArr[startIndex + i] != stampArr[i] {
				return false
			}
		}

		return true
	}

	func changeWordToQuestionMark(startIndex: Int) {
		for i in 0..<stampArr.count {
			targetArr[startIndex + i] = "?"
		}
	}
}
