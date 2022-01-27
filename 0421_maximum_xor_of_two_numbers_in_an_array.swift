// https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/

class Solution {
	var trie = Trie()

	func findMaximumXOR(_ nums: [Int]) -> Int {
		guard nums.count > 1 else { return 0 }

		let maxDigits = nums.max()!.toBinaryArray().count
		let firstArr = nums.first!.toBinaryArray(paddingTo: maxDigits)
		addArrToTrie(firstArr)
		var result = 0

		for i in 1..<nums.count {
			let arr = nums[i].toBinaryArray(paddingTo: maxDigits)
			var current = trie
			var diff = 0
			var diffMultiplier = 1
			for n in arr {
				diff *= 2

				if n == 1 {
					if let next = current.next[0] {
						diff += 1
						current = next
					} else if let next = current.next[1] {
						current = next
					}
				} else {
					if let next = current.next[1] {
						diff += 1
						current = next
					} else if let next = current.next[0] {
						current = next
					}
				}

				diffMultiplier *= 2
			}
			result = max(result, diff)
			addArrToTrie(arr)
		}

		return result
	}

	func addArrToTrie(_ arr: [Int]) {
		var current = trie
		for n in arr {
			if let next = current.next[n] {
				current = next
			} else {
				let newNode = Trie()
				current.next[n] = newNode
				current = newNode
			}
		}
	}
}

extension Int {
	func toBinaryArray(paddingTo: Int = 0) -> [Int] {
		var n = self
		var result = [Int]()
		while n != 0 {
			result.insert(n % 2, at: 0)
			n /= 2
		}
		if result.count < paddingTo {
			let paddingCount = paddingTo - result.count
			for _ in 1...paddingCount {
				result.insert(0, at: 0)
			}
		}
		return result
	}
}

class Trie {
	var next: [Trie?]
	init() {
		next = [nil, nil]
	}
}
