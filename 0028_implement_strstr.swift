// https://leetcode.com/problems/implement-strstr/

class Solution {
	private var hayArray = [Character]()
	private var needleArray = [Character]()

	func strStr(_ haystack: String, _ needle: String) -> Int {
		guard needle != "" else { return 0 }
		hayArray = Array(haystack)
		needleArray = Array(needle)
		guard hayArray.count >= needleArray.count else { return -1 }

		for i in 0...(hayArray.count - needleArray.count) {
			if checkAt(i: i) {
				return i
			}
		}
		return -1
	}

	private func checkAt(i: Int) -> Bool {
		for j in 0..<needleArray.count {
			if hayArray[i + j] != needleArray[j] {
				return false
			}
		}
		return true
	}
}
