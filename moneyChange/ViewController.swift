//
//  ViewController.swift
//  moneyChange
//
//  Created by Cristian Carreño on 04/11/2018.
//  Copyright © 2018 Cristian Carreño. All rights reserved.
//

import UIKit

let money=["Dolar","Euro","Libra","Peso","Yen"]

let estadosUnidos = Moneda(nombre: "Dolar", costo: 1.14, imgFondo: "mahatan", bandera:"banderaEEUU")

let espanya = Moneda(nombre: "Euro", costo: 1, imgFondo: "espanya", bandera:"banderaEspanyola")

let londres = Moneda(nombre: "Libra", costo: 0.87, imgFondo: "londres", bandera:"banderaLondinense")

let chile = Moneda(nombre: "Peso", costo: 781.85, imgFondo: "chile", bandera:"banderaChilena")

let japon = Moneda(nombre: "Yen", costo: 129.03, imgFondo: "japon", bandera:"banderaJapon")

let arrayMonedas = [estadosUnidos,espanya,londres,chile,japon]

var contador = 0

var diccionarioMoneda = ["Dolar":1.14,
                         "Euro":1,
                         "Libra":0.87,
                         "Peso":781.85,
                         "Yen":129.03]




class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var cantidad: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imagenFondo: UIImageView!
    @IBOutlet weak var bandera: UIImageView!
    @IBOutlet weak var nombreMoneda: UILabel!
    @IBOutlet weak var precioMoneda: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenFondo.image = UIImage(named:estadosUnidos.getImg())
        nombreMoneda.text = estadosUnidos.getNombre()
        precioMoneda.text = String(estadosUnidos.getCosto())
        bandera.image = UIImage(named:estadosUnidos.getBandera())
   
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return diccionarioMoneda.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return money[row];
    }
    
  
    
    @IBAction func btnConvert(_ sender: Any) {
     
        var valorObtenido: Int = Int(cantidad.text!)!
        
        
        
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

