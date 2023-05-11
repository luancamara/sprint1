//
//  BankTransfer.swift
//  Mentoria
//
//  Created by Thyago Raphael on 10/05/23.
//

import Foundation

final class BankTransfer: TransactionProtocol {
    let sourceAccount: String
    let destinationAccount: String
    let amount: Double
    let account: Account
    
    init(
        sourceAccount: String,
        destinationAccount: String,
        amount: Double,
        account: Account
    ) {
        self.sourceAccount = sourceAccount
        self.destinationAccount = destinationAccount
        self.amount = amount
        self.account = account
    }
    
    func validate() throws {
        // Verifica se existe conta de origem
        guard !sourceAccount.isEmpty else {
            throw ValidationError.invalidSourceAccount
        }
        
        // Verifica se existe conta de destino
        guard !destinationAccount.isEmpty else {
            throw ValidationError.invalidDestinationAccount
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
