// https://leetcode.com/problems/count-vowels-permutation/

class Solution {
	func countVowelPermutation(_ n: Int) -> Int {
		if n == 1 { return 5 }

		var vowels = Vowels()
		for _ in 2...n {
			vowels.next()
		}
		return vowels.sum()
	}
}

fileprivate struct Vowels {
	static let modulo = 1000000007

	var a = 1
	var e = 1
	var i = 1
	var o = 1
	var u = 1

	mutating func next() {
		let newA = e + i + u
		let newE = a + i
		let newI = e + o
		let newO = i
		let newU = i + o
		a = newA % Self.modulo
		e = newE % Self.modulo
		i = newI % Self.modulo
		o = newO % Self.modulo
		u = newU % Self.modulo
	}

	func sum() -> Int {
		(a + e + i + o + u) % Self.modulo
	}
}
