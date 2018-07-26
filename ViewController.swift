//
//  ViewController.swift
//  Circuit Thinger
//
//  Created by Spenser Kline on 7/26/18.
//  Copyright © 2018 Spencer Kline. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet var gate: UILabel!
    @IBOutlet weak var scrollGatePicker: UIPickerView!
    var pickerData: [String] = [String]()
    var pickedGate: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //connect data
        self.scrollGatePicker.dataSource = self
        self.scrollGatePicker.delegate = self
        
        //Data for picker
        pickerData = ["Input(Active High)","NAND","NOR","AND","OR","NOT","XOR"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   //number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //number of rows od data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //the data to reutrn for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedGate = pickerData[row]
    }
    
    func createGate(gate: String){
        var imageName = ""
        if(gate == "AND"){
            imageName = "andGate.png"
        }else if(gate == "NAND"){
            imageName = "nandGate.png"
        }else if(gate == "NOR"){
            imageName = "norGate.png"
        }else if(gate == "OR"){
            imageName = "orGate.png"
        }else if(gate == "XOR"){
            imageName = "xorGate.png"
        }else if(gate == "NOT"){
            imageName = "notGate.png"
        }
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 100, y: 100, width: 30, height: 50)
        imageView.isUserInteractionEnabled = true;
        
        view.addSubview(imageView)
    }
    
   
    
    
    @IBAction func chooseGate(_ sender: UIButton) {
        gate.text = pickedGate
        var log = Gate(gateType: pickedGate);
        if(pickedGate != "Input(Active High)"){
        createGate(gate: pickedGate)
        }
    }
}

