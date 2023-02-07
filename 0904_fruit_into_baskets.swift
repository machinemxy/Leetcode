// https://leetcode.com/problems/fruit-into-baskets/description/

class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var fruitCounts = [FruitCount]()
        var currentFruit = -1
        var currentCount = 0
        for fruit in fruits {
            if fruit == currentFruit {
                currentCount += 1
            } else {
                if currentFruit != -1 {
                    fruitCounts.append(FruitCount(fruit: currentFruit, count: currentCount))
                }
                currentFruit = fruit
                currentCount = 1
            }
        }
        fruitCounts.append(FruitCount(fruit: currentFruit, count: currentCount))
        
        var result = 0
        var currentTwoFruits = Set<Int>()
        var currentTwoCount = 0
        var i = 0
        while i < fruitCounts.count {
            let fruitCount = fruitCounts[i]
            if currentTwoFruits.contains(fruitCount.fruit) {
                currentTwoCount += fruitCount.count
                i += 1
            } else if currentTwoFruits.count < 2 {
                currentTwoFruits.insert(fruitCount.fruit)
                currentTwoCount += fruitCount.count
                i += 1
            } else {
                result = max(result, currentTwoCount)
                currentTwoFruits.removeAll()
                currentTwoCount = 0
                i -= 1
            }
        }
        result = max(result, currentTwoCount)
        return result
    }
}

struct FruitCount {
    let fruit: Int
    let count: Int
}
