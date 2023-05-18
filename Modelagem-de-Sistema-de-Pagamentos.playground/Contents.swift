import UIKit

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

@discardableResult

//func validateCreditCardPayment(credit: CreditCardPayment) {
//
//    if credit.numeroCartao != nil && credit.dataVencimento != nil && credit.codigoSeguranca != nil && credit.nomeTitularCartao != nil {
//        print("Pagamento com Cartão de Crédito validado")
//    }
//}
//
//func validateCreditCardPayment(credit: DebitCardPayment) {
//
//    if credit.numeroCartao != nil && credit.dataVencimento != nil && credit.codigoSeguranca != nil && credit.nomeTitularCartao != nil {
//        print("Pagamento com Cartão de Débito validado")
//    }
//}


/*
 Modelagem de Sistema de Pagamentos

 Imagine que você está desenvolvendo um sistema de pagamentos que deve lidar com várias formas de transações, como transferências bancárias, pagamentos com cartão de crédito e débito, e pagamentos com carteiras digitais. Sua tarefa é criar um modelo de classes em Swift que represente esse sistema de pagamentos. As classes devem utilizar os conceitos de POO como Herança, Polimorfismo, Abstração e Encapsulamento.

 Aqui estão as especificações para cada tipo de transação:

 Transferência Bancária
 Uma transferência bancária é uma transação entre duas contas bancárias. Ela contém as seguintes informações:

    - Conta de origem
    - Conta de destino
    - Valor

 Pagamento com Cartão de Crédito
 Um pagamento com cartão de crédito é uma transação onde o cliente utiliza o cartão de crédito para efetuar um pagamento. Ele contém as seguintes informações:

    -  Número do cartão
    - Data de validade do cartão
    - Código de segurança
     Nome do titular do cartão
     Valor

 Pagamento com Cartão de Débito
 Um pagamento com cartão de débito é uma transação onde o cliente utiliza o cartão de débito para efetuar um pagamento. Ele contém as seguintes informações:

 -  Número do cartão
 - Data de validade do cartão
 - Código de segurança
 - Nome do titular do cartão
 -  Valor

 Pagamento com Carteira Digital

 Um pagamento com carteira digital é uma transação onde o cliente utiliza uma carteira digital para efetuar um pagamento. Ele contém as seguintes informações:

 -  Número da carteira digital
 -  Valor
 Classes

 Abaixo estão algumas classes base que devem ser criadas para modelar o sistema de pagamentos.

  - Transaction: Uma classe abstrata que contém as informações comuns a todas as transações. Esta classe deve possuir um método abstrato chamado processTransaction(), que será implementado pelas classes filhas.
 - BankTransfer: Uma classe que representa a transferência bancária.
 - CreditCardPayment: Uma classe que representa o pagamento com cartão de crédito.
 - DebitCardPayment: Uma classe que representa o pagamento com cartão de débito.
 - DigitalWalletPayment: Uma classe que representa o pagamento com carteira digital.
 - TransactionProcessor: Uma classe que contém a lógica para processar as transações. Ela deve receber um array de Transaction e percorrer cada uma delas, chamando o método processTransaction() de cada uma.

 Requisitos adicionais
     Cada transação deve ter um método validate() que verifica se os dados da transação são válidos.
 
 */
