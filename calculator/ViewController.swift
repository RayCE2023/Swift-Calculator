//
//  ViewController.swift
//  calculator
//
//  Created by Raymond Chen on 2019-05-18.
//  Copyright © 2019 Raymond Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currNum:Double = 0;
    var prevNum:Double = 0;
    var calculating:Bool = false;
    var isDecimal:Bool = false;
    var operationTag:Int = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func Numbers(_ sender: UIButton) {
        
        if calculating == true{
            label.text = String(sender.tag - 1);
            currNum = Double(label.text!)!;
            calculating = false;
            
        }
        
        else if sender.tag == 19 {
            if !(label.text?.contains("."))!{
                if label.text == ""{
                    label.text = label.text! + "0.";
                }
                else{
                    label.text = label.text! + ".";
                }
            }
        }
        else{
            label.text = label.text! + String(sender.tag - 1)
            currNum = Double(label.text!)!;
        }
    }
    
    @IBAction func Operators(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 13 && sender.tag != 18 && sender.tag != 19{
            
            prevNum = Double(label.text!)!;
            operationTag = sender.tag;
            calculating = true;
        }
        else if sender.tag == 18{
                //divide
            if operationTag == 14{
                label.text = String(prevNum / currNum)
                currNum = prevNum / currNum
            }
                //mutiply
            else if operationTag == 15{
                label.text = String(prevNum * currNum)
                currNum = prevNum * currNum
            }
                //subtract
            else if operationTag == 16{
                label.text = String(prevNum - currNum)
                currNum = prevNum - currNum
            }
                //add
            else if operationTag == 17{
                label.text = String(prevNum + currNum)
                 currNum = prevNum + currNum
            }
        }
            
        else if sender.tag == 12{
            currNum = (currNum *  -1);
            label.text = String(currNum);
            
        }
        else if sender.tag == 13 {
            currNum = (currNum / 100);
            label.text = String(currNum);
        }
         
            
        else if sender.tag == 11{
            label.text = "";
            prevNum = 0;
            currNum = 0;
            calculating = false;
            operationTag = 0;
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

