// https://leetcode.com/problems/remove-sub-folders-from-the-filesystem/description/

class Solution {
    fun removeSubfolders(folder: Array<String>): List<String> {
        val folders = folder.map { "$it/" }.sorted().toMutableList()
        val resultList = mutableListOf<String>()
        while (folders.isNotEmpty()) {
            val first = folders.first()
            resultList.add(first.substring(0, first.length - 1))
            folders.removeAll { it.startsWith(first) }
        }
        return resultList
    }
}
