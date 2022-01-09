// https://leetcode.com/problems/robot-bounded-in-circle/

class Solution {
    var direction: Direction = .north
    var x = 0
    var y = 0

    func isRobotBounded(_ instructions: String) -> Bool {
        for c in instructions {
            switch c {
            case "G":
                switch direction {
                case .north:
                    y += 1
                case .south:
                    y -= 1
                case .east:
                    x += 1
                case .west:
                    x -= 1
                }
            case "L":
                switch direction {
                case .north:
                    direction = .west
                case .south:
                    direction = .east
                case .east:
                    direction = .north
                case .west:
                    direction = .south
                }
            default:
                switch direction {
                case .north:
                    direction = .east
                case .south:
                    direction = .west
                case .east:
                    direction = .south
                case .west:
                    direction = .north
                }
            }
        }

        if (x == 0 && y == 0) || (direction != .north) {
            return true
        } else {
            return false
        }
    }
}

enum Direction {
    case north, south, east, west
}
