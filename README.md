<h1 align="center">
<img src="https://lut.im/2ymhrfgHyc/mgumn3k1gpn4dg5X.svg" height="20px"> Democracy Watcher <img src="https://lut.im/2ymhrfgHyc/mgumn3k1gpn4dg5X.svg" height="20px">
<p align="center"><a href="https://github.com/Betree/democracy-watcher/blob/master/LICENSE"><img src="https://img.shields.io/aur/license/yaourt.svg" alt="License: GPL"/></a></p>
<br/>
</h1>

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/Betree/democracy-watcher)

This project aims to provide a set of simple tools to monitor a democratic entity. This entity can be a country, a city council or your organization.

It is a good fit for journalists wanting something easy to setup to track the promises of their local governments,
and for citizen wanting to collaborate to track their locality actions.

To unsleash its full power, this tool should be combined with [GatsbyJS](http://gatsbyjs.org/) which could provide a lot
of amazing features out of the box : RSS/ATOM feed, markdown text formatting, easy pictures integration, pre-rendered pages
with opengraph tags (to get nice miniatures when sharing on Facebook and Twitter).
It's not complicated, but has to be done. 

[Contact me](mailto:benjamin.piouffle@gmail.com) if you need these features,
I'll be happy to implement them if they can be useful to some people.

It's **entirely static** and the best place to host it is [Netlify](http://netlify.com/):
  - It's free
  - Takes less than 1 minutes to have a running instance ready to be served
  - Anyone can have access to the data and history of modifications
  - It's easy to participate

You can get a preview of what it looks like on [this link](https://democracywatcher.netlify.com).

Current implementation supports English and French but translating it
in a new language should be really quick.

## :newspaper: Promise tracker

List goals / promises with their description, their sources and their status. A
promise may be done, in progress, not yet started or broken.

You can also split the promises in categories (Culture, economy...etc)
which will be displayed as tabs and in subjects which will appears 
between promises :

![Promises view](https://lut.im/gT6h2jW7TK/UY4NqBNBeoe9LTMX.png)

# :floppy_disk: Installation + deployment

Fork this repository then clone it:
```bash
git clone git@github.com:__YOUR_GITHUB_USERNAME/democracy-watcher.git
```

You can then use the following commands to manage your project:

```bash
# Install dependencies
npm install

# Start dev server on http://localhost:8080
npm start

# Build production files to /docs
npm build
```

To deploy your project on Github pages, just go to the project Settings, scroll to
GitHub Pages and select `master branch /docs folder` from the Source dropdown menu.

To setup a custom domain, check out [this link](https://help.github.com/articles/using-a-custom-domain-with-github-pages/)

# :wrench: Configuration

All configuration and data modifications (except for home page) are done in YAML files. YAML has a very simple syntax, don't
be afraid if you don't know it yet.

## Ruling entities

The list of ruling entities is configured in `data/ruling_entities.yaml`. It has the following syntax:

```yaml
entities:
  - id: silly-party # A unique string used to identify the entity (used in url)
    name: Silly Party # The name of the ruling entity
    mandate_start: "2015-10-12" # Begining of the mandate, in the format "YYYY-MM-DD"
    mandate_end: "2020-10-12"
    # All fields below this line are optionnals
    leader: Jethro Q. Walrustitty
    description: The best government the world have ever seen
    thumb: https://api.adorable.io/avatars/200/xxxxx.png
    banner: https://api.adorable.io/avatars/300/xxxxx.png
    modules: [PROMISE]
  - (...)
```

### Promises

To configure promises, you must create a directory which has the id of the ruling entity as
name and create a file called `promises.yaml` in it. With our previous example:
> `data/silly-party/promises.yaml`

```yaml
# All promises must rest under a category (here Education and Economy)
Education: 
  - title: Create math classes for the chickens # Title of the promise
    status: DONE # Status - can be TODO, DONE, BROKEN or IN_PROGRESS
    subject: What to do with the chickens # An optionnal subject to group multiple promises
    description: # A description, use it to give details about the status or the source
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque in lacus ipsum.
      In porttitor tristique diam ut sodales. Proin porta molestie blandit. Vestibulum a felis eget mauris bibendum
      malesuada. Quisque porttitor lorem in euismod mollis. Fusce varius ut massa aliquet hendrerit. Ut scelerisque
      risus consectetur quam dapibus sollicitudin. Suspendisse pellentesque eget arcu ut varius.
      Morbi mollis sed nibh nec eleifend. Donec nec ultricies risus, sit amet hendrerit quam. Etiam non tortor
      dapibus, semper nulla quis, placerat orci.
    sources: # A list of sources confirming the promise or its status
      - media: Le Monde
        url: https://lemonde.fr/blablabla
        title: We saved the chickens !
  - title: Encourage internship for the chickens
    subject: What to do with the chickens
    status: IN_PROGRESS
  - title: Free books for the politicians
    status: TODO
    description:
      Maecenas et laoreet sapien. Maecenas ornare maximus mauris, sed blandit mi tristique vel. Maecenas rhoncus vel
      erat in venenatis. Praesent tincidunt dignissim facilisis. Quisque vestibulum viverra massa at commodo.
      Quisque vehicula felis vitae finibus aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Economy:
  - title: Make potatoes the new official currency
    status: BROKEN
    description: This project has been cancelled after experts said it could be dangerous.
    sources:
      - media: The Onion
        url: https://lemonde.fr/blablabla
        title: An awesome article

```
