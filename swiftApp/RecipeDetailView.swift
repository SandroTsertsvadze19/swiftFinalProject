import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @State private var ingredientStatus: [Bool]
    @State private var isFavorite: Bool = false
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self._ingredientStatus = State(initialValue: Array(repeating: false, count: recipe.ingredients.count))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Ingredients")
                    .font(.title2)
                    .padding(.top)
                
                ForEach(recipe.ingredients.indices, id: \.self) { index in
                    HStack {
                        Button(action: {
                            ingredientStatus[index].toggle()
                        }) {
                            HStack {
                                Image(systemName: ingredientStatus[index] ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(ingredientStatus[index] ? .green : .gray)
                                Text(recipe.ingredients[index])
                            }
                        }
                    }
                }
                
                Text("Instructions")
                    .font(.title2)
                    .padding(.top)
                
                Text(recipe.instructions)
                    .padding(.top, 4)
                
                Button(action: {
                    isFavorite.toggle()
                }) {
                    HStack {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .gray)
                        Text(isFavorite ? "Remove from Favorites" : "Add to Favorites")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle("Recipe Details")
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipes[0])
    }
}
