// https://leetcode.com/problems/out-of-boundary-paths/

class Solution {
    static let modulo = 1000000007

    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        if maxMove == 0 { return 0 }

        var positionDic: Dictionary<Position, Int> = [Position(y: startRow, x: startColumn) : 1]
        var result = 0
        for _ in 1...maxMove {
            var newPositionDic = Dictionary<Position, Int>()
            for (position, frequency) in positionDic {
                if position.x == 0 {
                    result = safeAdd(result, frequency)
                } else {
                    let newPosition = Position(y: position.y, x: position.x - 1)
                    newPositionDic[newPosition] = safeAdd(newPositionDic[newPosition], frequency)
                }

                if position.x == n - 1 {
                    result = safeAdd(result, frequency)
                } else {
                    let newPosition = Position(y: position.y, x: position.x + 1)
                    newPositionDic[newPosition] = safeAdd(newPositionDic[newPosition], frequency)
                }

                if position.y == 0 {
                    result = safeAdd(result, frequency)
                } else {
                    let newPosition = Position(y: position.y - 1, x: position.x)
                    newPositionDic[newPosition] = safeAdd(newPositionDic[newPosition], frequency)
                }

                if position.y == m - 1 {
                    result = safeAdd(result, frequency)
                } else {
                    let newPosition = Position(y: position.y + 1, x: position.x)
                    newPositionDic[newPosition] = safeAdd(newPositionDic[newPosition], frequency)
                }
            }
            positionDic = newPositionDic
        }

        return result
    }

    private func safeAdd(_ n1: Int, _ n2: Int) -> Int {
        let addResult = n1 + n2
        return addResult % Solution.modulo
    }

    private func safeAdd(_ n1: Int?, _ n2: Int) -> Int {
        let addResult = (n1 ?? 0) + n2
        return addResult % Solution.modulo
    }
}

fileprivate struct Position: Hashable {
    let y: Int
    let x: Int
}
