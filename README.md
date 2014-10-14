libre-converter
===============

Convert Word/Excel/Powerpoint to PDFs (or other extensions) via LibreOffice.

Why?
----
There are several providers to do this as a service. but they cost $ for every document you convert.
You can throw this little code in your VPS and enjoy the freedom of converting documents for free.

Installation
------------
### For development
```bash
git clone https://github.com/Schniz/libre-converter.git
cd libre-converter
npm install
node .
```

### For just using this dude
```bash
npm install -g libre-converter
libre-converter --port 6661 --hostname 0.0.0.0
```

and just read the help.

```bash
libre-converter --help
```

Requirements (other than the node's)..
--------------------------------------
Fucking LibreOffice. install this gold. you can install only LibreOffice's Writer if you are only into Words and stuff.

Have fun and contribute
-----------------------
Cause I code better with you guys :heart:

see ya.
