//
//  ViewController.swift
//  IMC
//
//  Created by gui on 12/05/19.
//  Copyright © 2019 gui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculate(_ sender: Any) {
        if let peso = Double(tfWeight.text!), let altura = Double(tfHeight.text!) {
            imc  = peso / pow(altura, 2)
            showResults()
        }
        
    }
    
    func showResults() {
        var result : String = ""
        var image : String = ""
        
        switch imc {
        case 0..<16:
            result = "Magreza"
            image = "abaixo"
        case 16..<18.5 :
            result = "Abaixo do peso"
            image = "abaixo"
        case 18.5..<25:
            result = "Peso Ideal"
            image = "ideal"
        case 25..<30 :
            result = "Sobrepeso"
            image = "sobre"
        default:
            result = "Obesidade"
            image = "obesidade"
        }
        
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        
        viResult.isHidden = false
        view.endEditing(true)
    }
    
}

