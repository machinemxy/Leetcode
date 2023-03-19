// https://leetcode.com/problems/design-add-and-search-words-data-structure/description/

class WordDictionary() {
    private val root = TrieNode()

    fun addWord(word: String) {
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
        val wordWithEnd = "$word#"
        var nodes = arrayListOf(root)
        for (c in wordWithEnd) {
            val newNodes = ArrayList<TrieNode>()
            for (node in nodes) {
                if (c == '.') {
                    for (next in node.nexts) {
                        if (next.key != '#') {
                            newNodes.add(next.value)
                        }
                    }
                } else {
                    node.nexts[c]?.let {
                        newNodes.add(it)
                    }
                }
            }
            if (newNodes.isEmpty()) {
                return false
            }
            nodes = newNodes
        }
        return true
    }
}

class TrieNode {
    val nexts = mutableMapOf<Char, TrieNode>()
}
