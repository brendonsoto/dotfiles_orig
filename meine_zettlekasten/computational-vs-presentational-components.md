:front-end:tech:

# Computational vs Presentational Components
I was imagining a budgetting app idea
During so I was thinking:
"I don't know what data structure I will be dealing with for representing the transactions. I kind of know how I want it displayed, but then I'd have to worry about transforming the data from one structure to another"

Then I related it to my current work at Odeko (Out of Stock refactor) and then thought:
"What if I had a component just for transforming the data structure from A to B?"

I think this is the core crux of computational vs presentational components.
Consider the following (using Vue):
```
<template>
  ... imagine a few lines here
</template>

<script>
...imports

... Vue.extend({
  props: ...,
  ...,
  computational() {
    dataStructureForUI() {
      return this.transform(this.dataFromProps)
    },
    transform() ...
  }
})
</script>
```

What if the lines in the template were just their own component and then the component was **only** concerned about transforming the structure from A to B?
