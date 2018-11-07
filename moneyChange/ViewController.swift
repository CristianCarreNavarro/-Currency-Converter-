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

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var cantidad: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imagenFondo: UIImageView!
    @IBOutlet weak var bandera: UIImageView!
    @IBOutlet weak var nombreMoneda: UILabel!
    @IBOutlet weak var precioMoneda: UILabel!
    @IBOutlet weak var resultadoConversion: UILabel!
    
    @IBOutlet weak var ajustes: UIButton!
    @IBOutlet weak var btnConvert: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenFondo.image = UIImage(named:estadosUnidos.getImg())
        nombreMoneda.text = estadosUnidos.getNombre()
        precioMoneda.text = String(estadosUnidos.getCosto())
        bandera.image = UIImage(named:estadosUnidos.getBandera())
        btnConvert.layer.cornerRadius = 10
   
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component==0){
            valor1 = arrayMonedas[row].getCosto()
            print("seleccion1=",valor1)
        }
        if(component==1){
            valor2 = arrayMonedas[row].getCosto()
            print("seleccion2=",valor2)        }
    }
    
    @IBAction func btnConvert(_ sender: Any) {
        
        if (cantidad.text!.isEmpty){
            print("no hay cantidad!")
        }else if(cantidad.text=="9999"){
            ajustes.isHidden = false
        }else{
            cantidadPedida = Double(cantidad.text!)!
            resultado = ((cantidadPedida * valor2)/valor1)
            print("valor1= ", valor1 ," valor2= ", valor2)
            resultadoConversion.text = String(resultado)
        }
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

