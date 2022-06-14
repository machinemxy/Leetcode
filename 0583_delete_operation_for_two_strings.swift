// https://leetcode.com/problems/delete-operation-for-two-strings/

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let arr1 = Array(word1)
        let arr2 = Array(word2)
        let count1 = arr1.count
        let count2 = arr2.count

        let row = Array(repeating: 0, count: count2)
        var matrix = Array(repeating: row, count: count1)

        for i in 0..<count1 {
            for j in 0..<count2 {
                if arr1[i] == arr2[j] {
                    if i == 0 || j == 0 {
                        matrix[i][j] = 1
                    } else {
                        matrix[i][j] = matrix[i - 1][j - 1] + 1
                    }
                } else {
                    if i == 0 && j == 0 {
                        matrix[i][j] = 0
                    } else if i == 0 {
                        matrix[i][j] = matrix[i][j - 1]
                    } else if j == 0 {
                        matrix[i][j] = matrix[i - 1][j]
                    } else {
                        matrix[i][j] = max(matrix[i - 1][j], matrix[i][j - 1])
                    }
                }
            }
        }

        return count1 + count2 - matrix[count1 - 1][count2 - 1] * 2
    }
}
