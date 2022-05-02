// https://leetcode.com/problems/sort-array-by-parity/

class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var evens = [Int]()
        var odds = [Int]()

        for num in nums {
            if num % 2 == 0 {
                evens.append(num)
            } else {
                odds.append(num)
            }
        }

        return evens + odds
    }
}
