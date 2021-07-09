:javascript:


# Overview
NPM produces `package-lock.json`
Yarn produces `yarn.lock`

This was prompted by this thread post when trying to help Alice w/ rebuilding node-sass
> (also to repeat, don’t delete the yarn.lock file! maybe only if you’re in the process of updating node packages. the yarn.lock file in master is known to work)

Let's check out the docs


# Package-lock.json
## What is its purpose?
To describe the exact dependency tree with version numbers so it can be reproducible by others

The docs are really well done here so I'm going to copy and tweak the formatting:
---
This file is intended to be committed into source repositories, and serves various purposes:
- Describe a single representation of a dependency tree such that teammates, deployments, and continuous integration are guaranteed to install exactly the same dependencies.
- Provide a facility for users to "time-travel" to previous states of node_modules without having to commit the directory itself.
- To facilitate greater visibility of tree changes through readable source control diffs.
- And optimize the installation process by allowing npm to skip repeated metadata resolutions for previously-installed packages.
---

**tl;dr**:
package-lock.json should be committed because it serves as a guide to reproducible builds

## Why does the file change when I just download the dependencies?
[source](https://stackoverflow.com/questions/45022048/why-does-npm-install-rewrite-package-lock-json)

This is pretty fascinating
It seems like there is a bit of flux
The story goes:
- before npm 5 the `package.json` file defined versions
- npm 5 introduces `package-lock.json` as a way to store the exact versions of the whole dependency tree with the goal of producing reproducible builds
- people are confused on which file is the source of truth
- a later version of npm 5 introduces behavior which allows `package.json` to overwrite the lock file
- people are still confused

**Solution**:
Pin the versions in `package.json`
(meaning remove any symbol prefixes)


# Yarn.lock
Is it the same or are there different quirks as well?

To start off it seems like it may be different depending on what version of yarn you're using. Great.

V1 acts the same as `package-lock.json`

There is no specific docs for V2 so, guessing it's the same
