// https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/

class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let rows: [Row] = mat.enumerated().map { (i, arr) in
            var soldiers = 0
            for num in arr {
                if num == 0 {
                    break
                } else {
                    soldiers += 1
                }
            }
            return Row(i: i, soldiers: soldiers)
        }

        let sortedRow = rows.sorted { l, r in
            if l.soldiers == r.soldiers {
                return l.i < r.i
            } else {
                return l.soldiers < r.soldiers
            }
        }

        var result = [Int]()
        for i in 0..<k {
            result.append(sortedRow[i].i)
        }
        return result
    }
}

struct Row {
    let i: Int
    let soldiers: Int
}
