import 'package:financeapp/data/one.dart';

List<money> geter_top() {
  money snap_food = money();
  snap_food.name = "snap food";
  snap_food.fee = "- \$100";
  snap_food.time = "jan 30,2022";
  snap_food.image = "assets/images/cart.png";
  snap_food.buy = true;

  money snap = money();
  snap.name = "Transfer";
  snap.fee = "- \$60";
  snap.time = "Today";
  snap.image = "assets/images/cart.png";
  snap.buy = true;

  return [snap_food, snap];
}
