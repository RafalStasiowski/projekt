F1 = Food.create(name: "Rolada z kluskami",
                 description: "Idealne na niedzielny obiad",
                 price: 30, food_image_file_name: "kluski.jpg",
                 status: "available"
                 )

F2 = Food.create(name: "Szpajza",
                 description: "Przepyszne",
                 price: 20,
                 status: "available",
                 food_image_file_name: "szpajza.jpg")

F3= Food.create(name: "Wodzionka",
                description: "Najlepsza ze wszystkich slonskich zup!",
                price: 15,
                status: "available",
                food_image_file_name: "wodzionka.jpg")


F4 = Food.create(name: "Galert",
                 description: "Obowiazkowa pozycja na kazdej imprezie i uroczystosci",
                 price: 20,
                 status: "available",
                 food_image_file_name: "galert.jpg")
F5 = Food.create(name: "Kolocz",
                 description: "Obowiazkowe na kazdym przyjeciu",
                 price: 40,
                 status: "available",
                 food_image_file_name: "kolocz2.jpg")


 

C1 = Category.create(title: "Przystawka",
                     description: "Przystawka")

C2 = Category.create(title: "Desery",
                     description: "Deser")


A1 = User.create(first_name: "Sebastian",
                 last_name: "Soja",
                 email: "seba5152@wp.pl",
                 password: "janpawel2",
                 password_confirmation: "janpawel2",
                 role: "admin")
O1 = Order.create(Status: "Zakończone", transaction_id: "1T7JJK6ASJK48110", user_id: A1.id)


Order_Item1 = OrderItem.create(quantity: 3, food_id: F1.id, order_id: 1)




C1.foods << F1
C2.foods << F2
C1.foods << F4
C2.foods << F5
C1.foods << F1





