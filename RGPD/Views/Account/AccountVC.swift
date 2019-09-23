//
//  AccountVC.swift
//  RGPD
//
//  Created by Thibault Deprez on 20/06/2018.
//  Copyright © 2018 Thibault Deprez. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var infoBtn6: UIButton!
    @IBOutlet weak var infoBtn5: UIButton!
    @IBOutlet weak var infoBtn4: UIButton!
    @IBOutlet weak var infoBtn3: UIButton!
    @IBOutlet weak var infoBtn2: UIButton!
    @IBOutlet weak var infoBtn1: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var textView5: UIView!
    @IBOutlet weak var textLbl5: UILabel!
    @IBOutlet weak var cgvView: UIView!
    @IBOutlet weak var cgvLbl: UILabel!
    @IBOutlet weak var cguView: UIView!
    @IBOutlet weak var cguLbl: UILabel!
    @IBOutlet weak var infoView4: UIView!
    @IBOutlet weak var infoLbl4: UILabel!
    @IBOutlet weak var textView4: UIView!
    @IBOutlet weak var textLbl4: UILabel!
    @IBOutlet weak var checkBackground4: UIView!
    @IBOutlet weak var checkView4: UIView!
    @IBOutlet weak var checkImg4: UIImageView!
    @IBOutlet weak var infoView3: UIView!
    @IBOutlet weak var infoLbl3: UILabel!
    @IBOutlet weak var textView3: UIView!
    @IBOutlet weak var textLbl3: UILabel!
    @IBOutlet weak var checkBackground3: UIView!
    @IBOutlet weak var checkView3: UIView!
    @IBOutlet weak var checkImg3: UIImageView!
    @IBOutlet weak var infoView2: UIView!
    @IBOutlet weak var infoLbl2: UILabel!
    @IBOutlet weak var textView2: UIView!
    @IBOutlet weak var textLbl2: UILabel!
    @IBOutlet weak var checkBackground2: UIView!
    @IBOutlet weak var checkView2: UIView!
    @IBOutlet weak var checkImg2: UIImageView!
    @IBOutlet weak var infoView1: UIView!
    @IBOutlet weak var infoLbl1: UILabel!
    @IBOutlet weak var textView1: UIView!
    @IBOutlet weak var textLbl1: UILabel!
    @IBOutlet weak var checkBackground1: UIView!
    @IBOutlet weak var checkView1: UIView!
    @IBOutlet weak var checkImg1: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backImg: UIImageView!
    
    private var theme : RGPDStylePage!
    private var selected : RGPDPages!
    
    var completion : ((Bool) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for item in RGPD.shared.theme.pages {
            if item.pageName == "account" {
                self.theme = item
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        setupView()
        
        
        let path = UIBezierPath(roundedRect: deleteBtn.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 8, height: 8))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.frame = deleteBtn.bounds
        deleteBtn.layer.mask = mask
    }

    func setupView() {
        checkBackground1.layer.masksToBounds = true
        checkBackground2.layer.masksToBounds = true
        checkBackground3.layer.masksToBounds = true
        checkBackground4.layer.masksToBounds = true
        
        if theme.backgroundColor.count == 1 {
            backgroundView.backgroundColor = colorGenerator.oneColor(theme.backgroundColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.backgroundColor)
            layer.frame = backgroundView.bounds
            backgroundView.layer.insertSublayer(layer, at: 0)
        }
        
        if theme.titleColor.count == 1 {
            titleLbl.textColor = colorGenerator.oneColor(theme.titleColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.titleColor)
            layer.frame = titleView.bounds
            titleView.layer.insertSublayer(layer, at: 0)
            titleView.mask = titleLbl
        }
        
        if theme.backButtonColor.count == 1 {
            backImg.tintColor = colorGenerator.oneColor(theme.backButtonColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.backButtonColor)
            layer.frame = backView.bounds
            backView.layer.insertSublayer(layer, at: 0)
            backView.mask = backImg
        }
        
        if theme.checkColor.count == 1 {
            checkImg1.tintColor = colorGenerator.oneColor(theme.checkColor[0])
            checkImg2.tintColor = colorGenerator.oneColor(theme.checkColor[0])
            checkImg3.tintColor = colorGenerator.oneColor(theme.checkColor[0])
            checkImg4.tintColor = colorGenerator.oneColor(theme.checkColor[0])
        } else {
            var layer = colorGenerator.gradient(theme.checkColor)
            layer.frame = checkView1.bounds
            checkView1.layer.insertSublayer(layer, at: 0)
            checkView1.mask = checkImg1
            layer = colorGenerator.gradient(theme.checkColor)
            layer.frame = checkView2.bounds
            checkView2.layer.insertSublayer(layer, at: 0)
            checkView2.mask = checkImg2
            layer = colorGenerator.gradient(theme.checkColor)
            layer.frame = checkView3.bounds
            checkView3.layer.insertSublayer(layer, at: 0)
            checkView3.mask = checkImg3
            layer = colorGenerator.gradient(theme.checkColor)
            layer.frame = checkView4.bounds
            checkView4.layer.insertSublayer(layer, at: 0)
            checkView4.mask = checkImg4
        }
        
        if theme.textColor.count == 1 {
            textLbl1.textColor = colorGenerator.oneColor(theme.textColor[0])
            textLbl2.textColor = colorGenerator.oneColor(theme.textColor[0])
            textLbl3.textColor = colorGenerator.oneColor(theme.textColor[0])
            textLbl4.textColor = colorGenerator.oneColor(theme.textColor[0])
            cguLbl.textColor = colorGenerator.oneColor(theme.textColor[0])
            cgvLbl.textColor = colorGenerator.oneColor(theme.textColor[0])
            textLbl5.textColor = colorGenerator.oneColor(theme.textColor[0])
        } else {
            var layer = colorGenerator.gradient(theme.textColor)
            layer.frame = textView1.bounds
            textView1.layer.insertSublayer(layer, at: 0)
            textView1.mask = textLbl1
            layer = colorGenerator.gradient(theme.textColor)
            layer.frame = textView2.bounds
            textView2.layer.insertSublayer(layer, at: 0)
            textView2.mask = textLbl2
            layer = colorGenerator.gradient(theme.textColor)
            layer.frame = textView3.bounds
            textView3.layer.insertSublayer(layer, at: 0)
            textView3.mask = textLbl3
            layer = colorGenerator.gradient(theme.textColor)
            layer.frame = textView4.bounds
            textView4.layer.insertSublayer(layer, at: 0)
            textView4.mask = textLbl4
            layer = colorGenerator.gradient(theme.textColor)
            layer.frame = cguView.bounds
            cguView.layer.insertSublayer(layer, at: 0)
            cguView.mask = cguLbl
            layer = colorGenerator.gradient(theme.textColor)
            layer.frame = cgvView.bounds
            cgvView.layer.insertSublayer(layer, at: 0)
            cgvView.mask = cgvLbl
            layer = colorGenerator.gradient(theme.textColor)
            layer.frame = textView5.bounds
            textView5.layer.insertSublayer(layer, at: 0)
            textView5.mask = textLbl5
        }

        if theme.fullCircleColor.count == 1 {
            if RGPD.shared.authGiven != nil, RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.comm.rawValue) {
                checkBackground1.backgroundColor = colorGenerator.oneColor(theme.fullCircleColor[0])
                infoLbl1.textColor = colorGenerator.oneColor(theme.fullCircleColor[0])
            }
            if RGPD.shared.authGiven != nil, RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.stats.rawValue) {
                checkBackground2.backgroundColor = colorGenerator.oneColor(theme.fullCircleColor[0])
                infoLbl2.textColor = colorGenerator.oneColor(theme.fullCircleColor[0])
            }
            if RGPD.shared.authGiven != nil, RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.private_data.rawValue) {
                checkBackground3.backgroundColor = colorGenerator.oneColor(theme.fullCircleColor[0])
            }
            if RGPD.shared.authGiven != nil, RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.payment_data.rawValue) {
                checkBackground4.backgroundColor = colorGenerator.oneColor(theme.fullCircleColor[0])
                infoLbl4.textColor = colorGenerator.oneColor(theme.fullCircleColor[0])
            }
        } else {
            if RGPD.shared.authGiven != nil, RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.comm.rawValue) {
                var layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = checkBackground1.bounds
                checkBackground1.layer.insertSublayer(layer, at: 0)
                layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = infoView1.bounds
                infoView1.layer.insertSublayer(layer, at: 0)
                infoView1.mask = infoLbl1
            }
            if RGPD.shared.authGiven != nil, RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.stats.rawValue) {
                var layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = checkBackground2.bounds
                checkBackground2.layer.insertSublayer(layer, at: 0)
                layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = infoView2.bounds
                infoView2.layer.insertSublayer(layer, at: 0)
                infoView2.mask = infoLbl2
            }
            if RGPD.shared.authGiven != nil, RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.private_data.rawValue) {
                var layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = checkBackground3.bounds
                checkBackground3.layer.insertSublayer(layer, at: 0)
                layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = infoView3.bounds
                infoView3.layer.insertSublayer(layer, at: 0)
                infoView3.mask = infoLbl3
            }
            if RGPD.shared.authGiven != nil, RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.payment_data.rawValue) {
                var layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = checkBackground4.bounds
                checkBackground4.layer.insertSublayer(layer, at: 0)
                layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = infoView4.bounds
                infoView4.layer.insertSublayer(layer, at: 0)
                infoView4.mask = infoLbl4
            }
        }
        
        if theme.emptyCircleColor.count == 1 {
            if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.comm.rawValue) {
                checkBackground1.backgroundColor = nil
                checkBackground1.layer.borderColor = colorGenerator.oneColor(theme.emptyCircleColor[0]).cgColor
                checkBackground1.layer.borderWidth = 1.0
                infoLbl1.textColor = colorGenerator.oneColor(theme.emptyCircleColor[0])
            }
            if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.stats.rawValue) {
                checkBackground2.backgroundColor = nil
                checkBackground2.layer.borderColor = colorGenerator.oneColor(theme.emptyCircleColor[0]).cgColor
                checkBackground2.layer.borderWidth = 1.0
                infoLbl2.textColor = colorGenerator.oneColor(theme.emptyCircleColor[0])
            }
            if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.private_data.rawValue) {
                checkBackground3.backgroundColor = nil
                checkBackground3.layer.borderColor = colorGenerator.oneColor(theme.emptyCircleColor[0]).cgColor
                checkBackground3.layer.borderWidth = 1.0
                infoLbl3.textColor = colorGenerator.oneColor(theme.emptyCircleColor[0])
            }
            if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.payment_data.rawValue) {
                checkBackground4.backgroundColor = nil
                checkBackground4.layer.borderColor = colorGenerator.oneColor(theme.emptyCircleColor[0]).cgColor
                checkBackground4.layer.borderWidth = 1.0
                infoLbl4.textColor = colorGenerator.oneColor(theme.emptyCircleColor[0])
            }
        } else {
            if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.comm.rawValue) {
                checkBackground1.backgroundColor = nil
                var colors = [UIColor]()
                for item in theme.emptyCircleColor {
                    colors.append(colorGenerator.oneColor(item))
                }
                checkBackground1.setGradientBorder(width: 1, colors: colors)
                let layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = infoView1.bounds
                infoView1.layer.insertSublayer(layer, at: 0)
                infoView1.mask = infoLbl1
            }
            if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.stats.rawValue) {
                checkBackground2.backgroundColor = nil
                var colors = [UIColor]()
                for item in theme.emptyCircleColor {
                    colors.append(colorGenerator.oneColor(item))
                }
                checkBackground2.setGradientBorder(width: 1, colors: colors)
                let layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = infoView2.bounds
                infoView2.layer.insertSublayer(layer, at: 0)
                infoView2.mask = infoLbl2
            }
            if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.private_data.rawValue) {
                checkBackground3.backgroundColor = nil
                var colors = [UIColor]()
                for item in theme.emptyCircleColor {
                    colors.append(colorGenerator.oneColor(item))
                }
                checkBackground3.setGradientBorder(width: 1, colors: colors)
                let layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = infoView3.bounds
                infoView3.layer.insertSublayer(layer, at: 0)
                infoView3.mask = infoLbl3
            }
            if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.payment_data.rawValue) {
                checkBackground4.backgroundColor = nil
                var colors = [UIColor]()
                for item in theme.emptyCircleColor {
                    colors.append(colorGenerator.oneColor(item))
                }
                checkBackground4.setGradientBorder(width: 1, colors: colors)
                let layer = colorGenerator.gradient(theme.fullCircleColor)
                layer.frame = infoView4.bounds
                infoView4.layer.insertSublayer(layer, at: 0)
                infoView4.mask = infoLbl4
            }
        }
        
        if theme.fullButtonColor.count == 1 {
            deleteBtn.backgroundColor = colorGenerator.oneColor(theme.fullButtonColor[0])
        } else {
            let layer = colorGenerator.gradient(theme.fullButtonColor)
            layer.frame = deleteBtn.bounds
            deleteBtn.layer.insertSublayer(layer, at: 0)
        }
        
        if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.comm.rawValue) {
            infoBtn1.isEnabled = false
        }
        if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.stats.rawValue) {
            infoBtn2.isEnabled = false
        }
        if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.private_data.rawValue) {
            infoBtn3.isEnabled = false
        }
        if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.payment_data.rawValue) {
            infoBtn4.isEnabled = false
        }
        if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.cgu.rawValue) {
            infoBtn5.isEnabled = false
        }
        if RGPD.shared.authGiven != nil, !RGPD.shared.authGiven.keyAccepted.contains(RGPDPages.cgv.rawValue) {
            infoBtn6.isEnabled = false
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let dest = segue.destination as? PreviewVC {
            dest.typePage = self.selected
        }
    }
 
    @IBAction func cgvTapped(_ sender: Any) {
        selected = .cgv
        self.performSegue(withIdentifier: "goToPreview", sender: self)
    }
    
    @IBAction func cguTapped(_ sender: Any) {
        selected = .cgu
        self.performSegue(withIdentifier: "goToPreview", sender: self)
    }
    
    @IBAction func paymentTapped(_ sender: Any) {
        selected = .payment_data
        self.performSegue(withIdentifier: "goToPreview", sender: self)
    }
    
    @IBAction func persoDataTapped(_ sender: Any) {
        selected = .private_data
        self.performSegue(withIdentifier: "goToPreview", sender: self)
    }
    
    
    @IBAction func statsTapped(_ sender: Any) {
        selected = .stats
        self.performSegue(withIdentifier: "goToPreview", sender: self)
    }
    
    @IBAction func commTapped(_ sender: Any) {
        selected = .comm
        self.performSegue(withIdentifier: "goToPreview", sender: self)
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Attention", message: "Vous êtes sur le point de supprimer votre compte. Êtes-vous sûr ?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Oui", style: .destructive) { (action) in
            Webservice.deleteAuth { (data) in
                do {
                    let decoder = JSONDecoder()
                    let tmp = try decoder.decode(addUserAnswer.self, from: data!)
                    print("RGPD POD Return from updateUserWebservice : \(tmp)")
                    self.completion(tmp.success)
                    self.dismiss(animated: true, completion: nil)
                } catch {
                    print(error)
                    self.completion(false)
                    self.dismiss(animated: true, completion: nil)
                    // handle error
                }
            }
        }
        let noAction = UIAlertAction(title: "Non", style: .cancel, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
        completion(false)
        self.dismiss(animated: true, completion: nil)
    }
}
