// https://leetcode.com/problems/find-common-characters/description/

import kotlin.math.min

class Solution {
    fun commonChars(words: Array<String>): List<String> {
        val store = IntArray(26) { Int.MAX_VALUE }
        for (word in words) {
            val array = convertWordToArray(word)
            for (i in store.indices) {
                store[i] = min(store[i], array[i])
            }
        }
        val result = mutableListOf<String>()
        for (i in store.indices) {
            for (j in 0 until store[i]) {
                result.add(('a' + i).toString())
            }
        }
        return result.toList()
    }
    
    private fun convertWordToArray(word: String): IntArray {
        val array = IntArray(26)
        for (c in word) {
            array[c - 'a']++
        }
        return array
    }
}
