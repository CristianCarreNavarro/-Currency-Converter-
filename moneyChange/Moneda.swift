//
//  Moneda.swift
//  moneyChange
//
//  Created by Cristian Carreño on 05/11/2018.
//  Copyright © 2018 Cristian Carreño. All rights reserved.
//

import Foundation



public class Moneda{
    private var nombre: String
    private  var costo: Double
    private var imgFondo: String
    private var bandera: String
    init(nombre: String, costo: Double, imgFondo: String, bandera: String) {
        self.nombre = nombre
        self.costo = costo
        self.imgFondo = imgFondo
        self.bandera = bandera
    }
    func getNombre()->String{
        return nombre
    }
    func getCosto()->Double{
        return costo
    }
    func getImg()->String{
        return imgFondo
    }
    func getBandera()->String{
        return bandera
    }
    func setCosto(valor : Double){
        self.costo = valor
    }
}
