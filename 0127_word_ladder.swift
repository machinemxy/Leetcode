// https://leetcode.com/problems/word-ladder/

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.contains(endWord) else { return 0 }

        let beginArray = Array(beginWord)
        let endArray = Array(endWord)
        let arrayList = wordList.map { Array($0) }
        var arraySet = Set(arrayList)
        var step = 1
        var currentSet: Set<[Character]> = [beginArray]
        while !currentSet.contains(endArray) {
            if currentSet.count == 0 { return 0 }

            var newSet = Set<[Character]>()
            for currentArray in currentSet {
                for testArray in arraySet {
                    if isSimilar(currentArray, testArray) {
                        arraySet.remove(testArray)
                        newSet.insert(testArray)
                    }
                }
            }
            currentSet = newSet
            step += 1
        }
        return step
    }

    private func isSimilar(_ a: [Character], _ b: [Character]) -> Bool {
        var differentCharCount = 0
        for i in 0..<a.count {
            if a[i] != b[i] {
                differentCharCount += 1
                if differentCharCount >= 2 {
                    return false
                }
            }
        }
        return true
    }
}
