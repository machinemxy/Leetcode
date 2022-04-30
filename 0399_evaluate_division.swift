// https://leetcode.com/problems/evaluate-division/

class Solution {
    private var dic = Dictionary<String, VariableInfo>()
    private var equations = [[String]]()
    private var values = [Double]()
    private var groupId = 0

    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        self.equations = equations
        self.values = values

        for i in 0..<self.equations.count {
            let first = self.equations[i][0]
            let second = self.equations[i][1]

            // If first and second variables are both unknown, set first as 1.
            if !dic.keys.contains(first) && !dic.keys.contains(second) {
                groupId += 1
                dic[first] = VariableInfo(groupId: groupId, value: 1)
                calculate(known: first)
            }
        }

        // When program reached here, all equations should be solved.
        var result = [Double]()
        for query in queries {
            if let firstVariableInfo = dic[query[0]], let secondVariableInfo = dic[query[1]] {
                if firstVariableInfo.groupId != secondVariableInfo.groupId {
                    // if two variables belong to different group, their reference systems are not the same, cannot be calculated
                    result.append(-1)
                } else {
                    result.append(firstVariableInfo.value / secondVariableInfo.value)
                }
            } else {
                result.append(-1)
            }
        }

        return result
    }

    private func calculate(known: String) {
        for i in 0..<self.equations.count {
            let first = equations[i][0]
            let second = equations[i][1]

            if first == known {
                if dic.keys.contains(second) {
                    continue
                } else {
                    let secondValue = dic[first]!.value / values[i]
                    dic[second] = VariableInfo(groupId: groupId, value: secondValue)
                    calculate(known: second)
                }
            } else if second == known {
                if dic.keys.contains(first) {
                    continue
                } else {
                    let firstValue = dic[second]!.value * values[i]
                    dic[first] = VariableInfo(groupId: groupId, value: firstValue)
                    calculate(known: first)
                }
            }
        }
    }
}

fileprivate struct VariableInfo {
    let groupId: Int
    let value: Double
}
