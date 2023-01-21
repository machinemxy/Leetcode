// https://leetcode.com/problems/restore-ip-addresses/description/

class Solution {
    var result = [String]()
    
    func restoreIpAddresses(_ s: String) -> [String] {
        let chars = Array(s)
        check(prevS: "", restCount: 4, restChars: chars)
        return result
    }
    
    func check(prevS: String, restCount: Int, restChars: [Character]) {
        var restChars = restChars
        if restChars.isEmpty {
            return
        }
        if restCount == 1 {
            let s = String(restChars)
            if isValid(s) {
                result.append(prevS + s)
            } 
        } else {
            var s = String(restChars.removeFirst())
            if isValid(s) {
                check(prevS: prevS + s + ".", restCount: restCount - 1, restChars: restChars)
            }
            if !restChars.isEmpty {
                s.append(restChars.removeFirst())
                if isValid(s) {
                    check(prevS: prevS + s + ".", restCount: restCount - 1, restChars: restChars)
                }
            }
            if !restChars.isEmpty {
                s.append(restChars.removeFirst())
                if isValid(s) {
                    check(prevS: prevS + s + ".", restCount: restCount - 1, restChars: restChars)
                }
            }
        }
    } 
    
    func isValid(_ s: String) -> Bool {
        if s.count > 1 {
            if s.count > 3 {
                return false
            } else if s.first! == "0" {
                return false
            } else {
                let i = Int(s)!
                if i > 255 {
                    return false
                } else {
                    return true
                }
            }
        } else {
            return true
        }
    }
}
