class ItemsData{
  final String itemName;
  final int itemPrice;
  ItemsData({required this.itemName, required this.itemPrice});
}

List<ItemsData> itemData=[
  ItemsData(itemName: 'SALT', itemPrice: 180),
  ItemsData(itemName: 'Oil', itemPrice: 220),
  ItemsData(itemName: 'Sugar', itemPrice: 240),
  ItemsData(itemName: 'Beef', itemPrice: 358),
  ItemsData(itemName: 'Chicken', itemPrice: 212),
];