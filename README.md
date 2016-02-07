# Intro To iOS Design Patterns

The exercise is to learn common Design Patterns in iOS thru the example of building an app allowing users to scroll thru and select albums to display information about each. Additionally users can delete albums from the list, undo those deletes, and
the app saves state, for example which album is selected, when the app is closed and run again later. 

There are a few challenges getting the app to work with newer versions of Swift and original images where not available but help can be found in the tutorial comments and I recommend you look there first if you are going thru the tutorial and hit issues/errors on your own.


##Covers good examples for the following patterns:

  * Creational: Singleton.
  * Structural: MVC, Decorator, Adapter, Facade.
  * Behavioral: Observer, and, Memento

##Abstracts for demonstrated patterns:
###Singleton
As the name implies, this pattern has been applied when a class has been limited to being created only once, lazily, and usually globally accessible. Examples include a global configuration handler or print spooler. In both cases there will be fewer issues working with a single access point versus multiple mixed access.

###MVC
MVC stands for Model View Controller and represents a compound pattern where you separate code based on one of the three roles. Data, and how to manipulate, forms your Model. Code handling display or how your data is viewed and used by users is the View. Functionality handling communication between, and decoupling, your View and Model is your Controller. The ideal here is decoupling allowing you to swap out, reuse, the different layers. Image having different views, maybe themes, using the same Model and Controller instead of having to write new Model and Controller code for each.

###Decorator
This is the name given to pattern when you add functionality, behaviors and responsibilities, to objects without modifying their preexisting implementation/code directly or by subclassing. In Swift this is achieved mostly thru Extensions or Delegation.

###Adaptor
Adaptor is another aptly named pattern where you wrap an object in another object and provide a standard interface more usable in context. This is very much like electrical adaptors in the real world.

###Facade
Facade is like Adaptor but for more robust, compound, implementations. An example would be providing a single interface that implements, hides, and decouples the complexity of several interfaces.

###Observer
Allows for decoupled communication of changes to interested objects. Basically objects can register interest in other objects' property and be notified of changes. Used extensively with MVC to allow Model changes to be communicated to the View. As the tutorial mentions, Cocoa implements in two common forms with Notifications and Key-Value Observing (KVO).

###Memento
Memento is the saving of state of an object allowing it to be restored later on.

##This is from following the two part tutorial from Ray Wenderlich's site at:

###Part 1:
https://www.raywenderlich.com/86477/introducing-ios-design-patterns-in-swift-part-1

###Part 2:
https://www.raywenderlich.com/90773/introducing-ios-design-patterns-in-swift-part-2

Tested with Xcode 7.2, iOS 8, and running on iPhone 6s