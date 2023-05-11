//
//  Transaction.swift
//  Mentoria
//
//  Created by Thyago Raphael on 10/05/23.
//

import Foundation

protocol TransactionProtocol {
    func validate() throws
    func processTransaction() throws
}
