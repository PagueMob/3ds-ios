//
//  ViewController.swift
//  Example3dsCocoa
//
//  Created by Jeferson Nazario on 24/04/20.
//  Copyright © 2020 jnazario.com. All rights reserved.
//

import UIKit
import Braspag3Ds
import CieloSilentOrderPost

class ViewController: UIViewController {
    
    var sdk: Braspag3dsProtocol!
    private var silentOrder: SilentOrderPostProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        sdk = Braspag3ds(accessToken: "", environment: .sandbox)
        silentOrder = SilentOrderPost.createInstance(environment: .production)
    }

    func authenticateCard() {
        
    }

}

