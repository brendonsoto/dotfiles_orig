= Project with Courtney =

Why not just do the things you know how to do and do things one step at a time?
i.e. 
- Create `server` and `client` dirs
- Create SQL for creating tables
- Create SQL for adding dummy data
- Create basic Flask app (hello world)
- Add DB to Flask
- Add a route to POST data
- Add a route to GET data
- Add login

== Description ==
The goal is to produce a web app to manage the workload and progress of students.

The main screen features a calendar that shows assignment due dates.

The calendar is interactive.
Clicking on a day will produce a mini menu pop-up box with the following links:
- attendance
- class work
- homework due
- projects due

To the left of the calendar is a list of students.
Clicking on a student will take you to a page giving an overview of the student.
The overview consists of assignments, whether they're missing, or the date they were received.

Above the calendar are two buttons.

One of which is Upcoming Assignments.
Clicking it will take you to a new page that displays a list of assignments due in cronological order.

The other is To Be Graded.
Clicking it will take you to a new page that shows the various assignments.
Clicking an assignment will show the grades for the students.


== Technology ==
Elm will be used to build this out.
Why? Mostly because I want to learn it.
Plus I want the safety of types for any functionality.

For the backend, I'll probably use MySQL since that's what I know and its pretty easy to setup.

Not sure for the server, but I may try Nginx?


== Timeline of Goals ==
By September (~7 months), deploy the app in full production
In 4 months have the app ready for testing by users
In 3 months have a v1 app ready
In 2 months build out the main calendar page
In 1 month set up the basic app
In 1 month, feel comfortable with Elm

== Elm ==
Ultimately, I need to know how to produce a SPA.
I feel pretty comfortable with its types so far.
The concept of pages is still a bit foreign to me.

I know I would feel comfortable once I know how to make a simple SPA routing to simple "Hello world!"-esque pages.
From there the focus would be how to make separate components and nest them together?
