// https://leetcode.com/problems/uncommon-words-from-two-sentences/description/

class Solution {
    fun uncommonFromSentences(s1: String, s2: String): Array<String> {
        val a1 = s1.split(' ')
        val set1 = mutableSetOf<String>()
        val unduplicatedSet1 = mutableSetOf<String>()
        for (word in a1) {
            if (set1.contains(word)) {
                unduplicatedSet1.remove(word)
            } else {
                set1.add(word)
                unduplicatedSet1.add(word)
            }
        }

        val a2 = s2.split(' ')
        val set2 = mutableSetOf<String>()
        val unduplicatedSet2 = mutableSetOf<String>()
        for (word in a2) {
            if (set2.contains(word)) {
                unduplicatedSet2.remove(word)
            } else {
                set2.add(word)
                unduplicatedSet2.add(word)
            }
        }

        val result = mutableListOf<String>()
        for (word in unduplicatedSet1) {
            if (!set2.contains(word)) {
                result.add(word)
            }
        }
        for (word in unduplicatedSet2) {
            if (!set1.contains(word)) {
                result.add(word)
            }
        }
        return result.toTypedArray()
    }
}
