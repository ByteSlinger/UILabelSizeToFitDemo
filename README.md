# UILabelSizeToFitDemo
Apple IOS Xcode UILabel SizeToFit Demo

This Objective C demo shows how to resize a UILabel programmatically, to fit BOTH width AND height of the label text.

The built-in sizeToFit method of UILabel does not set the width to fit the longest line in a multi-line label.  It uses a default width or the last width that was set.  But if you do it in 2 steps, it works perfectly!

Here's how to do it:

* Find the longest text line
* Set numberOfLines to 1 (temporarily)
* Set label text to longest text line
* Call label.sizeToFit (sets label width for longest line)
* Set numberOfLines to 0 (multi-line)
* Set label text to full multi-line text
* Call label.sizeToFit (sets label height for all lines)

Voila!  Now your UILabel is sized to fit your multi-line text.

UPDATE:  Here's another way, thanks to @DonMag on SO:

* Get the text size rect using boundingRectWithSize
* Set the label frame to this new text size
* Call label.sizeToFit

Look at [ViewController.m](https://github.com/ByteSlinger/UILabelSizeToFitDemo/blob/master/UILabelSizeToFitDemo/ViewController.m) and the **updateLabel** and **updateLable1** methods for the code.

Here are some screen shots, and you can see that the labels are resized to fit the longest line in each, as well as fit the height to contain all the lines:

<img height="300" src="https://github.com/ByteSlinger/UILabelSizeToFitDemo/blob/master/1.png?raw=true" /> <img height="300" src="https://github.com/ByteSlinger/UILabelSizeToFitDemo/blob/master/2.png?raw=true" /> <img height="300" src="https://github.com/ByteSlinger/UILabelSizeToFitDemo/blob/master/3.png?raw=true" />
