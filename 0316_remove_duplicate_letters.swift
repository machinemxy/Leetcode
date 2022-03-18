// https://leetcode.com/problems/remove-duplicate-letters/

class Solution {
	func removeDuplicateLetters(_ s: String) -> String {
		let array = Array(s)

		var lastIndexDic = Dictionary<Character, Int>()
		for i in 0..<array.count {
			let char = array[i]
			lastIndexDic[char] = i
		}

		var addedDic = Dictionary<Character, Bool>()
		for char in lastIndexDic.keys {
			addedDic[char] = false
		}

		var stack = [Character]()

		for i in 0..<array.count {
			let char = array[i]

			// this char already in the stack
			if addedDic[char]! {
				continue
			}

			while stack.count > 0 && stack.last! > char {
				let lastChar = stack.last!
				if lastIndexDic[lastChar]! > i {
					stack.removeLast()
					addedDic[lastChar] = false
				} else {
					break
				}
			}

			stack.append(char)
			addedDic[char] = true
		}

		return String(stack)
	}
}
