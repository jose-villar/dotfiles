---
title:
- Tutorial
author:
- José Villar 
date:
- \today
institute:
- Universidad de Talca
theme:
- CambridgeUS
colortheme:
- beaver
---

# Footnotes

Here is a footnote reference,[^1]

[^1]: Here is the footnote.

Here is an inline note.^[Inlines notes are easier to write, since
you don't have to pick an identifier and move down to type the
note.]


$$ \sum $$
$$ a_1 = 0 $$



# Definitions and code

## Frame title?

H~2~O

:   Water

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

What is the difference between `This is some verbatim` and `this is some verbatim`?

# The real second slide


(@good)  My first example will be numbered (1).
(@)  My second example will be numbered as according to (@good) (2).

Explanation of examples.

(@)  My third example will be numbered (3).

# More at the beginning

## Subsection
`pandoc -t beamer <ppt.md> -o <outputName.pdf>`  
`chromium <outputName.pdf> &`

## Block of code

> Take a look at this `<html>` that was a piece of code.

## Subsection

To write an end of line you gotta leave 2 spaces at the end of the line 

- [x] This is a complete item
- [ ] This is an incomplete item

# Tables

| **Product** | **Name** |
| :---------: | :------- | 
| Arroz       | 1000     |
| Azúcar      | 200      |

# Another table

: Sample grid table.

+--------------:+:--------------+:------------------:+
| Fruit         | Price         | Advantages         |
+===============+:=============:+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+:--------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+--------------:+--------------------+
+--------------:+:--------------+:------------------:+
| Right         | Left          | Centered           |
+---------------+---------------+--------------------+
# Title of Slide

*This is an italic sentence*

**This is a bold sentence**

This is an unordered list:

> + Item 1
> + Item 2
  - Item 2a 
  - Item 2b
> - Item 3

This is an ordered list:

1. Item 1
2. Item 2
3. Item 3

# Segunda diapo 

[//]: # (This may be the most platform independent comment)
<!-- this is another comment -->
![Caption](./1.png){height=200}

# Title of Slide 2

## Title of subheading

This is a slide


- Item of list
- Another
- etc.

# A picture

![Caption](./1.png){width="50%" }

