Generate a gradient using a custom curve function.

<img src="https://raw.githubusercontent.com/amokfa/flutter_curved_gradient/main/assets/curved2.png">

<br/>

<img src="https://raw.githubusercontent.com/amokfa/flutter_curved_gradient/main/assets/curved1.png">

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
