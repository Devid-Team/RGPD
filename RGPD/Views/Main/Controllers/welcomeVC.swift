//
//  welcomeVC.swift
//  RGPD
//
//  Created by Thibault Deprez on 23/05/2018.
//  Copyright © 2018 Thibault Deprez. All rights reserved.
//

import UIKit

class welcomeVC: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textLblPart3: UILabel!
    @IBOutlet weak var textViewPart3: UIView!
    @IBOutlet weak var textLblPart2: UILabel!
    @IBOutlet weak var textViewPart2: UIView!
    @IBOutlet weak var textLblPart1: UILabel!
    @IBOutlet weak var textViewPart1: UIView!
    @IBOutlet weak var titleLblPart2: UILabel!
    @IBOutlet weak var titleViewPart2: UIView!
    @IBOutlet weak var titleLblPart1: UILabel!
    @IBOutlet weak var titleViewPart1: UIView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    private var theme : RGPDStylePage!

    override func viewDidLoad() {
        super.viewDidLoad()

        if RGPD.shared.pagesShown.first == nil {
            nextBtn.setTitle("Valider", for: .normal)
        }
        
        for item in RGPD.shared.theme.pages {
            if item.pageName == "welcome" {
                self.theme = item
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        setupView()
    }

    func setupView() {

        if theme.backgroundColor.count == 1 {
            backgroundView.backgroundColor = colorGenerator.oneColor(theme.backgroundColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.backgroundColor)
            layer.frame = backgroundView.bounds
            backgroundView.layer.insertSublayer(layer, at: 0)
        }
        
        nextBtn.layer.masksToBounds = true
        
        if theme.titleColor.count == 1 {
            titleLblPart2.textColor = colorGenerator.oneColor(theme.titleColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.titleColor)
            layer.frame = titleViewPart2.bounds
            titleViewPart2.layer.insertSublayer(layer, at: 0)
            titleViewPart2.mask = titleLblPart2
        }
        
        if theme.iconColor.count == 1 {
            iconImg.tintColor = colorGenerator.oneColor(theme.iconColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.iconColor)
            layer.frame = iconView.bounds
            iconView.layer.insertSublayer(layer, at: 0)
            iconView.mask = iconImg
        }
        
        if theme.textColor.count == 1 {
            titleLblPart1.textColor = colorGenerator.oneColor(theme.textColor[0])
            textLblPart1.textColor = colorGenerator.oneColor(theme.textColor[0])
            textLblPart2.textColor = colorGenerator.oneColor(theme.textColor[0])
            textLblPart3.textColor = colorGenerator.oneColor(theme.textColor[0])
        } else {
            var layer = colorGenerator.gradient(theme.textColor)
            layer.frame = titleViewPart1.bounds
            titleViewPart1.layer.insertSublayer(layer, at: 0)
            titleViewPart1.mask = titleLblPart1
            layer = colorGenerator.gradient(theme.textColor)
            layer.frame = textViewPart1.bounds
            textViewPart1.layer.insertSublayer(layer, at: 0)
            textViewPart1.mask = textLblPart1
            layer = colorGenerator.gradient(theme.textColor)
            layer.frame = textViewPart2.bounds
            textViewPart2.layer.insertSublayer(layer, at: 0)
            textViewPart2.mask = textLblPart2
            layer = colorGenerator.gradient(theme.textColor)
            layer.frame = textViewPart3.bounds
            textViewPart3.layer.insertSublayer(layer, at: 0)
            textViewPart3.mask = textLblPart3
        }
        
        if theme.fullButtonColor.count == 1 {
            nextBtn.backgroundColor = colorGenerator.oneColor(theme.fullButtonColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.fullButtonColor)
            layer.frame = nextBtn.bounds
            nextBtn.layer.insertSublayer(layer, at: 0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func continueTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "main", bundle: Bundle(for: RGPD.self))
        var controller : UIViewController!
        if let nextPage = RGPD.shared.pagesShown.first {
            controller = storyboard.instantiateViewController(withIdentifier: nextPage.rawValue)
            self.navigationController?.pushViewController(controller, animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
//        let controller = storyboard.instantiateViewController(withIdentifier: "welcome")
//        viewController.present(controller, animated: true, completion: nil)
    }
    
}
