// https://leetcode.com/problems/transpose-matrix/

class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        var result = [[Int]]()

        let rowCount = matrix.count
        let colCount = matrix[0].count

        for colId in 0..<colCount {
            var resultRow = [Int]()
            for rowId in 0..<rowCount {
                resultRow.append(matrix[rowId][colId])
            }
            result.append(resultRow)
        }

        return result
    }
}
