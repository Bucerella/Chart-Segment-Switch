//
//  ViewController.swift
//  SimplePieChart
//
//  Created by Buse ERKUŞ on 14.05.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPieChart()
    }
    
    func setupPieChart(){
        pieView.chartDescription?.enabled = false
        pieView.drawHoleEnabled = false // Donut görünümü alır
        pieView.rotationAngle = 0
        pieView.rotationEnabled = false // PieChartın dönmesini sağlıyor 360 derece.
        pieView.isUserInteractionEnabled = true // Kullanıcı dilimlerin üzerine basılabilir hale gelir
       
    
        
        
        var entries: [PieChartDataEntry] = Array()
        
        entries.append(PieChartDataEntry(value: 45.0, label: "Takeout")) //Yüzdelerini ve isimleirni ekledi
        entries.append(PieChartDataEntry(value: 30.0, label: "Chicken"))
        entries.append(PieChartDataEntry(value: 20.0, label: "Soft Drink"))
        entries.append(PieChartDataEntry(value: 10.0, label: "Water"))
        entries.append(PieChartDataEntry(value: 40.0, label: "Home Meals"))
        
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        
        let c1 = NSUIColor(hex: 0x3a015c)
        let c2 = NSUIColor(hex: 0x4f0147)
        let c3 = NSUIColor(hex: 0x350123c)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001c)

        dataSet.colors = [c1,c2,c3,c4,c5]
        dataSet.drawValuesEnabled = false
        

        pieView.data = PieChartData(dataSet: dataSet)
        
    }
    
    @IBAction func goToOther(_ sender: Any) {
        performSegue(withIdentifier: "otherPage", sender: nil)
            //Diğer sayfaya geçiş sağlandı
    }


}

