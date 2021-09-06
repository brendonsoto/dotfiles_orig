:how-to:

# How to squash commits
- First find the number of commits you want to squash together (i.e. since master and your current changes)
- `git rebase -i HEAD~<num-commits>`
- At this point the editor should open up and you'll see `pick` on the left side with teh commits on the side
- Leave the first `pick` alone
- Change the others underneath to `s` or `squash`
- Save and leave the file
- The editor will open w/ a screen to edit the message
