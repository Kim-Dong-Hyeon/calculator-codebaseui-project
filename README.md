# iOS 입문 과제

### **간단한 계산기 앱 만들기**

---

<img src="https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2Fd62096c4-d686-4342-82dc-cd1ae543920c%2FUntitled.png?table=block&id=118f9635-dcac-4f0a-abe4-95b2f7c68e70&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1420&userId=&cache=v2" alt="Alternate text">

```text
🧑🏻‍💻 간단한 계산기 앱 만들기

    입문 강의에서 배운 것들을 복습하며 계산기 앱을 만들어봅시다.

    * `UILabel` 로 숫자를 표시합니다.
    * `UIButton` 으로 숫자와 연산 버튼들을 만듭니다.
    * `UIStackView` 로 버튼들을 규칙성있게 배치합니다.
    * `AutoLayout` 을 활용해서 레이아웃을 설정합니다.
    * `backgroundColor` , `layer.cornerRadius` 등 다양한 속성들을 활용합니다.
    * `UIButton` 의 `addTarget` 혹은 `IBAction` 으로 버튼을 클릭했을 때 이벤트를 설정합니다.
    * 스토리보드 vs 코드베이스 UI
        - 두 가지 방법으로 모두 구현해보면 매우 좋은 연습이 됩니다.
        - 둘 중 하나만 연습한다면 코드베이스 UI 로 구현해보는 것을 추천합니다.

    * 이 과제는 `Lv.1 ~ Lv.8` 의 단계로 이루어져 있습니다.
        - `Lv.1 ~ Lv.5` : 반드시 구현 해보세요.
        - `Lv.6 ~ Lv.8` : 실력 향상을 위해 연습해보세요.

    오랜 시간이 걸려도 괜찮습니다. 여러가지 시행착오를 겪으며 성장하는 과제가 되었으면 좋겠습니다.
```

<br></br>

### **실행 모습**

---

<img src="https://i.ibb.co/D9d9w9P/image.gif">
<br></br>

### **구현 단계 Level 1~8**

---

1. `UILabel` 로 숫자 라벨 띄우기
2. `Horizontal StackView` : 버튼 4개를 모아 가로 정렬 스택 뷰 만들기
3. `Vertical StackView` : `Horizontal StackView` 4줄을 세로로 정렬하는 스택 뷰 만들기
4. 숫자 버튼과 연산 버튼의 색상 구분하기
5. 버튼을 원형으로 만들기
6. 버튼을 클릭하면 라벨에 표시되도록 하기
    - 숫자가 0으로 시작하지 않도록 하기 (ex: `0123` → `123` )
7. 초기화 버튼 (`AC`) 구현
8. 사칙연산 버튼 (`=`) 구현

<br></br>

```text
🧑🏻‍💻 참고 사항

    일반적인 계산기 앱은 구현이 꽤 복잡합니다. 예를 들어 소수점이 들어오는 경우 고려, 입력된 값의 자릿수가 너무 커서 지정한 라벨의 영역을 넘어가는 경우를 고려해야 하며, 세자리 수 마다 쉼표를 찍어줘야하며, 모든 연산 버튼을 클릭할때마다 계산이 이루어져야 합니다.

    이 과제에서는 간단한 약식 계산기 앱을 개발합니다.
        - 소수점을 고려하지 않은, 정수형 계산만 하며
        - 모든 연산 버튼을 클릭할때마다 계산이 이루어지도록 하지는 않으며
        - 등호 버튼 (`=`) 을 클릭했을 때만 연산이 이루어지도록 합니다.
        - 수식 문자열이 들어왔을 때 이를 계산해주는 Swift 의 기본 제공 기능을 활용합니다.
```

<br></br>

### **Level 1**

---

<img align='left' width='200' height='420' src='https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2Fc9be3c30-86cd-4a25-b7a8-a2b42fdb997c%2FUntitled.png?table=block&id=1f6ed06b-baa3-4225-a70a-9848190d2a66&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=380&userId=&cache=v2'>

```text

🧑🏻‍💻 `UILabel` 을 사용해서 수식을 표시할 수 있는 라벨을 띄웁니다.


    * 속성
        - `backgroundColor = .black`
        - `textColor = .white`
        - 우선, 텍스트는 `12345` 로 고정
        - 텍스트 오른쪽 정렬
        - Font = 시스템 볼드체, 사이즈 60

    * AutoLayout
        - leading, trailing = superView 로 부터 30 떨어지도록 세팅
        - top = superView 로 부터 200 떨어지도록 세팅
        - height = 100

```

<br></br><br></br>

### **Level 2**

---

<img align='left' width='200' height='420' src='https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2F600db970-41fa-4dc2-94ac-5765676d13b0%2FUntitled.png?table=block&id=6f8d2254-63f0-4d96-bda3-b281b671a3f4&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=890&userId=&cache=v2'>

```text

🧑🏻‍💻 `UIStackView` 을 사용해서 4개의 버튼을 모아 가로 스택뷰 생성. 왼쪽과 같이 구성해보세요.


    * `UIButton` 속성
        - `font = .boldSystemFont(ofSize: 30)`
        - `backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)`
        - `frame.size.height = 80`
        - `frame.size.width = 80`
        - `layer.cornerRadius = 40`

    * `horizontalStackView` 속성
        - `axis = .horizontal`
        - `backgroundColor = .black`
        - `spacing = 10`
        - `distribution = .fillEqually`

    * `horizontalStackView AutoLayout`
        - height = 80

```

**힌트**: `func makeHorizontalStackView(_ views: [UIView]) → UIStackView` 와 같은 형태로 horizontalStackView 를 생성하는 메서드를 정의해두면 좋습니다. 똑같은 스택뷰 4줄이 필요하기 때문이죠.
<br></br>

