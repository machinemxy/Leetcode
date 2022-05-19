// https://leetcode.com/problems/longest-increasing-path-in-a-matrix/

class Solution {
    var m = 0
    var n = 0
    var matrix = [[Int]]()
    var cache = [[Int]]()

    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        m = matrix.count
        n = matrix[0].count
        self.matrix = matrix
        let cacheRow = Array(repeating: 0, count: n)
        cache = Array(repeating: cacheRow, count: m)
        var result = 1

        for y in 0..<m {
            for x in 0..<n {
                let steps = getLongestPath(y: y, x: x)
                if steps > result {
                    result = steps
                }
            }
        }

        return result
    }

    private func getLongestPath(y: Int, x: Int) -> Int {
        if cache[y][x] != 0 {
            return cache[y][x]
        }

        let currentValue = matrix[y][x]
        var maxSteps = 0

        if y - 1 >= 0 {
            let upValue = matrix[y - 1][x]
            if upValue > currentValue {
                let upSteps = getLongestPath(y: y - 1, x: x)
                if upSteps > maxSteps {
                    maxSteps = upSteps
                }
            }
        }

        if y + 1 < m {
            let downValue = matrix[y + 1][x]
            if downValue > currentValue {
                let downSteps = getLongestPath(y: y + 1, x: x)
                if downSteps > maxSteps {
                    maxSteps = downSteps
                }
            }
        }

        if x - 1 >= 0 {
            let leftValue = matrix[y][x - 1]
            if leftValue > currentValue {
                let leftSteps = getLongestPath(y: y, x: x - 1)
                if leftSteps > maxSteps {
                    maxSteps = leftSteps
                }
            }
        }

        if x + 1 < n {
            let rightValue = matrix[y][x + 1]
            if rightValue > currentValue {
                let rightSteps = getLongestPath(y: y, x: x + 1)
                if rightSteps > maxSteps {
                    maxSteps = rightSteps
                }
            }
        }

        cache[y][x] = maxSteps + 1
        return maxSteps + 1
    }
}
