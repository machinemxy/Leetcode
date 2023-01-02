// https://leetcode.com/problems/detect-capital/description/

class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        var pattern = Pattern.unknown
        for c in word {
            if c.isUppercase {
                switch pattern {
                    case .unknown:
                        pattern = .firstUp
                    case .firstUp:
                        pattern = .firstUpSecondUp
                    case .firstUpSecondLow:
                        return false
                    case .firstUpSecondUp:
                        continue
                    case .firstLow:
                        return false
                }
            } else {
                switch pattern {
                    case .unknown:
                        pattern = .firstLow
                    case .firstUp:
                        pattern = .firstUpSecondLow
                    case .firstUpSecondLow:
                        continue
                    case .firstUpSecondUp:
                        return false
                    case .firstLow:
                        continue
                }
            }
        }
        return true
    }
}

enum Pattern {
    case unknown, firstUp, firstUpSecondLow, firstUpSecondUp, firstLow
}
