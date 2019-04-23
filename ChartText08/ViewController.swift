//
//  ViewController.swift
//  ChartText08
//
//  Created by Thong, Chen Woon on 15/4/19.
//  Copyright © 2019 Thong, Chen Woon. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var txtTextBox: UITextField!
    @IBOutlet weak var chtChart: LineChartView!
    
    //var numbers : [Double] = []
    var numbers :[Double] = Array(repeating: 0.5, count: 50)
    var myTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func btnButton(_ sender: Any) {
        let input = Double(txtTextBox.text!)
        
        numbers.append(input!)
        txtTextBox.resignFirstResponder()
        updateGraph()
    }
    
    func updateGraph(){
        var lineChartEntry  = [ChartDataEntry]()
        for i in 0..<numbers.count {
            let value = ChartDataEntry(x: Double(i), y: numbers[i])
            lineChartEntry.append(value)
        }
        
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Number")
        
        line1.colors = [NSUIColor.blue]
        
        let data = LineChartData()
        
        data.addDataSet(line1)
        
        chtChart.data = data
        
        chtChart.chartDescription?.text = "My awesome chart"
    }
    
    @objc func randomDataPoints(timer:Timer){
        let number = drand48()
        numbers.append(number)
        if numbers.count > 50 {
            numbers.remove(at: 0)
        }
        
        updateGraph()
    }
    
    @IBAction func btnStart(_ sender: Any) {
        myTimer = Timer.scheduledTimer(timeInterval: 0.100, target:self, selector: #selector(ViewController.randomDataPoints), userInfo: nil, repeats: true)
    }
    @IBAction func btnStop(_ sender: Any) {
        myTimer.invalidate()
        
    }
}

