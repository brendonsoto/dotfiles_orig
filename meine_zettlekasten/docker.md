# Docker
:docker:

Docker is a tool for managing containers.

A *container* is a running process from an image.
An *image* is a collection of layers.
A *layer* is a set of file changes.
The overall flow is:
OS -> Layer(s) -> Image -> Container


## Learning with Jonathan
I've been going through the book [Docker In Practice](docker-in-practice) with Jonathan.
He's been wonderful in helping me learn and understand docker.
Here are some things I learned from him:
- Each step in a docker file is a layer
- Within a docker file, you can break a long line into multiple lines using `\` at the end of the line
- It is fine to use `&&` to group several commands together
- Each step produces a cache to be used on subsequent builds
- If a step changes and requires a new build, not from cache, it causes the subsequent steps to change too
- (This was brought up from August and supported by Jonathan) It's better to put steps whose results may change most frequently at the end to prevent cache-busting on subsequent steps

This one item is getting its own paragraph because there are other related items to it and the whole context took me a while to understand.
Docker is stateless.
What does stateless mean? How can a container/server be stateless?
To answer this, let's first explore what does *state* mean in the context of a server/vm.
State infers history. Before and after.
Think about state in terms of programming.
Think about functional programming!
Functions do not have state.
State implies some change is persisted in the surrounding context.
Something is changed and that change is persisted.
For servers/containers/vms state is considered the files on the machine.
Say the the container is up and running.
It has a set of files already there from running the build.
The *files that the image is set up with*, bootloaded with, is considered its *state*.
A change to state would then be a new file or a change to one of the files.
A *stateful* server/container/vm would be one where if the vm was stopped after the file change and restarted, the change would still be there.
A *stateless* server/container/vm would not have the change.
It would be back to its original files.
A total fresh vm.
