// https://leetcode.com/problems/guess-number-higher-or-lower/

/** 
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return 	     -1 if num is higher than the picked number
 *			      1 if num is lower than the picked number
 *               otherwise return 0 
 * func guess(_ num: Int) -> Int 
 */

class Solution : GuessGame {
	func guessNumber(_ n: Int) -> Int {
		var low = 1
		var high = n

		while true {
			let mid = (low + high) / 2
			let guessResult = guess(mid)
			if guessResult == 0 {
				return mid
			} else if guessResult == -1 {
				high = mid - 1
			} else {
				low = mid + 1
			}
		}
	}
}
