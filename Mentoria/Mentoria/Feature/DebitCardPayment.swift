//
//  DebitCardPayment.swift
//  Mentoria
//
//  Created by Thyago Raphael on 10/05/23.
//

import Foundation

final class DebitCardPayment: TransactionProtocol {
    let cardNumber: Int
    let cardExpirationString: String
    let cardSecurityCode: Int
    let cardHolderName: String
    let amount: Double
    let account: Account

    init(
        cardNumber: Int,
        cardExpirationString: String,
        cardSecurityCode: Int,
        cardHolderName: String,
        amount: Double,
        account: Account
    ) {
        self.cardNumber = cardNumber
        self.cardExpirationString = cardExpirationString
        self.cardSecurityCode = cardSecurityCode
        self.cardHolderName = cardHolderName
        self.amount = amount
        self.account = account
    }

    func validate() throws {
        // Verifica se o cartão possui 16 digitos
        let convertCardNumberToString = String(cardNumber)
        guard convertCardNumberToString.count == 16 else {
            throw ValidationError.invalidCardNumber
        }

        // Verifica se a data está vazia
        guard !cardExpirationString.isEmpty else {
            throw ValidationError.expiredCard
        }

        // Verifica se o cartão possui 3 digitos
        let convertCardSecurityToString = String(cardSecurityCode)
        guard convertCardSecurityToString.count == 3 else {
            throw ValidationError.invalidCardSecutiryCode
        }

        // Verifica se o titular do cartão não está vazio
        guard !cardHolderName.isEmpty else {
            throw ValidationError.invalidCardHoldName
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
