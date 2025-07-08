import 'package:financeapp/data/one.dart';
//import 'package:financeapp/data/listdata.dart';

List<money> geter() {
  money upwork = money();
  upwork.name = "upwork";
  upwork.fee = "650";
  upwork.time = "Today";
  upwork.image = "assets/cart.png";
  upwork.buy = false;

  money starbucks = money();
  starbucks.name = "Starbucks";
  starbucks.fee = "5.50";
  starbucks.time = "Today";
  starbucks.image = "assets/code.png";
  starbucks.buy = true;

  money trasfer = money();
  trasfer.name = "Transfer from yac";
  trasfer.fee = "100";
  trasfer.time = "jan 30.2022";
  trasfer.image = "assets/computer.png";
  trasfer.buy = false;

  return [
    upwork,
    starbucks,
    trasfer,
    starbucks,
    trasfer,
    upwork,
    trasfer,
    starbucks,
    upwork,
    trasfer,];
}
