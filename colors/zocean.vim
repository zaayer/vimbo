""" Original code
" Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (c) 2016-present Sven Greb <code@svengreb.de>

""" Modifications
" Copyright (c) 2018-present Kyle Rooker <rookerka@gmail.com>

" Project: Zimbo
" Repository: https://github.com/zaayer/zimbo
" License: MIT

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "zimbo"
let s:zimbo_vim_version="0.1.0"
set background=dark

let s:zimbo0_gui = "#2E3440"
let s:zimbo1_gui = "#3B4252"
let s:zimbo2_gui = "#434C5E"
let s:zimbo3_gui = "#4C566A"
let s:zimbo4_gui = "#D8DEE9"
let s:zimbo5_gui = "#E5E9F0"
let s:zimbo6_gui = "#ECEFF4"
let s:zimbo7_gui = "#8FBCBB"
let s:zimbo8_gui = "#88C0D0"
let s:zimbo9_gui = "#81A1C1"
let s:zimbo10_gui = "#5E81AC"
let s:zimbo11_gui = "#BF616A"
let s:zimbo12_gui = "#D08770"
let s:zimbo13_gui = "#EBCB8B"
let s:zimbo14_gui = "#A3BE8C"
let s:zimbo15_gui = "#B48EAD"

let s:zimbo1_term = "0"
let s:zimbo3_term = "8"
let s:zimbo5_term = "7"
let s:zimbo6_term = "15"
let s:zimbo7_term = "14"
let s:zimbo8_term = "6"
let s:zimbo9_term = "4"
let s:zimbo10_term = "12"
let s:zimbo11_term = "1"
let s:zimbo12_term = "11"
let s:zimbo13_term = "3"
let s:zimbo14_term = "2"
let s:zimbo15_term = "5"

let s:zimbo3_gui_brightened = [
  \ s:zimbo3_gui,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

if !exists("g:zimbo_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:zimbo_italic=1
  else
    let g:zimbo_italic=0
  endif
endif

let s:italic = "italic,"
if g:zimbo_italic == 0
  let s:italic = ""
endif

let s:italicize_comments = ""
if exists("g:zimbo_italic_comments")
  if g:zimbo_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:zimbo_uniform_status_lines')
  let g:zimbo_uniform_status_lines = 0
endif

if !exists("g:zimbo_comment_brightness")
  let g:zimbo_comment_brightness = 0
endif

if !exists("g:zimbo_uniform_diff_background")
  let g:zimbo_uniform_diff_background = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", "bold", "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", "underline", "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:zimbo1_gui, "NONE", s:zimbo1_term, "", "")
call s:hi("Cursor", s:zimbo0_gui, s:zimbo4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:zimbo1_gui, "NONE", s:zimbo1_term, "NONE", "")
call s:hi("Error", s:zimbo0_gui, s:zimbo11_gui, "", s:zimbo11_term, "", "")
call s:hi("iCursor", s:zimbo0_gui, s:zimbo4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:zimbo3_gui, s:zimbo0_gui, s:zimbo3_term, "NONE", "", "")
call s:hi("MatchParen", s:zimbo8_gui, s:zimbo3_gui, s:zimbo8_term, s:zimbo3_term, "", "")
call s:hi("NonText", s:zimbo2_gui, "", s:zimbo3_term, "", "", "")
call s:hi("Normal", s:zimbo4_gui, s:zimbo0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:zimbo4_gui, s:zimbo2_gui, "NONE", s:zimbo1_term, "NONE", "")
call s:hi("PmenuSbar", s:zimbo4_gui, s:zimbo2_gui, "NONE", s:zimbo1_term, "", "")
call s:hi("PMenuSel", s:zimbo8_gui, s:zimbo3_gui, s:zimbo8_term, s:zimbo3_term, "", "")
call s:hi("PmenuThumb", s:zimbo8_gui, s:zimbo3_gui, "NONE", s:zimbo3_term, "", "")
call s:hi("SpecialKey", s:zimbo3_gui, "", s:zimbo3_term, "", "", "")
call s:hi("SpellBad", "", s:zimbo0_gui, "", "NONE", "undercurl", s:zimbo11_gui)
call s:hi("SpellCap", "", s:zimbo0_gui, "", "NONE", "undercurl", s:zimbo13_gui)
call s:hi("SpellLocal", "", s:zimbo0_gui, "", "NONE", "undercurl", s:zimbo5_gui)
call s:hi("SpellRare", "", s:zimbo0_gui, "", "NONE", "undercurl", s:zimbo6_gui)
call s:hi("Visual", "", s:zimbo2_gui, "", s:zimbo1_term, "", "")
call s:hi("VisualNOS", "", s:zimbo2_gui, "", s:zimbo1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:zimbo11_gui, s:zimbo1_gui, s:zimbo11_term, s:zimbo1_term, "", "")
call s:hi("healthSuccess", s:zimbo14_gui, s:zimbo1_gui, s:zimbo14_term, s:zimbo1_term, "", "")
call s:hi("healthWarning", s:zimbo13_gui, s:zimbo1_gui, s:zimbo13_term, s:zimbo1_term, "", "")
call s:hi("TermCursorNC", "", s:zimbo1_gui, "", s:zimbo1_term, "", "")

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:zimbo1_gui
  let g:terminal_color_1 = s:zimbo11_gui
  let g:terminal_color_2 = s:zimbo14_gui
  let g:terminal_color_3 = s:zimbo13_gui
  let g:terminal_color_4 = s:zimbo9_gui
  let g:terminal_color_5 = s:zimbo15_gui
  let g:terminal_color_6 = s:zimbo8_gui
  let g:terminal_color_7 = s:zimbo5_gui
  let g:terminal_color_8 = s:zimbo3_gui
  let g:terminal_color_9 = s:zimbo11_gui
  let g:terminal_color_10 = s:zimbo14_gui
  let g:terminal_color_11 = s:zimbo13_gui
  let g:terminal_color_12 = s:zimbo9_gui
  let g:terminal_color_13 = s:zimbo15_gui
  let g:terminal_color_14 = s:zimbo7_gui
  let g:terminal_color_15 = s:zimbo6_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:zimbo1_gui, "NONE", s:zimbo1_term, "", "")
