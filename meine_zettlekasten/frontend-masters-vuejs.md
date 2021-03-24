:javascript:

# Contents

- [Vue3](#Vue3)
- [Introduction](#Introduction)
  - [Intro](#Introduction#Intro)
  - [Course Resources & Setup](#Introduction#Course Resources & Setup)
  - [Vue 3 Hello World](#Introduction#Vue 3 Hello World)
- [Directioves, Modifiers & Data Rendering](#Directioves, Modifiers & Data Rendering)
  - [v-model Directive](#Directioves, Modifiers & Data Rendering#v-model Directive)
    - [Post lesson reflection](#Directioves, Modifiers & Data Rendering#v-model Directive#Post lesson reflection)
    - [Questions so far](#Directioves, Modifiers & Data Rendering#v-model Directive#Questions so far)
  - [v-if & v-else](#Directioves, Modifiers & Data Rendering#v-if & v-else)
  - [v-bind](#Directioves, Modifiers & Data Rendering#v-bind)
    - [Post lesson reflection](#Directioves, Modifiers & Data Rendering#v-bind#Post lesson reflection)
  - [v-for](#Directioves, Modifiers & Data Rendering#v-for)
  - [v-once and v-pre](#Directioves, Modifiers & Data Rendering#v-once and v-pre)
  - [Event Bindings & v-on](#Directioves, Modifiers & Data Rendering#Event Bindings & v-on)
  - [v-html & v-text](#Directioves, Modifiers & Data Rendering#v-html & v-text)
  - [Directives Exercise](#Directioves, Modifiers & Data Rendering#Directives Exercise)
  - [Directives Solution](#Directioves, Modifiers & Data Rendering#Directives Solution)
  - [v-model Modifiers](#Directioves, Modifiers & Data Rendering#v-model Modifiers)
  - [Event Modifiers](#Directioves, Modifiers & Data Rendering#Event Modifiers)

:javascript:programming:

# Vue3
This is from the frontend masters

# Introduction
## Intro
Sarah wrote the docs for V3!

Evan You (creator) borrowed pieces from other tools and languages

Declarative

Sarah feels Vue prevents a lot of yak shaving
Also compares Vue usage with iPhone usage
Doesn't feel like it talks you down
Feels its a sophisticated piece of tech

Vuex?

Composition API? -- can be used as a state storage

Services? akin to Angular

Inspired by Polymer

Vue has html, css, and js altogether

Course doesn't cover a full application, but rather covers the basis and some advanced topics with resources to more advanced topics.


## Course Resources & Setup
Vue devtools, multiple versions
Vetur

Codepen -- high usage


## Vue 3 Hello World
Don't really need a preprocessor/webpack/etc

**Directives** seem to be attributes you can attach to html elements to attach functionality to it

Use double curly braces to display data `{{ message }}`


# Directioves, Modifiers & Data Rendering
## v-model Directive

**v-model** -- enables 2-way data binding

### Post lesson reflection
It seems like any attribute with `v-` as its prefix is a Vue "directive"
I _think_ directive is the right name. Not completely sure.

So far a pattern I'm noticing is in the JS section having an object like so:
```
const App = {
  data() {
    return [...]
  }
}

Vue.createApp(App).mount(#mountElem)
```

What this tells me is that an "app" is defined as a JS object.
A function called `data` is needed in the "app" object in order to show, uhhhm...data!
So far I've only seen **strings** as the **type returned** within the `data` function.
Then to "mount" the app, use `mount`, but that requires creating the app first which can be done using `Vue.createApp(Object)`.

### Questions so far
I get that Codepen is being used to bypass the setup, but what do you do to get started from scratch?

## v-if & v-else
`v-show` only reveals itself if the data it's attached to is not null/falsy

Mounting a component back and forth can be expensive
Use `v-show` for such situations since it makes the component but styles it with `display-none`
Use `v-if` if the component has **a lot** of data

`v-if` and `v-else-if` must be next to each other

## v-bind
Also can be used as `:`
This seems like a way to bind an element to the data available
This can be as prefix for another attribute

For example: `:class="[isTrue ? truthyClass : ""]"`

### Post lesson reflection
One other thing I noticed is how event handlers are attached
The event name is prefixed with `@` and inlined in the markup
Its value is set to the name of the function within the app object
The function just needs to be within the property `methods`, which is an object
For example:
```
// Markup
<div @mousemove="myFunction">...</div>

// JS
const App = {
  data: {...}
  methods: {
    myFunction: () => {...}
  }
}
```

## v-for
Your looping keyword
Think of it like `for (thing in things)`
There's a `key` attribute thats like React, something that needs to be unique per item created within the `v-for` bit

## v-once and v-pre
`v-once` - does not re-render once mounted
`v-pre` - like `pre` tags, but shows you the raw value instead of evaluating anything and pretty-printing it

`v-pre` is useful for **documentation**.

## Event Bindings & v-on
`v-on` can also be known as `@`
This is how you attach event handlers

It's possible to write the function handlers directly inline, but only useful for small things

## v-html & v-text
`v-html` can be used to render strings that may have html in it
**NOTE** Be careful regarding sanitizing and validating user input when using this since it can lead to XSS problems

`v-text` seems similar, not super sure...

## Directives Exercise
The goal is to make a little calculator
There should be two number inputs
Whenever one or the other changes, the sum should be updated
Additionally there's a select box that when a non-empty option is picked a message should display

I almost got all of it
The one thing I'm confused with is adding numbers in the moustache handlebars instead of storing it in state

## Directives Solution
Ahhhh, I needed to use a modifier on the directive to say "take the input and make it a number"

Also, I realized I didn't need to add a method to the App object to change a piece of state

**NOTE** Sarah mentioned using `.lazy` for things like form validation or waiting for input to totally finish to do a thing (instead of calling a function everytime a thing changes)

## v-model Modifiers
Modifiers are like suffixes that add some sort of functionality
Like an inline decorator (think Java or TypeScript)

Sarah added to her description of when to use `.lazy`.
She mentioned she views it as a way to only get the value once in a while as opposed to at every change

## Event Modifiers
Seems like you can include this not as a way of saying "map this even to this function" but rather shortcuts to common functions, like using `.prevent` as a shortcut for `e.preventDefault()`


# Methods, Computed Properties & Watchers
## Methods
Within the `methods` property of a Vue object you can access the state properties of the Vue instance using `this.dataBit`

If a method needs a parameter, like the `event` object, simply put it in the method
i.e.
```
const App = {
  methods: {
    click(e) { e.preventDefault(); ... }
  }
}
```

### Post lesson reflections
I'm a little bit concerned by how the state bits within a Vue instance seems easily mutable


## Methods in forms
An easy way to attach a submit handler to a form that automatically adds `e.preventDefault` is `<form @submit.prevent="submitHandler">`

This will look in your Vue instance for a method called `submitHandler` to attach

## Sorting Table Data with v-for
**NOTE** Cannot use arrow functions for declaring the method names because they won't bind correctly to the Vue instance
As a result you won't have access to `this.whatever`

### Post lesson reflection
Why isn't `:key` needed?

## Computed Properties
Within the App object can be a property called `computed`
Functions within `computed` are called only **when a dependency has changed**
Results of functions w/in `computed` are **cached**

## Computed Properties Exercise
Seemed pretty straight forward!
Didn't need to search online for things like the last exercise

## Computed Properties Solution

## Computed Properties Examples
Vue 2 had a separate `filters` section
This has been deprecated in favor of the `computed` section

Creating a Vue instance has also changed between V2 and V3

The reason for these changes is to reduce the size of the package
Vue3 apparently is pretty dang small

## Vue's Reactivity System & Proxies
Reactive programming = having multiple async data streams which have hooks to observe the changes in those streams
This makes it easier to react to state changes

Proxies were mentioned (ES6 proxies), but I'm not sure what that is

According to her slides, proxies are a way of intercepting other functions/objects
But what does it mean to intercept?

The examples provided are like so:
```
const dinner = {
  meal: 'tacos'
}

const handler = {
  get(target, prop) {
    return target[prop]
  }
}

const proxy = new Proxy(dinner, handler)
console.log(proxy.meal) // 'tacos'
```

The constructor for a proxy object looks like it needs:
- the thing (object/function) to observe
- an object with specific methods (i.e. `get`/`set`) that work with the target thing

Proxies seem helpful for tracking changes over time
In Vue, look up `track` and `trigger` for persisting changes

Also, Vue3 is spread out amongst packages to make it tree-shakeable resulting in smaller bundle sizes (woohoo!)

## Set(), Map() & WeakMap()
All ES6 stuff

You already know `Set`, it's like a math set where you only have unique values
`Map` is a key/value pair that maintains their order and is more performant for adding or removing stuff
Additionally, keys can only be added once

`WeakMap` is like `Map` but references can be collected by the garbage collector

Why is this stuff important?
Because it's what's going on under the hood with Vue
When creating a Vue instance, everything within the `data` property is stored in a `Map` of `Proxy` objects
The `Proxy` objects help Vue track and trigger changes to that data
Changes are saved as a `Set`

I could have misinterpretted this...rewatching...

Ah, the entire `data` object is converted into a `Proxy`, not every key/value pair.
`Set` comes in to track the changes to be made
The `Proxy` aspect of `data` allows subscribers, like components, to update accordingly

## Watchers
Watchers are used for async updates
You can make a "watcher" by adding a `watch` object to the Vue object

This seems handy for side effects

**NOTE** You can access the new and old values (in that order)

**NOTE** There's a keyword, `deep`, to let Vue know the change depends on nested properties

There seems to be other parts to a Vue instance like `created`

## Watchers Exercise
So the idea is
- click button
- taco with ! shows
- another string appears
- after a second, that other string appears
- must use a watcher

I think I want to watch the `orderSubmitted` state
When it's not null, create a setTimeout func to set it to null, but return a string
I'm also going to move the "where's my taco" bit to the `orderStatus` state

So the flow will be:
- hit button
- set `orderSubmitted` to true
- watcher will set `orderStatus` to the taco!
- watcher will setTimeout to null out the ordersubmitted

Ohhh, wait, the message should be `orderStatus`
I think I'm going to add a third piece of state to represent "wher's taco?" & "taco!"

## Watchers Solution
Ahh, Sarah did something like what my first idea was, `orderStatus` to hold 'where taco' and 'taco!'
The `getTaco` method changes `orderStatus` to "taco!"
The watcher was for `orderStatus` which would set `orderSubmitted` to a string

## Watchers Example
Question someone asked:
Can watchers effect other properties?
Yup
