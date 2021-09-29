// https://leetcode.com/problems/unique-email-addresses/submissions/

class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        for email in emails {
            checkEmail(email)
        }

        return realEmails.count
    }

    private var realEmails: Set<String> = []

    private func checkEmail(_ email: String) {
        let emailParts = email.components(separatedBy: "@")
        let localName = emailParts[0]
        let domainName = emailParts[1]
        let localParts = localName.components(separatedBy: "+")
        let realLocalName = localParts[0].replacingOccurrences(of: ".", with: "")
        let realEmail = realLocalName + "@" + domainName
        realEmails.insert(realEmail)
    }
}
