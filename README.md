# calculatorAppProject
이번 과제는 계산기 앱 만들기입니다! 일단 만들기 전 저의 목표는 도전과제까지 해보는 것인데요...
사실 할 수 있을지 너무 걱정이지만? 일단 해보겠습니다 이제 전 앱 개발 공부를 시작한지 3주나 지났기때문에 이겨내야 합니다!!

-------
## 필수 구현기능 가이드

####  Lv1.
> `UILabel` 을 사용해서 수식을 표시할 수 있는 라벨을 띄웁니다.
>
>- 속성
  - `backgroundColer = .black`
  - `textColor = .white`
  - 우선 텍스트는 `12345` 로 고정
  - 텍스트 오른쪽 정렬
  - Font = 시스템 볼드체, 사이즈 60
>  
>- AutoLayout
  - leading, trailing = superView 로 부터 30 떨어지도록 세팅
  - top = superView 로 부터 200 떨어지도록 세팅
  - height = 100
  
  일단 Xcode 실행을 먼저 해준 뒤 Lv1을 만들어 보겠습니다.
  이 부분은 제가 강의 들으면서 배웠던 부분이라서 아마 그래도... 조금은 쉽게(?) 만들 수 있지 않을까 싶은데...
  한 번 만들어보겠습니다.
  
  아! 참고로 코드베이스UI 와 스토리보드 중 두 가지 방법을 모두 구현하면 너무 좋겠지만 저는 과제를 생각보다 너무 늦게 시작을 했고 느린 저를 생각하면 아마 두 가지 방법을 모두 구현하진 못할 거 같습니다...
  그래서 코드베이스UI 방법으로 진행해보겠습니다!! 만약 시간이 널널하면 스토리보드도 한번 구현해보겠습니다!
  
-------------- 
코드베이스UI를 사용하려면 해야할 일들이 많아요 스토리보드부터 삭제를 다 해줍니다.
사이사이 숨어있는 아이들까지 잘 지워줘야 됩니다. 

지우고 난 뒤 SceneDelegate로 가서
```
  // 앱을 시작할 때 세팅해줄 코드들을 작성해주는 곳.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //UIWindowScene 객체 생성
        guard let windowScene = (scene as? UIWindowScene) else { return}
        let window = UIWindow(windowScene: windowScene)
        
        //window에게 루트 뷰컨트롤러 지정.
        window.rootViewController = ViewController()
        
        // 이 메서드를 반드시 작성해줘야만 윈도우가 활성화 됨
        window.makeKeyAndVisible()

        self.window = window
```
원래 있던 코드들은 지우고 코드를 작성해줍니다
작성하고 나서 잘 작동이 되는지 한 번 실행을 해줄 건데 ViewController에서 실행을 해봅니다!

