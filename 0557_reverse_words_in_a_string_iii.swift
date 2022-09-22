// https://leetcode.com/problems/reverse-words-in-a-string-iii/

class Solution {
	func reverseWords(_ s: String) -> String {
		s.components(separatedBy: " ").map { String($0.reversed()) }.joined(separator: " ")
	}
}
