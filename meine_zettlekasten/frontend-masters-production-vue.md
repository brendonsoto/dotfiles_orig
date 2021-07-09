:vue:javascript:

# Production Vue

Skipping ahead here a bit

## Testing
### Testing Libraries
- Started off discussing Pareto (80/20) rule
- recommends using Jest
- Vue Test Utils -- "useful for lower level testing"
- testing-library -- for component testing (it's the one by kent dodds ughhh)
- cypress is also working on component testing
- don't test functionality provided by vue
- stick w/ shallow rendering so you can focus on just one component

### Unit & E2E Testing
- homie thinks unit testing shouldn't be your focus, that unit tests isn't the 20% that gives you the 80%
- argues e2e > integration > unit
- argues should use cypress w/ just one or two browsers, the one most used for desktop and most used for mobile
- Best practice for e2e tests:
  - dont maintain state between tests
  - dont select elements by class (use data-attrs)
  - recommends looking for elements by the text
    - the idea from this is to try to test from the user's perspective
  - 
