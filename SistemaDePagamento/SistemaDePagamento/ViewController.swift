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
        // Do any additional setup after loading the view.
    }
}

    class Transaction {
        let valor: Int
        
        init(valor: Int) {
            self.valor = valor
        }
        
        func processTransaction() {
            print("Processo de transação")
        }
        
        func validate() { }
    }

    class BankTransfer: Transaction {
        let contaOrigem: Int
        let contaDestino: Int
        
        init(contaOrigem: Int, contaDestino: Int, valor: Int) {
            self.contaOrigem  = contaOrigem
            self.contaDestino = contaDestino
            super.init(valor: valor)
        }
        
        override func processTransaction() {
            super.processTransaction()
            print("Conta e destino estão corretos")
        }
        
        override func validate() { }
    }

    class CreditCardPayment: Transaction {
        let numeroCartao: String
        let dataVencimento: Int
        let codigoSeguranca: Int
        let nomeTitularCartao: String
        
        init(numeroCartao: String, dataVencimento: Int, codigoSeguranca: Int, nomeTitularCartao: String, valor: Int ) {
            self.numeroCartao = numeroCartao
            self.dataVencimento = dataVencimento
            self.codigoSeguranca = codigoSeguranca
            self.nomeTitularCartao = nomeTitularCartao
            super.init(valor: valor)
        }
        
        override func processTransaction() {
            super.processTransaction()
            print("Pagamento com Cartão de Crédito efetuado com Sucesso")
        }
        #if DEBUG && targetEnvironment(simulator)
        override func validate() {
        let number: Int = 6500400300322110
        let cvc: Int = 356
        let name: String = "Lebron James"
        let nameCard: String = "Lebron James"
        let dateCard: String = "12/28"
            
            if number == number.count && cvc == cvc.count && name == nameCard && dateCard == dateCard {
                print("Informações conferem com o Cartão Cadastrado")
            } else {
                print("Atenção!! As informações estão incorretas")
            }
        }
        #endif
    }

    class DebitCardPayment: Transaction{
        let numeroCartao: String
        let dataVencimento: Int
        let codigoSeguranca: Int
        let nomeTitularCartao: String
        
        init(numeroCartao: String, dataVencimento: Int, codigoSeguranca: Int, nomeTitularCartao: String, valor: Int ) {
            self.numeroCartao = numeroCartao
            self.dataVencimento = dataVencimento
            self.codigoSeguranca = codigoSeguranca
            self.nomeTitularCartao = nomeTitularCartao
            super.init(valor: valor)
        }
        
        override func processTransaction() {
            super.processTransaction()
            print("Pagamento com Cartão de Débito efetuado com Sucesso")
        }
    #if DEBUG && targetEnvironment(simulator)
        override func validate() {
            let password: Int = 04567346
            if password == password.count {
                print("Senha valida. Compra Efetuada com Sucesso")
            } else {
                print("Senha incorreta. Digitar a senha correta do cartão")
            }
        }
        #endif
    }

    class DigitalWalletPayment: Transaction {
        var numeroCarteiraDigital: Int
        
        init(numeroCarteiraDigital: Int, valor: Int) {
            self.numeroCarteiraDigital = numeroCarteiraDigital
            super.init(valor: valor)
        }
        
        override func processTransaction() {
            super.processTransaction()
            print("Pagamento com Cartão de Débito efetuado com Sucesso")
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

   
