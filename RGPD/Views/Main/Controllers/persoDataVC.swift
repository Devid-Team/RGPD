//
//  persoDataVC.swift
//  RGPD
//
//  Created by Thibault Deprez on 23/05/2018.
//  Copyright © 2018 Thibault Deprez. All rights reserved.
//

import UIKit

class persoDataVC: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var checkBackground: UIView!
    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UITextView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var checkView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var backView: UIView!
    private var checked = false
    private var theme : RGPDStylePage!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for item in RGPD.shared.theme.pages {
            if item.pageName == RGPDPages.private_data.rawValue {
                self.theme = item
            }
        }
        
        descriptionLbl.text = RGPD.shared.texts.private_data
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        setView()
    }

    func setView() {
        if theme.backgroundColor.count == 1 {
            backgroundView.backgroundColor = colorGenerator.oneColor(theme.backgroundColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.backgroundColor)
            layer.frame = backgroundView.bounds
            backgroundView.layer.insertSublayer(layer, at: 0)
        }
        
        if RGPD.shared.pagesShown.count == 1 {
            nextBtn.setTitle("Valider", for: .normal)
        }
        
        checkBackground.layer.masksToBounds = true
        nextBtn.layer.masksToBounds = true
        iconImg.layer.masksToBounds = true
        
        if theme.titleColor.count == 1 {
            titleLbl.textColor = colorGenerator.oneColor(theme.titleColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.titleColor)
            layer.frame = titleView.bounds
            titleView.layer.insertSublayer(layer, at: 0)
            titleView.mask = titleLbl
        }
        
        if theme.iconColor.count == 1 {
            iconImg.tintColor = colorGenerator.oneColor(theme.iconColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.iconColor)
            layer.frame = iconView.bounds
            iconView.layer.insertSublayer(layer, at: 0)
            iconView.mask = iconImg
        }
        
        if theme.checkColor.count == 1 {
            checkImg.tintColor = colorGenerator.oneColor(theme.checkColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.checkColor)
            layer.frame = checkView.bounds
            checkView.layer.insertSublayer(layer, at: 0)
            checkView.mask = checkImg
        }
        
        if theme.textColor.count == 1 {
            descriptionLbl.textColor = colorGenerator.oneColor(theme.textColor[0])
        } else {
            descriptionLbl.textColor = colorGenerator.oneColor(theme.textColor[0])
        }
        
        if theme.backButtonColor.count == 1 {
            backImg.tintColor = colorGenerator.oneColor(theme.backButtonColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.backButtonColor)
            layer.frame = backView.bounds
            backView.layer.insertSublayer(layer, at: 0)
            backView.mask = backImg
        }
        
        if checked {
            if theme.fullButtonTextColor.count == 1 {
                nextBtn.setTitleColor(colorGenerator.oneColor(theme.fullButtonTextColor[0]), for: .normal)
            } else {
                nextBtn.setTitleColor(UIColor.white, for: .normal)
            }
            
            nextBtn.isEnabled = true
            
            if let array = nextBtn.layer.sublayers {
                for item in array {
                    if item is CAGradientLayer || item is CAShapeLayer {
                        item.removeFromSuperlayer()
                    }
                }
            }
            if let array = checkBackground.layer.sublayers {
                for item in array {
                    if item is CAGradientLayer || item is CAShapeLayer {
                        item.removeFromSuperlayer()
                    }
                }
            }
            
            checkImg.isHidden = false
            if theme.fullCircleColor.count == 1 {
                checkBackground.backgroundColor = colorGenerator.oneColor(theme.fullCircleColor[0])
                checkBackground.layer.borderWidth = 0
            } else {
                checkBackground.layer.borderWidth = 0
                let layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = checkBackground.bounds
                checkBackground.layer.insertSublayer(layer, at: 0)
            }
            
            if theme.fullButtonColor.count == 1 {
                nextBtn.layer.borderWidth = 0
                nextBtn.backgroundColor = colorGenerator.oneColor(theme.fullButtonColor[0])
            } else {
                nextBtn.layer.borderWidth = 0
                let layer = colorGenerator.gradient(theme.fullButtonColor)
                layer.frame = nextBtn.bounds
                nextBtn.layer.insertSublayer(layer, at: 0)
            }
            
        } else {
            
            if theme.emptyButtonTextColor.count == 1 {
                nextBtn.setTitleColor(colorGenerator.oneColor(theme.emptyButtonTextColor[0]), for: .normal)
            } else {
                nextBtn.setTitleColor(UIColor.white, for: .normal)
            }
            
            nextBtn.isEnabled = false
            
            if let array = nextBtn.layer.sublayers {
                for item in array {
                    if item is CAGradientLayer || item is CAShapeLayer {
                        item.removeFromSuperlayer()
                    }
                }
            }
            if let array = checkBackground.layer.sublayers {
                for item in array {
                    if item is CAGradientLayer || item is CAShapeLayer {
                        item.removeFromSuperlayer()
                    }
                }
            }
            
            checkImg.isHidden = true
            if theme.emptyCircleColor.count == 1 {
                checkBackground.backgroundColor = nil
                checkBackground.layer.borderColor = colorGenerator.oneColor(theme.emptyCircleColor[0]).cgColor
                checkBackground.layer.borderWidth = 1.0
            } else {
                //                let layer = colorGenerator.gradient(theme.emptyCircleColor)
                //                layer.frame = checkBackground.bounds
                //                checkBackground.layer.insertSublayer(layer, at: 0)
                checkBackground.backgroundColor = nil
                var colors = [UIColor]()
                for item in theme.emptyCircleColor {
                    colors.append(colorGenerator.oneColor(item))
                }
                checkBackground.setGradientBorder(width: 1, colors: colors)
            }
            
            if theme.emptyButtonColor.count == 1 {
                nextBtn.backgroundColor = nil
                nextBtn.layer.borderWidth = 1
                nextBtn.layer.borderColor = colorGenerator.oneColor(theme.emptyButtonColor[0]).cgColor
            } else {
                nextBtn.backgroundColor = nil
                let gradient = colorGenerator.gradient(theme.emptyButtonColor)
                gradient.frame = nextBtn.bounds
                
                let shape = CAShapeLayer()
                shape.lineWidth = 1
                shape.path = UIBezierPath(roundedRect: nextBtn.bounds, cornerRadius: 20).cgPath
                shape.strokeColor = UIColor.black.cgColor
                shape.fillColor = UIColor.clear.cgColor
                gradient.mask = shape
                
                nextBtn.layer.addSublayer(gradient)
                //                let layer = colorGenerator.gradient(theme.emptyButtonColor)
                //                layer.frame = nextBtn.bounds
                //                nextBtn.layer.insertSublayer(layer, at: 0)
            }
            
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
    
    @IBAction func AcceptedTapped(_ sender: Any) {
        checked = !checked
        setView()
    }

    @IBAction func ContinueTapped(_ sender: Any) {
        if RGPD.shared.pagesShown.first == .private_data {
            RGPD.shared.pagesAccepted.append(RGPD.shared.pagesShown.removeFirst())
        }
        if (RGPD.shared.pagesShown.count == 0) {
            var str = "["
            for i in 0..<RGPD.shared.pagesAccepted.count {
                str += "\(i == 0 ? "" : ", ")\"\(RGPD.shared.pagesAccepted[i].rawValue)\""
            }
            str += "]"
            Webservice.updateUserAuthorizations(authKeysString: str, completion: { data in
                self.dismiss(animated: true, completion: nil)
                guard let data = data else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let tmp = try decoder.decode(addUserAnswer.self, from: data)
                    print("RGPD POD Return from updateUserWebservice : \(tmp)")
                } catch {
                    print(error)
                    // handle error
                }
            });
        } else {
            let storyboard = UIStoryboard(name: "main", bundle: Bundle(for: RGPD.self))
            let nextPage = RGPD.shared.pagesShown.first
            let controller = storyboard.instantiateViewController(withIdentifier: nextPage!.rawValue)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

    @IBAction func backPressed(_ sender: Any) {
        if RGPD.shared.pagesAccepted.contains(.private_data) {
            RGPD.shared.pagesShown.insert(RGPD.shared.pagesAccepted.remove(at: RGPD.shared.pagesAccepted.index(of: .private_data)!), at: 0)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
