Type.delete_all
Tree.delete_all
Window.delete_all

type1 = Type.create(name: "Fraser Fir")
type2 = Type.create(name: "Balsam Fir")

Tree.create(height: 7, price: 79.99, type_id: type1.id)
Tree.create(height: 8, price: 89.99, type_id: type1.id)
Tree.create(height: 9, price: 99.99, type_id: type1.id)
Tree.create(height: 10, price: 109.99, type_id: type1.id)
Tree.create(height: 7, price: 69.99, type_id: type2.id)
Tree.create(height: 8, price: 79.99, type_id: type2.id)
Tree.create(height: 9, price: 89.99, type_id: type2.id)
Tree.create(height: 10, price: 99.99, type_id: type2.id)

Window.create(delivery_window: "As soon as possible")
Window.create(delivery_window: "Weekday: Evenings")
Window.create(delivery_window: "Weekend: Evenings")
Window.create(delivery_window: "Weekend: Afternoon")
Window.create(delivery_window: "Weekend: Morning")
