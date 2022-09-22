//
//  ValidationHelper.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 22/09/2022.
//

import Foundation


enum RegularExpression {
    case egyptPhone
    case saudiArabiaPhone
    case password(min: Int = 8, max: Int = 16) //Minimum 8 characters at least 1 Alphabet and 1 Number:
    case email
    case userName
    case socialUserName
    case oneCapitalChar
    case oneSmallChar
    case oneNumber
    case oneSpecailChar
}

extension RegularExpression {
    var value: String {
        switch self {
        case .egyptPhone:
            return #"^(00201|201|\+201|01)(0|1|2|5)([0-9]{8})$"#
        case .saudiArabiaPhone:
            return #"^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$"#
        case .password:
            return "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
            //"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,}"
        case .email:
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .userName:
           return "\\A\\w{6,20}\\z"
        case .socialUserName:
            //instgramregular
            return "([A-Za-z0-9_](?:(?:[A-Za-z0-9_]|(?:\\.(?!\\.))){0,28}(?:[A-Za-z0-9_]))?)"

        case .oneCapitalChar:
            return "^(?=.*[A-Z]).*$"
        case .oneSmallChar:
            return "^(?=.*[a-z]).*$"
        case .oneNumber:
            return "^(?=.*[0-9]).*$"
        case .oneSpecailChar:
            return "^(?=.*[^ \\w]).*$"
        }
    }
}


//MARK: -  class 2

import Foundation

enum ValidationError: Error {
    //MARK: - Name -
    case emptyFirstName
    case shortFirstName
    case longFirstName
    case emptyLastName
    case shortLastName
    case longLastName
    case emptyFamilyName
    case shortFamilyName
    case longFamilyName
    case emptyFullName
    case shortFullName
    case longFullName
    case emptyName
    case shortName
    case longName
    case wrongUserName

    //MARK: - Phone -
    case emptyPhoneNumber
    case incorrectPhoneNumber
    case incorrectWhatsAppNumber

    //MARK: - Verification Code -
    case emptyVerificationCode
    case incorrectVerificationCode

    //MARK: - Email -
    case emptyMail
    case wrongMail

    //MARK: - Passwords -
    case emptyPassword
    case shortPassword
    case weakPassword
    case emptyNewPassword
    case shortNewPassword
    case emptyOldPassword
    case shortOldPassword
    case emptyConfirmNewPassword
    case emptyConfirmPassword
    case notMatchPasswords
    case terms

    //MARK: - Locations -
    case emptyCountry
    case emptyGovernorate
    case emptyCity
    case floorNumbers
    case emptyArea
    case emptyStreet
    case addressType
    case emptyLocation
    case estateLocation
    case emptyAddressDetails

    //MARK: - Images -
    case coverPicture
    case profilePicture
    case licensePicture
    case productPicture
    case contractNumber

    //MARK: - carPalet -
    case carPicture
    case carPlate
    case carModel
    case carType

    //MARK: - Date -
    case emptyAge
    case youngAge
    case emptyDate
    case notOldDate
    case notNewDate

    //MARK: - Message -
    case emptyTitle
    case emptyMessage
    case emptyTitleType

    //MARK: - Bank -
    case bankAccountHolder
    case bankName
    case bankTransferImage
    case fromBankName
    case bankAccountNumber

