// https://leetcode.com/problems/champagne-tower/

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

struct RowAndGlass: Hashable {
    let row: Int
    let glass: Int
}
