import SwiftUI

let recipes = [
    Recipe(
        name: "Pasta",
        ingredients: ["200g pasta", "2 cups of tomato sauce", "1 tsp salt"],
        instructions: "1. Boil water. 2. Cook pasta for 10 minutes. 3. Drain and mix with sauce."
    ),
    Recipe(
        name: "Salad",
        ingredients: ["Lettuce", "Tomato", "Cucumber", "Olive oil"],
        instructions: "1. Chop all vegetables. 2. Mix together. 3. Add olive oil and serve."
    ),
    Recipe(
        name: "Pizza",
        ingredients: ["Pizza dough", "Tomato sauce", "Mozzarella cheese"],
        instructions: "1. Spread sauce on dough. 2. Add cheese. 3. Bake at 200°C for 15 minutes."
    )
]


struct ContentView: View {
    var body: some View {
        NavigationView {
            List(recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    Text(recipe.name)
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
