// https://leetcode.com/problems/rectangle-area/

struct Rectangle {
    let x1: Int
    let x2: Int
    let y1: Int
    let y2: Int
    
    var area: Int {
        (x2 - x1) * (y2 - y1)
    }
}

class Solution {
    func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
        let leftRect: Rectangle
        let rightRect: Rectangle
        if ax1 < bx1 {
            leftRect = Rectangle(x1: ax1, x2: ax2, y1: ay1, y2: ay2)
            rightRect = Rectangle(x1: bx1, x2: bx2, y1: by1, y2: by2)
        } else {
            leftRect = Rectangle(x1: bx1, x2: bx2, y1: by1, y2: by2)
            rightRect = Rectangle(x1: ax1, x2: ax2, y1: ay1, y2: ay2)
        }
        guard rightRect.x1 < leftRect.x2 else { return leftRect.area + rightRect.area }
        if leftRect.y1 < rightRect.y1 {
            guard leftRect.y2 > rightRect.y1 else { return leftRect.area + rightRect.area }
            let duplicatedRect = Rectangle(x1: rightRect.x1, x2: min(leftRect.x2, rightRect.x2), y1: rightRect.y1, y2: min(leftRect.y2, rightRect.y2))
            return leftRect.area + rightRect.area - duplicatedRect.area
        } else {
            guard rightRect.y2 > leftRect.y1 else { return leftRect.area + rightRect.area }
            let duplicatedRect = Rectangle(x1: rightRect.x1, x2: min(leftRect.x2, rightRect.x2), y1: leftRect.y1, y2: min(leftRect.y2, rightRect.y2))
            return leftRect.area + rightRect.area - duplicatedRect.area
        }
    }
}
