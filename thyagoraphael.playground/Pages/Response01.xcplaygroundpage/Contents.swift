class Transaction {
    let amount: Double
    
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

class CardPayment: Transaction {
    let cardNumber: Int
    let cardExpirationDate: String
    let cardSecurityCode: Int
    let cardHolderName: String
    
    init(
        cardNumber: Int,
        cardExpirationDate: String,
        cardSecurityCode: Int,
        cardHolderName: String,
        amount: Double
    ) {
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

class TransactionProcessor {
    func processTransactions(transactions: [Transaction]) {
        transactions.forEach {
            if $0.validate() {
                $0.processTransaction()
            } else {
                print("Não foi possível concluir a transação")
            }
        }
    }
}

class BankTransfer: Transaction {
    let sourceAccount: String
    let destinationAccount: String
    
    init(
        sourceAccount: String,
        destinationAccount: String,
        amount: Double
    ) {
        self.sourceAccount = sourceAccount
        self.destinationAccount = destinationAccount
        
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        return true
    }
    
    override func processTransaction() { }
}

class CreditCardPayment: CardPayment {
    override init(
        cardNumber: Int,
        cardExpirationDate: String,
        cardSecurityCode: Int,
        cardHolderName: String,
        amount: Double
    ) {
        super.init(
            cardNumber: cardNumber,
            cardExpirationDate: cardExpirationDate,
            cardSecurityCode: cardSecurityCode,
            cardHolderName: cardHolderName,
            amount: amount
        )
    }
    
    override func validate() -> Bool {
        return true
    }
    
    override func processTransaction() { }
}

class DebitCardPayment: CardPayment {
    override init(
        cardNumber: Int,
        cardExpirationDate: String,
        cardSecurityCode: Int,
        cardHolderName: String,
        amount: Double
    ) {
        super.init(
            cardNumber: cardNumber,
            cardExpirationDate: cardExpirationDate,
            cardSecurityCode: cardSecurityCode,
            cardHolderName: cardHolderName,
            amount: amount
        )
    }
    
    override func validate() -> Bool {
        return true
    }
    
    override func processTransaction() { }

}

class DigitalWalletPayment: Transaction {
    let digitalWalletNumber: Int
    
    init(
        digitalWalletNumber: Int,
        amount: Double
    ) {
        self.digitalWalletNumber = digitalWalletNumber
        
        super.init(amount: amount)
    }
    
    override func validate() -> Bool {
        return true
    }
    
    override func processTransaction() { }
}
