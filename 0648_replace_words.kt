// https://leetcode.com/problems/replace-words/description/

class Solution {
    fun replaceWords(dictionary: List<String>, sentence: String): String {
        val root = Node()
        for (word in dictionary) {
            var node = root
            for (c in word) {
                if (node.nexts.containsKey('.')) {
                    break
                } else if (node.nexts.containsKey(c)) {
                    node = node.nexts.getValue(c)
                } else {
                    val newNode = Node()
                    node.nexts[c] = newNode
                    node = newNode
                }
            }
            if (!node.nexts.containsKey('.')) {
                val newNode = Node()
                node.nexts['.'] = newNode
            }
        }
        val words = sentence.split(' ').toMutableList()
        for (i in words.indices) {
            val word = words[i]
            var node = root
            for (j in word.indices) {
                val c = word[j]
                if (node.nexts.containsKey('.')) {
                    words[i] = word.substring(0 until j)
                    break
                } else if (node.nexts.containsKey(c)) {
                    node = node.nexts.getValue(c)
                } else {
                    break
                }
            }
        }
        return words.joinToString(" ")
    }
}

class Node {
    val nexts = mutableMapOf<Char, Node>()
}
