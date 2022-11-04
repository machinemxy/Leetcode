// https://leetcode.com/problems/reverse-vowels-of-a-string/

class Solution {
	let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
	let placeholder: Character = "あ" // the placeholder need to be out of ASCII characters

	func reverseVowels(_ s: String) -> String {
		var a = Array(s)
		var stack = [Character]()
		for (i, c) in a.enumerated() {
			if vowels.contains(c) {
				// append the vowel into an array, then set a[i] as a placeholder
				stack.append(c)
				a[i] = placeholder
			}
		}
		for (i, c) in a.enumerated() {
			if c == placeholder {
				// remove the last vowel of the array, and replace the placeholder to it
				a[i] = stack.removeLast()
			}
		}
		return String(a)
	}
}
