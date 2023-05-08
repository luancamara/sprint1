import Foundation

// MARK: - Enum ValidationResultPayment
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

// MARK: - Account
class Account {
    var balance: Double = 1000
    
    init(balance: Double) {
        self.balance = balance
    }
}

// MARK: - Transaction
class Transaction {
    let account: Account
    let amount: Double
    
    init(amount: Double, account: Account) {
        self.amount = amount
        self.account = account
    }
    
    func validate() throws {
        fatalError("Esse método deve ser implementado pelas classes filhas")
    }
    
    func processTransaction() throws {
        fatalError("Esse método deve ser implementado pelas classes filhas")
    }
}

// MARK: - BanckTransfer
class BankTransfer: Transaction {
    let sourceAccount: String
    let destinationAccount: String
    
    init(
        sourceAccount: String,
        destinationAccount: String,
        amount: Double,
        account: Account
    ) {
        self.sourceAccount = sourceAccount
        self.destinationAccount = destinationAccount
        
        super.init(amount: amount, account: account)
    }
    
    override func validate() throws {
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
    
    override func processTransaction() throws {
        try validate()
    }
}

// MARK: - CreditCardPayment
class CreditCardPayment: Transaction {
    let cardNumber: Int
    let cardExpirationString: String
    let cardSecurityCode: Int
    let cardHolderName: String

    init(
        cardNumber: Int,
        cardExpirationString: String,
        cardSecurityCode: Int,
        cardHolderName: String,
        amount: Double,
        account: Account
    ) {
        self.cardNumber = cardNumber
        self.cardExpirationString = cardExpirationString
        self.cardSecurityCode = cardSecurityCode
        self.cardHolderName = cardHolderName
        
        super.init(amount: amount, account: account)
    }

    override func validate() throws {
        // Verifica se o cartão possui 16 digitos
        let convertCardNumberToString = String(cardNumber)
        guard convertCardNumberToString.count == 16 else {
            throw ValidationError.invalidCardNumber
        }

        // Verifica se a data está vazia
        guard !cardExpirationString.isEmpty else {
            throw ValidationError.expiredCard
        }

        // Verifica se o cartão possui 3 digitos
        let convertCardSecurityToString = String(cardSecurityCode)
        guard convertCardSecurityToString.count == 3 else {
            throw ValidationError.invalidCardSecutiryCode
        }

        // Verifica se o titular do cartão não está vazio
        guard !cardHolderName.isEmpty else {
            throw ValidationError.invalidCardHoldName
        }

        // Verifica se o saldo é maior que 0
        guard amount > 0 else {
            throw ValidationError.invalidAmount
        }
    }

    override func processTransaction() throws {
        try validate()
    }
}

// MARK: - DebitCardPayment
class DebitCardPayment: Transaction {
    let cardNumber: Int
    let cardExpirationString: String
    let cardSecurityCode: Int
    let cardHolderName: String

    init(
        cardNumber: Int,
        cardExpirationString: String,
        cardSecurityCode: Int,
        cardHolderName: String,
        amount: Double,
        account: Account
    ) {
        self.cardNumber = cardNumber
        self.cardExpirationString = cardExpirationString
        self.cardSecurityCode = cardSecurityCode
        self.cardHolderName = cardHolderName
        
        super.init(amount: amount, account: account)
    }

    override func validate() throws {
        // Verifica se o cartão possui 16 digitos
        let convertCardNumberToString = String(cardNumber)
        guard convertCardNumberToString.count == 16 else {
            throw ValidationError.invalidCardNumber
        }

        // Verifica se a data está vazia
        guard !cardExpirationString.isEmpty else {
            throw ValidationError.expiredCard
        }

        // Verifica se o cartão possui 3 digitos
        let convertCardSecurityToString = String(cardSecurityCode)
        guard convertCardSecurityToString.count == 3 else {
            throw ValidationError.invalidCardSecutiryCode
        }

        // Verifica se o titular do cartão não está vazio
        guard !cardHolderName.isEmpty else {
            throw ValidationError.invalidCardHoldName
        }

        // Verifica se o saldo é maior que 0
        guard amount > 0 else {
            throw ValidationError.invalidAmount
        }
    }

    override func processTransaction() throws {
        try validate()
    }
}

// MARK: - DigitalWalletPayment
class DigitalWalletPayment: Transaction {
    let digitalWalletNumber: Int

    init(
        digitalWalletNumber: Int,
        amount: Double,
        account: Account
    ) {
        self.digitalWalletNumber = digitalWalletNumber

        super.init(amount: amount, account: account)
    }

    override func validate() throws {
        // Verifica se existe número da conta digital
        let convertDigitalWalletNumberToString = String(digitalWalletNumber)
        guard !convertDigitalWalletNumberToString.isEmpty else {
            throw ValidationError.invalidCardNumber
        }

        // Verifica se o saldo é maior que 0
        guard amount > 0 else {
            throw ValidationError.invalidAmount
        }
    }

    override func processTransaction() throws {
        try validate()
    }
}

// MARK: - TransactionProcessor
class TransactionProcessor {
    func processTransactions(transactions: [Transaction]) {
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

// LOADING DATA
let bankPayment = BankTransfer(
    sourceAccount: "thyago",
    destinationAccount: "Raphael",
    amount: 20,
    account: .init(balance: 0)
)


let creditCardPayment = CreditCardPayment(
    cardNumber: 1111111111111111,
    cardExpirationString: "10/11/2024",
    cardSecurityCode: 111,
    cardHolderName: "Thyago",
    amount: 120,
    account: .init(balance: 1000)
)

let debitCardPayment = DebitCardPayment(
    cardNumber: 2222222222222222,
    cardExpirationString: "11/10/2025",
    cardSecurityCode: 222,
    cardHolderName: "Raphael",
    amount: 150,
    account: .init(balance: 30)
)

let digitalWalletPayment = DigitalWalletPayment(
    digitalWalletNumber: 123456,
    amount: 200,
    account: .init(balance: 0)
)

let transactions = [
    bankPayment,
    creditCardPayment,
    debitCardPayment,
    digitalWalletPayment
]

let transactionProcessor = TransactionProcessor()
transactionProcessor.processTransactions(transactions: transactions)
