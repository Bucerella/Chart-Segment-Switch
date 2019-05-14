//
//  ViewController.swift
//  Examples_UI
//
//  Created by Buse ERKUŞ on 14.05.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit
import TinyConstraints

class RootViewController: UIViewController {

    lazy var themeSwitch: UISwitch = {
        var themeSwitch = UISwitch()
        themeSwitch.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1) //Kenar çizgileri rengidir
        themeSwitch.onTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) //Switch butonunu on konumuna aldığımızda içerisinin alacağı renk.
        themeSwitch.thumbTintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) // Swicth butonunun yuvarlak kısmıdır.
        themeSwitch.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) //Swicth Button'unun arka planını ayarlar.
        themeSwitch.layer.cornerRadius = 16 // Normalde swicth button dikdörtgen iken kenarlarını yuvarlar
        themeSwitch.layer.masksToBounds = true
        themeSwitch.addTarget(self, action: #selector(changingView), for: .valueChanged)
        return themeSwitch
    }()
    
    private var btn: UIButton = {
       var btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        btn.setTitle("Go To Segmented Page", for: .normal)
        btn.layer.cornerRadius = 16
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(goToSecond), for: .touchUpInside)
       return btn
    }()

    @objc func goToSecond(){

        let vc = SegmentedVC()
        present(vc, animated: true, completion: nil)
    }
    
    @objc func changingView(){
    
        if themeSwitch.isOn{
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) //Eğer buton açıksa arka planı beyaz yap
        }else{
            view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //Değilse siyah
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(themeSwitch)  //View'e buttonu ekledi.
        view.addSubview(btn)
        themeSwitch.centerInSuperview() //themeSwitch'i superView'in ortasına çekti.
        
        btn.topToBottom(of: themeSwitch)
        btn.leftAnchor.constraint(equalTo: themeSwitch.rightAnchor, constant: -125).isActive = true
        btn.topAnchor.constraint(equalTo: themeSwitch.bottomAnchor, constant: -100).isActive = true
    }


}

