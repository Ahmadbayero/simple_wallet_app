import 'package:simple_wallet_app/models/transaction.dart';

class ECard {
  ECard({
    this.bankName,
    this.cardNumber,
    this.cardHolderName,
    this.cardType,
    this.transactions,
  });
  final String bankName;
  final String cardNumber;
  final String cardHolderName;
  final String cardType;
  final List<Transaction> transactions;
}
