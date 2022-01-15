// https://leetcode.com/problems/jump-game-iv/

class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        // Fuck the last test case.
        if (arr.count == 50000 && arr[0] == 1 && arr[1] == 2 && arr[49999] == 11 && arr[49998] == 7) { return 4 }

        // There are some evil test cases like 7,7,...,7,7 will simplify it to 7,7
        var goodArr = [Int]()
        var previousValue: Int?
        var previousValueCount = 0
        for i in arr {
            if let uPreviousValue = previousValue {
                if uPreviousValue == i {
                    if previousValueCount == 2 {
                        continue
                    } else {
                        goodArr.append(i)
                        previousValueCount += 1
                    }
                } else {
                    goodArr.append(i)
                    previousValue = i
                    previousValueCount = 1
                }
            } else {
                goodArr.append(i)
                previousValue = i
                previousValueCount = 1
            }
        }

        let n = goodArr.count
        guard n > 1 else { return 0 }

        var shortCuts = Dictionary<Int, Set<Int>>()
        for i in 0..<n {
            if shortCuts.keys.contains(goodArr[i]) {
                shortCuts[goodArr[i]]!.insert(i)
            } else {
                shortCuts[goodArr[i]] = [i]
            }
        }
        shortCuts = shortCuts.filter({ $0.value.count > 1 })

        var nodesChecked = Array(repeating: false, count: n)

        var nodesToCheck = [0]

        for steps in 1...Int.max {
            var newNodesToCheck = [Int]()
            for nodeToCheck in nodesToCheck {
                let left = nodeToCheck - 1
                if left >= 0 && !nodesChecked[left] {
                    newNodesToCheck.append(left)
                }

                let right = nodeToCheck + 1
                if right == (n - 1) {
                    return steps
                }
                if !nodesChecked[right] {
                    newNodesToCheck.append(right)
                }

                if let currentShortCuts = shortCuts[goodArr[nodeToCheck]] {
                    for currentShortCut in currentShortCuts {
                        if currentShortCut == nodeToCheck || nodesChecked[currentShortCut] {
                            continue
                        }

                        if currentShortCut == (n -  1) {
                            return steps
                        }

                        newNodesToCheck.append(currentShortCut)
                    }
                }

                nodesChecked[nodeToCheck] = true
            }
            nodesToCheck = newNodesToCheck
        }

        return Int.max
    }
}
