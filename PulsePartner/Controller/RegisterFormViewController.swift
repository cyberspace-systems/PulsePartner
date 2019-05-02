//
//  RegisterFormViewController.swift
//  PulsePartner
//
//  Created by Ove von Stackelberg on 26.04.19.
//  Copyright © 2019 PulsePartner. All rights reserved.
//

import UIKit

class RegisterFormViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var firstnameInput: UITextField!
    @IBOutlet weak var lastnameInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var fitnessLevelLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func setFitnessLevel(_ sender: UISlider) {
        fitnessLevelLabel.text = String(Int(sender.value))
    }

    @IBAction func onButtonClick(_ sender: UIButton) {
        validateInput(completion: { registerData in
            UserManager.sharedInstance.createUser(withUserData: registerData,
                                                  sender: self) { success in
                                                    if success {
                                                        self.performSegue(withIdentifier: "FirstRegisterSegue", sender: self)
                                                    }
            }
        })
    }

    private func validateInput(completion: (UserRegisterData) -> Void) {
        guard let firstname = firstnameInput.text else {
            return
        }
        guard let surname = lastnameInput.text else {
            return
        }
        guard let email = emailInput.text else {
            return
        }
        guard let password = passwordInput.text else {
            return
        }
        guard let age = ageInput.text else {
            return
        }
        guard let weight = weightInput.text else {
            return
        }

        let registerData = UserRegisterData(firstname: firstname, surname: surname, email: email, password: password, age: age, weight: weight)
        completion(registerData)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
