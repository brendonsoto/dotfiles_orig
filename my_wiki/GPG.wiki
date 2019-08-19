= GPG =

The password manager I use now uses GPG.
I don't have a great understanding of GPG.
I want to understand it better so I can better understand the password manager.

== What I Know ==
- GPG is used for enryption (dur)
- It operates through using keys (private/public)
- The private key is your secret key, the master key
- The public key is a way of verifying things are from you
- You can say a document is from you by signing it with one of your keys (which, I'm unsure of)
- Subkeys can be used to also encrypt/sign stuff
- Revocation of keys can be used to invalidate documents/keys

== What I Want to Know ==
- How to get create subkeys to distribute to multiple machines so I can get my password manager on other machines easily?
- How to undo an expiration date or change a master key

== Getting to Learning ==
How am I going to learn the above?

I need to learn/review:
- How to make a gpg key
- How to make a subkey
- How to modify a password store

I'm thinking of...
- creating a new gpg key
- creating a dummy password-store for the new key
- creating a subkey
- passing the subkey to a new device.

Actually, I just made a new subkey, and I think the pass repo for here is online too. So I need to figure out...
- how to enable the repo to accept the new subkey
- how to securely send the subkey to the other computer
- how to add the subkey so i can use the repo

Use firefox send to send the subkeys
Wait, I wouldn't have to send the key, I would just have to get the ID of the other valid gpg users and then sign it locally.


=== Experiment 1 ===
I finally was able to access my NHL password storage (just stuff like trello/docker, nothing dangerous) on my personal computer! Here's how I did it.
On my personal computer I exported my public key and sent it to my work computer using FireFox send + email (I added a password via FireFox send because I'm paranoid). Then on the work computer I downloaded the file and imported the key. I had to locally sign the key by using `gpg --edit-key <imported-key>`. Afterwards I added the name/uid of the imported key to the list of valid gpg uids in `~/.password-store/.gpg-id`. Once that was done I had to re-initialize the password store using `pass init $(cat ~/.password-store/.gpg-id)`, push the changes, and I was all set! I hopped onto my personal computer, pulled the changes, and was able to access the passwords!

But now how to distribute from one public key...
Rather, let's say I want to access my password store from three different devices. How would I do that?

My initial thought is to make three subkeys and send them to the different places. I guess I can test that with the NHL one again?

I think the only way I can do this is by sending the encryption key around. I got this idea from https://superuser.com/questions/466396/how-to-manage-gpg-keys-across-multiple-systems
The idea is, you create your master pair, save it to a backup place (ie. usb), export the subkeys, then delete the master pair, and then re-import the subkeys. Apparently you can have multiple sub-keys for signing, but only one for encryption.
Thus I would need a usb to put the master + subkey into.
Which leads us to...

=== Experiment 2 ===
1. Get a usb
2. Copy work computer's master + sub keys there.
3. Copy keys to personal computer
4. Figure out a way to get only the subkey.
5. Try to decrypt stuff
To make things easier, I should find a way to just copy the subkeys to the usb

Well, this didn't work. I managed to get the subkey over to my personal computer, but I can't decrypt. I get the error "gpg: decryption failed: No secret key". So it looks like I do either need a secret key or just create multiple gpg ids and pass them around.

It's not working for some reason :(

I'm starting to think this doesn't really make sense...
The only place I'd need to transfer a key to is my phone and there are methods for that already. For other devices I'm a lot better off just making a gpg key on the new device, sending the pub key to my personal computer, link the pub key to a subfolder, and then push the code through git.

I'm still curious as to why it didn't work. Is it a thing like the subkeys where you can only use the last secret-key you used? How would this be found out? Actually, no, I don't think this is worth finding out, because of the above.

So I think the lesson here is, to allow access to a password store from multiple devices use multiple gpg keys (unless mobile in which case use secure transfer to get the secret key). Mobile is really the only exception to making gpg-keys per device.

Additionally, I figured out that the gpg prompt is quite useful. Used it to change the expiration dates on my keys!


=== Talk with Greg (NHL) ===
First I talked with Matt, asking if he knew anything about it. He referred me to Greg.
I asked Greg about it and he came by to check out the issue. Here's what he did:
1. Navigate to the .password-store to a specific password
2. Call `gpg _name-of-file_`
3. The resulting message displayed the fingerprint of the ID needed to decrypt the password

The fingerprint was different than the one I had so I guess I still had it encrypted with both this gpg key and the other computer's gpg key.
So the solution would be to get both keys, reset the `.gpg-id` file, reencrypt the password store, then push.
