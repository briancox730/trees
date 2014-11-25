Type.delete_all
Tree.delete_all
Window.delete_all
AvailableTree.delete_all

type1 = Type.create(name: "Fraser Fir")
type2 = Type.create(name: "Balsam Fir")

Tree.create(height: '3-5', price: 59, type_id: type1.id)
Tree.create(height: '5-6', price: 79, type_id: type1.id)
Tree.create(height: '6-7', price: 89, type_id: type1.id)
Tree.create(height: '7-8', price: 99, type_id: type1.id)
Tree.create(height: '8-9', price: 109, type_id: type1.id)

Tree.create(height: '3-5', price: 55, type_id: type2.id)
Tree.create(height: '5-6', price: 75, type_id: type2.id)
Tree.create(height: '6-7', price: 85, type_id: type2.id)
Tree.create(height: '7-8', price: 95, type_id: type2.id)
Tree.create(height: '8-9', price: 105, type_id: type2.id)


Window.create(delivery_window: "As soon as possible")
Window.create(delivery_window: "Weekday: Evenings")
Window.create(delivery_window: "Weekend: Evenings")
Window.create(delivery_window: "Weekend: Afternoon")
Window.create(delivery_window: "Weekend: Morning")
