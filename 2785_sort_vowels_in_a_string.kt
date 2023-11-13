// https://leetcode.com/problems/sort-vowels-in-a-string/description/

class Solution {
    fun sortVowels(s: String): String {
        val vowelSet = setOf('A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u')
        var vowels = mutableListOf<Char>()
        val a = s.toCharArray()
        for (i in a.indices) {
            val c = a[i]
            if (vowelSet.contains(c)) {
                vowels.add(c)
                a[i] = '-'
            }
        }
        vowels.sort()
        var vowelId = 0
        for (i in a.indices) {
            val c = a[i]
            if (c == '-') {
                a[i] = vowels[vowelId]
                vowelId++
            }
        }
        return String(a)
    }
}
