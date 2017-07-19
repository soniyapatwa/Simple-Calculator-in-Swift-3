//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Soniya Patwa on 20/06/17.
//  Copyright © 2017 RJio. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    var isCalculationBeingPerformed = false
    var previousNumber: Double = 0;
    var inputNumber: Double = 0;
    var operationToBePerformed: Int = 0;
    
    @IBOutlet var resultLabel: UILabel!
    @IBAction func numberPressed(_ sender: UIButton)
    {
        if(isCalculationBeingPerformed)
        {
            previousNumber = inputNumber
            resultLabel.text = String(sender.tag-1)
            inputNumber = Double(resultLabel.text!)!
            isCalculationBeingPerformed = false
        }
        else
        {
            resultLabel.text = resultLabel.text! + String(sender.tag-1)
            inputNumber = Double(resultLabel.text!)!
        }
    }
    
    @IBAction func actionButtonPressed(_ sender: UIButton)
    {
        isCalculationBeingPerformed = true

        if(resultLabel.text != "")
        {
            switch sender.tag
            {
            case 11:
                resultLabel.text = ""
                inputNumber = 0
                previousNumber = 0
                isCalculationBeingPerformed = false
                
            case 12:
                resultLabel.text = "/"
                operationToBePerformed = 12

            case 13:
                resultLabel.text = "*"
                operationToBePerformed = 13
                
            case 14:
                resultLabel.text = "+"
                operationToBePerformed = 14
                
            case 15:
                resultLabel.text = "-"
                operationToBePerformed = 15
                
            case 16:
                var result:Double = 0
                switch operationToBePerformed
                {
                case 12:
                    result = previousNumber / inputNumber
                    resultLabel.text = String(result)
                case 13:
                    result = previousNumber * inputNumber
                    resultLabel.text = String(result)
                case 14:
                    result = previousNumber + inputNumber
                    resultLabel.text = String(result)
                case 15:
                    result = previousNumber - inputNumber
                    resultLabel.text = String(result)
                default:
                    resultLabel.text = ""
                }
                inputNumber = 0
                previousNumber = 0
                isCalculationBeingPerformed = false

            default:
                resultLabel.text = ""
            }
        }
        else
        {
            
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}

