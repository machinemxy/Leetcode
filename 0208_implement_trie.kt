// https://leetcode.com/problems/implement-trie-prefix-tree/description/

class Trie {
    private val root = TrieNode()

    fun insert(word: String) {
        val wordWithEnd = "$word#"
        var node = root
        for (c in wordWithEnd) {
            node.nexts[c]?.let {
                node = it
            } ?: run {
                val newNode = TrieNode()
                node.nexts[c] = newNode
                node = newNode
            }
        }
    }

    fun search(word: String): Boolean {
        return startsWith("$word#")
    }

    fun startsWith(prefix: String): Boolean {
        var node = root
        for (c in prefix) {
            node.nexts[c]?.let {
                node = it
            } ?: run {
                return false
            }
        }
        return true
    }
}

class TrieNode {
    val nexts = mutableMapOf<Char, TrieNode>()
}

/**
 * Your Trie object will be instantiated and called as such:
 * var obj = Trie()
 * obj.insert(word)
 * var param_2 = obj.search(word)
 * var param_3 = obj.startsWith(prefix)
 */
