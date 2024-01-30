# Afiyet Listesi

## Projenin Amacı / Project's Purpose
Merhaba,

Uygulamanın temel amacı kendi tariflerinizi kaydetmek, tariflerinizin listesini tutmak ve aynı zamanda sevgili annemin lezzetli 
tariflerine de ulaşmaktır.Amaç aile dostlarının anneme sıklıkla sorduğu tarifleri sunmak.

Hello,

The main purpose of the application is to save your own recipes, keep a list of your recipes, and also access my beloved mother's 
delicious recipes. The purpose is to present recipes that family friends often ask my mother about.


## Projenin Açıklaması / Project's Explanation 
- Projenin geliştirilmesi sırasında temiz kod yazmaya ve MVVM mimarisine uymaya mümkün olduğunca özen gösterdim.
- Modelleri oluştururken verileri temsil edecek bir model ve verilerle işlem yapacak bir varlık oluşturdum.
- Polimorfizm ve Arayüz kullanımına ilişkin örnekleri uygulama içerisinde bulabilirsiniz.
---
- During the development of the project, I took as much care as possible to write clean code and comply with the MVVM architecture.
- While creating the models, I created a model to represent the data and an entity to process the data.
- You can find examples of Polymorphism and Interface usage in the application.
  

## Kurulum Talimatları / Installation Instructions 
1. Uygulamayı klonlayın: https://github.com/OzcanFatihCan/AfiyetListesi.git (Dilerseniz direkt ZIP olarak da indirebilirsiniz)
2. Klonlamak için kopyaladığınız bu linki GitBash veya git işlemlerini çalıştırabileceğiniz, işletim sisteminize uygun shell aracılığıyla bir dizine klon işlemini gerçekleştirin.
3. VSCode içerisinde File>Open Folder seçenekleri ile kaydettiğiniz dizine ulaşın. Bu dizindeki klasörü VSCode içerisinde açın.
4. Bu işlemden sonra uygulamayı geliştirme aşamasında kullanılan bağımlılıkları yüklemelisiniz. Bunun için VSCode içerisindeki terminalde aşağıdaki flutter
   komutlarını sırasıyla çalıştırın. Artık uygulamayı kullanabilirsiniz.
   
   ```
   flutter pub get
   ```
   ```
   flutter run
   ```
> [!NOTE]   
> Yaşayabileceğiniz kurulum sorunları için bana ulaşabilirsiniz
--- 
1. Clone the application: https://github.com/OzcanFatihCan/AfiyetListesi.git (You can also download it directly as ZIP if you wish)
2. To clone, clone the link you copied to a directory using GitBash or the shell appropriate to your operating system where you can run git processes.
3. Access the directory you saved in VSCode with File>Open Folder options. Open the folder in this directory in VSCode.
4. After this process, you must install the dependencies used during the development phase of the application. To do this,
   run the following flutter commands in the VSCode terminal, in order. You can now use the application.
   
   ```
   flutter pub get
   ```
   ```
   flutter run
   ```
> [!NOTE]
> You can contact me for any installation problems you may experience.

## Kullanıcı Kılavuzu / User guide

- [x] Login İşlemi
- [x] Google ile Login İşlemi
- [x] Yemek Tarifi Ekleme
- [x] Yemek Tariflerini Kategorik Listeleme
- [x] Favori Yemek Ekleme
- [x] Favorideki Yemekleri Kategorik Listeleme
- [x] Uygulama Yemekleri Kategorik Listeleme
- [x] Profil Düzenleme (Profil fotoğrafı / İsim)
- [x] Kullanıcılar Arasındaki Populer Yemekleri Kategorik Listeleme
- [x] Kullanıcılar Arasındaki Populer Yemekleri Aratma
- [x] Yemek Detaylarına Erişme (Populer, Kullanıcı, Favori, Uygulama yemekleri)
- [x] Kullanıcı Yemeği Güncellenmesi

---

- [x] Login Process
- [x] Login Process with Google
- [x] Add Recipe 
- [x] Listing Recipes Categorically
- [x] Add Favorite Food
- [x] Listing Favorite Foods Categorically
- [x] Listing App Food Categorically
- [x] Profile Edit (Profile photo / Name)
- [x] Categorically Listing Popular Foods Among Users
- [x] Searching For Popular Foods Amoung Users
- [x] Accessing Food Details (Popular, User, Favorite, Application Foods)
- [x] User Food Update 



## Referanslar / References
- Firebase İşlemleri/Firebase transaction: https://firebase.google.com/docs/build?hl=tr
- Animasyonlar/Animations: https://lottiefiles.com
- Harici Paketler/External Packages: https://pub.dev/
- Bloc Mimarisi/Bloc Architecture: https://bloclibrary.dev/#/
- Uygulama İçi Görseller Yapay Zeka Kullanılarak Üretilmiştir(DALL-E3): https://www.bing.com/images/create
 

## Ekran Kayıtları ve Ekran Görüntüleri / Screen Recordings and Screenshots
#### Giriş 
![First](https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/09e55a6f-6523-477d-bb9c-63ae64c83a97)

#### Login İşlemi

![Login](https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/b009b7dd-1888-43e0-8b88-4d947a1f6cc1)
![Register](https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/643738d2-dc83-427c-99d2-86e56663d1b6)

https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/14f6548b-de2e-4196-9a4e-14afbd0a7a5a

#### Google ile Login İşlemi

![GoogleLogin](https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/15d98d21-e2fd-41e2-8fc2-60dada347e01)

#### Yemek Tarifi Ekleme
![Foodadd1](https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/45191e12-0419-4925-ada4-b503581dd30b)
![Foodadd2](https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/05a8efdb-4f86-46b5-b15d-1114c8403a9b)

https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/ea7352b9-d7d5-4a39-8eff-2db58b46eb87

#### Yemek Tarifi Kategorik Listeleme

https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/1fc35c1b-4cee-41d5-950e-456dacd43d6d

#### Favori Yemek Ekleme

https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/3d580c7d-4874-41fa-91af-50fb572fb150

#### Favorideki Yemekleri Kategorik Listeleme

https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/90f659c8-8156-4849-b511-255b561aa591

#### Uygulama Yemekleri Kategorik Listeleme

https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/940c5abe-5b89-4252-b1e6-31c3294806cd

#### Profil Düzenleme (Profil fotoğrafı / İsim)

https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/476c2ded-a4d4-47a0-b5fc-3d3fa9299c6a

#### Kullanıcılar Arasındaki Populer Yemekleri Kategorik Listeleme
![PopularList](https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/04d98bdb-5492-4907-a91f-cd5a33731779)

#### Kullanıcılar Arasındaki Populer Yemekleri Aratma
![PopularSearch](https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/ce5a56f2-f599-437d-9079-b41bd8ed976b)

#### Yemek Detaylarına Erişme (Populer, Kullanıcı, Favori, Uygulama yemekleri)

https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/e247016f-994d-43b6-b0c7-2d886d8934dc

#### Kullanıcı Yemeği Güncellenmesi

https://github.com/OzcanFatihCan/AfiyetListesi/assets/93872480/6831f61b-e7bf-42e9-8e47-f955f1c5f4bf



