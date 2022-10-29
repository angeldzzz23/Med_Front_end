//
//  ViewController.swift
//  LoginUI
//
//  Created by Alexis Sanchez-Rosas on 10/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        userText.layer.cornerRadius = 20
        passText.layer.cornerRadius = 20
        signInButton.layer.cornerRadius = 20
        appleButton.layer.cornerRadius = 20
        googleButton.layer.cornerRadius = 20
    }


}

