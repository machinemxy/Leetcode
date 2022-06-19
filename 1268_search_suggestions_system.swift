// https://leetcode.com/problems/search-suggestions-system/

class Solution {
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        let sortedProducts = products.sorted()
        let rootNode = Node()
        for (i, product) in sortedProducts.enumerated() {
            var currentNode = rootNode

            for char in product {
                if let nextNode = currentNode.next[char] {
                    if nextNode.indexes.count < 3 {
                        nextNode.indexes.append(i)
                    }
                    currentNode = nextNode
                } else {
                    let nextNode = Node()
                    nextNode.indexes.append(i)
                    currentNode.next[char] = nextNode
                    currentNode = nextNode
                }
            }
        }

        var result = [[String]]()
        var searchNode: Node? = rootNode
        for char in searchWord {
            if let indexes = searchNode?.next[char]?.indexes {
                result.append(indexes.map({ sortedProducts[$0] }))
                searchNode = searchNode?.next[char]
            } else {
                result.append([])
                searchNode = nil
            }
        }

        return result
    }
}

fileprivate class Node {
    var next = Dictionary<Character, Node>()
    var indexes = [Int]()
}
