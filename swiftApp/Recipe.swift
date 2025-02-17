import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let ingredients: [String]
    let instructions: String
}