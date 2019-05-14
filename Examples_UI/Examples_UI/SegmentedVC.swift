//
//  SegmentedVC.swift
//  Examples_UI
//
//  Created by Buse ERKUŞ on 14.05.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit
import TinyConstraints

class SegmentedVC: UIViewController {

    let items = ["Black","Orange","Red"]
    
    lazy var segControl: UISegmentedControl = {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 9
        control.layer.borderWidth = 1
        control.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        control.tintColor = UIColor.white //Seçili olan yerin arka plan rengi
        control.addTarget(self, action: #selector(handlerSegment(_:)), for: .valueChanged)//value changed de değişim olacak ise yazılır. touchupinside yapsak idik değişir idi ama arka plan rengi değişmezdi.
        control.layer.masksToBounds = true
        return control
    }()
    
    @objc fileprivate func handlerSegment(_ sender: UISegmentedControl){
       
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .black

        case 1:
            view.backgroundColor = .orange
        case 2:
            view.backgroundColor = .red
        default:
            view.backgroundColor = .black

        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupViews()
    }
    fileprivate func setupViews(){
        
        view.backgroundColor = .black
        
        view.addSubview(segControl)
        segControl.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 12, left: 12, bottom: 0 ,right: 12), usingSafeArea: true)
        segControl.height(50)
    }
}
