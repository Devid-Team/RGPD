//
//  RGPDButton.swift
//  RGPD
//
//  Created by Thibault Deprez on 02/07/2018.
//  Copyright © 2018 Thibault Deprez. All rights reserved.
//

import UIKit

public protocol RGPDButtonDelegate {
    func didAskForDeletion()
}

public class RGPDButton: UIButton {

    public var delegate : RGPDButtonDelegate?
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override public func awakeFromNib() {
        super.awakeFromNib()
        
        self.setTitle("        Gérer mes données personnelles", for: .normal)
        let bundle = Bundle(for: RGPDButton.self)
        self.setBackgroundImage(UIImage(named: "boutonRGPD", in: bundle, compatibleWith: nil), for: .normal)
        self.layer.cornerRadius = 20
        self.addTarget(self, action: #selector(onTouchDown), for: UIControl.Event.touchDown)
    }
    
    @objc func onTouchDown() {
        RGPD.shared.showAccountModally(delegate as! UIViewController) { (result) in
            if (result) {
                self.delegate?.didAskForDeletion()
            }
        }
    }
}
