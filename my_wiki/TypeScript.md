TODO:
- Insert pictures!!!
- TypeScript w/ Express?

# TypeScript
A reference on TypeScript by building a small app.


## Why / Rationale
TypeScript offers more than just types to JavaScript.
I've been having difficulty transitioning to TypeScript so I wanted to write a guide of my own for it.
I learn best by doing so I hope to create some type of application with TypeScript to better understand it.

At this point you may be asking why are all of these sentences on new lines?
Because I'm writing this in Vim (Neovim) and that's just my style.


## What's Being Built?
A single page shopping app using React and TypeScript.

Why React?
Because that's what I know and work with at the time.

No server will be involved (at least at first).
We will not be dealing with authentication.
All of the data will be mocked.
This will allow us to focus on the TypeScript and front end portion of things.

The idea is to incrementally build the project instead of doing things "logically". (TODO What's a better way to say this?)


## Setting Up
1. Create a directory for your project
2. Navigate to the new directory
3. Run `npm init -y` to create `package.json`, the package management config file
4. Run `npm i typescript` to add TypeScript capabilities to your project


## How to Compile TypeScript to JavaScript
The TypeScript installation comes with a tool called `tsc` to compile your TypeScript to JavaScript.
To invoke it, run `npx run tsc myFile.ts`.

To compile multiple files a config file is needed, which brings us to our next session.


## tsconfig.json / How to Configure a TypeScript Project
A file named `tsconfig.json` is used by `tsc` when no arguments are passed to it.
`tsconfig.json` is the configuration for `tsc`.

For a full list of compiler options see [here](https://www.typescriptlang.org/docs/handbook/compiler-options.html).

`tsc` looks for a flag to auto create a `tsconfig.json` file.
To create a `tsconfig.json` file with default settings run `npx tsc --init`.
The file will have documentation.

The following is an example config file with comments detailing the config options:

```
{
  "compilerOptions": {
    "target": "es2015", // What version of JS the code should be compiled to
    "module": "es2015", // What module system to use (i.e. import/export vs module.exports vs ...)
    "allowJs": true, // TSC can compile JS
    "jsx": "react", // Turn JSX (from .TSX files) into `React.createElement` statements
    "inlineSourceMap": true // Enable sourcemap and inline it
    "outDir": "./build", // The output dir
    "rootDir": "./", // the root dir
    "strict": true, // Enable ALL the warnings
    "noUnusedLocals": true, // More warnings
    "noUnusedParameters": true, // More warnings
    "noImplicitReturns": true, // More warnings
    "noFallthroughCasesInSwitch": true, // More warnings
    "moduleResolution": "node",
    "esModuleInterop": true,
  }
}
```


## Webpack Integration
Let's be real, TypeScript will be used in a larger system, alongside other tools to all be compiled into some output.
In today's time (2019 of writing) the de facto tool is Webpack.
Check [here](https://www.typescriptlang.org/docs/handbook/integrating-with-build-tools.html#webpack) for how to integrate TypeScript with Webpack.

For convenience, here's what's there:

```
module.exports = {
    entry: "./src/index.tsx",
    output: {
        path: '/',
        filename: "bundle.js"
    },
    resolve: {
        extensions: [".tsx", ".ts", ".js", ".json"]
    },
    module: {
        rules: [
            // all files with a '.ts' or '.tsx' extension will be handled by 'ts-loader'
            { test: /\.tsx?$/, use: ["ts-loader"], exclude: /node_modules/ }
        ]
    }
}
```

We'll have to make a few edits to the above.
For instance, look at the output path; it's the root directory!
Here is the modified version:

```
const path = require('path')

module.exports = {
  entry: "./src/index.tsx",
  output: {
    path: path.resolve(__dirname, "./dist"),
    filename: "bundle.js"
  },
  resolve: {
    extensions: [".tsx", ".ts", ".js", ".json"]
  },
  module: {
    rules: [
      { test: /\.tsx?$/, use: ["ts-loader"], exclude: /node_modules/ }
    ]
  }
}
```

Why did the indentation change?
Because my indentation settings are set to two spaces while the other was just copied from the website.


### Giving Webpack a Spin
Let's create the `src` directory with an `index.tsx` file with the following contents for now:

```
function sayHi(name) {
  return `Hi ${name}`
}

document.body.textContent = sayHi("Knee")
```

I'm mature.
I know.


Don't forget to install Webpack by running `npm i -D webpack webpack-cli`.

Finally add to `package.json`:

```
...
scripts: {
  start: "webpack --mode=development --watch"
}
...
```

Now if we run `npm run start` we can see our Webpack process starting up.
We should now see an error message `TS7006: Parameter 'name' implicitly has an 'any' type`.
This begins our exploration into TypeScript!


## Types, Types, Types!
Previously we had an error saying something about an `any` type.
`any` is a type itself to indicate a variable can be, well, anything!
The error message is the result of having `strict: true` in our `tsconfig.json` file.
The `strict` parameter sets a bunch of other checks one of which states not to allow variables with the type of `any`.

Instead of going through the types one at a time, we will talk about them as they pop up in our code.
If you'd like to see a full list of the types, check [here](https://www.typescriptlang.org/docs/handbook/basic-types.html).

Looking at our function, we know a string is to be expected. String is represented in TypeScript using the keyword `string`, but how do we say in code that our param `name` is of the type `string`? We do so using a colon.

`function sayHi(name: string) { ...`

After making that change and saving we see Webpack report to us that everything is all good.

This is great, but now let's start actually building something.


## HTML and Hot Reloading
Also, to add some convenience, let's add the Webpack HTML Plugin to remove the need to create a base HTML page.
While we're at it, let's add Webpack's dev server to get some hot reloading goodness.

`npm i -D html-webpack-plugin webpack-dev-server`

And in `webpack.config.js`:

```
const HtmlWebpackPlugin = require('html-webpack-plugin')

...

module.exports = {
	...
	plugins: [new HtmlWebpackPlugin()]
}
```

Since we're using `HtmlWebpackPlugin` to create our `index.html` file we will need to configure Webpack's dev server to point to that file which happens to be in the `dist` directory.

```
// In webpack.config.js...

...
module.exports = {
	...
	devServer: {
		contentBase: path.resolve(__dirname, 'dist')
	}
}

```

Lastly, let's change our script in `package.json` to run the project from
`"start": "webpack --mode=development --watch"`
to
`"start": "webpack-dev-server --mode=development"`.

Now if we run `npm run start` we should be able to open localhost:8080 in our browser to see *Hi Knee*.
Hilarious!!
If we change "Knee" to anything else we should see the browser reload and our changes in.


## Enter React
Let's quit our Webpack process and run `npm i react react-dom` to add React to our project.

Afterwards, let's make sure all is well by converting what we've done to React.
We'll replace the contents of `src/index.tsx` with:

```
import React from 'react'
import ReactDOM from 'react-dom'

const SayHi = ({ name }) => `Hi {name}`


ReactDOM.render(
  <SayHi name="Knee" />,
  document.body
)
```

Running `npm run start` reveals three errors, all errors regarding the type `any`, but notice how two of them are for the imports.
Also, for the two imports the error message mentions the idea of a *declaration file*.
Why is that?

### Tangent Time! Declaration Files, Interfaces, and Why Modules Need Them
This section explores the why behind declaration files and modules.
Feel free to skip.
A more formal explanation can be found in the TypeScript documentation [here](https://www.typescriptlang.org/docs/handbook/declaration-files/introduction.html) and [here](https://www.typescriptlang.org/docs/handbook/modules.html#working-with-other-javascript-libraries).

Let's work backwards.
What is a module?
A module is a package of code that exposes some functionality or data.
The portion of code exposed is the interface to that module.

TypeScript is all about types, right?
As we make our own functions, classes, and data structures we add the types to give our code context, like when we made that hilarious function to say "hi" to a thing with the name "Knee".
If we exported that function then whatever code that uses it will know that that function takes a param with a type of string.
The compiler knows because we supplied the types.
But what about code from a third party?
What if that code wasn't written in TypeScript?
This is the problem declaration files help solve.

Declaration files provide typed interfaces for code from other sources.
Interfaces here can be thought of similarly to Java interfaces where the interface lists the name of functions and what they should return without the implementation details.
Declaration files are distinguishable by their `.d.ts` suffix.


#### Going in Deeper
Let's look at React's declaration file [here](https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/react/index.d.ts).
Around line 55 we see the following:

```
export as namespace React;

declare namespace React {
  ...
```

Without rewriting the code the author was able to provide types to the React codebase!
Let's check out what an interface looks like:

```
interface ReactElement<P = any, T extends string | JSXElementConstructor<any> = string | JSXElementConstructor<any>> {
	type: T;
	props: P;
	key: Key | null;
}
```

Looking at the innards of the interface we see the `props` and `key` properties that are so familiar in React.
The brackets next to `ReactElement` are for a concept called *generics* which we'll get into later (or you can skip to [here]() if you can't wait).
Giving it a quick glance though we see `P = any` and see that `props` is set to `P` therefore giving it a type of `any`.
Why `P`?
Well, you've got me.
// TODO, link for generics and discuss why P


#### Back to the Tangent
To wrap this tangent up, *declaration files*, noted by their `.d.ts` suffix, provide *typed interfaces* for untyped code, like libraries made using native JavaScript.


## Back to React
The error message also gives us a helpful tip:
> "Try `npm install @types/react` if it exists or add a new declaration (.d.ts) file containing `declare module 'react';`"
Let's do just that.

Upon rerunning Webpack we see the error for React is gone!
Yay!
But another popped up about constructors.
Let's do what we did to solve the React type issue for ReactDOM:
`npm i @types/react-dom`

Cool, back down to three issues.
We know how to solve the `any` type issue so let's do that.
But wait, adding `: string` to the `name` param doesn't seem to cut it!
`TS6133: 'string' is declared but its value is never read.`

The `name` param is destructured from `props` for our functional component.
If we delete the curly brackets around the parameter, then Webpack does not complain about it.
But what then should be done for destructured props?


### Types and Destructuring
There's some info on destructuring [here](https://www.typescriptlang.org/docs/handbook/variable-declarations.html#object-destructuring).
However, this doesn't seem to help us because we're using JSX.
Let's check out the [JSX section](https://www.typescriptlang.org/docs/handbook/jsx.html) of the documentation.
Not quite helpful either, let's do some trial an error!
We know that `props` is an object and can have different properties.
This sounds like a good use for an `interface` so let's try that.

```
interface SayHiProps {
  name: string
}

const SayHi = ({ name }: SayHiProps) => `Hi {name}`
```

The error goes away!
Thus we have found that in order to use *destructuring* we need to establish an *interface*.
Now let's examine the next error.
`JSX element type 'string' is not a constructor function for JSX elements.`
Our function returns a string so let's try wrapping it in React Fragment tags.

```
const SayHi = ({ name }: SayHiProps) => <>Hi {name}</>
```

The errors have gone away and we're able to see our code in the browser!


### Creating a container
Let's create the container for the rest of our components.
We'll be switching out the main content of our `index.tsx` file with:

```
const App = () => (
  <main>
    <h1>Let's Shop!</h1>
  </main>
)

ReactDOM.render(
  <App />,
  document.body
)
```

#### A Quick Detour to Module Town
Even though this is a simple small app, let's move our container code to another file to explore the concept of modules within TypeScript.
Now we are left with:

```
// src/App.tsx
import React from 'react'

const App = () => (
  <main>
    <h1>Let's Shop!</h1>
  </main>
)

export default App


// src/index.tsx
import React from 'react'
import ReactDOM from 'react-dom'
import App from './App'


ReactDOM.render(
  <App />,
  document.body
)
```

All works!
As we see importing/exporting modules are the same as in regular JavaScript.


### Adding a Layout
Our shopping app will have two columns: one for filters, the other for a grid to display the "products".
I don't know about you, but I love [Styled Components](https://www.styled-components.com/).
Let's use them!
Quit webpack and run:
`npm i styled-components`

Afterwards let's style our app using CSS grid!
Side note: Normally I like to make a directory per component and have styles in a separate file, but for now let's add styles in the same file.

```
import React from 'react'
import styled from 'styled-components'

const Container = styled.main`
  display: grid;
  grid-template-columns: 1fr 3fr;
  grid-template-areas:
  "header header"
  "sidebar content";
  margin: 0 auto;
  max-width: 1024px;
`

const Header = styled.header`
  grid-area: header;
`

const Sidebar = styled.div`
  grid-area: sidebar;
`

const Products = styled.div`
  grid-area: content;
`

const App = () => (
  <Container>
    <Header>
      <h1>Let's Shop!</h1>
    </Header>
    <Sidebar>
      Sidebar
    </Sidebar>
    <Products>
      Products
    </Products>
  </Container>
)

export default App
```

Now if we save we see a few errors regarding types for our styled components.
Looks like another types declaration is needed:
`npm i @types/styled-components`

All is well now!


### What's to be Sold?
We never discussed what was being sold.
Cryptocurrencies!
Why?
Because it's surprisingly difficult to find shopping APIs that do not require registering for a key.
We'll be using the CoinGecko API to get a list of coins compared to the USD.
More specifically: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false

While the example is strange it was chosen because the API has the following types we can explore:
- String (name, symbol, url reference)
- Number (price)
- Date (last_update)
Even though dates are represented by strings in the API we can get creative and try working with it as a Date object.



TODO:
- talk about how to set up dynamic filters by:
  - name (like, choosing starting letter?)
  - price
  - last updated
  - why these? because they're all different types
- Talk about async actions
