//
//  TransactionProcessor.swift
//  Mentoria
//
//  Created by Thyago Raphael on 10/05/23.
//

import Foundation

class TransactionProcessor {
    func processTransactions(transactions: [TransactionProtocol]) {
        transactions.forEach {
            do {
                try $0.processTransaction()
                print("Transação realizada com sucesso")
            } catch {
                guard let error = error as? ValidationError else { return }
                print(error.messageResult)
            }
        }
    }
}
