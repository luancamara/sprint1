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
        print( validate() ? "Transação realizada" : "ERRO! - Transação cancelada.")
    }
    
    init(amount: Double) {
        self.amount = amount
    }
    
}

class Account {
    
    static let accountShared = Account()
    var balance: Double = 500.00
    var credicardLimit = 1000.00
    
    private init() {}
    
}

// DigitalWalletPayment

final class DigitalWalletPayment: Transaction {
    
    let account = Account.accountShared
    private let walletNumber: String?
    
    init(walletNumber: String? = nil, amount: Double) {
        self.walletNumber = walletNumber
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        
        if walletNumber != nil &&
            amount > 0 && amount <= account.balance
        {
            account.balance -= amount
            print(account.balance)
            return true
        }
        
        return false
    }
    
    override func processTransaction() {
        print(validate() ? "Pagamento com carteira digital realizado com sucesso." : "ERRO! - Pagamento com carteira digital cancelado.")
    }
    
}

// BankTransfer

final class BankTransfer: Transaction {
    
    private let sourceAccount: String?
    private let destinationAccount: String?
    let account = Account.accountShared
    
    
    init(sourceAccount: String? = nil, destinationAccount: String? = nil, amount: Double) {
        self.sourceAccount = sourceAccount
        self.destinationAccount = destinationAccount
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        if sourceAccount != nil &&
            destinationAccount != nil &&
            amount > 0 && amount <= account.balance
        {
            account.balance -= amount
            print(account.balance)
            return true
        }
        return false
    }
    
    override func processTransaction() {
        print( validate() ? "Tranferência bancária realizada com sucesso." : "ERRO! - Tranferência bancária cancelada.")
    }
}


// DebitCardPayment

final class DebitCardPayment: Transaction {
    
    private let cardNumber: String?
    private let expirationdate: String?
    private let securityCode: String?
    private let cardHolderName: String?
    let account = Account.accountShared
    
    init(cardNumber: String? = nil, expirationdate: String? = nil, securityCode: String? = nil, cardHolderName: String? = nil, amount: Double) {
        self.cardNumber = cardNumber
        self.expirationdate = expirationdate
        self.securityCode = securityCode
        self.cardHolderName = cardHolderName
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        if cardNumber?.count == 16 &&
            expirationdate != nil &&
            securityCode != nil &&
            cardHolderName != nil &&
            amount > 0 && amount <= account.balance
        {
            account.balance -= amount
            print(account.balance)
            return true
        }
        return false
    }
    
    override func processTransaction() {
        print(validate() ?  "Pagamento com cartão de débito realizado com sucesso." : "ERRO! - Pagamento com cartão de débito cancelado.")
    }
}


// CreditCardPayment

final class CreditCardPayment: Transaction {
    
    private let cardNumber: String?
    private let expirationdate: String?
    private let securityCode: String?
    private let cardHolderName: String?
    let account = Account.accountShared
    
    init(cardNumber: String? = nil, expirationdate: String? = nil, securityCode: String? = nil, cardHolderName: String? = nil, amount: Double) {
        self.cardNumber = cardNumber
        self.expirationdate = expirationdate
        self.securityCode = securityCode
        self.cardHolderName = cardHolderName
        super.init(amount: amount)
    }
    override func validate() -> Bool {
        if cardNumber?.count == 16 &&
            expirationdate != nil &&
            securityCode?.count == 3 &&
            cardHolderName != nil &&
            amount > 0 && amount < account.credicardLimit
        {
            account.credicardLimit -= amount
            print(account.credicardLimit)
            return true
        }
        return false
    }
    
    override func processTransaction() {
        print( validate() ? "Pagamento com cartão de crédito realizado com sucesso." : "ERRO! - Pagamento com cartão de crédito cancelado.")
    }
    
}


// TransactionProcessor

final class TransactionProcessor: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bankPayment = BankTransfer(sourceAccount: "CiclanoAccount", destinationAccount: "FulanoAccount", amount: 150)
        let creditPayment = CreditCardPayment(cardNumber: "3202948390878909", expirationdate: "02/2030", securityCode: "098", cardHolderName: "Ciclano da Silva", amount: 700)
        let debitPayment = DebitCardPayment(cardNumber: "2334455509871234", expirationdate: "03/2028", securityCode: "897", cardHolderName: "Fulano dos Santos", amount: 39)
        let digitalWalletPayment = DigitalWalletPayment(walletNumber: "2380", amount: 200)
        let digitalWalletPayment2 = DigitalWalletPayment(walletNumber: "2380", amount: 20)
        
        let array = [bankPayment, creditPayment, debitPayment, digitalWalletPayment, digitalWalletPayment2]
        
        array.forEach {
            $0.processTransaction()
        }
        
    }
    
}
