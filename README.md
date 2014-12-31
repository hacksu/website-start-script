website-start-script
====================

If the CS department ever does something weird and breaks the hacksu webiste,
just clone this repository onto the server and execute `start.sh`. It will
install nginx, node, npm, and forever, and then configure an nginx proxy, clone
the Website repo, and run the app.

So simple:
```
git clone https://github.com/hacksu/website-start-script
cd website-start-script
chmod u+x start.sh
sudo ./start.sh
```
Annnnnd the website should be up and running.