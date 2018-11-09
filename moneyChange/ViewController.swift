//
//  ViewController.swift
//  moneyChange
//
//  Created by Cristian Carreño on 04/11/2018.
//  Copyright © 2018 Cristian Carreño. All rights reserved.
//

import UIKit



let estadosUnidos = Moneda(nombre: "Dolar", costo: 1.14, imgFondo: "mahatan", bandera:"banderaEEUU")
let espanya = Moneda(nombre: "Euro", costo: 1, imgFondo: "espanya", bandera:"banderaEspanyola")
let londres = Moneda(nombre: "Libra", costo: 0.87, imgFondo: "londres", bandera:"banderaLondinense")
let chile = Moneda(nombre: "Peso", costo: 781.85, imgFondo: "chile", bandera:"banderaChilena")
let japon = Moneda(nombre: "Yen", costo: 129.03, imgFondo: "japon", bandera:"banderaJapon")


let arrayMonedas = [estadosUnidos,espanya,londres,chile,japon]


var contador = 0
var valor1: Double = 0.0
var valor2: Double = 0.0
var cantidadPedida: Double = 0
var resultado: Double = 0.0



class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var cantidad: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imagenFondo: UIImageView!
    @IBOutlet weak var bandera: UIImageView!
    @IBOutlet weak var nombreMoneda: UILabel!
    @IBOutlet weak var precioMoneda: UILabel!
    @IBOutlet weak var resultadoConversion: UILabel!
    @IBOutlet weak var ajustes: UIButton!
    @IBOutlet weak var btnConvert: UIButton!
    
    @IBOutlet weak var mensajeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenFondo.image = UIImage(named:estadosUnidos.getImg())
        nombreMoneda.text = estadosUnidos.getNombre()
        precioMoneda.text = String(estadosUnidos.getCosto())
        bandera.image = UIImage(named:estadosUnidos.getBandera())
        btnConvert.layer.cornerRadius = 10
        cantidad.delegate = self
    mensajeLabel.text = ""
    }
    
  
/* Metodo que no permite que se acepten caracteres no especificados en la variable allowedharacters
 */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:
        NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharcterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharcterSet)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayMonedas.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayMonedas[row].getNombre()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: NSInteger, inComponent component: Int) {
        
        if(component==0){
            valor1 = arrayMonedas[row].getCosto()
            print("seleccion1=",valor1)
        }
        if(component==1){
            valor2 = arrayMonedas[row].getCosto()
            print("seleccion2=",valor2)        }
    }
    
    
    
    @IBAction func btnConvert(_ sender: Any) {
        
        if valor1.isEqual(to: 0.0){
            valor1=arrayMonedas[0].getCosto()
        }
        if valor2.isEqual(to: 0.0){
            valor2=arrayMonedas[0].getCosto()
        }
        if (cantidad.text!.isEmpty){
            print("no hay cantidad!")
            
            mostrarAlerta(title: "ERROR", message: "No has introducido cantidad!")
            
            
            
        }else if(cantidad.text=="9999"){
            ajustes.isHidden = false
        }else{
            cantidadPedida = Double(cantidad.text!)!
            resultado = ((cantidadPedida * valor2)/valor1).rounded()
            
            print("valor1= ", valor1 ," valor2= ", valor2)
            resultadoConversion.text = String(resultado)
        }
    }

    func mostrarAlerta(title: String, message: String) {
      
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let cancelar = UIAlertAction(title: "Cancelar", style: .default, handler: {(action) in
            
                self.mensajeLabel.text = ""
        })
        
                alertaGuia.addAction(cancelar)
        present(alertaGuia, animated: true, completion: nil)
        
    }
  
  
    @IBAction func btnNext(_ sender: Any) {
          contador += 1
        if(contador < arrayMonedas.count){
            imagenFondo.image = UIImage(named:arrayMonedas[contador].getImg())
            nombreMoneda.text = arrayMonedas[contador].getNombre()
            precioMoneda.text = String(arrayMonedas[contador].getCosto())
            bandera.image = UIImage(named:arrayMonedas[contador].getBandera())

        }else{
            print("no hay más Monedas")
            contador=arrayMonedas.count-1
        }
        
    }
  
    
    
    @IBAction func btnBefore(_ sender: Any) {
        contador -= 1
        if(contador <= -1){
            print("no hay más Monedas lo siento")
            contador=0
        }else{
           imagenFondo.image = UIImage(named:arrayMonedas[contador].getImg())
           nombreMoneda.text = arrayMonedas[contador].getNombre()
           precioMoneda.text = String(arrayMonedas[contador].getCosto())
           bandera.image = UIImage(named:arrayMonedas[contador].getBandera())
        }
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

