//
//  ContentView.swift
//  Shared
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-10-31.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var widthAnchor: CGSize {
        #if os(iOS)
            return CGSize(width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/2.2)
        #endif
        #if os(macOS)
            return CGSize(width: 200, height: 200)
        #endif
    }

    var body: some View {
        #if os(iOS)
            tabview
        #endif
        #if os(macOS)
            sidebar
        #endif
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private var sidebar: some View {
        NavigationView {
          List {
              NavigationLink(destination: PokemonGridView(sizeContainer: .constant(CGSize(width: 200, height: 100)))) {
              Label("Dashboard", systemImage: "square.dashed")
            }
            // ...
        }
          
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<50) { i in
                        PokemonGridView(
                            sizeContainer: .constant(widthAnchor),
                            progressValue: 0.3
                        )
                    }
                }
                .padding()
            }
        }
      }
    
        var columns: [GridItem] = [GridItem(.adaptive(minimum: 200))]
      
      private var tabview: some View {
          TabView {
              NavigationView {
              ScrollView {
                  LazyVGrid(columns: columns, spacing: 5) {
                      ForEach(0..<50) { i in
                          PokemonGridView(
                              sizeContainer: .constant(widthAnchor),
                              progressValue: 0.3
                          )
                      }
                  }
                  .padding()
              }
              .searchable(text: .constant(""))
              .navigationTitle("Globedex")
              .toolbar {
                  ToolbarItem {
                      Button(action: addItem) {
                          Label("User", systemImage: "person.crop.circle.fill")
                      }
                  }
                }
              }
              .foregroundColor(.black)
               .tabItem {
                   Image(systemName: "1.square.fill")
                   Text("First")
               }
              PokemonGridView(sizeContainer: .constant(CGSize(width: 200, height: 100)))
               .tabItem {
                   Image(systemName: "2.square.fill")
                   Text("Second")
               }
              PokemonGridView(sizeContainer: .constant(CGSize(width: 200, height: 100)))
               .tabItem {
                   Image(systemName: "3.square.fill")
                   Text("Third")
               }
          }
          .font(.headline)
      }
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