    //MARK: - category -
    case emptyCategory
    case emptyPriceBefor
    case emptyPriceAfter
    case priceBeforeSmallThanPriceAfter
    case emptyDescription
    
}
extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        //MARK: - Name -
        case .emptyFirstName:
            return "Please enter first name."
        case .shortFirstName:
            return "First name is too short."
        case .longFirstName:
            return "First name is too long."
        case .emptyLastName:
            return "Please enter last name."
        case .shortLastName:
            return "Last name is too short."
        case .longLastName:
            return "Last name is too long."
        case .emptyFamilyName:
            return "Please enter family name."
        case .shortFamilyName:
            return "Family name is too short."
        case .longFamilyName:
            return "Family name is too long."
        case .emptyFullName:
            return "Please enter full name."
        case .shortFullName:
            return "Full name is too short."
        case .longFullName:
            return "Full name is too long."
        case .emptyName:
            return "Please enter name."
        case .shortName:
            return "Name is too short , must be greater than 6."
        case .longName:
            return "Name is too long."
        case.wrongUserName:
            return "username must not have special character"

        //MARK: - Phone -
        case .emptyPhoneNumber:
            return "Please enter your phone number."
        case .incorrectPhoneNumber:
            return "Please enter correct phone number."
        case .incorrectWhatsAppNumber:
            return "Please enter correct whatsApp number."

        //MARK: - Verification Code -
        case .emptyVerificationCode:
            return "Please enter verification code"
        case .incorrectVerificationCode:
            return "Verification Code should be 4 digits."
        case .estateLocation:
            return "Please enter estate location"
        case .contractNumber:
            return "Please enter contract number"
        //MARK: - Email -
        case .emptyMail:
            return "Please enter email field."
        case .wrongMail:
            return "Please enter correct email address."

        //MARK: - Passwords -
        case .emptyPassword:
            return "Please enter password field."
        case .shortPassword:
            return "Password is too short, it should be 8 characters at least."
        case .weakPassword:
            return "Weak paswword , please choose strong one"
        case .emptyNewPassword:
            return "Please enter new password field."
        case .shortNewPassword:
            return "New password is too short, it should be 8 characters at least."
        case .emptyOldPassword:
            return "Please enter old password field."
        case .shortOldPassword:
            return "Old password is too short, it should be 8 characters at least."
        case .emptyConfirmNewPassword:
            return "Please enter confirm new password field."
        case .emptyConfirmPassword:
            return "Please enter confirm password field."
        case .notMatchPasswords:
            return "Passwords not match."
        case .terms:
            return "Please read and agree our terms and conditions first"

        //MARK: - Locations -
        case .emptyCountry:
            return "Please select country."
        case .emptyGovernorate:
            return "Please select governorate"
        case .emptyCity:
            return "Please select city."
        case .floorNumbers:
            return "Please select the floor"
        case .emptyArea:
            return "Please select area."
        case .emptyStreet:
            return "Please enter street name."
        case .addressType:
            return "Please enter address type."
        case .emptyLocation:
            return "Please select the location."
        case .emptyAddressDetails:
            return "Please write address details"

        //MARK: - Images -
        case .coverPicture:
            return "Please pick cover picture."
        case .profilePicture:
            return "Please pick your profile picture."
        case .licensePicture:
            return "Please pick license picture."
        case .productPicture:
            return "Please pick product image."

        //MARK: - Cars -
        case .carPicture:
            return "Please pick car picture"
        case .carPlate:
            return "Please enter car palet."
        case .carModel:
            return "Please select car model."
        case .carType:
            return "Please Select car type."

        //MARK: - Date -
        case .emptyAge:
            return "Please enter the age."
        case .youngAge:
            return "If it is your age, please grow up first =D."
        case .notOldDate:
            return "Please selecte older date."
        case .notNewDate:
            return "Please selecte newer date."
        case .emptyDate:
            return "Please select the date."

        //MARK: - Message -
        case .emptyTitle:
            return "You Must Send Subject Title"
        case .emptyMessage:
            return "Please enter your message"
        case .emptyTitleType:
            return "Please enter title type"

        //MARK: - Bank -
        case .bankAccountHolder:
            return "Please enter bank account holder name"
        case .bankName:
            return "Plaese enter bank name"
        case .bankTransferImage:
            return "Please select bank transfer image"
        case .fromBankName:
            return "Plaese enter from bank name"
        case .bankAccountNumber:
            return "Please enter bank account number"

        //MARK: - category -
        case .emptyCategory:
            return "Please Select category"
        case .emptyPriceBefor:
            return "Please enter price before"
        case .emptyPriceAfter:
            return "Please enter proce after"
        case .priceBeforeSmallThanPriceAfter:
            return "price before is smaller than price after"
        case .emptyDescription:
            return "Please enter description"

        }
    }
}


//MARK: - class 3

import Foundation

struct ValidationService {

