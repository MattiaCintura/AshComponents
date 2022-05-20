# AshComponents
AshComponents is a UI custom components package built using **SwiftUI** and avelable for iOS 15 and future versions.

## Demo
<img src="https://user-images.githubusercontent.com/32592671/169589945-03242ecf-a4fe-462c-ba68-c97699da5c49.png" width="180"/> |
<img src="https://user-images.githubusercontent.com/32592671/169590066-1e55192e-b350-4ade-91ab-a6d013231e05.png" width="180"/> |
<img src="https://user-images.githubusercontent.com/32592671/169590386-ee7ea4c0-3630-440d-a521-35c89e5ac2a4.png" width="180"/> |
<img src="https://user-images.githubusercontent.com/32592671/169590703-d2329e86-ce21-4593-9d10-a736bb204fb9.png" width="180"/>


## Overview
`AshComponents` provides a better solution to SwiftUI's built-in compontents such as NavigationView and TabView.

* [Installation](#installation)
* [Requirements](#requirements)
* [Getting started](#getting-started)

## Installation
#### Swift Package Manager
`AshComponents` can be added to your progect through [Swift Package Manager](https://swift.org/package-manager/).

1. From the **File** menu, select **Add Package...**
2. Enter this repo **URL** or **name** into the search bar.
3. Click on **Add Package**.
4. At this point Xcode will verify the package and get the latest version.
5. Click again on **Add Package**.
6. Now the package should be added to your Xcode project.

![Xcode file tree](https://user-images.githubusercontent.com/32592671/138132972-a569cd6a-bab2-455c-817c-25b313c32bc2.png)

Remember to verify if the package has been succesfully added into the **Frameworks, Libraries and Embedded Content** section of your project.

![Package avelable](https://user-images.githubusercontent.com/32592671/138134335-d9cde473-65e5-4cef-93eb-2bae522dcbae.png)

If not, just click on the **+** button and select it from the file tree that will be shown.

Now you just need to import the package on your SwiftUI file and enjoy it 🎉.

``` swift
import AshComponents
```

## Requirements
* iOS 15.0+
* Xcode 13+

# Getting started

## TabBar
The TabBar works exactly like the default SwiftUI TabView, but it looks way better 🙂

### Floating TabBar
<img src="https://user-images.githubusercontent.com/32592671/169594304-4f212df4-f2e2-42ae-a1cb-8ff5288a4080.png" width="220"/>

``` swift
import SwiftUI
import AshComponents

struct AshTabBar_Test: View {
    
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Home", color: .blue)
    
    var body: some View {
        AshFloatingTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .customTabBarItem(tab: TabBarItem(iconName: "house", title: "Home", color: .blue), selection: $tabSelection)
            Color.red
                .customTabBarItem(tab: TabBarItem(iconName: "heart", title: "Favorites", color: .pink), selection: $tabSelection)
        }
    }
}
```

### Fixed TabBar
<img src="https://user-images.githubusercontent.com/32592671/169595213-9fea96d0-8172-46f6-b4a9-c15d384c0778.png" width="220"/>

``` swift
import SwiftUI
import AshComponents

struct AshTabBar_Test: View {
    
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Home", color: .blue)
    
    var body: some View {
        AshTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .customTabBarItem(tab: TabBarItem(iconName: "house", title: "Home", color: .blue), selection: $tabSelection)
            Color.red
                .customTabBarItem(tab: TabBarItem(iconName: "heart", title: "Favorites", color: .pink), selection: $tabSelection)
        }
    }
}
```

You can customize the name, the color and the icon of the tab bar items using the modifier `.customTabBarItem`.

## NavBar
The NavBar implements the functionalities of the default SwiftUI NavigationView including the useage of NavigationLink or the custom NavLink.

<img src="https://user-images.githubusercontent.com/32592671/138155512-d1a430c1-2a3b-4b35-9d14-a75bbc2817d9.png" width="220"/> |

``` swift
struct HomeView: View {
    var body: some View {
        AshNavView {
            VStack {
                Text("Home")
            }
            .customNavigationTitle("Home")
            .customNavigationSubtitle("This is the home page of your app")
            .customNavigationBackgroundColor(.blue)
            .customNavigationForegroundColor(.white)
            .customNavigationIcon("house")
            .customNavigationBackButtonHidden(true)
        }
    }
}
```
> You can use the custom modifiers to adjust the NavBar to your needs.

### Title
<img src="https://user-images.githubusercontent.com/32592671/138157862-5a51022c-a97d-40a9-bc21-fd4f52fe0f3e.png" width="250"/>

``` swift
.customNavigationTitle("Home")
```

### Subtitle
<img src="https://user-images.githubusercontent.com/32592671/138158783-bb90c3d5-5dab-4a33-b7de-9a698d6cce92.png" width="250"/>

``` swift
.customNavigationSubtitle("This is the home page of your app")
```

### Background color
<img src="https://user-images.githubusercontent.com/32592671/138158913-0a064a01-3e7a-45c5-a823-2825753cb065.png" width="250"/>

``` swift
.customNavigationBackgroundColor(.blue)
```

### Foreground color
<img src="https://user-images.githubusercontent.com/32592671/138159015-72548e98-073f-43bf-aebc-6bb9806be357.png" width="250"/>

``` swift
customNavigationForegroundColor(.white)
```

### Icon
<img src="https://user-images.githubusercontent.com/32592671/138159123-546812a7-3e7e-4200-a754-637d82a4c42f.png" width="250"/>

``` swift
.customNavigationIcon("house")
```
> The image name refers to [SF Symbols](https://developer.apple.com/sf-symbols/).
