// https://leetcode.com/problems/champagne-tower/

class Solution {
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

struct RowAndGlass: Hashable {
    let row: Int
    let glass: Int
}
