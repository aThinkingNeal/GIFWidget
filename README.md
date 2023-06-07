# GIFWidget

## How to run

* Open this project in Xcode
* Go to folder WidgetGIF
* Open the file WidgetGIF in the editor
* Click the build button on the top left corner
* The GIF of angry Jerry will be displayed in the simulator after the simulator is loaded, currently the GIF will somehow only redisplay after a long period of time (like 10 seconds)


## 学习的非凡体验

* Swift是一门让我感觉有点奇怪的语言，似乎过于强调灵活性而导致代码易读性比较差，不过Apple的documentation写的很好

* Widget的生态似乎并不成熟，Swift ios UI能够直接找到display GIF的package，但是Widget并没有能够直接支持的 GIF display package

* 自学的关键在于面对大量的陌生名词时不要恐惧，要有信心弄明白它们只是时间问题

* Widget的 timeline refresh policy 似乎会对刷新时间有一定限制，尽管目前的代码设置成.atEnd, 即当前 timeline display 完后立刻更新timeline，但实测需要等 10s 左右 timeline 才会再次更新, 根据 ios 官方的说法，会对 widget 的更新速度实施一定限制。（见Reference 中最后一个 link）

## References


[Learn to code with Apple - Apple Developer](https://developer.apple.com/learn/curriculum/)

[Develop apps for iOS | Apple Developer Documentation](https://developer.apple.com/tutorials/app-dev-training/)

## Swift
[YouTube](https://www.youtube.com/watch?v=nAchMctX4YA)

[Documentation](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/)

## SwiftUI
https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views

## Widgets
[YouTube](https://www.youtube.com/watch?v=jucm6e9M6LA)

[Creating a widget extension | Apple Developer Documentation](https://developer.apple.com/documentation/WidgetKit/Creating-a-Widget-Extension)

[Keeping a widget up to date | Apple Developer Documentation](https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date)

## Display GIF
[YouTube](https://www.youtube.com/watch?v=9fz8EW-dX-I)

## Build GIF widget with Swift
[YouTube](https://www.youtube.com/results?search_query=display+a+gif+in+ios+widget+swift)

[swiftui - iOS 16 WidgetKit Lock Screen Animated GIFs - Stack Overflow](https://stackoverflow.com/questions/73814632/ios-16-widgetkit-lock-screen-animated-gifs)

[How to play gif in widget? | Apple Developer Forums](https://developer.apple.com/forums/thread/720640)

[swift - How to add a Gif on my widget in SwiftUI? - Stack Overflow](https://stackoverflow.com/questions/74466862/how-to-add-a-gif-on-my-widget-in-swiftui)

## Bugs
[iOS - Package manifest at ‘/Package.swift’ cannot be accessed (/Package.swift doesn’t exist in file system) - Stack Overflow](https://stackoverflow.com/questions/75473774/package-manifest-at-package-swift-cannot-be-accessed-package-swift-doesnt)


** related to timeline update**
https://stackoverflow.com/questions/66504540/timeline-reload-policy-seems-to-be-ignored-in-widgetkit

https://stackoverflow.com/questions/66258627/ios-clock-animations-on-homescreen-widget/66408154#66408154
