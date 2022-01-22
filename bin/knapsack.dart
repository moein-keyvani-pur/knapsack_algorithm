void main() {
  List<MyObject> myThings = [
    MyObject(p: 35, w: 7),
    MyObject(p: 30, w: 5),
    MyObject(p: 20, w: 2),
    MyObject(p: 12, w: 3),
    MyObject(p: 3, w: 1),
  ];
  List<MyObject> knapsack = [];
  bubbleSort(listMyObject: myThings);
  // we should get totalWeight from user using botoom line:
  /* try {
      double totalWeight=double.parse(stdin.readLineSync());
    } catch (e) {
    print('exception ${e.toString()}');
    }
*/
  double totalWeight = 13; // this input from user
  double currentWeight = 0;
  double totalProfit = 0;
  for (var item in myThings) {
    if (totalWeight >= currentWeight + item.weight!) {
      currentWeight += item.weight!;
      totalProfit += item.profit!;
      knapsack.add(item);
    }
  }
  print('all weight in knapsack is $currentWeight');
  print('total profit $totalProfit');
}

bubbleSort({required List<MyObject> listMyObject}) {
  MyObject itemMaxprofit = MyObject(p: 0.0, w: 0.0);
  List<MyObject> helper = [];
  for (int i = 0; i < listMyObject.length; i += 1) {
    itemMaxprofit = listMyObject[i];
    var pDivededW = itemMaxprofit.profit! / itemMaxprofit.weight!;
    for (int j = i; j < listMyObject.length; j += 1) {
      if (listMyObject[j].profit! / listMyObject[j].weight! > pDivededW) {
        var x = listMyObject[j];
        listMyObject[j] = listMyObject[i];
        listMyObject[i] = x;
        pDivededW = listMyObject[j].profit! / listMyObject[j].weight!;
      }
    }
  }
}

class MyObject {
  final double? profit;
  final double? weight;
  MyObject({double? p, double? w})
      : profit = p,
        weight = w;
}
