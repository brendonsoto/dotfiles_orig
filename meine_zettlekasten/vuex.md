:vue:

# Vuex
Vuex is a state management tool for Vue
Based on Flux

Seems like Redux
there's a store
cannot mutate the store

Any changes you want to make to the store must be in a `mutations` property of the store
You act on mutations by using `store.commit`
You can add global access to the store by adding `store: store` to the initial Vue declaration
Then you can access the store in components via `this.$store`
Updates then would look like `this.$store.commit('name-of-mutation')`


# Accessing store from components
Access store from computed properties

The `mapState` function can be used as a shortcut from repeating `this.$store.whatever`

```
// in vue component
export default {
  computed: mapState({
    thing1: state => state.thing1,
    thing2: 'thing2',
    derivedUsingThing3(state) {
      this.somethingElse + state.thing3
    }
  })
}
```

# Getters
You know how with redux you'd have a util function for returning something based off of a piece of state?
Vuex has getters for this
At the root store declaration you can write getter functions that get the state and do whatever with it
These functions will be available to any component so you don't have to import the same file

You can access the getter via `store.getters.myFunc`


# Mutations
Mutations are like actions in Redux
You have a string as a name/identifier and then you have the function
```
const store = new Vuex.store({
  state: {
    count: 1
  },
  mutations: {
    increment(state) {
      state.count++
    }
  }
})

store.commit('increment')
```

## Mutations with payloads
```
mutations: {
  increment(state, payload) {
    ...
  }
}
```

## Alternate commit style
```
store.commit({
  type: 'increment',
  payload: { ... }
})
```

## Committing mutations in components
`this.$store.commit('mutation-name')`


# Actions
Similar to mutations but they trigger mutations instead of making changes to the state themselves and can be asynchronous

Each action takes a `context` parameter/arg that has the same access to `store` and `commit` but also a `dispatch` function to call other actions


## Triggering actions
`store.dispatch('action')`


## Composing actions
actions can return promises which allow you to chain actions together


# Modules
Fractal approach to the store
It's like ducks! ReDucks! Quack

Copying the example from the docs:
```
const moduleA = {
  state: () => ({ ... }),
  mutations: { ... },
  actions: { ... },
  getters: { ... }
}

const moduleB = {
  state: () => ({ ... }),
  mutations: { ... },
  actions: { ... }
}

const store = new Vuex.Store({
  modules: {
    a: moduleA,
    b: moduleB
  }
})

store.state.a // -> `moduleA`'s state
store.state.b // -> `moduleB`'s state
```
