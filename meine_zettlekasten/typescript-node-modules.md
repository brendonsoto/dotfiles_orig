:typescript:

# Node Modules
Say you want to use `Express`.
How do you import it?
Usually you use `const express = require("express")`.
This will give you some warnings.
Then there's `import express from "express"`
This gives you other warnings.
Then the TypeScript manual mentions a way that doesn't create errors:
`import express = require("express")`

Personally, I think it's funky, but that's just opinion on style.
