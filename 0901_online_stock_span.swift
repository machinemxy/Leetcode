// https://leetcode.com/problems/online-stock-span/

class StockSpanner {
    var stocks = [Int]()
    var spans = [Int]()
    
    init() {}
    
    func next(_ price: Int) -> Int {
        var i = stocks.count - 1
        while i >= 0 && price >= stocks[i] {
            i -= spans[i]
        }
        let span = stocks.count - i
        stocks.append(price)
        spans.append(span)
        return span
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */
