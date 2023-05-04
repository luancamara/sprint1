import UIKit
import Foundation


// Transaction
class Transaction {
    
    var contaDeOrigem: Int
    var contaDeDestino: Int
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

// Card Payment:
class CardPayment: Transaction {
    var numeroDoCartao: Int
    var validadeDoCartao: String
    var codigoDeSeguranca: Int
    var nomeDoTitularDoCartao: String
    
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
        if numeroDoCartao != 16 {
            return false
        }
        if validadeDoCartao.isEmpty {
            return false
        }
        if codigoDeSeguranca != 3 {
            return false
        }
        if nomeDoTitularDoCartao.isEmpty {
            return false
        }
        if valor <= 0 {
            return false
        }
        return true
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
    
    var numeroDaCarteiraDigital: Int
    
    // Inicializador:
    init(numeroDaCarteiraDigital: Int, contaDeOrigem: Int, contaDeDestino: Int, valor: Double) {
        self.numeroDaCarteiraDigital = numeroDaCarteiraDigital
        super.init(contaDeOrigem: contaDeOrigem, contaDeDestino: contaDeDestino, valor: valor)
    }
    
    // Método validate:
    override func validate() -> Bool {
        
        // Verifica se o número da carteira digital é válido:
        if numeroDaCarteiraDigital != 16 {
            return false
        }
        
        // Verifica se o valor é positivo:
        if valor <= 0 {
            return false
        }
        return true
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











