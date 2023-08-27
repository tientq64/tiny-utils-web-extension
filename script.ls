function getDomainName
  location.hostname
    .split \.
    .sort (a, b) ~> b.length - a.length
    .at 0

function getKeyCombo event
  combo = ""
  if event.ctrlKey
    combo += "Ctrl+"
  if event.shiftKey
    combo += "Shift+"
  if event.altKey
    combo += "Alt+"
  code = event.code
    .replace /^Key/ ""
  combo += code
  combo

!function onkeydownGlobal event
  return if event.repeat or not event.isTrusted

  combo = getKeyCombo event
  switch combo
  | \F11
    setTimeout !~>
      unless document.fullscreen
        document.body.requestFullscreen!
    , 100

const domainName = getDomainName!
document.documentElement.classList.add domainName.toUpperCase!

window.addEventListener \keydown onkeydownGlobal
