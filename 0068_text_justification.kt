// https://leetcode.com/problems/text-justification/description/

class Solution {
    fun fullJustify(words: Array<String>, maxWidth: Int): List<String> {
        val result = ArrayDeque<String>()
        val n = words.size
        val pool = mutableListOf<String>()
        var currentSpace = 0
        for (word in words) {
            val restSpace = maxWidth - currentSpace - pool.size
            if (restSpace >= word.length) {
                pool.add(word)
                currentSpace += word.length
            } else {
                buildString(pool, result, maxWidth, currentSpace)
                pool.clear()
                pool.add(word)
                currentSpace = word.length
            }
        }
        if (pool.isNotEmpty()) {
            buildString(pool, result, maxWidth, currentSpace)
        }
        val lastLine = result.removeLast()
        val splitedWords = lastLine.split(' ')
        var str = ""
        for (word in splitedWords) {
            if (word.isNotEmpty()) {
                str += word
                if (str.length < maxWidth) {
                    str += ' '
                }
            }
        }
        result.add(str.padEnd(maxWidth, ' '))
        return result.toList()
    }

    private fun buildString(pool: MutableList<String>, result: ArrayDeque<String>, maxWidth: Int, currentSpace: Int) {
        val n = pool.size
        if (n == 1) {
            val str = pool.first().padEnd(maxWidth, ' ')
            result.add(str)
        } else {
            val spaceSpace = maxWidth - currentSpace
            val spaceCount = spaceSpace / (n - 1)
            var extraCount = spaceSpace % (n - 1)
            var str = ""
            pool.forEachIndexed { i, word ->
                str += word
                if (i < n - 1) {
                    for (j in 1..spaceCount) {
                        str += ' '
                    }
                    if (extraCount > 0) {
                        str += ' '
                        extraCount--
                    }
                }
            }
            result.add(str)
        }
    }
}
