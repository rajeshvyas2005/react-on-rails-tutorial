# Here is the Puzzle
# Under the Bitcoin protocol, a block can contain up to 1000000 bytes of transactions.
# Miners can freely choose transactions to include in a block, and once they mine a block, they
# earn the transaction fees for each transaction in the block and an additional 12.5 BTC as a
# reward (as of May 2017).
# Please find the maximum possible reward for creating a block using the following 12
# transactions:
# ID Size (byte) Fee (BTC)
# 1 57247 0.0887
# 2 98732 0.1856
# 3 134928 0.2307
# 4 77275 0.1522
# 5 29240 0.0532
# 6 15440 0.0250
# 7 70820 0.1409
# 8 139603 0.2541
# 9 63718 0.1147
# 10 143807 0.2660
# 11 190457 0.2933
# 12 40572 0.0686
#
# Notes
# - A block cannot contain the same transaction more than once.
# - For simplicity, there are no dependencies between transactions, and any combination of
# transactions can be included in a block.
# - Also for the sake of simplicity you may ignore the fact that blocks must always contain a
# coinbase transaction.
using System;
using System.Collections.Generic;
class BtcTransaction
{
  const int MaxBlockSize = 1000000;
  const double AdditionalReward = 12.5;
  public void CalculateReward(List<Item> items)
  {
    var result = RecursiveMining((items.Count) - 1, MaxBlockSize, items);
    Console.WriteLine("Size of the Block: {0}", result.Item1);
    Console.WriteLine("Transaction Fee for the Block: {0} BTC", result.Item2);
    Console.WriteLine("Final Reward for the Block: {0} BTC", result.Item2 + AdditionalReward);
  }

  private Tuple<int, double> RecursiveMining(int i, int s, List<Item> items)
  {
  	if (i < 0 || s == 0) {
      return Tuple.Create(0,0.0);
  	} else if (items[i].TransSize > s) {
      return RecursiveMining(i - 1, s, items);
    }

    var resultFirst = RecursiveMining(i - 1, s, items);
  	var resultSecond = RecursiveMining(i - 1, s - items[i].TransSize, items);
    // Memo: Item1 = TransSize and Item2 = TransFee
  	var firstFee = resultFirst.Item2;
  	var secondFee = items[i].TransFee + resultSecond.Item2;
  	if (secondFee > firstFee) {
      return Tuple.Create(resultSecond.Item1 + items[i].TransSize, secondFee);
  	}

    return Tuple.Create(resultFirst.Item1, resultFirst.Item2);
  }

  public class Item
  {
      public int Id { get; set; }
      public int TransSize { get; set; }
      public double TransFee { get; set; }
  }
}

class Mothership
{
  static void Main()
  {
      List<BtcTransaction.Item> transactionItems = new List<BtcTransaction.Item>();
      transactionItems.Add(new BtcTransaction.Item() { Id = 1, TransSize = 57247, TransFee = 0.0887 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 2, TransSize = 98732, TransFee = 0.1856 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 3, TransSize = 134928, TransFee = 0.2307 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 4, TransSize = 77275, TransFee = 0.1522 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 5, TransSize = 29240, TransFee = 0.0532 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 6, TransSize = 15440, TransFee = 0.0250 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 7, TransSize = 70820, TransFee = 0.1409 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 8, TransSize = 139603, TransFee = 0.2541 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 9, TransSize = 63718, TransFee = 0.1147 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 10, TransSize = 143807, TransFee = 0.2660 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 11, TransSize = 190457, TransFee = 0.2933 });
      transactionItems.Add(new BtcTransaction.Item() { Id = 12, TransSize = 40572, TransFee = 0.0686 });

      BtcTransaction b = new BtcTransaction();
      b.CalculateReward(transactionItems);
  }
}
