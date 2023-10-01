// https://leetcode.com/problems/reverse-words-in-a-string-iii/description/

class Solution {
    fun reverseWords(s: String): String {
        return s
            .split(' ')
            .map {
                it.reversed()
            }
            .reduce { result, element ->
                "$result $element"
            }
    }
}
