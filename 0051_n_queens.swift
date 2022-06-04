// https://leetcode.com/problems/n-queens/

class Solution {
    private var n = 0
    private var solution = [[String]]()

    func solveNQueens(_ n: Int) -> [[String]] {
        self.n = n
        // create the matrix
        let row: [Character] = Array(repeating: ".", count: n)
        let matrix = Array(repeating: row, count: n)

        putQueens(row: 0, matrix: matrix)
        return solution
    }

    private func putQueens(row: Int, matrix: [[Character]]) {
        for i in 0..<n {
            guard matrix[row][i] == "." else { continue }

            var newMatrix = matrix
            newMatrix[row][i] = "Q"
            if row == n - 1 {
                saveMatrixAsSolution(matrix: newMatrix)
                // if it is last row, then there is only one place that can place queen, so we can use break instead of continue
                break
            }

            for j in 1..<(n - row) {
                if i - j >= 0 {
                    newMatrix[row + j][i - j] = "*"
                }

                newMatrix[row + j][i] = "*"

                if i + j < n {
                    newMatrix[row + j][i + j] = "*"
                }
            }

            putQueens(row: row + 1, matrix: newMatrix)
        }
    }

    private func saveMatrixAsSolution(matrix: [[Character]]) {
        var strArray = [String]()
        for i in 0..<n {
            var str = ""
            for j in 0..<n {
                if matrix[i][j] == "Q" {
                    str.append("Q")
                } else {
                    str.append(".")
                }
            }
            strArray.append(str)
        }
        solution.append(strArray)
    }
}
