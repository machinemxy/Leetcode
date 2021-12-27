// https://leetcode.com/problems/zigzag-conversion/

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }

        var storage = Array.init(repeating: [String.Element](), count: numRows)
        var currentRow = 0
        var currentDirection = 1
        for c in s {
            storage[currentRow].append(c)
            currentRow += currentDirection
            if currentRow >= numRows {
                currentRow -= 2
                currentDirection = -1
            } else if currentRow < 0 {
                currentRow += 2
                currentDirection = 1
            }
        }

        var result = ""
        for row in storage {
            result.append(String(row))
        }

        return result
    }
}
