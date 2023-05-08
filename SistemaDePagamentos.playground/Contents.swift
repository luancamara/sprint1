import UIKit
import Foundation


// Transaction
class Transaction {
    
    let contaDeOrigem: Int
    let contaDeDestino: Int
    let valor: Double
    
    // Método validate:
    func validate() -> Bool {
        return false
    }
    
    // Método abstrato:
    func processTransaction() {}
    
    
    // Inicializador:
    init(contaDeOrigem: Int, contaDeDestino: Int, valor: Double) {
        self.contaDeOrigem = contaDeOrigem
        self.contaDeDestino = contaDeDestino
        self.valor = valor
    }
}

// Class Account:
class Account {
    let name: String
    var saldo: Double
    var limite: Double
    
    init(name: String, saldo: Double, limite: Double) {
        self.name = name
        self.saldo = saldo
        self.limite = limite
    }
    
}

// Card Payment:
class CardPayment: Transaction {
    let numeroDoCartao: Int
    let validadeDoCartao: String
    let codigoDeSeguranca: Int
    let nomeDoTitularDoCartao: String
    
    // Inicializador:
    init(numeroDoCartao: Int, validadeDoCartao: String, codigoDeSeguranca: Int, nomeDoTitularDoCartao: String, contaDeOrigem: Int, contaDeDestino: Int, valor: Double) {
        self.numeroDoCartao = numeroDoCartao
        self.validadeDoCartao = validadeDoCartao
        self.codigoDeSeguranca = codigoDeSeguranca
        self.nomeDoTitularDoCartao = nomeDoTitularDoCartao
        super.init(contaDeOrigem: contaDeOrigem, contaDeDestino: contaDeDestino, valor: valor)
    }
    
    // Método validate:
    override func validate() -> Bool {
        if numeroDoCartao != 16 &&
            validadeDoCartao.isEmpty &&
            codigoDeSeguranca != 3 &&
            nomeDoTitularDoCartao.isEmpty &&
            valor < 0 {
            return true
        } else {
            print("Algo deu errado verifique as informações da transferência")
            return false
        }
    }
    
    
    // Bank Transfer:
    class BankTransfer: Transaction {
        
        
        // Inicializador:
        override init(contaDeOrigem: Int, contaDeDestino: Int, valor: Double) {
            super.init(contaDeOrigem: contaDeOrigem, contaDeDestino: contaDeDestino, valor: valor)
        }
        
        // Método validate:
        override func validate() -> Bool {
            // Verifica se os dados da transação são válidos
            if contaDeOrigem < 4 && contaDeDestino < 4 && valor < 0 {
                return true
            } else {
                print("Algo deu errado verifique as informações da transferência")
                return false
            }
        }
        
        
        // Método abstrato:
        override func processTransaction() {
            print("Transferência bancária processada: valor: \(valor)$ da Conta de origem: \(contaDeOrigem) para Conta de destino:  \(contaDeDestino)")
        }
        
    }
    
    // Credit Card Payment:
    class CreditCardPayment: CardPayment {
        
        // Inicializador:
        override init(numeroDoCartao: Int, validadeDoCartao: String, codigoDeSeguranca: Int, nomeDoTitularDoCartao: String, contaDeOrigem: Int, contaDeDestino: Int, valor: Double) {
            super.init(numeroDoCartao: numeroDoCartao,validadeDoCartao: validadeDoCartao,codigoDeSeguranca: codigoDeSeguranca,nomeDoTitularDoCartao: nomeDoTitularDoCartao,contaDeOrigem: contaDeOrigem, contaDeDestino: contaDeDestino, valor: valor)
        }
        
        
        // Método abstrato:
        override func processTransaction() {
            print("Compra no crédito processada: Valor: \(valor)$ Nome do comprador: \(nomeDoTitularDoCartao)")
        }
        
    }
    
    // Debit Card Payment:
    class DebitCardPayment: CardPayment {
        
        // Inicializador:
        override init(numeroDoCartao: Int, validadeDoCartao: String, codigoDeSeguranca: Int, nomeDoTitularDoCartao: String, contaDeOrigem: Int, contaDeDestino: Int, valor: Double) {
            super.init(numeroDoCartao: numeroDoCartao,validadeDoCartao: validadeDoCartao,codigoDeSeguranca: codigoDeSeguranca,nomeDoTitularDoCartao: nomeDoTitularDoCartao,contaDeOrigem: contaDeOrigem, contaDeDestino: contaDeDestino, valor: valor)
        }
        
        // Método abstrato:
        override func processTransaction() {
            print("Compra no débito processada: Valor: \(valor)$ Nome do comprador: \(nomeDoTitularDoCartao)")
        }
        
    }
    
    // Digital Wallet Payment:
    class DigitalWalletPayment: Transaction {
        
        let numeroDaCarteiraDigital: Int
        
        // Inicializador:
        init(numeroDaCarteiraDigital: Int, contaDeOrigem: Int, contaDeDestino: Int, valor: Double) {
            self.numeroDaCarteiraDigital = numeroDaCarteiraDigital
            super.init(contaDeOrigem: contaDeOrigem, contaDeDestino: contaDeDestino, valor: valor)
        }
        
        // Método validate:
        override func validate() -> Bool {
            
            // Verifica se os dados da transação são válidos
            if numeroDaCarteiraDigital < 4 && valor < 0 {
                return true
            } else {
                print("Algo deu errado verifique as informações da transferência")
                return false
            }
        }
        
        // Método abstrato:
        override func processTransaction() {
            print("Pagamento concluído: Valor: \(valor)$  Número da carteira digital: \(numeroDaCarteiraDigital)")
        }
        
    }
    
    class TransactionProcessor {
        func processTransactions(transactions: [Transaction]) {
            transactions.forEach {
                if $0.validate() {
                    $0.processTransaction()
                } else {
                    print("Transação inválida, favor verificar os dados.")
                }
            }
        }
    }
}

