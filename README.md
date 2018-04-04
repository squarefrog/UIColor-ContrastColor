UIColor+ContrastingColor
=====================

Returns either black or white based on the contrast against the current colour.

There are currently two options for determining which colour to use: the 50% method, or the YIQ method.

## The 50% method
The self colour is converted to hex then checked if it is >= 0x808080. If the colour is >= 0x808080 then black colour is returned, otherwise white colour is returned.

## The YIQ method
The YIQ method is arguably better as it applies weighting to the colours, which could result in better contrast matches.

![Screenshot](https://raw.githubusercontent.com/squarefrog/UIColor-ContrastColor/master/screenshot.png)

## Using the category
Using [CocoaPods](http://cocoapods.org), add the following to your Podfile

```ruby
pod 'UIColor+ContrastingColor'
```

Alternatively, just drag the contents of the `Classes` folder into your project.

Then import the header and call the method:

```obj-c
UIColor *redColor = [UIColor redColor];
UIColor *textColor = [redColor sqf_contrastingColorWithMethod:SQFContrastingColorYIQMethod];
```

## Credits

This category was inspired by a [blog post](http://24ways.org/2010/calculating-color-contrast/) by [Brian Suda](http://24ways.org/authors/briansuda/). If you haven't read it, I highly recommend you go take a look at the original article for more depth.
