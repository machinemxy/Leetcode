// https://leetcode.com/problems/prefix-and-suffix-search/

class WordFilter {
    private var rootNode = Node()
    private var reversedRootNode = Node()
    private var cache = Dictionary<String, Int>()

    init(_ words: [String]) {
        for (i, word) in words.enumerated() {
            var currentNode = rootNode
            for char in word {
                if let nextNode = currentNode.next[char] {
                    nextNode.indexes.insert(i)
                    currentNode = nextNode
                } else {
                    let nextNode = Node()
                    nextNode.indexes.insert(i)
                    currentNode.next[char] = nextNode
                    currentNode = nextNode
                }
            }

            let reversedWord = word.reversed()
            currentNode = reversedRootNode
            for char in reversedWord {
                if let nextNode = currentNode.next[char] {
                    nextNode.indexes.insert(i)
                    currentNode = nextNode
                } else {
                    let nextNode = Node()
                    nextNode.indexes.insert(i)
                    currentNode.next[char] = nextNode
                    currentNode = nextNode
                }
            }
        }
    }

    func f(_ prefix: String, _ suffix: String) -> Int {
        if let cacheResult = cache["\(prefix)~\(suffix)"] { return cacheResult }

        var currentNode = rootNode
        for char in prefix {
            if let nextNode = currentNode.next[char] {
                currentNode = nextNode
            } else {
                cache["\(prefix)~\(suffix)"] = -1
                return -1
            }
        }
        let prefixIndexes = currentNode.indexes

        currentNode = reversedRootNode
        let reversedSuffix = suffix.reversed()
        for char in reversedSuffix {
            if let nextNode = currentNode.next[char] {
                currentNode = nextNode
            } else {
                cache["\(prefix)~\(suffix)"] = -1
                return -1
            }
        }
        let suffixIndexes = currentNode.indexes

        let mergedIndexes = prefixIndexes.intersection(suffixIndexes)
        let result = mergedIndexes.reduce(-1) { max($0, $1) }
        cache["\(prefix)~\(suffix)"] = result
        return result
    }
}

fileprivate class Node {
    var next = Dictionary<Character, Node>()
    var indexes = Set<Int>()
}
