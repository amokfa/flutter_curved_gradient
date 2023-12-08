Generate a gradient using a custom curve function.

![demo1](assets/curved1.png)


![demo2](assets/curved2.png)

## Usage

```dart
Container(
  decoration: BoxDecoration(
    gradient: CurvedGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.grey, Colors.transparent],
      granularity: 10,
      curveGenerator: (x) => pow(sin(x * 10), 2).toDouble(),
    ),
  ),
)
```
