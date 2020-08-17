# MusicPlayer

## Building And Running The Project (Requirements)
* Swift 5.0+
* Xcode 11.5+
* iOS 13.0+

# Getting Started
If this is your first time encountering swift/ios development, please follow [the instructions](https://developer.apple.com/support/xcode/) to setup Xcode and Swift on your Mac. 
- checkout `master` branch to run latest version
- open the project by double clicking the `MusicPlayer.xcodeproj` file
- make sure you downloaded swift-packages
## Configs
```
// App Settings
APP_NAME = MusicPlayer
PRODUCT_BUNDLE_IDENTIFIER = com.hellofresh.MusicPlayer

#targets:
* MusicPlayer
* MusicPlayerTests
* MusicPlayerUITests //make sure simulator IO/Connect Hardware keyboard is off

```
# Build and or run application by doing:
* Select the build scheme which can be found right after the stop button on the top left of the IDE
* [Command(cmd)] + B - Build app
* [Command(cmd)] + R - Run app

## App Architecture
This application uses the Model-View-ViewModel (refered to as MVVM) architecture. The main purpose of the MVVM is to move the data state from the View to the ViewModel.

### Model
In the MVVM design pattern, Model is the same as in MVC pattern. It represents the data.

### View
View is represented by the UIView or UIViewController objects, accompanied with their .xib and .storyboard files, which should only display prepared data. 

### ViewModel
it is responsible for getting the data be ready and formatted to be filled in the UI, connect the other components to do different jobs, also it reserve the UI state. hides all asynchronous networking code, data preparation code for visual presentation, and code listening for Model changes. All of these are hidden behind a well-defined API modeled to fit this particular View.

## Structure

### SupportingFiles
- contains AppDelegate, SceneDelegate, Assets, Info plist.

### Modules
- includes Navigation, Extensions

### Scenes
This is for group of app scenes: login, recipes list, and recipe details 
 

## TODO
* design better api client.
* add error handling.
* add code coverage.
* add ui tests.

 

