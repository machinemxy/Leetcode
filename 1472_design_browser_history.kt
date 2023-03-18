// https://leetcode.com/problems/design-browser-history/description/

class BrowserHistory(homepage: String) {
    private val histories = arrayListOf(homepage)
    private var index = 0

    fun visit(url: String) {
        histories.subList(index + 1, histories.size).clear()
        histories.add(url)
        index++
    }

    fun back(steps: Int): String {
        val newIndex = index - steps
        if (newIndex < 0) {
            index = 0
            return histories[index]
        } else {
            index = newIndex
            return histories[index]
        }
    }

    fun forward(steps: Int): String {
        val newIndex = index + steps
        if (newIndex >= histories.size) {
            index = histories.size - 1
            return histories[index]
        } else {
            index = newIndex
            return histories[index]
        }
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * var obj = BrowserHistory(homepage)
 * obj.visit(url)
 * var param_2 = obj.back(steps)
 * var param_3 = obj.forward(steps)
 */
 
