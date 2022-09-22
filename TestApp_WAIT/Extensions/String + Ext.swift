//
//  String + Ext.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 22/09/2022.
//


import Foundation

extension String {
    
    func isValidPhoneNumber(pattern: String) -> Bool {
//        return self.range(of: pattern ,options: .regularExpression) != nil
        return self.count > 9 && self.count <= 11
    }
    func isValidEmail() -> Bool {
        let testEmail = NSPredicate(format:"SELF MATCHES %@", RegularExpression.email.value)
        return testEmail.evaluate(with: self)
    }
    func isValidatePassword() -> Bool{
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", RegularExpression.password().value)
        print(passwordPredicate.evaluate(with: self))
        return passwordPredicate.evaluate(with: self)
    }
    func isValidUserName() -> Bool {
        let Test = NSPredicate(format:"SELF MATCHES %@", RegularExpression.userName.value)
        return Test.evaluate(with: self)
    }
    func isValidSocialUserName()->Bool{
        let test = NSPredicate(format:"SELF MATCHES %@", RegularExpression.socialUserName.value)
        return test.evaluate(with: self)
    }
    func containOneCpital()->Bool{
        let test = NSPredicate(format:"SELF MATCHES %@", RegularExpression.oneCapitalChar.value)
        return test.evaluate(with: self)
    }
    func containOneSmall()->Bool{
        let test = NSPredicate(format:"SELF MATCHES %@", RegularExpression.oneSmallChar.value)
        return test.evaluate(with: self)
    }
    func containOneNumber()->Bool{
        let test = NSPredicate(format:"SELF MATCHES %@", RegularExpression.oneNumber.value)
        return test.evaluate(with: self)
    }
    func containOneSpecial()->Bool{
        let test = NSPredicate(format:"SELF MATCHES %@", RegularExpression.oneSpecailChar.value)
        return test.evaluate(with: self)
    }

    
}

// MARK: - Converters -
extension String {
    
    var replacedArabicDigitsWithEnglish: String {
        var str = self
        let map = [
            "٠": "0",
            "١": "1",
            "٢": "2",
            "٣": "3",
            "٤": "4",
            "٥": "5",
            "٦": "6",
            "٧": "7",
            "٨": "8",
            "٩": "9",
        ]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    var replacedEnglishDigitsWithArabic: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $1, with: $0) }
        return str
    }
    var isInt: Bool {
        return Int(self) != nil
    }
    var isDouble: Bool {
        return Double(self) != nil
    }
    
    func toDouble() -> Double {
        return Double(self) ?? 0.0
    }
    func toInt() -> Int {
        return Int(self) ?? 0
    }
    func toPrice() -> String {
        return String(format: "%.01f", self.toDouble()) + " " + "SAR"
    }
    func toKiloMeter() -> String {
        return String(format: "%.01f", self.toDouble()) + " " + "Km"
    }
    func increase() -> String {
        return String(self.toInt() + 1)
    }
    func decrease() -> String {
        guard self.toInt() > 1 else {return self}
        return String(self.toInt() - 1)
    }
    func trimWhiteSpace() -> String{
        let newValue = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return newValue
    }
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.date(from: self)
        return date
    }
    func toDay() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        return date
    }
    func toTime() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func createUniqueUserName()->String
    {
       // let trimmed = str.trimmingCharacters(in: .whitespacesAndNewlines)
        var userName  = self.trimByme()
        userName += String(Int.random(in: 0..<9999999))
        return userName
    }
    
    func trimByme()->String{
        let str = self
        let arr = str.components(separatedBy: .whitespaces) // ["+39", "333", "3333333"]
        let str2 = arr.joined()
        return str2
    }

    
    @available(iOS 13.0, *)
    func toTimeAgo() -> String {
        guard let date = self.toDate() else {return String()}
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
    
}

// MARK: - NSAttributedString -
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
