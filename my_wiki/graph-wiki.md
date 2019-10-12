# Graph Wiki
This is inspired by reading the chapters about _chunking_ in "A Mind for Numbers" by Barbara Oakley.

Wiki's are great.
You can link multiple articles to each other.
But, unless if you're reading through the article, you can't see what the topic is related to.
So...
What if...
There were a system where related knowledge was visualized or at least pointed out?

[Tool Idea - A] Imagine a command line tool, like vim wiki, but when you open a document a sidebar would/could appear listing the linked articles underneath the section title the link was in? The section title would provide brief context and the link would show you how it's related!

This can enable rapid small chunks of information to be written and visualized as a whole, with context!
[Problem - A] With this then, the problem becomes how to see the whole tree of information?

[Problem - B] At the core, the problem to solve is how to create a tool to create small interconnected notes and be able to see the whole of those connections for context?

[Tool Idea - B] When first thinking through this I was imagining a GUI tool where each "note" would be its own node. As more nodes are made you can link between them. There would be different screens, the first screen a "graph selector" screen and once a graph is selected you'd see the index node with other nodes in the background that the user can access.

[Tool Idea - A0] To go back to the CLI idea, for visualizing context, there could be a mode where the articles are listed, title only, and whatever article the cursor is at would be the "active node" and cause all other instances of that node to be highlighted.
More detail is needed.
As an example, each article would be scanned for links.
The mode view/interface would consist of a list of the articles with any links listed too, but indented, underneath the main article.
When the cursor is over an article or link, all other instances of that article will highlight or have some way of telling it apart.
Maybe selecting it will split the screen and show the main article alongside all of the other articles where the active node exists with the respective section titles for context.

[Problem - A/B] The problem then becomes one of visualizing context.
To be devil's advocate, if using a traditional model, isn't context a given? By traditional model I mean the model where you have a folder to hold all related information and you further and further boil it down? So it's like the breadcrumbs give you the context?


I can't help but think of zettlekasten here. It seems very simple:
- each note/index card represents a single thought identified only by a number in some designated area
- cards aren't sorted by topic, but by number
- cards can refer to each other by number
- cards can go off on topics and extend identifiers (i.e. 1, 1a, 1b, etc.)

Is the lack of hierarchial organization what enables the concepts to stick more? Because we have to hunt for the related cards and thus put the context together ourselves?
Could this be related to the idea of writing notes by paraphrasing instead of copying the source material?
