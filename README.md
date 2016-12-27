![GitHub Logo](/resources/header.png)

`xcsummary` is a macOS command line tool that parses `xcbodebuild` test results and generates html output with activity screenshots. We use it as a part of our CI Server and find it very useful and helpful. We'd like to share it.

* [Installation](#installation)
* [Usage](#usage)
* [Example](#example)
* [Output](#output)
* [Inspiration](#inspiration)
* [Links](#links)
* [Contribution](#contribution)

## Installation

Open terminal and do the following:

* Clone the project.
```shell
git clone https://github.com/MacPaw/xcsummary.git
```

* Navigate to source folder
```shell
cd xcsummary
```

* Copy binary to the folder you prefer. For example /usr/local/bin/
```shell
cp build/xcsummary /usr/local/bin/xcsummary
```
## Usage

As easy as pie:
```shell
xcsummary -in <path to Summary.plist> -out <path to result.html>
```

Optional -show_success argument can be used to expand green test cases as well.

## Example

Tip: we use `-resultBundlePath` parameter in xcodebuild to know the exact location for every single build.
```shell
#Run your test as usual
xcodebuild test -workspace YourProject.xcworkspace -scheme YourProjectScheme -resultBundlePath '<path_to_results>' 
#Here we suggest to browse <path_to_results> folder to check the folders structure.
#... and generate the report
xcsummary -in <path_to_results>/1_Test/action_TestSummaries.plist -out ~/Desktop/result.html
```

![script](/resources/example_cropped.gif)

## Screenshots

![screen1](/resources/scr1.png)
![screen2](/resources/scr2.png)
![screen3](/resources/scr3.png)

## Output

[Live HTML Example](http://htmlpreview.github.io/?https://github.com/MacPaw/xcsummary/blob/master/resources/example/result.html)

## Inspiration
xcsummary is completely inspired by [xcpretty](https://github.com/supermarin/xcpretty), we really love it and use it. But since xcpretty has some [issues](https://github.com/supermarin/xcpretty/issues/251) with screenshots collection, we decided to create our own one :)

## Links
Great article to understand [Test Logs in Xcode](http://michele.io/test-logs-in-xcode)

## Contribution
Feel free to open issues and pull requests. 
