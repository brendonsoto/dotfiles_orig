# Web Dev Problems and Solutions


# Scrolling
## Overflow: auto and max-height, but content does not fill
Say you have a container with the following styling:
```
max-height: 400px;
overflow-y: auto;
```

And you have several elements as child elements, but the combined height does not exceed the max height yet you still see the scroll bar
One thing that can lead to it is having *line height less than font-size*
