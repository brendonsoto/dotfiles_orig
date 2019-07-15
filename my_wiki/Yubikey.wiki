= Yubikey =

== Setup ==
I tried making separate keys for Encryption and Authentication, but that did not work

Here's what I did to get the Yubikey 5c to work with Pass.
This includes not only decrypting passwords across computers, but also generating new ones across computers too.
I make this distinction because I had a lot of difficulty doing so.

NOTE: I did not make subkeys. I just transfered the primary key.
Why did I do this? Because I wanted my secret keys on the Yubikey so I can download

I'm goign to try going the subkey route, but I got a way to work and here's how:

1. Format the Yubikey with personal preferences
2. Stick in Yubikey
3. `gpg --edit-key BS`
4. `keytocard` << set to 1) Signature & accept everything
5. `key 1` << should show an asterisk next to the encryption subkey
6. `keytocard` << set to 2) Encryption & accept everything
7. `save`
8. `gpg --export --armour BS > output.asc`
9. import the above key into the new machine with gpg
10. stick yubikey into new machine
11. `gpg --card-status`

You're done!

== Getting Yubikey + Pass working on a new computer ==

1. Enter yubikey into computer
2. Open a terminal
3. `gpg --edit-card`
4. `fetch`
5. Fetch the pass

Should be good!
