# SwiftUISearchBar
A searchBar for SwiftUI implemented with a UITextField which is the first responder.

## Requirements
- iOS 13.0+
- Xcode 11.0+
- Swift 5.0+

## Installation
### Swift Package Manager
1. Select `File > Swift Packages > Add Package Dependency...`.
2. Enter `https://github.com/struuuuggle/SwiftUISearchBar` in the "Choose Package Repository" dialog.
3. Specify a rule as `Branch`, and set the branch field to `master`.

## Usage
After installation, you can import SwiftUISearchBar to your project by adding the following sentence.

```swift
import SwiftUISearchBar
```

Then you can use `SwiftUISearchBar` in your project like this.

```swift
@State var searchTerm: String = ""

var body: some View {
    SwiftUISearchBar(text: $searchTerm, placeholder: "Search", onTap: {
        // do something on tapping the textField 
    }, onEdit: {
        // do something on editing the textField.text
    }, onCommit: { textFieldText in
        // do something on tapping the search button in keyboard
    }, onCancel: {
        // do something on tapping the cancel button
    })
}
```

## Example
See also [Demo](https://github.com/struuuuggle/SwiftUISearchBar/tree/master/SwiftUISearchBarDemo).
