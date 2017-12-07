//
//  ConversionCalculatorViewController.swift
//  Conversion Calculator
//
//  Created by Teodor Ivanov on 11/8/17.
//  Copyright © 2017 Teodor Ivanov. All rights reserved.
//

import UIKit

class ConversionCalculatorViewController: UIViewController {
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var inputText = ""
    var outputText = ""
    var isPositive = true
    var converters = [Converter]()
    var currentConverter = Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set up converter Array
        converters.append(Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"))
        converters.append(Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"))
        converters.append(Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"))
        converters.append(Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi"))
        // Do any additional setup after loading the view.
        outputDisplay.text = currentConverter.outputUnit
        inputDisplay.text = currentConverter.inputUnit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Handles the UIAlertController to change.
    @IBAction func converterIsTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Choose converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        for converter in converters {
            alert.addAction(UIAlertAction(title: converter.label, style: UIAlertActionStyle.default) {
                (_) in
                self.outputDisplay.text = converter.outputUnit
                self.inputDisplay.text = self.inputText + " " + converter.inputUnit
                self.currentConverter.label = converter.label
                self.currentConverter.outputUnit = converter.outputUnit
                self.currentConverter.inputUnit = converter.inputUnit
                if let input = Double(self.inputText){
                    self.outputDisplay.text = self.determineCalculation(input: input, currentConverter: self.currentConverter)
                }
            })
        }
            
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        inputDisplay.text = "" + self.currentConverter.inputUnit
        outputDisplay.text = "" + self.currentConverter.outputUnit
        inputText = ""
        isPositive = true
    }
    
    @IBAction func flipSignButton(_ sender: UIButton) {
        if isPositive {
            inputText = "-" + inputText
            isPositive = false
        }else {
            inputText.removeFirst()
            isPositive = true
        }
        if let input = Double(inputText){
             self.inputDisplay.text = inputText + " " + currentConverter.inputUnit
            self.outputDisplay.text = determineCalculation(input: input, currentConverter: currentConverter)
        }
    }
    
    @IBAction func calculatorButtonTapped(sender: UIButton) {
        inputText.append(sender.currentTitle!)
        inputDisplay.text = inputText + " " + currentConverter.inputUnit
        if let input = Double(inputText){
            self.outputDisplay.text = determineCalculation(input: input, currentConverter: currentConverter)
        }
    }
    
    func determineCalculation(input: Double, currentConverter: Converter) -> String{
        var output = 0.0
        switch(currentConverter.label){
            case "fahrenheit to celcius":
                //FahrenheitToCelcius T(°C) = (T(°F) - 32) × 5/9
                output = ((input - 32) * (5/9))
                break
            case "celcius to fahrenheit":
                //celciusToFahrenheit T(°F) = T(°C) × 9/5 + 32
                output = (input * (9/5)) + 32
                break
            case "miles to kilometers":
                 //milesToKilometers 1 mile * 1.609344 = km
                output = input * 1.609344
                break
            case "kilometers to miles":
                //kmTomiles 1 km * 0.6214 mi = mile
                output = input * 0.6214
                break
            default:
                break
        }
        outputText = String.localizedStringWithFormat("%.2f", output) + " " + currentConverter.outputUnit
        return outputText
    }
}
