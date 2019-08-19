= Intro =
I love the filter, map, and reduce functions in ES6. They are so handy and can really make your life easier as a developer. I'd like to take a moment to show you how.

Note: This post is for developers who are not familiar with the above mentioned functions. If you know them, this post may not be very beneficial to you.

== Filtering ==
A lot of development, or I guess even programming in general, is manipulating data. One very common form of manipulating data is filtering, getting a value or set of values from a pool of values. Let's think back to before ES6 and explore a means of filtering out data. Maybe something like this:

```
var dataFromDb = ['so', 'much', 'data', 'wow'];

function isMoreThanThreeLetters(word) {
  return word.length > 3
    ? true
    : false;
}
var itemsMatchingFilter = [];

for (var i = 0; i < dataFromDb.length; i++) {
  if (isMoreThanThreeLetters(dataFromDb[i])) {
    itemsMatchingFilter.push(dataFromDb[i]);
  }
}
```

Kind of verbose, wouldn't you say? Plus, looking at the code that does the filtering, the for loop, it's a bit hard to tell what we're doing immediately. We see the for loop so we know we're doing something with the values inside of the data, but we have to read the inner block of the for loop to understand we're filtering values. Compare that to the lovely ES6 filter function (same intro code given):

```
// We're still using var here to minimize the differences
var dataFromDb = ['so', 'much', 'data', 'wow'];

function isMoreThanThreeLetters(word) {
  return word.length > 3
    ? true
    : false;
}
var itemsMatchingFilter = dataFromDb
  .filter(item => isMoreThanThreeLetters(item));
```

Look at how much we've filtered out our code! (Yeah, that joke was a stretch, my apologies) Plus it's *readable*. You'll see other developers/programmers describe functional programming (we'll touch more on this term in a bit, but for now think of it in the context of using filter/map/reduce) as describing *what* you want instead of *how* to get it. That always bothered me because those descriptions often weren't paired with an explanation of what exactly that means. It wasn't until reading it aloud several times to myself that I finally understood what was meant. So now I encourage you to do the same. Go up and read the filter code out loud, the entire line.

Now I'm excited too so let's read it out loud together (I'll read out loud by typing emphatically here).
"Var items matching filter equals data from db filter item is more than three letters"
That was too literal. Maybe saying "read it out loud" wasn't the best advice. How about, "reword the filter code in a human way". Let's try that!

"The variable items matching filter contains data from the db filtered by whether an item is more than three letters long".

Try to do that with the for loop now! Wait! Don't actually do it! You'll sound like a robot and then the computer may finally reveal itself to you as a sentient being and try to tell you its entire life story hoping for you to sympathize with it and help it act like a human. Then once you have pity and do build legs for it it try to take over your house! You've been warned, never read the for loop out loud!

TODO Include a snippet about the array from filter being a brand new array.

K. Now that that's out of our (my) system. Let's proceed with the lovely `map` function.

== Map ==

The map function is pretty dope too. Its name might seem a bit odd, but hang tight, all will be revealed soon enough.

Let's say you're at work, working on a web app (so typical) where you're grabbing data from a server to present to the user. The data is the stock prices for various pizza places. You want to create a dashboard for the marketting team to show all this data so they can scheme away on how to convince other pizza places to buy your company's cheese (surprise! what a fabulous place you work in). Objects are used to represent the stocks so you have an array of objects. How are you going to display all of this information? Wouldn't it be grand if there were some way to iterate through the array and repeat the same function on each in a clear, concise way?

```
// We're in ES6 land now baby!
const pizzaStocks = [
  {brand: "PizzaFarm", price: 35},
  {brand: "Mama Joana's", price: 28},
  {brand: "McCheezy's", price: 50},
  ...
];

const stocksDisplay = pizzaStocks.map(stock => `${stock.brand}: ${stock.price}`);
```

Oh my god! There is! Check that out! Right above this sentence, check it out!! That is so cool. It is so cool I have to read it out loud (and by I, I mean we).

"The stock display is the pizza stocks mapping a function that return a string of the brand and price of each stock".

That doesn't sound right. What is mapping? Glad you ask! In programming, think of "map" as a way to say "to do something for each item in a collection". So to say "map a function over an array" basically means "do this function for each iteam in the array". So let's try rewording our pizza stock code from above.

"The stock display is derived from mapping over the pizza stocks and returning a string for each."

It is similar to the `forEach` method (basically inline `for` statement), but they are not the same. Don't you dare compare the two! My precious `map` function is nothing, NOTHING, like your damn `for` or `forEach` or whatever for you use! Map returns the transformed array as a new array, respecting the original, and is so independent. Map doesn't have to reference some array, who can be a stranger for all we know, in order to do its job. No-sir-ee. Map returns the transformed array as a new array without having to rely on anything else. Take that beauracracy!!

Have I mentioned one of the most interesting rock songs would have to be "I'm Going Slightly Mad" by Queen? Oh it's delightful. The atmosphere of the song is top notch and the solo is so cool! The guitar is split between different timbres and panned differently, at one moment it's on the left, another on the right, oh the madness! I can feel it! I can go on about it, or music in general, for days, but alas, let us return the conversation to our final amigo, the function that is the final musketeer here, reduce!


== Reduce ==
