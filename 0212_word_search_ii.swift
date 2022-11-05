// https://leetcode.com/problems/word-search-ii/

class Solution {
    let initialTrie = Trie()
    var board = [[Character]]()
    var rowCount = 0
    var colCount = 0
    var result = [String]()
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        self.board = board
        rowCount = board.count
        colCount = board[0].count
        
        for word in words {
            var trie = initialTrie
            for c in word {
                if trie.nexts.keys.contains(c) {
                    trie = trie.nexts[c]!
                } else {
                    let next = Trie()
                    trie.nexts[c] = next
                    trie = next
                }
            }
            trie.nexts["."] = Trie() // "." marks end of a word
        }
        
        for i in 0..<rowCount {
            for j in 0..<colCount {
                check(point: Point(y: i, x: j), trie: initialTrie, visited: [], word: "")
            }
        }
        
        return result
    }
    
    func check(point: Point, trie: Trie, visited: Set<Point>, word: String) {
        let c = board[point.y][point.x]
        guard trie.nexts.keys.contains(c) else { return }
        
        var newVisited = visited
        newVisited.insert(point)
        let newWord = word + String(c)
        let newTrie = trie.nexts[c]!
        
        if newTrie.nexts.keys.contains(".") {
            result.append(newWord)
            remove(word: newWord, from: initialTrie)
        }
        
        if point.x - 1 >= 0 {
            let left = Point(y: point.y, x: point.x - 1)
            if !visited.contains(left) {
                check(point: left, trie: newTrie, visited: newVisited, word: newWord)
            }
        }
        
        if point.x + 1 < colCount {
            let right = Point(y: point.y, x: point.x + 1)
            if !visited.contains(right) {
                check(point: right, trie: newTrie, visited: newVisited, word: newWord)
            }
        }
        
        if point.y - 1 >= 0 {
            let up = Point(y: point.y - 1, x: point.x)
            if !visited.contains(up) {
                check(point: up, trie: newTrie, visited: newVisited, word: newWord)
            }
        }
        
        if point.y + 1 < rowCount {
            let down = Point(y: point.y + 1, x: point.x)
            if !visited.contains(down) {
                check(point: down, trie: newTrie, visited: newVisited, word: newWord)
            }
        }
    }
    
    func remove(word: String, from trie: Trie) {
        if word.isEmpty {
            trie.nexts.removeValue(forKey: ".")
        } else {
            var newWord = word
            let c = newWord.removeFirst()
            let nextTrie = trie.nexts[c]!
            remove(word: newWord, from: nextTrie)
            if nextTrie.nexts.isEmpty {
                trie.nexts.removeValue(forKey: c)
            }
        }
    }
}

final class Trie {
    var nexts = [Character: Trie]()
}

struct Point: Hashable {
    let y: Int
    let x: Int
}
