# SwiftUI-SearchBar

A searchBar for SwiftUI implemented with a UITextField which is the first responder.

# Usage
```swift
@State var searchTerm: String = ""

var body: some View {
    SearchBar(text: $searchTerm, placeholder: "Search", onTap: {
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
