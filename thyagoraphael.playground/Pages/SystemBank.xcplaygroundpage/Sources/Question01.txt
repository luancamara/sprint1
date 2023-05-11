/*
 Modelagem de Sistema de Pagamentos

 Imagine que você está desenvolvendo um sistema de pagamentos que deve lidar com várias formas de transações, como transferências bancárias, pagamentos com cartão de crédito e débito, e pagamentos com carteiras digitais. Sua tarefa é criar um modelo de classes em Swift que represente esse sistema de pagamentos. As classes devem utilizar os conceitos de POO como Herança, Polimorfismo, Abstração e Encapsulamento.

 Aqui estão as especificações para cada tipo de transação:

 1. Transferência Bancária
 Uma transferência bancária é uma transação entre duas contas bancárias. Ela contém as seguintes informações:

 Conta de origem
 Conta de destino
 Valor

 
 2. Pagamento com Cartão de Crédito
 Um pagamento com cartão de crédito é uma transação onde o cliente utiliza o cartão de crédito para efetuar um pagamento. Ele contém as seguintes informações:

 Número do cartão
 Data de validade do cartão
 Código de segurança
 Nome do titular do cartão
 Valor

 3. Pagamento com Cartão de Débito
 Um pagamento com cartão de débito é uma transação onde o cliente utiliza o cartão de débito para efetuar um pagamento. Ele contém as seguintes informações:

 Número do cartão
 Data de validade do cartão
 Código de segurança
 Nome do titular do cartão
 Valor

 4. Pagamento com Carteira Digital
 Um pagamento com carteira digital é uma transação onde o cliente utiliza uma carteira digital para efetuar um pagamento. Ele contém as seguintes informações:

 Número da carteira digital
 Valor
 
 
 Classes

 Abaixo estão algumas classes base que devem ser criadas para modelar o sistema de pagamentos.
  
 Transaction: Uma classe abstrata que contém as informações comuns a todas as transações. Esta classe deve possuir um método abstrato chamado processTransaction(), que será implementado pelas classes filhas.
 BankTransfer: Uma classe que representa a transferência bancária.
 CreditCardPayment: Uma classe que representa o pagamento com cartão de crédito.
 DebitCardPayment: Uma classe que representa o pagamento com cartão de débito.
 DigitalWalletPayment: Uma classe que representa o pagamento com carteira digital.
 TransactionProcessor: Uma classe que contém a lógica para processar as transações. Ela deve receber um array de Transaction e percorrer cada uma delas, chamando o método processTransaction() de cada uma.

 Requisitos adicionais
 
 Cada transação deve ter um método validate() que verifica se os dados da transação são válidos.
 */
