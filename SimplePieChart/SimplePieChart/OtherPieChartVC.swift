//
//  OtherPieChartVC.swift
//  SimplePieChart
//
//  Created by Buse ERKUŞ on 14.05.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit
import Charts
class OtherPieChartVC: UIViewController {

    @IBOutlet weak var iosStepper: UIStepper!
    @IBOutlet weak var macStepper: UIStepper!
    @IBOutlet weak var pieChart: PieChartView!
    
    var iosDataEntry = PieChartDataEntry(value: 0)
    var macDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = "CHART"
        pieChart.chartDescription?.textAlign = .center
        
        iosDataEntry.value = iosStepper.value
        iosDataEntry.label = "iOS"
        
        macDataEntry.value = macStepper.value
        macDataEntry.label = "macOS"
        
        
        
        numberOfDownloadsDataEntries = [iosDataEntry,macDataEntry]
        
        updateChartData()
    }
    
    @IBAction func changeiOS(_ sender: Any) {
        iosDataEntry.value = (sender as AnyObject).value
        updateChartData()
    }
    
    @IBAction func changeMac(_ sender: Any) {
        macDataEntry.value = (sender as AnyObject).value
        updateChartData()
    }
    
    func updateChartData(){
        
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colorss = [#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)]
        chartDataSet.colors = colorss as! [NSUIColor]
        pieChart.data = chartData
    }
    
}
