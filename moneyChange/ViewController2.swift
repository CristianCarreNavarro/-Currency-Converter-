//
//  ViewController2.swift
//  moneyChange
//
//  Created by Cristian Carreño on 06/11/2018.
//  Copyright © 2018 Cristian Carreño. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var apply: UIButton!
    @IBOutlet weak var nuevoValor: UITextField!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return arrayMonedas.count;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayMonedas[row].getNombre()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            valor1 = arrayMonedas[row].getCosto()
            print("seleccion=",valor1)
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        apply.layer.cornerRadius = 10
        back.layer.cornerRadius = 10
    }
  
    @IBAction func aplicarNuevoValor(_ sender: Any) {
        
        if (nuevoValor.text!.isEmpty){
            print("no hay cantidad!")
        }else{
        
        for moneda in arrayMonedas{
            if (moneda.getCosto()==valor1){
               
                moneda.setCosto(valor: Double(nuevoValor.text!)!)
            }
          }
        }
    }
}
