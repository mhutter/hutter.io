---
# Only the main coffee file needs front matter (the dashes are enough)
---
window.onload = ->
  c = document.getElementById 'menu-collapse'
  b = document.getElementById 'navbar-toggle'

  showMenu = ->
    c.classList.remove 'collapsed'
    b.onclick = hideMenu

  hideMenu = ->
    c.classList.add 'collapsed'
    b.onclick = showMenu

  c.classList.add 'collapsed'
  b.onclick = showMenu