### **Level 3**

---

<img align='left' width='200' height='420' src='https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2F7a741e1d-bf97-4f31-9240-bbe29db3df2e%2FUntitled.png?table=block&id=4c27b577-20a0-48dc-832c-bcf7383f5887&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=890&userId=&cache=v2'>

```text

🧑🏻‍💻 `UIStackView` 을 사용해서 세로 스택 뷰 생성. 왼쪽과 같이 구성해보세요.


    * `verticalStackView` 속성
        - `axis = .vertical`
        - `backgroundColor = .black`
        - `spacing = 10`
        - `distribution = .fillEqually`

    * `horizontalStackView AutoLayout`
        - width = 350
        - top = label 의 bottom 으로 부터 60 떨어지도록.
        - centerX = superView 와 같도록.

```

<br></br><br></br><br></br>

### **Level 4**

---

<img align='left' width='200' height='420' src='https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2Fa37c65f9-f4a7-4c2b-92b0-1bb02604185b%2FUntitled.png?table=block&id=9c33ae1f-cb69-472a-933d-03260c693fb6&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=890&userId=&cache=v2'>

```text

🧑🏻‍💻 연산 버튼 (+, -, *, /, AC, =) 들은 색상을 orange 로 설정.


    - 개발 효율성을 위한 팁.
    버튼을 만드는 `func makeButton` 이라는 메서드가 있었고 인자로 `titleValue: String`, `action: Selector`, `backgroundColor: UIColor` 를 받을 수 있으면 편했겠죠.

```

<br></br><br></br><br></br><br></br><br></br><br></br>

### **Level 5**

---

<img align='left' width='200' height='420' src='https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2F0f4a4a83-718d-4d2e-83e6-e802086d7a7b%2FUntitled.png?table=block&id=0b071fa6-12a2-4386-8316-f15b163ed599&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=880&userId=&cache=v2'>

```text

🧑🏻‍💻 모든 버튼들을 원형으로 만들기.


    * 힌트
        - HorizontalStackView 의 높이 = 80
        - VerticalStackView 의 가로 = 350.
        - VerticalStackView 의 Spacing = 10
        - 그렇기 때문에 VerticalStackView 에 들어가는 모든 버튼은 가로 길이가 (350 - 10 * 3) / 4 = 80 이 됨.
        - 즉 모든 버튼은 정사각형이 됨.
        - 버튼을 원형으로 만들기 위해서는 정사각형 버튼을 만들고, cornerRadius 를 한 변 길이의 절반으로 설정하면 됩니다.
        - 여기까지 했으면 필수 구현들을 마쳤습니다.
        - 기본적인 UI 구성이었습니다.
        - 이 다음 스텝들은 본격적인 로직의 영역입니다.

```

<br></br><br></br><br></br>

### **Level 6**

---
```text
🧑🏻‍💻 버튼을 클릭하면 라벨에 표시되도록 합니다.
```

- [ ]  이제 기본 텍스트는 “12345” 가 아닌 “0” 이 되도록 합니다.
- [ ]  기본으로 라벨에 노출되어있던 텍스트 오른쪽에 버튼을 클릭하면 그 버튼의 값이 추가되도록 합니다.
    * 예를들어 설명하면
        1. 맨처음 기본값 `0`
        2. 그 다음 `1` 클릭했음 → 표시되는 값은 `01`
        3. 그 다음 `2` 클릭했음 → 표시되는 값은 `02`
        4. 그 다음 `+` 클릭했음 → 표시되는 값은 `02+`
        5. 그 다음 `3` 클릭했음 → 표시되는 값은 `02+3`
- [ ]  하지만 `012` 라는 값은 이상합니다. 맨 앞자리가 `0` 인 숫자라면, 0을 지우고 표현하도록 합니다.
    * 예를들면, `012` → `12` 가 되어야 합니다.

<br></br>

### **Level 7**

---

```text
🧑🏻‍💻 초기화 버튼 (`AC`) 을 구현합니다.
```

- [ ]  AC 버튼을 클릭하면 모든 값을 지우고 “0” 으로 초기화 되도록 구현합니다.

<br></br>

### **Level 8**

---

<img src="https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2Fa5e02aa4-00b2-4fe8-b383-41607945cd0a%2FUntitled.png?table=block&id=6796a064-abfe-4762-a585-2de9e2e88482&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1420&userId=&cache=v2">

```text
🧑🏻‍💻 등호 (`=`) 버튼을 클릭하면 연산이 수행되도록 구현합니다.

    * `1+2+3` 을 입력 후, `=` 을 클릭하면 결과값인 `6` 이 출력되도록 해주세요.
    * `123*456` 을 입력 후, `=` 을 클릭하면 결과값인 `56088` 이 출력되도록 해주세요.
    * 연산에 필요한 메서드를 제공해드리겠습니다. 이 메서드를 활용해주세요.
```

```swift
    /// 수식 문자열을 넣으면 계산해주는 메서드.
    ///
    /// 예를 들어 expression 에 "1+2+3" 이 들어오면 6 을 리턴한다.
    /// 잘못된 형식의 수식을 넣으면 앱이 크래시 난다. ex) "1+2++"
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
```

```text
    주석의 설명대로, 잘못된 형식의 수식을 넣으면 동작하지 않습니다.

    예를들어 `1+2++` 라는 수식은 잘못된 수식입니다.
```

<br></br>

### **Level 8까지 과제를 다 했다면?**

* **(필수)** 과제를 제출해주세요.
* 과제 제출이 확인되는 경우, Swift 문법을 다시 복습할 수 있는 과제를 제공해드릴 예정입니다.
