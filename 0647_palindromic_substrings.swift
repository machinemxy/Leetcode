// https://leetcode.com/problems/palindromic-substrings/

class Solution {
    private var array = [Character]()

    func countSubstrings(_ s: String) -> Int {
        array = Array(s)
        var result = 0

        for i in 0..<array.count {
            result += countOddPalindromes(centerId: i)
            result += countEvenPalindromes(centerId: i)
        }

        return result
    }

    private func countOddPalindromes(centerId: Int) -> Int {
        var count = 1
        var l = centerId - 1
        var r = centerId + 1

        while true {
            if l < 0 { break }
            if r >= array.count { break }
            if array[l] != array[r] { break }
            count += 1
            l -= 1
            r += 1
        }

        return count
    }

    private func countEvenPalindromes(centerId: Int) -> Int {
        var count = 0
        var l = centerId
        var r = centerId + 1

        while true {
            if l < 0 { break }
            if r >= array.count { break }
            if array[l] != array[r] { break }
            count += 1
            l -= 1
            r += 1
        }

        return count
    }
}
