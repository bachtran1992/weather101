//
//  ViewController.swift
//  weather101
//
//  Created by iOS Student on 9/27/16.
//  Copyright © 2016 iOS Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lbl_background: UIImageView!
    
    @IBOutlet weak var lbl_city: UILabel!
    
    
    @IBOutlet weak var lbl_temp: UILabel!
    
    @IBOutlet weak var lbl_quotes: UILabel!
    
    @IBOutlet weak var lbl_CF: UILabel!
    
    
    var quotes = ["Never forget what you are, for surely the world will not. Make it your strength. Then it can never be your weakness. Armour yourself in it, and it will never be used to hurt you." , "Can a man still be brave if he's afraid? 'That is the only time a man can be brave","Death is so terribly final, while life is full of possibilities."]
    var city = ["King's Landing","Winterfell","Old Valyria"]
    
    var backgroundimage = ["Blood.png","Moon.png","Sun.png"]
    
    
    var CF: Bool = true
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func button_CF(_ sender: AnyObject) {
        var Temp101 = Double((lbl_temp.text)!)
        CF = !CF
        if (lbl_CF.text == "F")
        {
            lbl_CF.text = "C"
            Temp101 = (Temp101! - 32) / 1.8
            lbl_temp.text = String(format:"%.f", Temp101!)
            CF = true
        }
        else
        {
            Temp101 = Temp101! * 1.8 + 32
            lbl_temp.text = String(format:"%.f", Temp101!)
            lbl_CF.text = "F"
            CF = false
            
        }
    
    }
    



    
   
    @IBAction func button_refresh(_ sender: AnyObject) {
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        lbl_city.text = city[cityIndex]
        
        
        let quotesIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        lbl_quotes.text = quotes[quotesIndex]
        
        
        let imageIndex = Int(arc4random_uniform(UInt32(backgroundimage.count)))
        lbl_background.image = UIImage.init(named: backgroundimage[imageIndex])
        
        
        getTemp()
    }
    
    func getTemp() ->Void{
        let randomNumber = String(format: "%2.1f", randomTemp())
                    lbl_temp.text = randomNumber
    }
    
    func randomTemp() -> Double {
        if CF
        {
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
        }
        else
        {
            return (Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)) * 1.8 + 32
        }
    }
}




