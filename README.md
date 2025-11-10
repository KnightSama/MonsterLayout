# MonsterLayout
用尽可能少的代码完成 iOS AutoLayout 布局

## 安装

### Swift Package Manager

1.在Package.swift文件添加如下代码:
```
dependencies: [
  .package(url: "https://github.com/pujiaxin33/JXSegmentedView.git", from: "1.2.1")
]
```
2.使用命令行构建:
```
$ swift build
```

### CocoaPods

该方式已移除，请直接使用 SPM 引用

### 手动

Clone代码，把Sources文件夹拖入项目，就可以使用了；

## 使用示例

### 为视图添加、修改、删除、重置布局
```swift
import MonsterLayout

class ViewController: UIViewController {

    lazy var box = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 新增视图时直接添加布局约束
        // 设置约束为四周填充父视图
        view.addSubview(box, .fill)

        // 重置约束
        // 重新设置约束为在父视图居中并且宽高为100
        box.remake(.center, .size(100))

        // 更新约束
        // 将视图的宽高更新为 100， 30
        box.update(.size(100, 30))

        // 移除约束
        // 将视图的居中约束移除
        box.remove(.center)

        // 新增约束
        // 新增视图居上、居左约束
        box.append(.top, .left)
    }

}
```
### 设置约束的 Offset
```swift
// 下面两种方法都可以设置左侧约束 Offset 为 50
view.addSubview(box, .left(50))
view.addSubview(box, .left.offset(50))
```
### 设置约束的 Multiplier
```swift
// 设置高度为指定高度的2倍
view.addSubview(box, .height(50).multiplier(2))
```

### 设置约束的 Relation
```swift
// 添加左侧约束为 lessThanOrEqual
view.addSubview(box, .left.relation(.less))
```

### 设置约束的优先级
```swift
// 添加左侧约束优先级为 high
view.addSubview(box, .left.priority(.high))
```

## License

MonsterLayout is released under the MIT license. See LICENSE for details.
