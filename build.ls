require! {
  "fs-extra": fs
  "livescript2": livescript
  "stylus2": stylus
  terser
}

fs.emptyDirSync \dist

code = fs.readFileSync \prescript.ls \utf8
code = livescript.compile code
{code} = await terser.minify code
fs.writeFileSync \dist/prescript.js code

code = fs.readFileSync \script.ls \utf8
code = livescript.compile code
{code} = await terser.minify code
fs.writeFileSync \dist/script.js code

styl = fs.readFileSync \style.styl \utf8
styl = stylus.render styl, compress: yes
fs.writeFileSync \dist/style.css styl

manifest = fs.readJsonSync \manifest.json
fs.writeJsonSync \dist/manifest.json manifest

fs.copySync \icons \dist/icons
