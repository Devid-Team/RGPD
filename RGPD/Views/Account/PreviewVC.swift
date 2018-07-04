//
//  PreviewVC.swift
//  RGPD
//
//  Created by Thibault Deprez on 21/06/2018.
//  Copyright © 2018 Thibault Deprez. All rights reserved.
//

import UIKit

class PreviewVC: UIViewController {

    @IBOutlet weak var descriptionTF: UITextView!
    @IBOutlet weak var titleLbl: UILabel!
    
    var typePage : RGPDPages!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch typePage! {
        case .cgv:
            titleLbl.text = "Conditions générales de vente"
            if RGPD.shared.texts.CGV == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                descriptionTF.text = RGPD.shared.texts.CGV!
            }
        case .comm:
            titleLbl.text = "Prospection commerciale"
            if RGPD.shared.texts.comm == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                descriptionTF.text = RGPD.shared.texts.comm!
            }
        case .stats:
            titleLbl.text = "Statistiques"
            if RGPD.shared.texts.stats == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                descriptionTF.text = RGPD.shared.texts.stats!
            }
        case .private_data:
            titleLbl.text = "Données personnelles"
            if RGPD.shared.texts.private_data == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                descriptionTF.text = RGPD.shared.texts.private_data!
            }
        case .payment_data:
            titleLbl.text = "Informations Bancaires"
            if RGPD.shared.texts.payment_data == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                descriptionTF.text = RGPD.shared.texts.payment_data!
            }
        default:
            titleLbl.text = "Conditions générales d'utilisation"
            if RGPD.shared.texts.CGU == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                descriptionTF.text = RGPD.shared.texts.CGU!
            }
        }
        // Do any additional setup after loading the view.
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
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
