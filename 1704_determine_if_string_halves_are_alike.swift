// https://leetcode.com/problems/determine-if-string-halves-are-alike/

class Solution {
	func halvesAreAlike(_ s: String) -> Bool {
		let array = Array(s)
		let halfCount = array.count / 2
		var firstHalfVowels = 0
		var secondHalfVowels = 0
		let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
		for i in 0..<halfCount {
			if vowels.contains(array[i]) {
				firstHalfVowels += 1
			}
		}
		for i in halfCount..<array.count {
			if vowels.contains(array[i]) {
				secondHalfVowels += 1
			}
		}
		return firstHalfVowels == secondHalfVowels
	}
}
