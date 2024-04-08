# Weather APP

Simple weather app using OpenWeatherAPI, MVVM + Clean Swift, Combine and SwiftUI


## Architecture

![Screenshot 2024-04-08 at 17 01 39](https://github.com/lucasbordini/Weather/assets/27768689/45ce0ccf-518f-4c2c-bff1-1e0a750417b5)


## SwiftUI Layers

### Adapter
Converts from a ViewModel to a UIState object

### Screen
Top-most SwiftUI component (after the adapter) that is the logical container for all of the content on the page

### Components
Inner-view that has a piece of the total content on the page. Only uses bindings and lambdas.

### UIState
Mapping of @Published properties on ViewModel to necessary properties to render the UI. Comes with a static constructor as well for Previews.
