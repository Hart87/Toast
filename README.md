# Toast for iOS
Toast Messages for iOS - Swift 4 / iOS12

![Alt Text](https://media.giphy.com/media/54ZTjYIqMogM2Rz7m1/giphy.gif)

Toast messages come from Android. They're subtle messages that appear briefly towards
the bottom of the screen and then go away a few seconds later.


# Installation
copy the Toast.swift file into your directory


# Use
```swift
var toast = Toast()

toast.Show(message: "🚨 🍞 First Toast 🍞 🚨", textColor: .white, backgroundColor: .blue, view: self.view)
```

The function takes 4 parameters. message(String) - is the message you want to send. textColor & backgroundColor(both UIColor). 
view (UIView) is the view you want the toast to appear in. The message will last for 4 seconds. 
You can use whatever color types you want - hex, RGB, .color enumerations. Doesn't matter as long as you store it as a UIColor variable

Feel free to use it in your apps. Hope you enjoy it. Spread the word.

# Questions
I'll update this as I go. and questions HMU... Hart87@gmail.com
