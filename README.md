# ConfiguringInitializer

Write configuration code for most objects in Swift in a closure on the initializer.

# Example Usage

    // create and configure
    // any NSObject-derived object
    // very simply with a clean syntax
    // (and code-completion even works)
    let df = DateFormatter() {
        $0.dateStyle = .short
        $0.timeStyle = .long
    }

    // and you can write very clean configuration code in classes this way
    final class Dummy {
            
        var someValue : String?
        
        static let dateFormatter = DateFormatter() {
            $0.dateFormat = "yyyy-MM-dd HH:mm"
            $0.timeZone = TimeZone(secondsFromGMT: 0)
        }
    }

    // it's easy enough to add conformance to most other classes
    // NOTE: the class must be declared final for this to work
    extension Dummy : ConfiguringInitializer {}

    let dummyToo = Dummy {
        $0.someValue = "Hello"
    }
    // yes, this example is trivial, but imagine any configuration code in here


## Importing

### Step 1:

Import ConfiguringInitializer into your project.

ConfiguringInitializer is available as a Swift Package at https://github.com/jaywardell/TimeTravel.  
You can downlaod it or import it in XCode using `File->Swift Packages->Add Package Dependency…`

### Step 2:

Import ConfiguringInitializer into any Swift file

    import ConfiguringInitializer

## Requirements
ConfiguringInitializer has only been tested against Swift 5.1 and XCode 11.  It may work with some previous versions of swift.

## License (of sorts)
ConfiguringInitializer is free to use or modify in any way you see fit.  If you have an idea for an improvement, please submit a pull request.

## Thanks:
This package was inspired by an article by John Sundell at https://www.swiftbysundell.com/articles/encapsulating-configuration-code-in-swift/
