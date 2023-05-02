// Verificar com o Luan se precisa usar o nome abstract antes do class nessa classe
class Transaction {
    var amount: Double

    init(amount: Double) {
        self.amount = amount
    }
    
    func validate() -> Bool {
        fatalError("Esse método deve ser implementado pelas classes filhas")
    }
    
    func processTransaction() {
        fatalError("Esse método deve ser implementado pelas classes filhas")
    }
}

class TransactionProcessor {
    func processTransactions(transactions: [Transaction]) {
        for transaction in transactions {
            if transaction.validate() {
                transaction.processTransaction()
            } else {
                print("Não foi possível concluir a transação")
            }
        }
    }
}

class BankTransfer: Transaction {
    let sourceAccount: String
    let destinationAccount: String

    init(sourceAccount: String, destinationAccount: String, amount: Double) {
        self.sourceAccount = sourceAccount
        self.destinationAccount = destinationAccount
        
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        return true
    }
    
    override func processTransaction() { }
}

class CreditCardPayment: Transaction {
    let cardNumber: Int
    let cardExpirationDate: String
    let cardSecurityCode: Int
    let cardHolderName: String
    
    init(cardNumber: Int, cardExpirationDate: String, cardSecurityCode: Int, cardHolderName: String, amount: Double) {
        self.cardNumber = cardNumber
        self.cardExpirationDate = cardExpirationDate
        self.cardSecurityCode = cardSecurityCode
        self.cardHolderName = cardHolderName
        
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        return true
    }
    
    override func processTransaction() { }
}

// Verificar com o Luan se essa classe pode herdar a CreditCardPayment
class DebitCardPayment: Transaction {
    let cardNumber: Int
    let cardExpirationDate: String
    let cardSecurityCode: Int
    let cardHolderName: String
    
    init(cardNumber: Int, cardExpirationDate: String, cardSecurityCode: Int, cardHolderName: String, amount: Double) {
        self.cardNumber = cardNumber
        self.cardExpirationDate = cardExpirationDate
        self.cardSecurityCode = cardSecurityCode
        self.cardHolderName = cardHolderName
        
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        return true
    }
    
    override func processTransaction() { }
}

class DigitalWalletPayment: Transaction {
    let digitalWalletNumber: Int
    
    init(digitalWalletNumber: Int, amount: Double) {
        self.digitalWalletNumber = digitalWalletNumber
        
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        return true
    }
    
    override func processTransaction() { }
}
