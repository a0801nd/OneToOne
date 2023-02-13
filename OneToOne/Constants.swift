import Foundation

struct K {
    static let appName = "OneToOne"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "FromRegisterToChat"
    static let loginSegue = "FromLoginToChat"
    
    struct BrandColors {
        static let marine = "Marine"
        static let white = "White"
        static let green = "Green"
    }
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
