// https://leetcode.com/problems/reveal-cards-in-increasing-order/description/

class Solution {
    fun deckRevealedIncreasing(deck: IntArray): IntArray {
        val sortedDeck = ArrayDeque(deck.sorted())
        val originalDeck = ArrayDeque<Int>()
        val initOne = sortedDeck.removeLast()
        originalDeck.add(initOne)
        while (sortedDeck.isNotEmpty()) {
            val a = originalDeck.removeLast()
            originalDeck.addFirst(a)
            val b = sortedDeck.removeLast()
            originalDeck.addFirst(b)
        }
        return originalDeck.toIntArray()
    }
}
