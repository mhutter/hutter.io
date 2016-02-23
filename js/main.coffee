---
# Only the main coffee file needs front matter (the dashes are enough)
---
window.onload = ->
  c = document.getElementById 'menu-collapse'
  b = document.getElementById 'navbar-toggle'

  showMenu = ->
    c.classList.remove 'hidden'
    b.onclick = hideMenu

  hideMenu = ->
    c.classList.add 'hidden'
    b.onclick = showMenu

  c.classList.add 'hidden'
  b.onclick = showMenu
