
## Struktur folder

```
lib/
├── main.dart                  MultiProvider, tema, halaman awal
├── models/                    abstract class dan turunannya
│   ├── menu_product.dart      abstract class MenuProduct (blueprint)
│   ├── food_product.dart      turunan 1, prepMinutes = 10, level pedas
│   ├── drink_product.dart     turunan 2, prepMinutes = 3, pilihan suhu
│   ├── cart_item.dart
│   └── order_model.dart       OrderModel, OrderItem, OrderStatus
├── services/
│   ├── database_helper.dart   singleton SQLite, CRUD async
│   └── order_code_service.dart  kode order dan slot waktu ambil
├── providers/                 state dan logika bisnis (ChangeNotifier)
│   ├── menu_provider.dart
│   ├── cart_provider.dart
│   └── order_provider.dart
├── pages/
│   ├── main_page.dart         NavigationBar, 3 halaman utama
│   ├── home_page.dart
│   ├── menu_page.dart
│   ├── product_detail_page.dart
│   ├── cart_page.dart
│   ├── checkout_page.dart     form pembayaran (mode tambah dan ubah)
│   ├── receipt_page.dart
│   └── orders_page.dart
├── widgets/                   komponen yang dipakai ulang
└── utils/                     validators, format, tema
test/                          unit test (model, validator, keranjang, kode order, format)
```
