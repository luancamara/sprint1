//
//  ViewController.swift
//  sprint01Exercise
//
//  Created by Kaue de Assis Jacyntho on 02/05/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// Transaction

class Transaction {
    
    var amount: Double
    
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
    
    var walletNumber: String?
    
    init(walletNumber: String? = nil) {
        self.walletNumber = walletNumber
        super.init(amount: 0.00)
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

    var cardNumber: String?
    var expirationdate: String?
    var securityCode: String?
    var cardHolderName: String?
    

    init(cardNumber: String? = nil, expirationdate: String? = nil, securityCode: String? = nil, cardHolderName: String? = nil) {
        self.cardNumber = cardNumber
        self.expirationdate = expirationdate
        self.securityCode = securityCode
        self.cardHolderName = cardHolderName
        super.init(amount: 0.00)
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
    
    var sourceAccount: String?
    var destinationAccount: String?
    
    init(sourceAccount: String? = nil, destinationAccount: String? = nil) {
        self.sourceAccount = sourceAccount
        self.destinationAccount = destinationAccount
        super.init(amount: 0.00)
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
    
    var cardNumber: String?
    var expirationdate: String?
    var securityCode: String?
    var cardHolderName: String?
    
    init(cardNumber: String? = nil, expirationdate: String? = nil, securityCode: String? = nil, cardHolderName: String? = nil) {
        self.cardNumber = cardNumber
        self.expirationdate = expirationdate
        self.securityCode = securityCode
        self.cardHolderName = cardHolderName
        super.init(amount: 0)
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
        
        let bank = BankTransfer(sourceAccount: "CiclanoAccount", destinationAccount: "FulanoAccount")
        let credit = CreditCardPayment(cardNumber: "32029483", expirationdate: "02/2030", securityCode: "098", cardHolderName: "Ciclano da Silva")
        let debit = DebitCardPayment(cardNumber: "23344555", expirationdate: "03/2028", securityCode: "897", cardHolderName: "Fulano dos Santos")
        let digitalWallet = DigitalWalletPayment(walletNumber: "2380")
        
        bank.amount = 50.00
        credit.amount = 100.00
        debit.amount = 75.00
        digitalWallet.amount = 180.00
        
        let array = [bank, credit, debit, digitalWallet]
        
        array.forEach {
            $0.processTransaction()
        }

    }
   
}
