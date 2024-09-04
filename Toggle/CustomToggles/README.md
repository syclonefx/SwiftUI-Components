## CustomToggles

A sample project for a custom ToggleStyle for SwiftUI

Light mode
<picture>
<img src="custom_toggle_non-active_light.jpg" height="500px">
</picture>
<picture>
<img src="custom_toggle_active_light.jpg" height="500px">
</picture>
Dark mode   
<picture>
<img src="custom_toggle_non-active_dark.jpg" height="500px">
</picture>
<picture>
<img src="custom_toggle_active_dark.jpg" height="500px">
</picture>


#### Customization
- onImage: String (SFSymbol) 
- offImage: String (SFSymbol)
- onColor: Color
- offColor: Color

#### Use in your code
```swift
Toggle(isOn: $isOn, label: {
  Text("Active")
})
  .toggleStyle(CustomToggleStyle(onImage: "heart.fill", onColor: .pink, offColor: .gray.opacity(0.3)))
  .labelsHidden()
```