    //MARK: - Name -
    static func validate(firstName: String?) throws -> String {
        guard let firstName = firstName, !firstName.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyFirstName
        }
        guard firstName.count > 2 else {
            throw ValidationError.shortFirstName
        }
        guard firstName.count < 61 else {
            throw ValidationError.longFirstName
        }
        return firstName
    }
    static func validate(lastName: String?) throws -> String {
        guard let lastName = lastName, !lastName.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyLastName
        }
        guard lastName.count > 2 else {
            throw ValidationError.shortLastName
        }
        guard lastName.count < 61 else {
            throw ValidationError.longLastName
        }
        return lastName
    }
    static func validate(familyName: String?) throws -> String {
        guard let familyName = familyName, !familyName.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyFamilyName
        }
        guard familyName.count > 2 else {
            throw ValidationError.shortFamilyName
        }
        guard familyName.count < 61 else {
            throw ValidationError.longFamilyName
        }
        return familyName
    }
    static func validate(fullName: String?) throws -> String {
        guard let fullName = fullName, !fullName.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyFullName
        }
        guard fullName.count > 2 else {
            throw ValidationError.shortFullName
        }
        guard fullName.count < 61 else {
            throw ValidationError.longFullName
        }
        return fullName
    }
    static func validate(name: String?) throws -> String {
        guard let name = name, !name.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyName
        }
        guard name.count >= 6 else {
            throw ValidationError.shortName
        }
        guard name.count < 61 else {
            throw ValidationError.longName
        }
        return name
    }

    //MARK: - Phone -
    static func validate(phone: String?) throws -> String {
        guard let phone = phone, !phone.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyPhoneNumber
        }
        guard phone.isValidPhoneNumber(pattern: RegularExpression.saudiArabiaPhone.value) else {
            throw ValidationError.incorrectPhoneNumber
        }
        return phone
    }

    //MARK: - Verification code -
    static func validate(verificationCode: String?) throws -> String {
        guard let verificationCode = verificationCode, !verificationCode.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyVerificationCode
        }
        guard verificationCode.count == 4 else {
            throw ValidationError.incorrectVerificationCode
        }
        return verificationCode
    }

    //MARK: - Email -
    static func validate(email: String?) throws -> String {
        guard let email = email, !email.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyMail
        }
        guard email.isValidEmail() else{
            throw ValidationError.wrongMail
        }
        return email
    }

    //MARK: - Passwords -
    static func validate(password: String?) throws -> String {
        guard let password = password, !password.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyPassword
        }
        guard password.count >= 8 else {
            throw ValidationError.shortPassword
        }
        guard password.isValidatePassword() else {
            throw ValidationError.weakPassword
        }
        return password
    }
    static func validate(newPassword: String?) throws -> String {
        guard let newPassword = newPassword, !newPassword.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyNewPassword
        }
        guard newPassword.count > 5 else {
            throw ValidationError.shortNewPassword
        }
        return newPassword
    }
    static func validate(oldPassword: String?) throws -> String {
        guard let oldPassword = oldPassword, !oldPassword.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyOldPassword
        }
        guard oldPassword.count > 5 else {
            throw ValidationError.shortOldPassword
        }
        return oldPassword
    }
    static func validate(newPassword: String, confirmNewPassword: String?) throws -> String {
        guard let confirmNewPassword = confirmNewPassword, !confirmNewPassword.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyConfirmNewPassword
        }
        guard newPassword == confirmNewPassword else {
            throw ValidationError.notMatchPasswords
        }
        return newPassword
    }
    static func validate(newPassword: String, confirmPassword: String?) throws -> String {
        guard let confirmPassword = confirmPassword, !confirmPassword.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyConfirmPassword
        }
        guard newPassword == confirmPassword else {
            throw ValidationError.notMatchPasswords
        }
        return newPassword
    }
    static func validate(termesAgreed: Bool) throws {
        guard termesAgreed else {
            throw ValidationError.terms
        }
    }

    //MARK: - Location -
    static func validate(countryId: Int?) throws -> Int {
        guard let countryId = countryId else {
            throw ValidationError.emptyCountry
        }
        return countryId
    }
    static func validate(governorateId: Int?) throws -> Int {
        guard let governorateId = governorateId else {
            throw ValidationError.emptyGovernorate
        }
        return governorateId
    }
    static func validate(cityId: Int?) throws -> Int {
        guard let cityId = cityId else {
            throw ValidationError.emptyCity
        }
        return cityId
    }
    static func validate(areaId: Int?) throws -> Int {
        guard let areaId = areaId else {
            throw ValidationError.emptyArea
        }
        return areaId
    }
    static func validate(streetName: String?) throws -> String {
        guard let streetName = streetName, !streetName.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyStreet
        }
        return streetName
    }
    static func validate(department: String?) throws -> String {
        guard let department = department, !department.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyStreet
        }
        return department

    }
    static func validate(addressType: String?) throws -> String {
        guard let addressType = addressType, !addressType.trimWhiteSpace().isEmpty else {
            throw ValidationError.addressType
        }
        return addressType
    }
    static func validate(addressDetails: String?) throws -> String {
        guard let addressDetails = addressDetails, !addressDetails.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyAddressDetails
        }
        return addressDetails
    }
    static func validateLocation(address: String?, lat: Double?, long: Double?) throws -> (address: String, lat: Double, long: Double) {
        guard let address = address, let lat = lat, let long = long else {
            throw ValidationError.emptyLocation
        }
        return (address, lat, long)
    }

    //MARK: - Images -
    static func validate(profilePicture: Data?) throws -> Data {
        guard let profilePicture = profilePicture else {
            throw ValidationError.profilePicture
        }
        return profilePicture
    }
    static func validate(licensePicture: Data?) throws -> Data {
        guard let licensePicture = licensePicture else {
            throw ValidationError.licensePicture
        }
        return licensePicture
    }
    static func validate(productPicture: Data?) throws -> Data {
        guard let productPicture = productPicture else {
            throw ValidationError.productPicture
        }
        return productPicture
    }

    //MARK: - Cars -
    static func validate(carPicture: Data?) throws -> Data {
        guard let carPicture = carPicture else {
            throw ValidationError.carPicture
        }
        return carPicture
    }
    static func validate(carPlate: String?) throws -> String {
        guard let carPlate = carPlate, !carPlate.trimWhiteSpace().isEmpty else {
            throw ValidationError.carPlate
        }
        return carPlate
    }
    static func validate(carModel: Int?) throws -> Int {
        guard let carModel = carModel else {
            throw ValidationError.carModel
        }
        return carModel
    }
    static func validate(carType: Int?) throws -> Int {
        guard let carType = carType else {
            throw ValidationError.carType
        }
        return carType
    }

    //MARK: - Date -
    static func validate(age: String?) throws -> String {
        guard let age = age, !age.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyAge
        }
        guard age.toInt() > 0 else {
            throw ValidationError.youngAge
        }
        return age
    }
