// https://leetcode.com/problems/path-with-minimum-effort/

class Solution {
    private var heights = [[Int]]()
    private var rowCount = 0
    private var colCount = 0

    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        rowCount = heights.count
        colCount = heights[0].count

        if rowCount == 1 && colCount == 1 { return 0 }

        var minHeight = Int.max
        var maxHeight = Int.min
        for i in 0..<rowCount {
            for j in 0..<colCount {
                let height = heights[i][j]
                minHeight = min(minHeight, height)
                maxHeight = max(maxHeight, height)
            }
        }

        var l = 0
        var r = maxHeight - minHeight
        self.heights = heights
        var result = r

        while l <= r {
            let mid = (l + r) / 2
            if canFinishWithEffort(mid) {
                result = mid
                r = mid - 1
            } else {
                l = mid + 1
            }
        }

        return result
    }

    private func canFinishWithEffort(_ effort: Int) -> Bool {
        let start = Point(y: 0, x: 0)
        let end = Point(y: rowCount - 1, x: colCount - 1)
        var visited: Set<Point> = [start]
        var actives: Set<Point> = [start]

        while actives.count > 0 {
            var newActives = Set<Point>()

            for active in actives {
                // left
                if active.x - 1 >= 0 {
                    let left = active.leftPoint()
                    if !visited.contains(left) {
                        if heightDifference(active, left) <= effort {
                            visited.insert(left)
                            newActives.insert(left)
                        }
                    }
                }

                // up
                if active.y - 1 >= 0 {
                    let up = active.upPoint()
                    if !visited.contains(up) {
                        if heightDifference(active, up) <= effort {
                            visited.insert(up)
                            newActives.insert(up)
                        }
                    }
                }

                // right
                if active.x + 1 < colCount {
                    let right = active.rightPoint()
                    if !visited.contains(right) {
                        if heightDifference(active, right) <= effort {
                            visited.insert(right)
                            newActives.insert(right)
                        }
                    }
                }

                // down
                if active.y + 1 < rowCount {
                    let down = active.downPoint()
                    if !visited.contains(down) {
                        if heightDifference(active, down) <= effort {
                            visited.insert(down)
                            newActives.insert(down)
                        }
                    }
                }
            }

            if newActives.contains(end) {
                return true
            } else {
                actives = newActives
            }
        }

        return false
    }

    private func heightDifference(_ point1: Point, _ point2: Point) -> Int {
        abs(heights[point1.y][point1.x] - heights[point2.y][point2.x])
    }
}

fileprivate struct Point: Hashable, Equatable {
    let y: Int
    let x: Int

    func leftPoint() -> Point {
        Point(y: y, x: x - 1)
    }

    func upPoint() -> Point {
        Point(y: y - 1, x: x)
    }

    func rightPoint() -> Point {
        Point(y: y, x: x + 1)
    }

    func downPoint() -> Point {
        Point(y: y + 1, x: x)
    }
}
