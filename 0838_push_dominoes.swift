// https://leetcode.com/problems/push-dominoes/

class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var dominoes = Array(dominoes)
        if dominoes.count == 1 { return String(dominoes) }
        
        while true {
            // calculate the tendencies
            var hasTendency = false
            var tendencies: [Tendency] = Array(repeating: .keep, count: dominoes.count)
            for (i, domino) in dominoes.enumerated() {
                guard domino == "." else { continue }
                if i == 0 {
                    if dominoes[i + 1] == "L" {
                        tendencies[i] = .left
                        hasTendency = true
                    }
                } else if i == dominoes.count - 1 {
                    if dominoes[i - 1] == "R" {
                        tendencies[i] = .right
                        hasTendency = true
                    }
                } else {
                    if dominoes[i - 1] == "R" && dominoes[i + 1] != "L" {
                        tendencies[i] = .right
                        hasTendency = true
                    } else if dominoes[i + 1] == "L" && dominoes[i - 1] != "R" {
                        tendencies[i] = .left
                        hasTendency = true
                    }
                }
            }
            if !hasTendency {
                break
            }
            
            // apply tendencies
            for (i, tendency) in tendencies.enumerated() {
                guard tendency != .keep else { continue }
                if tendency == .left {
                    dominoes[i] = "L"
                } else {
                    dominoes[i] = "R"
                }
            }
        }
        
        return String(dominoes)
    }
}

enum Tendency {
    case left, right, keep
}
