//
//  ViewController.swift
//  moneyChange
//
//  Created by Cristian Carreño on 04/11/2018.
//  Copyright © 2018 Cristian Carreño. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagenFondo: UIImageView!
    
    @IBOutlet weak var bandera: UIImageView!
    
    @IBOutlet weak var nombreMoneda: UILabel!
    
    @IBOutlet weak var precioMoneda: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      imagenFondo.image = UIImage(named: "mahatan")
      nombreMoneda.text = "Dolar"
      precioMoneda.text = "1.14$"
     bandera.image = UIImage(named:"banderaEEUU")
    }

    @IBAction func btnNext(_ sender: Any) {
        
        if(imagenFondo.image == UIImage(named:"mahatan")){
            imagenFondo.image = UIImage(named: "espanya")
            nombreMoneda.text = "Euro"
            precioMoneda.text = "166.386 pesetas"
            bandera.image = UIImage(named:"banderaEspanyola")
        }
       else if(imagenFondo.image == UIImage(named:"espanya")){
            imagenFondo.image = UIImage(named: "londres")
            nombreMoneda.text = "Libra"
            precioMoneda.text = "0,87£"
            bandera.image = UIImage(named:"banderaLondinense")
            
            
        }
        else if(imagenFondo.image == UIImage(named:"londres")){
            imagenFondo.image = UIImage(named: "chile")
            nombreMoneda.text = "Peso"
            precioMoneda.text = "781,85₱"
            bandera.image = UIImage(named:"banderaChilena")
        }
        else if(imagenFondo.image == UIImage(named:"chile")){
            imagenFondo.image = UIImage(named: "japon")
            nombreMoneda.text = "Yen"
            precioMoneda.text = "129,03¥"
            bandera.image = UIImage(named:"banderaJapon")
        }
        
    }
    
    @IBAction func btnBefore(_ sender: Any) {
        if(imagenFondo.image == UIImage(named:"espanya")){
            imagenFondo.image = UIImage(named: "mahatan")
            nombreMoneda.text = "Dolar"
            precioMoneda.text = "1.14$"
            bandera.image = UIImage(named:"banderaEEUU")
        }
       else if(imagenFondo.image == UIImage(named:"londres")){
            imagenFondo.image = UIImage(named: "espanya")
            nombreMoneda.text = "Euro"
            precioMoneda.text = "166.386 pesetas"
            bandera.image = UIImage(named:"banderaEspanyola")
            
        }
        else if(imagenFondo.image == UIImage(named:"chile")){
            imagenFondo.image = UIImage(named: "londres")
            nombreMoneda.text = "Libra"
            precioMoneda.text = "0,87£"
            bandera.image = UIImage(named:"banderaLondinense")
        }
        else if(imagenFondo.image == UIImage(named:"japon")){
            imagenFondo.image = UIImage(named: "chile")
            nombreMoneda.text = "Peso"
            precioMoneda.text = "781,85₱"
            bandera.image = UIImage(named:"banderaChilena")
        }
    }
}

