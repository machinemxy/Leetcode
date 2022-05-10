// https://leetcode.com/problems/combination-sum-iii/

class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        combination(k: k, n: n, mustBeGreaterThan: 0)
    }

    private func combination(k: Int, n: Int, mustBeGreaterThan: Int) -> [[Int]] {
        if k == 1 {
            if n > mustBeGreaterThan && n <= 9 {
                return [[n]]
            } else {
                return []
            }
        } else {
            let ceiling = min(n / k, 10 - k)
            var result = [[Int]]()
            var i = mustBeGreaterThan + 1
            while i <= ceiling {
                let subResult = combination(k: k - 1, n: n - i, mustBeGreaterThan: i)
                result += subResult.map { array in
                    var newArray = array
                    newArray.insert(i, at: 0)
                    return newArray
                }

                i += 1
            }
            return result
        }
    }
}
