//
//  ContentView.swift
//  Shared
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-10-31.
//

import SwiftUI
import CoreData
import Combine

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State private var favoriteColor = 0

    var widthAnchor: CGSize {
        #if os(iOS)
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return CGSize(width: 180, height: 200)
        case .phone:
            return CGSize(width: UIScreen.main.bounds.width/2.3, height: UIScreen.main.bounds.width/2.1)
        default:
            return CGSize(width: UIScreen.main.bounds.width/2.3, height: UIScreen.main.bounds.width/2.1)
        }
        #endif
        #if os(macOS)
        return CGSize(width: 180, height: 200)
        #endif
    }

    var body: some View {
      #if os(iOS)
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            sidebar
        case .phone:
            tabview
        default:
            tabview
        }
      #endif
      #if os(macOS)
        sidebar
      #endif
    }

    private var suscriptions = Set<AnyCancellable>()
    
    init(){
        let pokemonData = DefaultGetPokemonUseCase<Int>()
        pokemonData.execute(with: 1)
        .receive(on: DispatchQueue.main)
        .sink { response in
            switch response {
            case .finished:
                print("Sucess!")
            case .failure(let error):
                print("Error \(error)")
            }
        } receiveValue: { pokemon in
            print(pokemon)
        }
        .store(in: &suscriptions)
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    let columns2 = [GridItem(.adaptive(minimum: 190))]
    
    private var pokedexGridView: some View {
        ScrollView {
            LazyVGrid(columns: columns2, spacing: 15) {
                ForEach(1..<500) { i in
                    PokedexCellView(
                        sizeContainer: .constant(widthAnchor),
                        viewModel: PokemonCellViewModel(number: i)
                    )
                }
            }
            .padding()
        }
        .navigationTitle("Pokedex")
    }
    
    private var sidebar: some View {
        NavigationView {
          List {
              NavigationLink(destination: pokedexGridView) {
                Label("Pokedex", systemImage: "star.fill")
              }
              .searchable(
                text: .constant("")
              )
              NavigationLink(destination: pokedexGridView) {
                Label("Trainer", systemImage: "figure.walk")
              }
              .searchable(
                text: .constant("")
              )
          }
          .toolbar {
              ToolbarItem(placement: .principal){
                  Picker("Attack", selection: $favoriteColor) {
                      Text("Strong").tag(0)
                      Text("Weak").tag(1)
                  }
                  .pickerStyle(.segmented)
              }
          }
        }
      }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
    #if os(iOS)
    var columns: [GridItem] = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width/2.3))]
      
    private var tabview: some View {
          TabView {
              NavigationView {
                ScrollView {
                  LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(1..<50) { i in
                        PokedexCellView(
                          sizeContainer: .constant(widthAnchor),
                            viewModel: PokemonCellViewModel(number: i)
                              )
                          }
                      }
                      .padding()
                  }
                  .navigationBarTitle("Pokedex", displayMode: .large)
                  .searchable(
                    text: .constant(""),
                    placement: .navigationBarDrawer(displayMode: .always)
                  )
                  
                  
                  .toolbar {
                      ToolbarItem(placement: .navigationBarLeading) {
                          Button(action: addItem) {
                            Label("User", systemImage: "speaker.fill")
                          }
                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            Picker("Attack", selection: $favoriteColor) {
                                Text("Strong").tag(0)
                                Text("Weak").tag(1)
                            }
                            .pickerStyle(.segmented)
                        }
                  }
              }
              .tabItem {
                  Label("Pokedex", systemImage: "star.fill")
              }
              
              PokedexCellView(sizeContainer: .constant(CGSize(
                width: 200, height: 100
              )), viewModel: PokemonCellViewModel(number: 1))
               .tabItem {
                   Label("Trainer", systemImage: "figure.walk")
               }
          }
          .font(.headline)
      }
    #endif
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
