# Toast for iOS
Toast Messages for iOS - Swift 4 / iOS12

Toast messages come from Android. They're subtle messages that appear briefly towards
the bottom of the screen and then go away a few seconds later.


# Installation
copy the Toast.swift file into your directory


# Use
var toast = Toast()

toast.Show(message: "🚨 🍞 First Toast 🍞 🚨", textColor: .white, backgroundColor: .blue, view: self.view)

The function takes 4 parameters. message(String) - is the message you want to send. textColor & backgroundColor(both UIColor). 
view (UIView) is the view you want the toast to appear in. The message will last for 4 seconds.
