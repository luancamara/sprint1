//
//  ValidationError.swift
//  Mentoria
//
//  Created by Thyago Raphael on 10/05/23.
//

import Foundation

enum ValidationError: Error {
    case invalidCardNumber
    case expiredCard
    case invalidCardSecutiryCode
    case invalidCardHoldName
    case invalidAmount
    case invalidSourceAccount
    case invalidDestinationAccount
    case invalidTransaction
    case invalidBalance
    
    var messageResult: String {
        switch self {
        case .invalidCardNumber:
            return "ERROR: Número do cartão inválido"
        case .expiredCard:
            return "ERROR: O cartão expirou"
        case .invalidCardSecutiryCode:
            return "ERROR: Código de segurança inválido"
        case .invalidCardHoldName:
            return "ERROR: Não possui nome"
        case .invalidAmount:
            return "ERROR: Não possui saldo"
        case .invalidSourceAccount:
            return "ERROR: Não existe conta de origem"
        case .invalidDestinationAccount:
            return "ERROR: Não existe conta de destino"
        case .invalidTransaction:
            return "ERROR: Transação cancelada"
        case .invalidBalance:
            return "ERROR: Não tem saldo na conta"
        }
    }
}
