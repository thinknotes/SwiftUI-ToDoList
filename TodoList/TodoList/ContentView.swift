//
//  ContentView.swift
//  TodoList
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfTask: Int = 0
    @State private var taskName: String = ""
    @State private var task: [String] = []
    @State private var alert: Bool = false
    @State private var buttonNotInUse: Bool = true
    var body: some View {
        NavigationView{
            VStack {
                Text("Number of task: \(numberOfTask)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                TextField("Enter task name", text: $taskName)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                
                HStack {
//
                    
                    
                    
                    Button(action: {
                        if taskName.isEmpty {
                            alert = true
                        } else {
                            task.append(taskName)
                            numberOfTask += 1
                        }
                        
                    }, label: {
                        Text("Add Task")
                            .padding() //gives padding
                            .background(taskName.count != 0 ? Color.blue : Color.gray)//set the background color to blue
                            .cornerRadius(10) //gives a corner radius of 10
                            .foregroundColor(.white) //set the text color to white
                           
                           
                        
                    })
                    .alert(isPresented: $alert) {
                            Alert(
                            title: Text("Empty Task"),
                            message: Text("Your can not add a empty task")
                                )
                        }
                    
                  
                    
                    Button(action: {
                        task.removeAll()
                        numberOfTask = 0
                    }, label: {
                        Text("Remove All Task")
                            .padding() //gives padding
                            .background(task.isEmpty ? Color.gray : Color.blue)//set the background color to blue
                            .cornerRadius(10) //gives a corner radius of 10
                            .foregroundColor(.white) //set the text color to white
                    })
                }
                .disabled(taskName.count == 0)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                
                if taskName.isEmpty {
                    List {
                        ForEach(task, id: \.self) { tasks in
                            Text("\(tasks)")
                            
                        }
                    }
                } else {
                    List {
                        ForEach(task, id: \.self) { tasks in
                            Text("\(tasks)")
                            
                        }
                        .onDelete(perform: { indexSet in
                            deleteTask(offset: indexSet)
                            numberOfTask -= 1
                        })
                    }
                    
                   
                }
                
                Spacer()
                
               
                    
            }
            .navigationTitle("Todo List")
        }
        .padding()
       
        
        
    }
    
    func deleteTask(offset: IndexSet) {
        task.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
