// https://leetcode.com/problems/furthest-building-you-can-reach/

class Solution {
    private var ladderStack = [Int]()

    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var building = 0
        var bricks = bricks
        var ladders = ladders

        while true {
            if building == heights.count - 1 { break }
            let heightDifference = heights[building + 1] - heights[building]
            if heightDifference <= 0 {
                building += 1
                continue
            }

            if ladders > 0 {
                ladders -= 1
                building += 1
                addHeightDifferenceToLadderStack(heightDifference)
                continue
            }

            addHeightDifferenceToLadderStack(heightDifference)
            let minLadderHeight = ladderStack.removeFirst()
            if bricks < minLadderHeight {
                break
            } else {
                bricks -= minLadderHeight
                building += 1
            }
        }

        return building
    }

    private func addHeightDifferenceToLadderStack(_ heightDifference: Int) {
        if ladderStack.isEmpty {
            ladderStack.append(heightDifference)
            return
        }

        if heightDifference <= ladderStack.first! {
            ladderStack.insert(heightDifference, at: 0)
        } else if heightDifference >= ladderStack.last! {
            ladderStack.append(heightDifference)
        } else {
            var l = 0
            var r = ladderStack.count - 1
            while l <= r {
                let mid = (l + r) / 2
                let midVal = ladderStack[mid]
                if heightDifference == midVal {
                    l = mid
                    r = l - 1
                } else if heightDifference < midVal {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            ladderStack.insert(heightDifference, at: l)
        }
    }
}
