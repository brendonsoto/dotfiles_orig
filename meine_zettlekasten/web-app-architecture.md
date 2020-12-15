:programming:

# Web App Architecture
I thought to check youtube for some sources

# MoreThanCoding.com - UX, Then Architecture, Then Tools
[Source](https://morethancoding.com/2013/03/12/ux-then-architecture-then-tools/)

Adding this at top to emphasize a certain thing:
Think of the users first

The article outlines the thought process as building a house
Start with a foundation, then framework, then the rest


# TechLead - Systems Design Interview Concepts
[Source](https://www.youtube.com/watch?v=REB_eGHK_P4)

A web app is typically spread across:
- asset servers
- web servers
- database server

## Asset Servers
These are the systems responsible for delivering static assets (images/css/js)
Typically CDNs are used for this
Two methods of using the CDNs are:
- pushing data to the servers
- waiting for users to request data from the CDN

While the first may seem more proactive the tradeoff is seeing the demand for the assets, how many users are requesting the data
The latter may have a slower initial delivery time for a user of a specific region, but afterwards other users will have faster delivery times


## Web Servers
Load balancers can be used to distribute the load across multiple web servers
Different algorithms can be used for distributing the load
For example, calculating which server has the least load and directing traffic there


## Database Server
The database aspect, to me, seems the most complex

There's the topic of relational vs noSQL
Outside of the video, the general vibe I get is to use relational for when you know the structure of the data and noSQL for when you don't or when you want to throw a bunch of data in without worrying too much about organization

One consideration is caching results to improve read access
This can be achieved through the use of tools like memcached and redis

Then database sharding can be used to split up a database into multiple pieces
This can be used to optimize writes as well as reads
The video mentioned two forms of splitting a db across:
- vertical (each db has a certain number of columns and you merge them for the big pic)
- horizontal (each db has all of the columns, but diff data)

Finally there's the idea of duplicating the main db and having other copies to read from
