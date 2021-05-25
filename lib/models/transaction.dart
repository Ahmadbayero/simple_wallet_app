enum TransactionType { income, expense }

class Transaction {
  Transaction({
    this.transactionName,
    this.transactionDate,
    this.transactionType,
    this.transactionAmount,
  });
  final String transactionName;
  final DateTime transactionDate;
  final TransactionType transactionType;
  final double transactionAmount;
}
