//
//  ViewController.swift
//  sprint01Exercise
//
//  Created by Kaue de Assis Jacyntho on 02/05/23.
//

import UIKit


// Transaction

class Transaction {
    
    let amount: Double
    
    func validate() -> Bool {
        return true
    }
    func processTransaction() {
        validate() ? print("Transaction done") : print("Transaction canceled. Invalid data")
    }
    
    init(amount: Double) {
        self.amount = amount
    }

}


// DigitalWalletPayment

class DigitalWalletPayment: Transaction {
    
    let walletNumber: String?
    
    init(walletNumber: String? = nil, amount: Double) {
        self.walletNumber = walletNumber
        super.init(amount: amount)
    }
    override func validate() -> Bool {
        
        if walletNumber != nil && amount > 0 {
            return true
        }
        return false
    }
    
    override func processTransaction() {
        validate() ? print("DigitalWalletPayment done") : print("DigitalWalletPayment canceled. Invalid data")
    }
    
}


// CreditCardPayment

class CreditCardPayment: Transaction {

    let cardNumber: String?
    let expirationdate: String?
    let securityCode: String?
    let cardHolderName: String?
    

    init(cardNumber: String? = nil, expirationdate: String? = nil, securityCode: String? = nil, cardHolderName: String? = nil, amount: Double) {
        self.cardNumber = cardNumber
        self.expirationdate = expirationdate
        self.securityCode = securityCode
        self.cardHolderName = cardHolderName
        super.init(amount: amount)
    }
    override func validate() -> Bool {
        if cardNumber != nil && expirationdate != nil && securityCode != nil && cardHolderName != nil && amount > 0 {
            return true
        }
        return false
    }
    
    override func processTransaction() {
        validate() ? print("CreditCardPayment done") : print("CreditCardPayment canceled. Invalid data")
    }
    
    
}

// BankTransfer

class BankTransfer: Transaction {
    
    let sourceAccount: String?
    let destinationAccount: String?
    
    init(sourceAccount: String? = nil, destinationAccount: String? = nil, amount: Double) {
        self.sourceAccount = sourceAccount
        self.destinationAccount = destinationAccount
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        if sourceAccount != nil && destinationAccount != nil && amount > 0 {
            return true
        }
        return false
    }
    
    override func processTransaction() {
        validate() ? print("BankTransfer done") : print("BankTransfer canceled. Invalid data")
    }
}


// DebitCardPayment

class DebitCardPayment: Transaction {
    
    let cardNumber: String?
    let expirationdate: String?
    let securityCode: String?
    let cardHolderName: String?
    
    init(cardNumber: String? = nil, expirationdate: String? = nil, securityCode: String? = nil, cardHolderName: String? = nil, amount: Double) {
        self.cardNumber = cardNumber
        self.expirationdate = expirationdate
        self.securityCode = securityCode
        self.cardHolderName = cardHolderName
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        if cardNumber != nil && expirationdate != nil && securityCode != nil && cardHolderName != nil && amount > 0 {
            return true
        }
        return false
    }
    
    override func processTransaction() {
        validate() ? print("DebitCardPayment done") : print("DebitCardPayment canceled. Invalid data")
    }
}


// TransactionProcessor

class TransactionProcessor: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bank = BankTransfer(sourceAccount: "CiclanoAccount", destinationAccount: "FulanoAccount", amount: 50)
        let credit = CreditCardPayment(cardNumber: "32029483", expirationdate: "02/2030", securityCode: "098", cardHolderName: "Ciclano da Silva", amount: 75)
        let debit = DebitCardPayment(cardNumber: "23344555", expirationdate: "03/2028", securityCode: "897", cardHolderName: "Fulano dos Santos", amount: 39)
        let digitalWallet = DigitalWalletPayment(walletNumber: "2380", amount: 180)
        
        let array = [bank, credit, debit, digitalWallet]
        
        array.forEach {
            $0.processTransaction()
        }

    }
   
}
