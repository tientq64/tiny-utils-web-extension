el = document.createElement \script
el.src = chrome.runtime.getURL \script.js
el.onload = (.target.remove!)
document.body.appendChild el