//    static func validate(oldDate: String?) throws -> String {
//        guard let oldDate = oldDate, let date = oldDate.toDate() else {
//            throw ValidationError.emptyDate
//        }
//        guard date.isBeforNow() else {
//            throw ValidationError.notOldDate
//        }
//        return oldDate
//    }
//    static func validate(newDate: String?) throws -> String {
//        guard let newDate = newDate, let date = newDate.toDate() else {
//            throw ValidationError.emptyDate
//        }
//        guard date.isBeforNow() else {
//            throw ValidationError.notNewDate
//        }
//        return newDate
//    }
    static func validate(date: String?) throws -> String {
        guard let date = date, !date.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyDate
        }
        return date
    }

    //MARK: - Message -
    static func validate(title: String?) throws -> String {
        guard let title = title, !title.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyTitle
        }
        return title
    }
    static func validate(titleType: String?) throws -> String {
        guard let titleType = titleType, !titleType.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyTitleType
        }
        return titleType
    }

    //MARK: - Bank -
    static func validate(bankAccountHolder: String?) throws -> String {
        guard let bankAccountHolder = bankAccountHolder, !bankAccountHolder.trimWhiteSpace().isEmpty else {
            throw ValidationError.bankAccountHolder
        }
        return bankAccountHolder
    }
    static func validate(bankName: String?) throws -> String {
        guard let bankName = bankName, !bankName.trimWhiteSpace().isEmpty else {
            throw ValidationError.bankName
        }
        return bankName
    }
    static func validate(fromBankName: String?) throws -> String {
        guard let fromBankName = fromBankName, !fromBankName.trimWhiteSpace().isEmpty else {
            throw ValidationError.fromBankName
        }
        return fromBankName
    }
    static func validate(bankAccountNumber: String?) throws -> String {
        guard let bankAccountNumber = bankAccountNumber, !bankAccountNumber.trimWhiteSpace().isEmpty else {
            throw ValidationError.bankAccountNumber
        }
        return bankAccountNumber
    }
    static func validate(bankTransferImage: Data?) throws -> Data {
        guard let bankTransferImage = bankTransferImage else {
            throw ValidationError.bankTransferImage
        }
        return bankTransferImage
    }

    //MARK: - Categories -
    static func validate(categoryId: Int?) throws -> Int {
        guard let categoryId = categoryId else {
            throw ValidationError.emptyCategory
        }
        return categoryId
    }
    static func validate(priceBefore: String?, priceAfter: String?) throws -> (priceBefore: String, priceAfter: String) {
        guard let priceBefore = priceBefore, !priceBefore.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyPriceBefor
        }
        guard let priceAfter = priceAfter, !priceAfter.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyPriceAfter
        }
        guard priceBefore.toDouble() > priceAfter.toDouble() else {
            throw ValidationError.priceBeforeSmallThanPriceAfter
        }
        return (priceBefore, priceAfter)

    }
    static func validate(description: String?) throws -> String {
        guard let description = description, !description.trimWhiteSpace().isEmpty else {
            throw ValidationError.emptyDescription
        }
        return description
    }

}


//do {
//
//            let creditinal = try ValidationService.validate(phone: self.creditinalTextField.text)
////            let creditinal = try ValidationService.validate(email: self.creditinalTextField.text)
//            let password = try ValidationService.validate(password: self.passwordTextField.text)
//
//            // API Services
//            self.loginWith(creditinal, password)
//
//        } catch {
//
//            // Show Alert With Errror
//            self.showErrorAlert(error: error.localizedDescription)
//        }
