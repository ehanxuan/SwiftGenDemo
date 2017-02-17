//
//  ViewController.swift
//  SwiftGenDemo
//
//  Created by feilang-ehanxuan on 2017/02/17.
//  Copyright © 2017年 ehanxuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var sampleImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /** string 使用例  **/
//        welcomeLabel.text = NSLocalizedString("welcome", nil)
        welcomeLabel.text = tr(.welcome)
        
        /** color 使用例 **/
//        welcomeLabel.textColor = UIColor(red: 100/255.0, green: 150/255.0, blue: 200/255.0, alpha: 1)
//        welcomeLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)         // 339666，自定义颜色不能正确显示；不能定义通用颜色
        welcomeLabel.textColor = UIColor(named: .articleBody)
        
        /** fonts 使用例 **/
//        welcomeLabel.font = UIFont(name: "Avenir-Heavy", size: 17)
        welcomeLabel.font = UIFont(font: FontFamily.Avenir.heavy, size: 17)
        
        /** 图片使用例：因为 xcode8 本身可以支持编码时提示图片名，且可以显示图片预览，故不提倡使用 SwiftGen **/
//        sampleImage.image = #imageLiteral(resourceName: "SampleImage")
//        sampleImage.image = UIImage(named: "sampleImage")
        sampleImage.image = UIImage(asset: .sampleImage);
        sampleImage.image = Asset.sampleImage.image
        
        
        showAllFonts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showAllFonts()
    {
        let familyNames = UIFont.fontNames(forFamilyName: "Avenir")
        
        for familyName in familyNames
        {
            print(familyName)
//            let fontNames = familyName.
//            for fontName in fontNames
//            {
//                index++
//                
//                print("第 \(index) 个字体，字体font名称：\(fontName)")
//            }
        }
    }

}

