//
//  ContentView.swift
//  WeSplit
//
//  Created by Catherine on 10/8/19.
//  Copyright © 2019 Catherine Priazhnikova. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipAmount = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipAmount
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var totalAmount : Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipAmount = orderAmount / 100 * tipSelection
        let totalAmount = orderAmount + tipAmount
        
        return totalAmount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Number of people")) {
                    TextField("Number of people", text: $numberOfPeople)
                    .keyboardType(.decimalPad)
                }
                Section(header: Text("Check amount")) {
                    TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tips percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                .navigationBarTitle("We split")
                }
            }
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

