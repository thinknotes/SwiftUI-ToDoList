//
//  ContentView.swift
//  TodoList
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfTask: Int = 0 //Keep track of number of task
    @State private var taskName: String = "" //Is the task Name
    @State private var task: [String] = [] //Holds track of all the task
    @State private var alert: Bool = false //Alert variable
    var body: some View {
        NavigationView{ //Set the view for title
            VStack { //Holds the elements in a vertical container
                Text("Number of task: \(numberOfTask)") //Shows the number of task
                    .frame(maxWidth: .infinity, alignment: .leading) //Helps with aliging the frame
                    .padding() //Adds padding on text
                
                TextField("Enter task name", text: $taskName) //TextField to enter task name
                    .padding()//Adds padding on text
                    .textFieldStyle(.roundedBorder) //Style the textfield broder
                
                HStack { //Wraps the view in a vertical container
//
                    
                    
                    
                    Button(action: { //Button to add task
                        if taskName.isEmpty {//check if taskname is empty
                            alert = true //set the alert to true
                        } else { //Else
                            task.append(taskName) //add task name to the task array
                            numberOfTask += 1 //Update the counter
                        }
                        
                    }, label: {
                        Text("Add Task") //Button text
                            .padding() //gives padding
                            .background(taskName.count != 0 ? Color.blue : Color.gray)//set the background color to blue
                            .cornerRadius(10) //gives a corner radius of 10
                            .foregroundColor(.white) //set the text color to white
                           
                           
                        
                    })
                    .alert(isPresented: $alert) { //Shows the alert
                            Alert( //Alert
                            title: Text("Empty Task"), //Alert text
                            message: Text("Your can not add a empty task") //Alert message
                                )
                        }
                    
                  
                    
                    Button(action: { //Button to remove text
                        task.removeAll() //removes everything in task array
                        numberOfTask = 0 //reset the counter to zero
                    }, label: {
                        Text("Remove All Task") //Button text
                            .padding() //gives padding
                            .background(task.isEmpty ? Color.gray : Color.blue)//set the background color to blue
                            .cornerRadius(10) //gives a corner radius of 10
                            .foregroundColor(.white) //set the text color to white
                    })
                }
                .padding() //gives padding
                .frame(maxWidth: .infinity, alignment: .leading) //set the frame width
                
                
                
                if taskName.isEmpty { //If taskName is empty
                    List { //Shows it in a list
                        ForEach(task, id: \.self) { tasks in //Display all the data in task
                            Text("\(tasks)") //Shows task title
                            
                        }
                    }
                } else { //Else
                    List { //Shows it in a list
                        ForEach(task, id: \.self) { tasks in  //Display all the data in task
                            Text("\(tasks)") //Shows task title
                            
                        }
                        .onDelete(perform: { indexSet in //perform the delete action with swiple action
                            deleteTask(offset: indexSet) //calls the delete task function
                            numberOfTask -= 1 //set the counter to -1
                        })
                    }
                    
                   
                }
                
                Spacer() //Space out the view
                
               
                    
            }
            .navigationTitle("Todo List") //Set the title for the view
        }
        .padding() //Add padding
       
        
        
    }
    
    func deleteTask(offset: IndexSet) { //create a function with take IndexSet for arrays
        task.remove(atOffsets: offset) //removes from task using the data from IndexSet
    }
}

#Preview {
    ContentView()
}
