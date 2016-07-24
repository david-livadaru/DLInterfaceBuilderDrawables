# DLInterfaceBuilderDrawables
An iOS framework which facilitates the use of UIKit view which are rending realtime within Interface Builder provided by Xcode.


### Known issues

Interface Builder is not drawing the following elements, but they're visible on simulator and device:

1. Shadow outside view's bounds on any UIView subclass
2. Tint color on UIImageView
3. Background color on UINavigationBar.
4. Bar tint color, tint color and background color on UITabBar.
5. 