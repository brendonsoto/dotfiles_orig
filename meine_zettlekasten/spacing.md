# Spacing
:css-quirks:


## Child Takes up Full Width of Padded Parent
Consider the following:
```
// HTML
<main class="parent">
  <p class="child">I am a child</p>
</main>

// CSS
.parent {
  padding: 0 20px;
  width: 1000px;
}
```

When this renders the child component will have space around it
Say you want the child element to sit snuggly with the parent and touch its corners
Usually I tried to shy away from padding on a parent element and instead put it on each of the child elements
A better way may be through negative margins:
```
// CSS
.child {
  margin: 0 -20px;
}
```
Notice the margin is *the same value* as the padding of the parent, *but negated*
Also notice that *no width was applied* to the child, no `width: 100%;`
