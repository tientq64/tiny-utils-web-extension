function getDomainName
  location.hostname
    .split \.
    .sort (a, b) ~> b.length - a.length
    .at 0
    .toUpperCase!

CodesMap =
  Backquote: \`
  Minus: \-
  Equal: \=
  Backslash: \\
  Quote: \'
  Semicolon: \;
  Comma: \,
  Period: \.
  Slash: \/
  BracketLeft: \[
  BracketRight: \]

function getKeyCombo event
  combo = ""
  if event.location in [0 3]
    if event.ctrlKey
      combo += \Ctrl+
    if event.shiftKey
      combo += \Shift+
    if event.altKey
      combo += \Alt+
    combo += event.code - /^(Key|Digit)/
  combo

!function addGlobalKeyPress callback
  window.addEventListener \keydown (event) !~>
    if not event.repeat and event.isTrusted and document.activeElement is document.body
      combo = getKeyCombo event
      if combo
        callback combo, event

const domainName = getDomainName!
document.documentElement.classList.add domainName

addGlobalKeyPress (combo) !->
  switch combo
  | \F11
    if /^.+?\.io$/.test location.hostname
      setTimeout !~>
        unless document.fullscreen
          document.documentElement.requestFullscreen!
      , 100

switch domainName
| \STARVE
  removeAds = (count) !~>
    if count
      setTimeout !~>
        els = document.querySelectorAll 'iframe[src*="yolla-d"],iframe[src*="lijit"],iframe[src*="js-sec"],iframe[src*="adnxs"],iframe[src*="pubmatic"],iframe[src*="3lift"],iframe[src*="rubiconproject"],iframe[src*="contextweb"],iframe[src*="criteo"]'
        for el in els
          el.remove!
        removeAds count - 1
      , 30000
  removeAds 16
  guideEl = document.createElement \div
  guideEl.id = \guide
  guideEl.hidden = yes
  guideEl.innerHTML = """
    CUỐC/XẺNG ĐÁ - 15 đá | 50 gỗ
    CUỐC/XẺNG VÀNG - 20 vàng | 30 đá | 40 gỗ
    CUỐC/XẺNG KIM CƯƠNG - 20 kim cương | 50 vàng | 80 đá
    CUỐC/XẺNG THẠCH ANH - 30 thạch anh | 40 kim cương | 60 vàng
    BÚA ĐÁ - 50 đá | 90 gỗ
    BÚA VÀNG - 80 vàng | 120 đá | 160 gỗ
    BÚA KIM CƯƠNG - 80 kim cương | 150 vàng | 200 đá
    BÚA THẠCH ANH - 60 thạch anh | 160 kim cương | 250 vàng
    CHĨA - 100 gỗ | 50 đá
    BÌNH TƯỚI CÂY - 50 gỗ
    SÁCH - 4 da sói | 4 tơ nhện | 4 giấy
    CỜ LÊ - 70 đá
    XÔ - 1 tơ nhện | 20 gỗ

    KIẾM VÀNG - 40 vàng | 50 đá | 60 gỗ
    KIẾM KIM CƯƠNG - 40 kim cương | 60 vàng | 80 đá
    KIẾM THẠCH ANH - 40 thạch anh | 60 kim cương | 100 vàng

    MŨ LEN 1 - 1 da thỏ | 2 tơ nhện
    MŨ LEN 2 - 5 da sói | 4 tơ nhện
    MŨ LEN 3 - 5 da gấu/cáo | 4 tơ kim cương
    MŨ SA MẠC 1 - 2 da lợn | 4 tơ nhện
    MŨ SA MẠC 2 - 4 da lợn | 6 tơ nhện | 4 lông cánh cụt | 12 lông kền kền
    MŨ NÔNG DÂN - 3 da thỏ | 2 tơ nhện
    BALO - 5 da sói | 6 tơ nhện

    LỬA TRẠI 1 - 5 đá | 25 gỗ
    LỬA TRẠI 2 - 10 đá | 35 gỗ
    LÒ SƯỞI - 15 vàng | 50 đá | 150 gỗ
    CẦU - 15 gỗ
    MÁI NHÀ - 30 gỗ
    LÔ ĐẤT - 15 đất | 20 gỗ
    CỐI XAY GIÓ - 2 tơ | 20 đá | 60 gỗ
    GIẾNG - 30 đất | 100 đá
    MÁY BAY - 8 lông diều hâu | 10 tơ nhện | 10 giấy | 250 gỗ

    TƯỜNG GỖ - 20 gỗ
    TƯỜNG ĐÁ - 17 đá
    TƯỜNG VÀNG - 14 vàng
    TƯỜNG KIM CƯƠNG - 11 vàng
    CỬA GỖ - 30 gỗ
    CỬA ĐÁ - 27 đá
    CỬA VÀNG - 24 vàng
    CỬA KIM CƯƠNG - 21 vàng
    TƯỜNG GAI GỖ - 40 gỗ | 30 đá | 1 tường gỗ
    TƯỜNG GAI ĐÁ - 70 đá | 1 tường đá
    TƯỜNG GAI VÀNG - 40 vàng | 30 đá | 1 tường vàng
    TƯỜNG GAI KIM CƯƠNG - 40 kim cương | 30 đá | 1 tường kim cương
    CỬA GAI GỖ - 80 gỗ | 60 đá | 1 cửa gỗ
    CỬA GAI ĐÁ - 140 đá | 1 cửa đá
    CỬA GAI VÀNG - 80 vàng | 60 đá | 1 cửa vàng
    CỬA GAI KIM CƯƠNG - 80 kim cương | 60 đá | 1 cửa kim cương
  """
  document.body.appendChild guideEl
  addGlobalKeyPress (combo) !->
    switch combo
    | \F
      game.market.select!
    | \C
      if game.craft_list.list.style.display is \inline-block
        game.craft_list.list.previous!
      else
        game.craft_list.select_book!
    | \Space
      not= guideEl.hidden

| \TRUYENNUNG
  delete window.open
