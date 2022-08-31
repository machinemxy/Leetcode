// https://leetcode.com/problems/pacific-atlantic-water-flow/

class Solution {
    var heights = [[Int]]()
    var flows = [[Flow]]()
    var rowCount = 0
    var colCount = 0

    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        self.heights = heights
        rowCount = heights.count
        colCount = heights[0].count
        let flowRow = Array(repeating: Flow(), count: colCount)
        flows = Array(repeating: flowRow, count: rowCount)

        for x in 0..<colCount {
            if !flows[0][x].canGoPacific {
                flowToPacific(y: 0, x: x)
            }
        }

        if rowCount > 1 {
            for y in 1..<rowCount {
                if !flows[y][0].canGoPacific {
                    flowToPacific(y: y, x: 0)
                }
            }
        }

        for x in 0..<colCount {
            if !flows[rowCount - 1][x].canGoAtlantic {
                flowToAtlantic(y: rowCount - 1, x: x)
            }
        }

        if rowCount > 1 {
            for y in 0..<(rowCount - 1) {
                if !flows[y][colCount - 1].canGoAtlantic {
                    flowToAtlantic(y: y, x: colCount - 1)
                }
            }
        }

        var result = [[Int]]()
        for y in 0..<rowCount {
            for x in 0..<colCount {
                if flows[y][x].canGoPacific && flows[y][x].canGoAtlantic {
                    result.append([y, x])
                }
            }
        }
        return result
    }

    func flowToPacific(y: Int, x: Int) {
        flows[y][x].canGoPacific = true
        let currentHeight = heights[y][x]
        if y > 0 && heights[y - 1][x] >= currentHeight && !flows[y - 1][x].canGoPacific {
            flowToPacific(y: y - 1, x: x)
        }

        if x > 0 && heights[y][x - 1] >= currentHeight && !flows[y][x - 1].canGoPacific {
            flowToPacific(y: y, x: x - 1)
        }

        if y < rowCount - 1 && heights[y + 1][x] >= currentHeight && !flows[y + 1][x].canGoPacific {
            flowToPacific(y: y + 1, x: x)
        }

        if x < colCount - 1 && heights[y][x + 1] >= currentHeight && !flows[y][x + 1].canGoPacific {
            flowToPacific(y: y, x: x + 1)
        }
    }

    func flowToAtlantic(y: Int, x: Int) {
        flows[y][x].canGoAtlantic = true
        let currentHeight = heights[y][x]
        if y > 0 && heights[y - 1][x] >= currentHeight && !flows[y - 1][x].canGoAtlantic {
            flowToAtlantic(y: y - 1, x: x)
        }

        if x > 0 && heights[y][x - 1] >= currentHeight && !flows[y][x - 1].canGoAtlantic {
            flowToAtlantic(y: y, x: x - 1)
        }

        if y < rowCount - 1 && heights[y + 1][x] >= currentHeight && !flows[y + 1][x].canGoAtlantic {
            flowToAtlantic(y: y + 1, x: x)
        }

        if x < colCount - 1 && heights[y][x + 1] >= currentHeight && !flows[y][x + 1].canGoAtlantic {
            flowToAtlantic(y: y, x: x + 1)
        }
    }
}

struct Flow {
    var canGoPacific = false
    var canGoAtlantic = false
}