call s:hi("CursorLineNr", s:zimbo3_gui, s:zimbo0_gui, "NONE", "", "", "")
call s:hi("Folded", s:zimbo3_gui, s:zimbo1_gui, s:zimbo3_term, s:zimbo1_term, "bold", "")
call s:hi("FoldColumn", s:zimbo3_gui, s:zimbo0_gui, s:zimbo3_term, "NONE", "", "")
call s:hi("SignColumn", s:zimbo1_gui, s:zimbo0_gui, s:zimbo1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:zimbo8_gui, "", s:zimbo8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:zimbo1_gui, "", s:zimbo1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:zimbo4_gui, s:zimbo11_gui, "NONE", s:zimbo11_term, "", "")
call s:hi("ModeMsg", s:zimbo4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:zimbo4_gui, "", "", "", "", "")
call s:hi("Question", s:zimbo4_gui, "", "NONE", "", "", "")
if g:zimbo_uniform_status_lines == 0
  call s:hi("StatusLine", s:zimbo8_gui, s:zimbo3_gui, s:zimbo8_term, s:zimbo3_term, "NONE", "")
  call s:hi("StatusLineNC", s:zimbo4_gui, s:zimbo1_gui, "NONE", s:zimbo1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:zimbo8_gui, s:zimbo3_gui, s:zimbo8_term, s:zimbo3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:zimbo4_gui, s:zimbo1_gui, "NONE", s:zimbo1_term, "NONE", "")
else
  call s:hi("StatusLine", s:zimbo8_gui, s:zimbo3_gui, s:zimbo8_term, s:zimbo3_term, "NONE", "")
  call s:hi("StatusLineNC", s:zimbo4_gui, s:zimbo3_gui, "NONE", s:zimbo3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:zimbo8_gui, s:zimbo3_gui, s:zimbo8_term, s:zimbo3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:zimbo4_gui, s:zimbo3_gui, "NONE", s:zimbo3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:zimbo0_gui, s:zimbo13_gui, s:zimbo1_term, s:zimbo13_term, "", "")
