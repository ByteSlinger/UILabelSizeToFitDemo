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

Look at ViewController.m and the updateLabel method for the code.
