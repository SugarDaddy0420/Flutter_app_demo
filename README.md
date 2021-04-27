  - [Vue上課程式碼及說明文件本](#Vue上課程式碼及說明文件)
  - [Flutter安裝](#Flutter安裝)
  - [Flutter安裝常見錯誤](#Flutter安裝常見錯誤)
  - [FlutterDay1](#FlutterDay1)
    - [無狀態widget](#無狀態widget)
    - [有狀態widget](#有狀態widget)
    - [使用套件](#使用套件)
    - [Flutter頁面佈局](#Flutter頁面佈局)
      - [Text](#Text)
      - [Column](#Column)
      - [Row](#Row)
      - [Center](#Center)
      - [SizedBox](#SizedBox)
      - [ListView](#ListView)
      - [InkWell](#InkWell)
      - [MediaQuery](#MediaQuery)
  - [JsonToDart](#JsonToDart)

# Vue上課程式碼及說明文件
- https://github.com/lanceden/flutter_demo/tree/main/assets/VueDemo
- https://github.com/lanceden/vuecli-demo

# Flutter安裝
- mac
1. 下載Flutter: https://flutter.dev/docs/get-started/install
2. 解壓縮到:/Library
3. 開啟terminal輸入：vim .zshrc，按"i"鍵進入編輯模式
4. 輸入:export PATH=電腦中Flutter的路徑/flutter/bin:$PATH
5. 保存文件:wq
6. 重新加載terminal：source ~/.zshrc
6. 開啟terminal，輸入:flutter doctor，驗證是否安裝成功


# Flutter安裝常見錯誤

* 若照上述安裝有錯誤或失敗，請參考底下連結

* https://github.com/lanceden/flutter_demo/blob/main/FlutterInstall.md


# FlutterDay1

- 了解如何寫出建置專案的計數器
- 語法快捷鍵

```
stless - 產生無狀態的widgt

stful - 產生有狀態的widget
```

---

### 無狀態widget
* StatelessWidget在App初始化之後就不能改變，它是immutable。如果想要改變就得new一個新的StatelessWidget去做更換。

### 有狀態widget
*   StatefulWidget可以在App內無限次的被重繪集及更新狀態，它是mutable，需要重繪時可以調用setState()，
    去標記自己為dirty狀態，為下次更新做準備。

---

### 使用套件
*   於pubspec.yaml中dependencies新增使用的套件名稱偶版本號，保存後用flutter pub get 更新專案
*    Dio: 使用於發送網路請求   
*    flutter_swiper：類似於Carousel效果

```
  dependencies:
  flutter:
    sdk: flutter
  dio: ^3.0.2
  flutter_swiper: ^1.1.6
```

### Dio套件

- 發送Post請求
```
try {
  var response = await dio.post(
    '/JasperFitness/Banner/Preview',
    options: Options(headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    }),
  );
  if (response.statusCode == HttpStatus.ok) {
    return response.data;
  }
} catch (e) {
  return print(e);
}
```

### Swiper套件
```
Swiper(
  itemBuilder: (BuildContext context, int index) {
    return Image.network(
      '${banners.data.result[index].bannerImageName}',
      fit: BoxFit.fill,
      width: MediaQuery
          .of(context)
          .size
          .width,
    );
  },
  autoplay: true,
  itemCount: bannersCount,
  itemWidth: 300,
  itemHeight: 300,
  pagination: new SwiperPagination(),
  onTap: (index) {
    print(index);
  },
)
```
---


### Flutter頁面佈局

#### Text
- 顯示文字
- TextStyle - 文字大小、顏色調整

```
Text(
  'Hello World',
  style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
)
```

#### Column
- 將容器中的多個Widget垂直排列(由上往下)

```
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Image.asset(
      'assets/images/silerkitchen.jpg',
      width: 100,
      height: 100,
    ),
  ],
)
```

#### Row 
- 將容器中的多個Widget水平排列(由左往右)

```
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Image.asset(
      'assets/images/silerkitchen.jpg',
      width: 100,
      height: 100,
    ),
  ],
)
```

#### Center 
- 將容器中的單一Widget垂直置中

```
Center(
  child: Text('我被垂直置中啦'),
)
```

- Container - 可以控制繪製(painting)、定位(positioning)和大小(sizing)。

```
Container(
  height: 40,
  child: Center(
    child: Text('$message'),
  ),
)
```

#### SizedBox 
- 一個具有指定寬高的Box。

```
SizedBox(
  width: 16,
)
```

#### ListView 
- ListView是最常被使用的滾動組件，可以沿著一個方向排列所有children。
```
ListView.builder(
  shrinkWrap: true,
  itemBuilder: (context, index) {}
)
```

#### InkWell
- 當需要給一個元素點擊事件的時候可使用
#### GestureDetector
- 用法與InkWell類似，不過GestureDetector有更多處理手勢的方法

```
InkWell(
  onTap: () {
    print('點選了');
  },
  child: ListTile(
    title: Text('InkWell的子元件是ListTile'),
    trailing: Icon(Icons.chevron_right),
  ),
),

```

#### MediaQuery 
- 取回當前裝置大小資訊
```
// 取回當前裝置大小資訊
var mediaQueryData = MediaQuery.of(context);
// 取回取回當前裝置寬度
final double widthScreen = mediaQueryData.size.width;
// 取回取回當前裝置高度
final double heightScreen = mediaQueryData.size.height;
```

---

### JsonToDart
- 使用線上轉換，網址：https://app.quicktype.io/

---
