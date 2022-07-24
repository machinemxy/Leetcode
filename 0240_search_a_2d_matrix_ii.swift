// https://leetcode.com/problems/search-a-2d-matrix-ii/

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rowCount = matrix.count
        let colCount = matrix[0].count

        var points = [Point(y: 0, x: 0)]
        while points.count > 0 {
            var newPoints = [Point]()
            for point in points {
                if matrix[point.y][point.x] == target {
                    return true
                } else if matrix[point.y][point.x] > target {
                    continue
                }

                if point.x == 0 {
                    if point.y + 1 < rowCount {
                        newPoints.append(Point(y: point.y + 1, x: point.x))
                    }
                }

                if point.x + 1 < colCount {
                    newPoints.append(Point(y: point.y, x: point.x + 1))
                }
            }

            points = newPoints
        }

        return false
    }
}

fileprivate struct Point {
    let y: Int
    let x: Int
}
