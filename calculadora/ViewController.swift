//
//  ViewController.swift
//  Calculadora
//
//  Created by dani and Rafa on 09/01/2020.
//  Copyright © 2020 dani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    
    var ftt: Bool = true
    var memoria: Double = 0
    var resultado: Double = 0
    var ft: Bool = true
    var numeroAnterior: Double = 0
    var operacion = 0
    
    @IBOutlet weak var bt_num1: UIButton!
    @IBOutlet weak var bt_num2: UIButton!
    @IBOutlet weak var lb_pantalla: UILabel!
    @IBOutlet weak var lb_operacion: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    
    @IBAction func numeroPressed (_ sender : Any){
        let tag = (sender as! UIButton).tag
        if(ftt){
            lb_pantalla.text = String(tag)
            ftt = false
        }else{
        
        if((String(lb_pantalla.text!)=="0") || (String(lb_pantalla.text!)=="0.0")){
                        lb_pantalla.text = String(tag)
    
                    }else{
                       
                       lb_pantalla.text = String(lb_pantalla.text!) + String(tag)
                   }
        
        }
    }
    
    
    
    
    
    
    @IBAction func suma (_ sender : Any){
        if(String(lb_pantalla.text!)==""){
            return
        }
        if(ft == true){
            operacion = 1
        }
        numeroAnterior=Double(lb_pantalla.text!)!
        if(String(lb_operacion.text!)==""){
            lb_operacion.text = " " + String(numeroAnterior) + " +"
        }else{
          lb_operacion.text = String(lb_operacion.text!) + String(numeroAnterior) + " +"
        }
        
        lb_pantalla.text=""
        
        
        switch operacion{
        case 1: // +
            resultado = resultado + numeroAnterior
        case 2: // -
            resultado = resultado - numeroAnterior
        case 3: // *
        resultado = resultado * numeroAnterior
        case 4: // /
           resultado = resultado / numeroAnterior
        default:
            print("default")
        }
       ft = false
       operacion = 1
    
    }
    
    @IBAction func resta (_ sender : Any){
        if(String(lb_pantalla.text!)==""){
            return
        }
        if(ft == true){operacion = 2}
        numeroAnterior=Double(lb_pantalla.text!)!
        if(String(lb_operacion.text!)==""){
            lb_operacion.text = " " + String(numeroAnterior) + " -"
        }else{
          lb_operacion.text = String(lb_operacion.text!) + String(numeroAnterior) + " -"
        }
        
        lb_pantalla.text=""
        
        
        switch operacion{
        case 1: // +
            resultado = resultado + numeroAnterior
        case 2: // -
            if(ft){
              resultado = numeroAnterior - resultado
            }else{
              resultado = resultado - numeroAnterior
            }
        case 3: // *
            resultado = resultado * numeroAnterior
        case 4: // /
            resultado = resultado / numeroAnterior
        default:
            print("default")
        }
       ft = false
       operacion = 2
    
    }
    
    @IBAction func multi (_ sender : Any){
        if(String(lb_pantalla.text!)==""){
            return
        }
        if(ft == true){operacion = 1}
        numeroAnterior=Double(lb_pantalla.text!)!
        if(String(lb_operacion.text!)==""){
            lb_operacion.text = " " + String(numeroAnterior) + " *"
        }else{
          lb_operacion.text = String(lb_operacion.text!) + String(numeroAnterior) + " *"
        }
        
        lb_pantalla.text=""
        
        
        switch operacion{
        case 1: // +
            resultado = resultado + numeroAnterior
        case 2: // -
            if(ft){
              resultado = numeroAnterior - resultado
            }else{
              resultado = resultado - numeroAnterior
            }
        case 3: // *
            resultado = resultado * numeroAnterior
        case 4: // /
            resultado = resultado / numeroAnterior
        default:
            print("default")
        }
        ft = false
       operacion = 3
    
    }
    
    @IBAction func div(_ sender : Any){
        if(String(lb_pantalla.text!)==""){
            return
        }
        if(ft == true){operacion = 1}
        numeroAnterior=Double(lb_pantalla.text!)!
        if(String(lb_operacion.text!)==""){
            lb_operacion.text = " " + String(numeroAnterior) + " /"
        }else{
          lb_operacion.text = String(lb_operacion.text!) + String(numeroAnterior) + " /"
        }
        
        lb_pantalla.text=""
        
        
        switch operacion{
        case 1: // +
            resultado = resultado + numeroAnterior
        case 2: // -
            if(ft){
              resultado = numeroAnterior - resultado
            }else{
              resultado = resultado - numeroAnterior
            }
        case 3: // *
            resultado = resultado * numeroAnterior
        case 4: // /
            resultado = resultado / numeroAnterior
        default:
            print("default")
        }
       ft = false
       operacion = 4
    
    }
    
    
   
    
    
    
    
    @IBAction func operacionPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag
        
        switch tag {
        
            
        case 15: // =
            if(String(lb_pantalla.text!)==""){
                return
            }
            ft = true
            switch operacion {
            case 1: // +
                resultado = resultado + Double(lb_pantalla.text!)!

            case 2: // -
            resultado = resultado - Double(lb_pantalla.text!)!
            
            
            case 3: // *
     
            resultado = resultado * Double(lb_pantalla.text!)!
            
            case 4: // /
                resultado = resultado / Double(lb_pantalla.text!)!
            default:
                print("default")
            }
            lb_pantalla.text = String(resultado)
            memoria = resultado
            resultado = 0
            lb_operacion.text = ""
            ftt = true
            ft = true
            
        case 16: // AC
            
            ftt = true
            ft = true
            numeroAnterior=0
            operacion=0
            lb_operacion.text=""
            lb_pantalla.text="0"
        case 17: // ANS
            lb_pantalla.text=String(memoria)
            
        case 20: // .
            if(!lb_pantalla.text!.contains(".")){
                lb_pantalla.text = String(lb_pantalla.text!) + "."
            }
            
            
        default:
            print("default")
        }
        
        
    }
    
}
