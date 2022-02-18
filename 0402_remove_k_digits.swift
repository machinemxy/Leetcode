// https://leetcode.com/problems/remove-k-digits/

class Solution {
	func removeKdigits(_ num: String, _ k: Int) -> String {
		let chars = Array(num)
		return removeKdigits(chars, k)
	}

	private func removeKdigits(_ chars: [Character], _ k: Int) -> String {
		var chars = chars
		var k = k
		var i = 0

		while chars.count > 0 && k > 0 {
			if i + 1 == chars.count || chars[i] > chars[i + 1] {
				chars.remove(at: i)
				k -= 1
				// remove leading zero
				if i == 0 {
					while chars.count > 0 && chars[0] == "0" {
						chars.removeFirst()
					}
				}
				i = max(i - 1, 0)
			} else {
				i += 1
			}
		}

		if chars.count == 0 {
			return "0"
		} else {
			return String(chars)
		}
	}
}
