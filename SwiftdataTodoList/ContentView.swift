//
//  ContentView.swift
//  SwiftdataTodoList
//
//  Created by Amrut.Gaikwad on 16/09/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \TodoItem.timestamp, order: .reverse)
    var items: [TodoItem]
    @State var newTask: String
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(items) { item in
                        HStack {
                            Text(item.task)
                                .strikethrough(item.isCompleted)
                            
                            Spacer()
                            
                            Button{
                                item.isCompleted.toggle()
                            } label: {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(item.isCompleted ? .green : .gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem(offsets:))
                }
                .padding()
                
                HStack {
                    TextField("Add a new task...", text: $newTask)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: addItem) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    .disabled(newTask.isEmpty)
                }
                .padding()
            }
            .navigationTitle("To-do List📝 - SwiftData")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
        
    func addItem() {
        guard !newTask.isEmpty else {
            return
        }
        let item = TodoItem(task: newTask)
        modelContext.insert(item)
        newTask = ""
    }
    
    func deleteItem(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

//#Preview {
//    ContentView(modelContext: TodoItem.self, items: [], newTask: "")
//}
