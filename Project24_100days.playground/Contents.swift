import UIKit

let name = "Taylor"

for letter in name {
    print("Give me a \(letter)!")
}

//print(name[3])

let letter = name[name.index(name.startIndex, offsetBy: 3)]


extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

let letter2 = name[3]

let password = "12345"
password.hasPrefix("123")
password.hasSuffix("345")

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
}

password.deletingPrefix("123")
password.deletingSuffix("345")

let weather = "it's going to rain"
print(weather.capitalized)


extension String {
    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        return firstLetter.uppercased() + self.dropFirst()
    }
}

print(weather.capitalizedFirst)

let input = "Swift is like Objective-C without the C"
input.contains("Swift")

let languages = ["Python", "Ruby", "Swift"]
languages.contains("Swift")

extension String {
    func containsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }

        return false
    }
}

input.containsAny(of: languages)
languages.contains(where: input.contains)


let string = "This is a test string"
/*
let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)
]

let attributedString = NSAttributedString(string: string, attributes: attributes)
*/
let attributedString = NSMutableAttributedString(string: string)
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))


extension String {
    func withPrefix(_ prefix: String) -> String {
        guard !self.hasPrefix(prefix) else { return self }
        return String(prefix + self)
    }
}

var word2 = "pet"
let word2Pref = word2.withPrefix("car")


extension String {
    func isNumeric() -> Bool {
        let range = NSRange(location: 0, length: self.utf16.count)
        let regex = try! NSRegularExpression(pattern: "[0-9]+(?:[.,][0-9]+)*")
        if regex.firstMatch(in: self, options: [], range: range) != nil {
        return true
        }
        return false
    }
}

let numericTestStringOnly = "Oh hello there!"
let numericTestInt = "Zhenja is going to adopt another 3 or 10 cats"
let numericTestFloat = "The password is 2.71828"
let numericTestIntInString = "She's a wisted 3ckster"
let numericTestFloatInString = "I love cakes and 3.14159es"
let numericTestFloatInStringComma = "I love cakes and 3,14159es"

let numericTestFail = numericTestStringOnly.isNumeric()
let numericTestPassOne = numericTestFloat.isNumeric()
let numericTestPassTwo = numericTestInt.isNumeric()
let numericTestPassThree = numericTestFloatInString.isNumeric()
let numericTestPassFour = numericTestIntInString.isNumeric()
let numericTestPassFive = numericTestFloatInStringComma.isNumeric()


extension String {
    func linesRE() -> Int {
        let range = NSRange(location: 0, length: self.utf16.count)
        let regex = try! NSRegularExpression(pattern: "\\n")
        let nsString = self as NSString
        let results = regex.matches(in: self, options: [], range: range)
        if regex.firstMatch(in: self, options: [], range: range) != nil {
            return results.map{nsString.substring(with: $0.range)}.count + 1
        }
        return 0
    }
}

let linesToCount = "this\nis\na\ntest"

let linesCountRE = linesToCount.linesRE()

extension String {
    func lines() -> Int {
        let range = self.split(separator: "\n")
        if range.count != 0 {
            return range.count
        }
        return 0
    }
}

let linesCount = linesToCount.lines()