![](https://velog.velcdn.com/images/kr0sam/post/29e9c09e-c819-4f69-8c17-7bdf53a6d9ab/image.png)



  ![](https://velog.velcdn.com/images/kr0sam/post/42d5b002-b295-4093-b6c5-e9cc10b45c0f/image.png)
  
  ...? 왜 이렇게 뜬거지...? 저는 시키는대로 했을 뿐인데요... 
  빌드전용 장치는 이 대상을 실행하는데 사용할 수 없답니다... 
  도대체 내가 뭘 잘못했을까 하고 고민 좀 하고 올게요...
  고민해보고 안 되면 튜터님께 찾아가보겠습니다...🥲

아니 이런 바보같은 실수를 했습니다,,, 그냥 제가 기기를 선택하지 않아서 생긴 오류였어요...!!!!!!!!!!!!!!!
3주나 공부했으면서 이런 실수를 하다니!!!!!!!!!!!!!!!!!!!!!!!!!
역시 알려주신 선생님...? 튜터님...? 께서 하신대로 그대로 했는데 오류가 생길리가 없죠....

![](https://velog.velcdn.com/images/kr0sam/post/60004c06-7207-473d-ba3e-e43aef1f2933/image.png)


허허허 이런 바보같은 실수를... 아 생각할 수록 너무 부끄럽군요... 마음같아서 이 부분을 지우고 완벽한(?) 사람으로 보이게 하고 싶지만 이런 실수정도 해줘야 나중에 제가 저를 보고 귀여워할 수 있도록 기록하겠습니다...ㅎ


![](https://velog.velcdn.com/images/kr0sam/post/705ef646-757a-4a09-b829-781b6cecba01/image.png)


다행히 잘 작동합니다... 

Lv1 필수 구현 속성을 먼저 해결합니다
```
import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        label.text = "12345"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false // 오토 레이아웃을 활성화하기 위해 반드시 작성해야되는 코드임

```
AutoLayout 부분에서 정말 너무 힘들었는데요...
```
 label.textAlignment = .right
        
        label.font = UIFont(name: "system bold", size: 60)
        
        view.addSubview(label) // 이 코드 미작성시 label이 보이지 않음 ㅠ 주의!!
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
            
        ])
        
    }
}
```
일단 어찌저찌 자료들 보면서, 구글 서치하면서 했는데 문제가 생겼습니다...
![](https://velog.velcdn.com/images/kr0sam/post/98a0b370-03ff-42d2-9a2b-c60962f02f72/image.png)
엄... 왜 제 숫자들이 구석에 들어가있을까요... 심지어 폰트 설정도 안 된 거 같은데... 아무리 강의를 돌려봐도 나와있지 않습니다...!!!!! 구글에 서치를 해도 친절하게 알려주지만 알려준대로 한 것이 이것입니다,,, 아마 제가 이해를 잘못했거나 강의에 나왔는데 제대로 못 봤거나... 무조건 제가 문제일 겁니다 허허

이 부분을 해결하려고 다시 한 번 서치의 늪에 빠져보겠습니다...
이번 제 과제의 목표는 그 누구의 도움 없이 혼자 해내는 것이기 때문에 (서치 빼고 ㅎㅎ) 다시 찾아보다가 정 안 되면 튜터님께 다녀오겠습니다...

--------
제가 한 번 서치를 해보았는데요 저의 실수가 맞았습니다 
```
 label.textAlignment = .right
        
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        
        view.addSubview(label) // 이 코드 미작성시 label이 보이지 않음 ㅠ 주의!!
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
            
        ])
        
    }
}
```
폰트를 설정할 때 처음 제가 작성한 코드는`label.font = UIFont(name: "system bold", size: 60)`이거였는데 다시 찾아보니 
`label.font = UIFont.systemFont(ofSize: 60, weight: .bold)` 이렇게 적어야 되더라구요 시스템 볼드체를 적고 싶어서 처음 나온 방법에 제 생각대로 적었더니 안 됐던 거였어요! 

다음 문제였던 숫자가 구석에 몰려있던 현상이었는데요
`trailingAnchor`을 잘못 잡았습니다 오른쪽여백으로부터 왼쪽으로 30만큼 가야될 땐 `-`를 사용해주어야 합니다.
![](https://velog.velcdn.com/images/kr0sam/post/5a0ba664-fb7e-41fe-8aeb-27680a42281f/image.png)
그렇게 해서 완성된 Lv1 입니다!

-------------
#### Lv2.
> `UIStackView` 을 사용해서 4개의 버튼을 모아 가로 스택뷰 생성
 - `UIButton` 속성
   - `font = .boldSystemFont(ofSize: 30`
   - `backgroundColor = UIColor(red: 58/255, green: 58/255m blue: 58/255, alpha: 1.0)`
   - `height = 80`
   - `width = 80`
   - `layer.cornerRadius = 40`
 - `horizontalStackView` 속성
   - `axis = .horizontal`
   - `backgroundColor = .black`
   - `spacing = 10`
   - `distribution = .fillEqually`
 - `horizontalStackView AutoLayout`
   - `height = 80`
   >
📌 힌트: `func makeHorizontalStackView(_ views: [UIView]) -> UIStackView`와 같은 형태로 horizontalStackView를 생성하는 메서드를 정의해두면 좋습니다. 똑같은 스택뷰 4줄이 필요하기 때문이죠


Lv2부터는 스냅킷을 넣어서 만들어보았습니다
기본적인 틀은 강의내용에서 배웠던 걸로 만들다가 `stackView`는 처음 보는 개념인 거 같아서 구글링을 열심히 하고 다른 분들이 올리신 개념들을 보고 제 느낌이 가는대로 만들어보았는데요 사실 잘 될지는 모르겠어요...
일단 해보고 안 되면 수정하는 걸로!!
```
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
            
        }
    }

```
제가 `horizontalStackView` 속성만 채워서 시뮬레이터가 안 돌아가는 거 같아요...
아무래도 `UIButton` 속성도 만들어주고 나서 시뮬레이터를 돌려보겠습니당
![](https://velog.velcdn.com/images/kr0sam/post/c12cdf8a-2776-4447-bfa6-89c57299f721/image.png)
button 속성을 만드는 도중에 만나버린 오류입니다 iOS에서는 폰트를 사용할 수 없다는데... 
label때랑 같은 느낌으로 만들면 될 줄 알았는데 안 되네용 
안 된다? 그럼 될 때까지 싸워보겠습니다. 누가 이기나 보자!!!!!!!!!!!!!!!!!!

하다가 실수로 다 날려버렸어요... 다행히 여기에 기록이 남아있긴 하지만 날려버린 김에 처음부터 뜯어고쳐 보고 있습니당 구글링을 해보니까 폰트를 변경하는 방법이 친절하게 나와있더라구요
폰트 변경 하는 방법이 다 다른 건지는 정확하게 잘 모르겠지만 label과 button은 검색해본 결과 다른 거 같습니당
```
 button1.titleLabel?.font = .boldSystemFont(ofSize: 30)
```
![](https://velog.velcdn.com/images/kr0sam/post/d892f02e-dbf1-4d17-bb47-9538a1c14dc1/image.png)
오류 없이 잘 입력을 한 거 같긴 하지만 결과를 봐야 정확히 알 수 있겠지요...
나머지 버튼들을 다 작성해보고 오도록 하겠습니다!!!!

코드를 작성하다가 문득 든 생각인데요 좌표는 하난데 제가 코드를 여러개 작성하면 다 같은 위치에 뜨지 않나...? 라는 생각과 힌트를 주신 이유가 있지 않을까라는 생각이 들었습니다...
얼마나 다행인지 버튼들 다 작성하기 전에 생각해냈습니다 호호 


```
 private func configureUI() {
        let titles = ["7", "8", "9", "+"]
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10 // 버튼 간 간격 10포인트
        stackView.distribution = .fillEqually // 모든 버튼을 동일한 높이로 채움
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for title in titles {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            stackView.addArrangedSubview(button)
        }

```

`UIButton` 속성과 `horizontalAtackView` 속성을 만드는 건 생각보다 문제 없이 잘 해결 됐는데 
`horizontalStackView AutoLayout` 부분을 아직 구상하지 못했고 시뮬레이터를 돌릴 때 잘 돌아갈 수 있게 `Auto Layout` 제약 조건을 설정해주는 일만 남았습니다.
제약 조건이 다로 명시되있는 건 없어서 아마 제가 알아서 해내는 것이 미션이 아닐까라는 생각을 조심스럽게 해봅니다...
아니면 아쉬운거고 맞다면 정말 다행인 거구요~!

제가 지금 못한 것들이 다 오토레이아웃 부분이라서 자료들 찾아보면서 만들기는 했는데요
```
 
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        
        
    }
```

문제가 생겨버렸습니다
<img width="606" height="1166" alt="스크린샷 2025-09-09 오후 7 34 33" src="https://github.com/user-attachments/assets/c5a3b2e2-7ab3-4c28-93e7-33836be88818" />

오잉 예시 사진 보면 이렇게 뜨면 안 되는게 맞는데
제가 Lv1에서 만든 12345가 어디로 간 거죠...?????????
도대체 제가 무슨 실수를 했을까요... 좌표 실수인가.. 적으면 안 되는 파일에서 적은 건가...
전에 만들었던 걸 다 날려버린 걸까요...?

만들 때마다 이런 이벤트들이 있으면 개복치인 저는 터져버립니다... 나에게 이러지마 제발...🥲

hahahahahahahahahahahaha 사실 튜터님 도움 없이 혼자 해내고 싶었는데...
아무리 검색을 해도 아무리 많은 시도를 해도 잘 모르겠어서 도움을 받았습니다...
혼자서 한 1시간 머리 붙잡고 한 거 같은데 튜터님 덕분에 10분도 안 되서 해결이 됐답니다~!!

제 문제는 코드를 적은 위치였는데요 제가 원래 코드를 파일마다 나눠서 하려다가 생긴 문제였습니다.
Xcode는 한 화면만 보여준다고 해야되나 그래서 제가 이 버튼에 대한 코드들을 라벨 코드 아래에 넣으니 문제 없이 잘 작동 했습니다!!

앗 그리고 제가 튜터님과 화면을 보면서 고치느라 문제됐던 화면 오류도 바로 고쳤습니다.

#### 🥲 있었던 일 요약
1. 멋있어보이려고 코드 분리하다가 시뮬레이터 화면에 안 뜸
2. 무슨 문젠지 몰라서 이것저것 찾아보다가 찾아본 거 다 해봄
3. 1시간 넘게 소요
4. 마침 튜터님 방문에 고민 해결
5. 알고 보니 멋있어보이려고 했던 짓이 문제였음
6. 위치를 옮기고 나니 화면에 다 보이긴 하는데 Lv1이랑 Lv2가 겹쳐져서 보임
7. 덕분에 알게 된 것!!!!!!



`stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100`
요건 제가 처음 만들었던 `label`의 아래 부분으로 부터 얼마만큼 띄우겠다는 뜻인데 앱을 만들 때 거리감을 감으로 하는 것보단 이렇게 하는게 더 편하다고 하셨습니다!!
그렇게 해서 완성된 Lv2
<img width="606" height="1166" alt="스크린샷 2025-09-09 오후 8 34 09" src="https://github.com/user-attachments/assets/cea228d8-0afc-465e-a369-dd813c09b6ca" />

저... 이번주 안에 Lv5까지 할 수 있겠죠...?

