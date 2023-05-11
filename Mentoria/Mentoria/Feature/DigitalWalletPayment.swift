//
//  DigitalWalletPayment.swift
//  Mentoria
//
//  Created by Thyago Raphael on 10/05/23.
//

import Foundation

final class DigitalWalletPayment: TransactionProtocol {
    let digitalWalletNumber: Int
    let amount: Double
    let account: Account

    init(
        digitalWalletNumber: Int,
        amount: Double,
        account: Account
    ) {
        self.digitalWalletNumber = digitalWalletNumber
        self.amount = amount
        self.account = account
    }

    func validate() throws {
        // Verifica se existe número da conta digital
        let convertDigitalWalletNumberToString = String(digitalWalletNumber)
        guard !convertDigitalWalletNumberToString.isEmpty else {
            throw ValidationError.invalidCardNumber
        }

        // Verifica se o saldo é maior que 0
        guard amount > 0 else {
            throw ValidationError.invalidAmount
        }
        
        // Verifica se a conta tem saldo
        guard account.balance > 0 else {
            throw ValidationError.invalidBalance
        }
    }

    func processTransaction() throws {
        try validate()
    }
}
