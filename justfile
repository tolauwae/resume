compile:
  typst compile resume.typ

watch:
  typst watch resume.typ

jet:
  just recolor-icons "#2A2D31"
  just compile

green:
  just recolor-icons "#005842"
  just compile


recolor-icons color:
  @if ! printf '%s\n' '{{ color }}' | grep -Eq '^#[0-9A-Fa-f]{3}([0-9A-Fa-f]{3})?$'; then echo 'color must be a 3- or 6-digit hex value, for example #005842' >&2; exit 1; fi
  sed -i -E -e 's/(fill[=:][[:space:]]*"?)(#[fF]{3})([";])/\1__PURE_WHITE_3__\3/g' -e 's/(fill[=:][[:space:]]*"?)(#[fF]{6})([";])/\1__PURE_WHITE_6__\3/g' -e 's@(fill[=:][[:space:]]*"?)(#[0-9A-Fa-f]{3}|#[0-9A-Fa-f]{6})([";])@\1{{ color }}\3@g' -e 's/__PURE_WHITE_3__/#fff/g' -e 's/__PURE_WHITE_6__/#ffffff/g' icons/*.svg
