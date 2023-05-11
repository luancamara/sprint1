//
//  ViewController.swift
//  SistemaDePagamento
//
//  Created by Kleiton Mendes de Brito on 10/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

enum TransactionError: Error {
    case failCreditCardPayment
    case failDebitCardPayment
    case failDigitalWalletPayment
    case accountNotFound
}

enum PasswordError: Error {
    case incorrectPassword, passwordNotMatch
}

protocol Transaction {
    let valor: Int { get }
    func processTransaction()
    func validate()
}

class BankTransfer: Transaction {
    
    let valor: Int
    
#if DEBUG && targetEnvironment(simulator)
    func processTransaction() {
        print("Conta e destino estão corretos")
    }
    
    func validate() {
        if contaOrigem != nil &&
            contaDestino != nil {
            print("Ir para a tela de confirmação de transação")
        }
    }
#endif
    
    let contaOrigem: Int
    let contaDestino: Int
    
    init(contaOrigem: Int, contaDestino: Int, valor: Int) {
        self.contaOrigem  = contaOrigem
        self.contaDestino = contaDestino
    }
#if DEBUG && targetEnvironment(simulator)
    func processTransaction() {
        print("Conta e destino estão corretos")
    }
    
    func validate() {
        if contaOrigem != nil &&
            contaDestino != nil {
            print("Ir para a tela de confirmação de transação")
        }
    }
#endif
    
    func failProcessTransaction() throws -> String {
        if contaOrigem == nil &&
            contaDestino == nil {
            throw TransactionError.accountNotFound
        }
    }
    
    do {
        try TransactionError.accountNotFound
    } catch {
        print(error)
    }
}

class CreditCardPayment: Transaction {
    
    var valor: Int
    
    let numeroCartao: String
    let dataVencimento: Date
    let codigoSeguranca: Int
    let nomeTitularCartao: String
    
    init(numeroCartao: String, dataVencimento: Int, codigoSeguranca: Int, nomeTitularCartao: String, valor: Int ) {
        self.numeroCartao = numeroCartao
        self.dataVencimento = dataVencimento
        self.codigoSeguranca = codigoSeguranca
        self.nomeTitularCartao = nomeTitularCartao
    }
    
    func processTransaction() {
        print("Pagamento com Cartão de Crédito efetuado com Sucesso")
    }
#if DEBUG && targetEnvironment(simulator)
    func validate() {
        let number: String = "6500400300322110"
        let cvc: String = "356"
        let name: String = "Lebron James"
        let nameCard: String = "Lebron James"
        let dateCard: String = "12/28"
        
        if number.count == number.count && cvc.count == cvc.count && name == nameCard && dateCard == dateCard {
            print("Informações conferem com o Cartão Cadastrado")
        } else {
            TransactionError.failCreditCardPayment
        }
    }
#endif
    
    func validadeCreditCardPayment() throws -> String {
            throw TransactionError.failCreditCardPayment
        }
 
    do {
        TransactionError.failCreditCardPayment
    } catch {
        print(error)
    }
    
}
    
class DebitCardPayment: Transaction{
    
    let valor: Int
    
    let numeroCartao: String
    let dataVencimento: Int
    let codigoSeguranca: Int
    let nomeTitularCartao: String
    
    init(numeroCartao: String, dataVencimento: Int, codigoSeguranca: Int, nomeTitularCartao: String, valor: Int ) {
        self.numeroCartao = numeroCartao
        self.dataVencimento = dataVencimento
        self.codigoSeguranca = codigoSeguranca
        self.nomeTitularCartao = nomeTitularCartao
    }
    
     func processTransaction() {
        print("Pagamento com Cartão de Débito efetuado com Sucesso")
    }
    
#if DEBUG && targetEnvironment(simulator)
     func validate() {
        let password: String = "04567346"
        if password == password.count {
            print("Senha valida. Compra Efetuada com Sucesso")
        } else {
            PasswordError.incorrectPassword
        }
    }
#endif
}

class DigitalWalletPayment: Transaction {
    
    let valor: Int
    
    func validate() {
        if let password.isEmpty {
            print("Pagamento Efetuado com Sucesso")
        }
    }
    
    var numeroCarteiraDigital: Int
    
    init(numeroCarteiraDigital: Int, valor: Int) {
        self.numeroCarteiraDigital = numeroCarteiraDigital
    }
    
     func processTransaction() {
        print("Pagamento com Cartão de Débito efetuado com Sucesso")
    }
    
    func failtProcessTransaction() throws -> String {
        TransactionError.failDebitCardPayment
    }
    
    do {
        try? TransactionError.failDebitCardPayment
    } catch {
        print(error)
    }
    
}

class TransactionProcessor {
    func processTransactions(transaction:[Transaction] ) {
        for transactions in transaction {
            transaction.count
        }
    }
}

class CreateAccount {
    let fullName: String
    let cpf: Int
    let address: String
    let dateBirth: Date
    let state: String
    let city: String
    
    init(fullName: String, cpf: Int, address: String, dateBirth: Date, state: String, city: String) {
        self.fullName = fullName
        self.cpf = cpf
        self.address = address
        self.dateBirth = dateBirth
        self.city = city
    }
    
    func contaOrigem() { }
    
    func contaDestino() { }
}

//    @discardableResult

   
