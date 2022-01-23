// https://leetcode.com/problems/maximum-good-people-based-on-statements/

class Solution {
    private var peopleCount = 0
    private var statements = [[Int]]()
    private var maxGoodPeople = 0

    func maximumGood(_ statements: [[Int]]) -> Int {
        self.statements = statements
        peopleCount = statements.count
        validate(assumption: Array(repeating: true, count: peopleCount))
        return maxGoodPeople
    }

    private func validate(assumption: [Bool]) {
        for i in 0..<assumption.count {
            if assumption[i] == false {
                continue
            }

            var newAccuses = [Int]()
            for j in 0..<assumption.count {
                if statements[i][j] == 1 && assumption[j] == false {
                    // person i is lying
                    var newAssumption = assumption
                    newAssumption[i] = false
                    validate(assumption: newAssumption)
                    return
                } else if statements[i][j] == 0 && assumption[j] == true {
                    newAccuses.append(j)
                }
            }

            if newAccuses.count > 0 {
                // person i is lying
                var newAssumption1 = assumption
                newAssumption1[i] = false
                validate(assumption: newAssumption1)

                // person i is telling truth
                var newAssumption2 = assumption
                for newAccuse in newAccuses {
                    newAssumption2[newAccuse] = false
                }
                validate(assumption: newAssumption2)

                return
            }
        }
        let goodPeople = assumption.filter { $0 }.count
        maxGoodPeople = max(maxGoodPeople, goodPeople)
    }
}
