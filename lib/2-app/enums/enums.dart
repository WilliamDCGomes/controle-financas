enum Flavor {
  DEV,
  HMLG,
  PROD,
}
enum StatusBill {
  alreadyPaid,
  deadlineEnding,
  late,
  investment,
  futureBill,
}
enum FormPayment {
  money,        // Dinheiro
  check,        // Cheque
  creditCard,   // Cartão de Crédito
  debtCard,     // Cartão de Débito
  bankTransfer, // Tranferência Bancária
  bankSlip,     // Boleto Bancário
  other,        // Outra Forma de Pagamento
}