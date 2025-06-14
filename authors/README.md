# Author Metadata

This directory contains author information for Unreal Archive content authors.

An author file can be created by hand, although using the `indexing` binary 
would be preferred, as documented in the Unreal Archive repository README.

## Important Note

After adding, editing, or creating images, you must open a Pull Request to get
the changes merged. 

## Manual Creation or Editing

Authors are stored in directories based on the author "primary name", all 
lowercase, spaces replaced with dash (`-`), and punctuation replaced with 
underscore (`_`). For example, a primary name of "Joe Soap" would be in a
directory `joe-soap`, or a name "Joe 'SkweekyKleen' Soap" would be
`joe-_skweekykleen_-soap`.

Within the directory, the `author.yml` file defines the author's properties,
per the example below:

```yaml
---
name: "Joe 'SkweekyKleen' Soap"
aliases:
- "SkweekyKleen"
- "Joe Soap"
- "Squeaky Clean Joe"
links:
  Joe's Homepage: "https://skweekykleen.joe"
  My Other Profile: "https://some-social-network.com/users/joesoap"
about: "I like clean maps"
```

An author can have as many or as few aliases as required, and alias added will
cause content identified as created under that name/alias to appear under the 
primary name from the author config.

If no links are required, the `links` section can be represented as simply:

```yaml
links: {}
```

## Images

If desired, a few images can be defined for an author, visible in different
places. These images should be named as follows, and added to the author's 
directory, alongside the above `author.yml` file.

- `icon.png` / `icon.jpg`
  - Wherever the author's name is shown, this will appear as a small image 
    next to their name.
  - Should be small, under around 40px square.
- `profile.png` / `profile.jpg`
  - This will be displayed at the top of the info panel on the author's page.
  - Medium size image, under around 400px square.
- `bg.png` / `bg.jpg`
  - This will be shown as the background image of the author's page.
  - May or may not be visible or clearly shown depending on the website 
    styling.
  - Can be any size image, will be stretched to user's screen size.
- `cover.png` / `cover.jpg`
  - Will be shown as the button/card/cover on the author listing page.
  - Medium size image, aspect ratio around 600px wide and 250px high.
