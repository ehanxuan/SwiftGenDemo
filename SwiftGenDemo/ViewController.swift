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
        // Do any additional setup after loading the view, typically from a nib.
        
        /** string 使用例  **/
//        welcomeLabel.text = NSLocalizedString("welcome", nil)
        welcomeLabel.text = tr(.welcome)
        
        /** 图片使用例 **/
//        sampleImage.image = #imageLiteral(resourceName: "SampleImage")
//        sampleImage.image = UIImage(named: "sampleImage")
        sampleImage.image = UIImage(asset: .sampleImage);
        sampleImage.image = Asset.sampleImage.image
        
        /** color 使用例 **/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

