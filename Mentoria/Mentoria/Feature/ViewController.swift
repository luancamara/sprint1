//
//  ViewController.swift
//  Mentoria
//
//  Created by Thyago Raphael on 10/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        loadData()
    }
    
    func loadData() {
        let bankPayment = BankTransfer(
            sourceAccount: "thyago",
            destinationAccount: "Raphael",
            amount: 20,
            account: .init(balance: 0)
        )

        let creditCardPayment = CreditCardPayment(
            cardNumber: 1111111111111111,
            cardExpirationString: "10/11/2024",
            cardSecurityCode: 111,
            cardHolderName: "Thyago",
            amount: 120,
            account: .init(balance: 1000)
        )

        let debitCardPayment = DebitCardPayment(
            cardNumber: 2222222222222222,
            cardExpirationString: "11/10/2025",
            cardSecurityCode: 222,
            cardHolderName: "Raphael",
            amount: 150,
            account: .init(balance: 30)
        )

        let digitalWalletPayment = DigitalWalletPayment(
            digitalWalletNumber: 123456,
            amount: 200,
            account: .init(balance: 0)
        )

        let transactions: [TransactionProtocol] = [
            bankPayment,
            creditCardPayment,
            debitCardPayment,
            digitalWalletPayment
        ]

        let transactionProcessor = TransactionProcessor()
        transactionProcessor.processTransactions(transactions: transactions)
    }
}

