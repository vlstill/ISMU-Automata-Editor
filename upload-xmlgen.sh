#!/usr/bin/env bash

cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<slozka>
  <tento_uzel>
    <nazev>v2</nazev>
    <zkratka_pro_url>v2</zkratka_pro_url>
    <pravo>
      <typ_prava>r</typ_prava>
      <typ_subjektu>w</typ_subjektu>
    </pravo>
  </tento_uzel>
EOF

for file in $@; do
    shortcut=$(echo $file | tr .[:upper:] -[:lower:])
    mime=text/plain
    if echo $file | grep -q '[.]js$'; then
        mime=application/javascript
    elif echo $file | grep -q '[.]css$'; then
        mime=text/css
    fi
    cat <<EOF
  <uzel>
    <zkratka_pro_url>$shortcut</zkratka_pro_url>
    <pravo>
      <typ_prava>r</typ_prava>
      <typ_subjektu>w</typ_subjektu>
    </pravo>
    <objekt>
      <mime_type>$mime</mime_type>
      <kodovani>u</kodovani>
      <jmeno_souboru>$file</jmeno_souboru>
      <poradi>0</poradi>
    </objekt>
  </uzel>
EOF
done

cat <<EOF
</slozka>
EOF
