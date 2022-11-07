# URLBuilder

Create, modify and append components to an URL in a declarative style. URLRequest can also be created and modified in a declarative style. 

## URL usage

There's three different ways of working with URLs. Building, modifying and appending.

Building an URL looks like this:

```swift
import URLBuilder

let url = URL {
    Host("api.themoviedb.org")
    Path("3")
}
```

This produces the URL https://api.themoviedb.org/3

Modifying an URL, given the previous URL, looks like this:

```swift
let modifiedURL = url.modified {
    Path("4")
}
```

This produces the URL https://api.themoviedb.org/4

Appending to an URL, given the previous URL, looks like this:

```swift
let appendedURL = modifiedURL.appending {
    Path("configuration")
    Queries {
        Query(name: "lang", value: "en")
    }
}
```

This produces the URL https://api.themoviedb.org/4/configuration?lang=en

## URLRequest usage



See documentation for more information.
