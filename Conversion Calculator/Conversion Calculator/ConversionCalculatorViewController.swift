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
    
    var converters = [Converter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set up converter Array
        converters.append(Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"))
        converters.append(Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"))
        converters.append(Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"))
        converters.append(Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi"))
        // Do any additional setup after loading the view.
        outputDisplay.text = converters[0].outputUnit
        inputDisplay.text = converters[0].inputUnit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterIsTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Choose converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let fahrenheitToCelcius = UIAlertAction(title: converters[0].label, style: UIAlertActionStyle.default) {
            (_) in
            self.outputDisplay.text = self.converters[0].outputUnit
            self.inputDisplay.text = self.converters[0].inputUnit
        }
        let celciusToFahrenheit = UIAlertAction(title: converters[1].label, style: UIAlertActionStyle.default) {
            (_) in
            self.outputDisplay.text = self.converters[1].outputUnit
            self.inputDisplay.text = self.converters[1].inputUnit
        }
        let milesToKilometers = UIAlertAction(title: converters[2].label, style: UIAlertActionStyle.default) {
            (_) in
            self.outputDisplay.text = self.converters[2].outputUnit
            self.inputDisplay.text = self.converters[2].inputUnit
        }
        let kilometerToMiles = UIAlertAction(title: converters[3].label, style: UIAlertActionStyle.default) {
            (_) in
            self.outputDisplay.text = self.converters[3].outputUnit
            self.inputDisplay.text = self.converters[3].inputUnit
        }
        
        alert.addAction(fahrenheitToCelcius)
        alert.addAction(celciusToFahrenheit)
        alert.addAction(milesToKilometers)
        alert.addAction(kilometerToMiles)
        
        self.present(alert, animated: true, completion: nil)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
