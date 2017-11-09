//
//  Converter.swift
//  Conversion Calculator
//
//  Created by Teodor Ivanov on 11/9/17.
//  Copyright © 2017 Teodor Ivanov. All rights reserved.
//

import Foundation

struct Converter {
    var label: String
    var inputUnit: String
    var outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String){
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}