call s:hi("WildMenu", s:zimbo8_gui, s:zimbo1_gui, s:zimbo8_term, s:zimbo1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:zimbo1_gui, s:zimbo8_gui, s:zimbo1_term, s:zimbo8_term, "underline", "")
call s:hi("Search", s:zimbo1_gui, s:zimbo8_gui, s:zimbo1_term, s:zimbo8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:zimbo4_gui, s:zimbo1_gui, "NONE", s:zimbo1_term, "NONE", "")
call s:hi("TabLineFill", s:zimbo4_gui, s:zimbo1_gui, "NONE", s:zimbo1_term, "NONE", "")
call s:hi("TabLineSel", s:zimbo8_gui, s:zimbo3_gui, s:zimbo8_term, s:zimbo3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:zimbo4_gui, "", "NONE", "", "NONE", "")
call s:hi("VertSplit", s:zimbo2_gui, s:zimbo1_gui, s:zimbo3_term, s:zimbo1_term, "NONE", "")

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("Character", s:zimbo14_gui, "", s:zimbo14_term, "", "", "")
call s:hi("Comment", s:zimbo3_gui_brightened[g:zimbo_comment_brightness], "", s:zimbo3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("Constant", s:zimbo4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("Delimiter", s:zimbo6_gui, "", s:zimbo6_term, "", "", "")
call s:hi("Exception", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("Float", s:zimbo15_gui, "", s:zimbo15_term, "", "", "")
call s:hi("Function", s:zimbo8_gui, "", s:zimbo8_term, "", "", "")
call s:hi("Identifier", s:zimbo4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("Keyword", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("Label", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("Number", s:zimbo15_gui, "", s:zimbo15_term, "", "", "")
call s:hi("Operator", s:zimbo9_gui, "", s:zimbo9_term, "", "NONE", "")
call s:hi("PreProc", s:zimbo9_gui, "", s:zimbo9_term, "", "NONE", "")
call s:hi("Repeat", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("Special", s:zimbo4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:zimbo13_gui, "", s:zimbo13_term, "", "", "")
call s:hi("SpecialComment", s:zimbo8_gui, "", s:zimbo8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("StorageClass", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("String", s:zimbo14_gui, "", s:zimbo14_term, "", "", "")
call s:hi("Structure", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
call s:hi("Tag", s:zimbo4_gui, "", "", "", "", "")
call s:hi("Todo", s:zimbo13_gui, "NONE", s:zimbo13_term, "NONE", "", "")
call s:hi("Type", s:zimbo9_gui, "", s:zimbo9_term, "", "NONE", "")
call s:hi("Typedef", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("awkCharClass", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("awkPatterns", s:zimbo9_gui, "", s:zimbo9_term, "", "bold", "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("cssDefinition", s:zimbo7_gui, "", s:zimbo7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:zimbo7_gui, "", s:zimbo7_term, "", "underline", "")
call s:hi("cssStringQ", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:zimbo8_gui, "", s:zimbo8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("dtExecKey", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("dtLocaleKey", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("dtNumericKey", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("dtTypeKey", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:zimbo_uniform_diff_background == 0
  call s:hi("DiffAdd", s:zimbo14_gui, s:zimbo0_gui, s:zimbo14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:zimbo13_gui, s:zimbo0_gui, s:zimbo13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:zimbo11_gui, s:zimbo0_gui, s:zimbo11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:zimbo9_gui, s:zimbo0_gui, s:zimbo9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:zimbo14_gui, s:zimbo1_gui, s:zimbo14_term, s:zimbo1_term, "", "")
  call s:hi("DiffChange", s:zimbo13_gui, s:zimbo1_gui, s:zimbo13_term, s:zimbo1_term, "", "")
  call s:hi("DiffDelete", s:zimbo11_gui, s:zimbo1_gui, s:zimbo11_term, s:zimbo1_term, "", "")
  call s:hi("DiffText", s:zimbo9_gui, s:zimbo1_gui, s:zimbo9_term, s:zimbo1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")

call s:hi("goBuiltins", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:zimbo3_gui, "", s:zimbo3_term, "", "", "")
call s:hi("helpHyperTextJump", s:zimbo8_gui, "", s:zimbo8_term, "", "underline", "")

call s:hi("htmlArg", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("htmlLink", s:zimbo4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")

call s:hi("lessClass", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("markdownCode", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("markdownFootnote", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("markdownId", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("markdownH1", s:zimbo8_gui, "", s:zimbo8_term, "", "", "")
call s:hi("markdownLinkText", s:zimbo8_gui, "", s:zimbo8_term, "", "", "")
call s:hi("markdownUrl", s:zimbo4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")

call s:hi("phpClasses", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("phpDocTags", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("podVerbatimLine", s:zimbo4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("rubySymbol", s:zimbo6_gui, "", s:zimbo6_term, "", "bold", "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("sassClass", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("sassId", s:zimbo7_gui, "", s:zimbo7_term, "", "underline", "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("vimMapRhs", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("vimNotation", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("xmlCdataStart", s:zimbo3_gui, "", s:zimbo3_term, "", "bold", "")
call s:hi("xmlNamespace", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:zimbo13_gui, "", s:zimbo13_term, "", "", "")
call s:hi("ALEErrorSign" , s:zimbo11_gui, "", s:zimbo11_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:zimbo14_gui, "", s:zimbo14_term, "", "", "")
call s:hi("GitGutterChange", s:zimbo13_gui, "", s:zimbo13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:zimbo11_gui, "", s:zimbo11_term, "", "", "")
call s:hi("GitGutterDelete", s:zimbo11_gui, "", s:zimbo11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:zimbo14_gui, "", s:zimbo14_term, "", "", "")
call s:hi("SignifySignChange", s:zimbo13_gui, "", s:zimbo13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:zimbo11_gui, "", s:zimbo11_term, "", "", "")
call s:hi("SignifySignDelete", s:zimbo11_gui, "", s:zimbo11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:zimbo11_gui, "", s:zimbo11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:zimbo11_gui, "", s:zimbo11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:zimbo14_gui, "", s:zimbo14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:zimbo4_gui, s:zimbo3_gui, "", s:zimbo3_term, "", "")
call s:hi("jediFat", s:zimbo8_gui, s:zimbo3_gui, s:zimbo8_term, s:zimbo3_term, "bold,underline", "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:zimbo11_gui, "", "", s:zimbo11_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:zimbo8_gui, "", s:zimbo8_term, "", "", "")

"+--- Languages ---+
" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:zimbo8_gui, "", s:zimbo8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")
call s:hi("mkdFootnote", s:zimbo8_gui, "", s:zimbo8_term, "", "", "")
call s:hi("mkdRule", s:zimbo10_gui, "", s:zimbo10_term, "", "", "")
call s:hi("mkdLineBreak", s:zimbo9_gui, "", s:zimbo9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:zimbo7_gui, "", s:zimbo7_term, "", "", "")