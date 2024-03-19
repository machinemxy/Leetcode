// https://leetcode.com/problems/combination-sum-ii/description/

class Solution {
    private var sortedCandidates = [Int]()
    private var caches = [Key: Set<[Int]>]()
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        sortedCandidates = candidates.sorted()
        let set = calculate(from: 0, target: target)
        return Array(set)
    }
    
    private func calculate(from: Int, target: Int) -> Set<[Int]> {
        if let cache = caches[Key(from, target)] {
            return cache
        }
        
        let currentValue = sortedCandidates[from]
        let restTarget = target - currentValue
        if restTarget == 0 {
            let set: Set<[Int]> = [[target]]
            return set
        } else if restTarget < 0 || from == sortedCandidates.count - 1 {
            let set: Set<[Int]> = []
            return set
        }

        let set1 = calculate(from: from + 1, target: target)
        if restTarget < currentValue {
            caches[Key(from, target)] = set1
            return set1
        }
        let originalSet2 = calculate(from: from + 1, target: restTarget)
        let set2 = originalSet2.map { intArray in
            var newIntArray = intArray
            newIntArray.insert(currentValue, at: 0)
            return newIntArray
        }
        let set = set1.union(set2)
        caches[Key(from, target)] = set
        return set
    }
}

struct Key: Hashable {
    let from: Int
    let target: Int
    
    init(_ from: Int, _ target: Int) {
        self.from = from
        self.target = target
    }
}
