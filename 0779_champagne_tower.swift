// https://leetcode.com/problems/champagne-tower/

struct RowAndGlass: Hashable {
    let row: Int
    let glass: Int
}

// Recursion
class Solution {
    private var dic = Dictionary<RowAndGlass, Double>()

    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        if poured == 0 { return 0 }

        dic[RowAndGlass(row: 0, glass: 0)] = Double(poured)

        return min(1, pour(rowAndGlass: RowAndGlass(row: query_row, glass: query_glass)))
    }

    private func pour(rowAndGlass: RowAndGlass) -> Double {
        if let result = dic[rowAndGlass] {
            return result
        }

        let row = rowAndGlass.row
        let glass = rowAndGlass.glass

        if glass == 0 {
            let prev = pour(rowAndGlass: RowAndGlass(row: row - 1, glass: 0))
            let result = max(0, (prev - 1) / 2)
            dic[rowAndGlass] = result
            return result
        } else if glass == row {
            let prev = pour(rowAndGlass: RowAndGlass(row: row - 1, glass: glass - 1))
            let result = max(0, (prev - 1) / 2)
            dic[rowAndGlass] = result
            return result
        } else {
            let prevLeft = pour(rowAndGlass: RowAndGlass(row: row - 1, glass: glass - 1))
            let prevRight = pour(rowAndGlass: RowAndGlass(row: row - 1, glass: glass))
            let result = max(0, (prevLeft - 1) / 2) + max(0, (prevRight - 1) / 2)
            dic[rowAndGlass] = result
            return result
        }
    }
}


// DP
class Solution2 {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        if query_row == 0 { return poured >= 1 ? 1 : 0 }

        let row = query_row
        let glass: Int
        if query_glass > query_row / 2 {
            glass = query_row - query_glass
        } else {
            glass = query_glass
        }

        var dic = Dictionary<RowAndGlass, Double>()
        dic[RowAndGlass(row: 0, glass: 0)] = Double(poured)

        for i in 1...row {
            for j in 0...min(glass, i) {
                if j == 0 {
                    let prev = dic[RowAndGlass(row: i - 1, glass: 0)]!
                    dic[RowAndGlass(row: i, glass: j)] = max((prev - 1) / 2, 0)
                } else if j == i {
                    let prev = dic[RowAndGlass(row: i - 1, glass: j - 1)]!
                    dic[RowAndGlass(row: i, glass: j)] = max((prev - 1) / 2, 0)
                } else {
                    let prevLeft = dic[RowAndGlass(row: i - 1, glass: j - 1)]!
                    let prevRight = dic[RowAndGlass(row: i - 1, glass: j)]!
                    dic[RowAndGlass(row: i, glass: j)] = max((prevLeft - 1) / 2, 0) + max((prevRight - 1) / 2, 0)
                }
            }
        }

        return min(dic[RowAndGlass(row: row, glass: glass)]!, 1)
    }
}
