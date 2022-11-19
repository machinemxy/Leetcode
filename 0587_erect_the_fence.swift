// https://leetcode.com/problems/erect-the-fence/

class Solution {
    func outerTrees(_ trees: [[Int]]) -> [[Int]] {
        let trees = trees.sorted { tree1, tree2 in
            if tree1[0] == tree2[0] {
                return tree1[1] <= tree2[1]
            } else {
                return tree1[0] < tree2[0]
            }
        }
        
        let firstHalfKeyTrees = getKeyTrees(trees: trees)
        let secondHalfKeyTrees = getKeyTrees(trees: trees.reversed())
        return Array(firstHalfKeyTrees.union(secondHalfKeyTrees))
    }
    
    func canRemoveP2(p1: [Int], p2: [Int], p3: [Int]) -> Bool {
        let v1x = p2[0] - p1[0]
        let v1y = p2[1] - p1[1]
        let v2x = p3[0] - p2[0]
        let v2y = p3[1] - p2[1]
        return v1x * v2y > v1y * v2x
    }
    
    func getKeyTrees(trees: [[Int]]) -> Set<[Int]> {
        var stack = [[Int]]()
        for tree in trees {
            while stack.count >= 2 && canRemoveP2(p1: stack[stack.count - 2], p2: stack[stack.count - 1], p3: tree) {
                stack.removeLast()
            }
            stack.append(tree)
        }
        return Set(stack)
    }
}
