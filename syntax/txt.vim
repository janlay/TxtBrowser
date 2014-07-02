" Vim syntax file
" Language:    text/plain
" Maintainer:  yysfire <yysfire@gmail.com>, guoyoooping <guoyoooping@163.com>
" Last Update: 2014-07-02 12:08
" Release:     1.3.6

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

runtime! syntax/help.vim

"set case insensitive.
syn case ignore

"This script is encoded as utf8, and will convert to appropriate value when running.
scriptencoding utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key words definition.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Keywords
syn keyword txtTodo todo fixme note comment notice
syn keyword txtError error bug caution dropped
syn keyword txtDebug warning debug

syn cluster txtAlwaysContains add=txtTodo,txtError,txtDebug
syn cluster txtNormalContains add=txtNumber,txtUrl,txtCPM
syn cluster txtBracketsContains  add=txtBlock,txtParentesis,txtBrackets,txtAngleBrackets
syn cluster txtQuoteContains  add=txtQuotes,txtApostrophe

syn match txtOperator "[~\-+*<>\[\]{}=|#@$%&\\/&\^]"

" English Punctuation Marks
syn match txtEPM "[_:\.,!?]"

"syn match txtLetters "[A-Za-z]"

" Normal Chinese Punctuation Marks
syn match txtCPM "[，。；：！？、《》【】“”‘’（）『』「」〖〗﹝﹞〔〕〈〉…￥·■◆▲●★□◇△○☆＄‰￥℃※±⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂⒃⒄⒅⒆⒇⒈⒉⒊⒋⒌⒍⒎⒏⒐⒑⒒⒓⒔⒕⒖⒗⒘⒙⒚⒛①②③④⑤⑥⑦⑧⑨⑩㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩→←↑↓§№◎ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅪⅫ≈≡≠＝≤≥＜＞≮≯∷±＋－×÷／∫∮∝∞∧∨∑∏∪∩∈∵∴⊥∥∠⌒⊙≌∽√°¤￠〇]"

" Numbers
syn match txtNumber "\d\(\.\d\+\)*\.\?"

"txtComment: Lines that start with '#'
"以#号打头的行为注释文本
syn match   txtComment '^#.*$' contains=@txtAlwaysContains,txtUrl
"以//打头的行为注释文本
syn region txtComment  matchgroup=txtComment start="^\/\/" end="$" contains=@txtAlwaysContains,txtUrl oneline

"txtTitle: Lines start with digit and '.'
"标题文本: 前面有任意个空格,数字.[数字.]打头, 并且该行里不含有,.。，等标点符号
"
syn match txtTitle "^\(\d\+ \)\+\s*[^,。，]\+$"
syn match txtTitle "^\(\d\+ \)\+\s*[^,。，]\+$"
"
syn match txtTitle "^\(\d\+\.\)\+\s*[^,。，]\+$"
syn match txtTitle "^\(\d\+\.\)\+\s*[^,。，]\+,"

"txtTitle: Lines start with Chinese digit and '.'
"标题文本: 汉字数字加'.、'打头，且该行不含,.。，标点符号
syn match txtTitle "^\([一二三四五六七八九十][、.]\)\+\s*[^,。，]\+$"
syn match txtTitle "^\([一二三四五六七八九十][、.]\)\+\s*[^,。，]\+,"
syn match txtTitle "^\(\s*（\)*\([一二三四五六七八九十]\+）*[、. ]\)\+\s*[^,。，]\+$"
syn match txtTitle "^\(\s*（\)*\([一二三四五六七八九十]\+[、. ]\)\+\s*[^,。，]\+[，,]"
syn match txtTitle "^（\([一二三四五六七八九十]\+）*[、. ]\)\+\s*[^,。，]\+$"
syn match txtTitle "^（\([一二三四五六七八九十]\+[、. ]\)\+\s*[^,。，]\+[，,]"

"txtTitle: Lines start with digit
"标题文本: 以数字打头, 中间有空格, 后跟任意文字. 且该行不含有,.。，标点符号
syn match txtTitle "^\d\+\s\+.\+\s*[^,。，]$"
syn match txtTitle "^\d\+\s\+.\+\s*[^,。，],"
"标题文本: 以数字打头, 中间有中文顿号, 后跟任意文字. 且该行不含有,.。，标点符号
syn match txtTitle "^\d\+、.\+\s*[^,。，]$"

"标题文本: 网络小说标题
syn match txtTitle "^.*第\?\([一二三四五六七八九十百千零]\)\+章\s*[^,。，]\+$"
syn match txtTitle "^.*第\([0-9]\)\+章.*$"
syn match txtTitle "^.*[序楔]\+\s*[^,。，]\+$"

"txtList: Lines start with space and then '-+*.'
"列表文本: 任意空格打头, 后跟一个[-+*.]
syn match txtList    '^\s*\zs[-+*.] [^ ]'me=e-1

"txtList: Lines start with space and then digit
"列表文本: 任意空格打头, 后跟一个(数字) 或 (字母) 打头的文本行
syn match txtList    '^\s*\zs(\=\([0-9]\+\|[a-zA-Z]\))'

"txtList: Lines start with space and then digit and '.'
"列表文本: 至少一个空格打头, [数字.]打头, 但随后不能跟数字(排除把5.5这样的文
"本当成列表)
syn match txtList "^\s\+\zs\d\+\.\d\@!"

"txtApostrophe: text in the apostrophe
"单引号内文字, 作用范围最多两行.
"syn match   txtApostrophe  /'[^']\+\(\n\)\=[^']*'/ contains=@txtNormalContains,@txtAlwaysContains

"txtQuotes: text in the quotoes
"双引号内文字, 包括全角半角, 作用范围最多两行
"syn match   txtQuotes     '["][^"]\+\(\n\)\=[^"]*["]' contains=@txtNormalContains,@txtAlwaysContains

"syn  region  txtQuotes    matchgroup=txtEPM  start=/'/ skip=/\\'/ end=/'/  contains=@txtNormalContains,@txtAlwaysContains oneline
syn  region  txtQuotes    matchgroup=txtEPM  start="\(\s\|^\)\@<='" end="'"  contains=@txtNormalContains,@txtAlwaysContains
"syn  region  txtQuotes    matchgroup=txtEPM  start=/"/ skip=/\\"/ end=/"/  contains=@txtNormalContains,@txtAlwaysContains
syn  region  txtQuotes    matchgroup=txtEPM  start=/"/ end=/"/  contains=@txtNormalContains,@txtAlwaysContains
syn  region  txtQuotes    matchgroup=txtCPM  start="[“]"  end="[”]"  contains=@txtNormalContains,@txtAlwaysContains
syn  region  txtQuotes    matchgroup=txtCPM  start="[‘]"  end="[’]"  contains=@txtNormalContains,@txtAlwaysContains


"txtBrackets: text in the brackets
syn region  txtBrackets  matchgroup=txtCPM  start="[《]"  end="[》]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
syn region  txtBrackets  matchgroup=txtCPM  start="[（]"  end="[）]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
syn region  txtBrackets  matchgroup=txtCPM  start="[『]"  end="[』]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
syn region  txtBrackets  matchgroup=txtCPM  start="[【]"  end="[】]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
syn region  txtBrackets  matchgroup=txtCPM  start="[﹝]"  end="[﹞]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
syn region  txtBrackets  matchgroup=txtCPM  start="[〔]"  end="[〕]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
syn region  txtBrackets  matchgroup=txtCPM  start="[〈]"  end="[〉]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
syn region  txtBrackets  matchgroup=txtCPM  start="[「]"  end="[」]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
syn region  txtBrackets  matchgroup=txtCPM  start="[〖]"  end="[〗]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
syn region  txtAngleBrackets matchgroup=txtEPM  start="<"  end=">"   contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains  oneline
"syn region  txtAngleBrackets matchgroup=txtEPM  start="<"  end=">"   contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
"syn region  txtParentesis    matchgroup=txtEPM  start="("  end=")"   contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains  oneline
syn region  txtParentesis    matchgroup=txtEPM  start="("  end=")"   contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
syn region  txtBrackets      matchgroup=txtEPM  start="\[" end="\]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains  oneline
"syn region  txtBrackets      matchgroup=txtEPM  start="\[" end="\]"  contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains
"syn region  txtBlock         matchgroup=txtEPM  start="{"  end="}"   contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains  oneline
syn region  txtBlock         matchgroup=txtEPM  start="{"  end="}"   contains=@txtBracketsContains,@txtNormalContains,@txtAlwaysContains

"link url
syn match txtUrl "\(http\|https\|ftp\|telnet\|file\|gopher\|wais\|ed2k\)://\(\w\|[\-&@%#=?\:\.\/]\)\+"
syn match txtUrl '\(www[23]\=\.\|ftp\.\)\(\w\|[\-&@%#=?\:\.\/]\)\+'
" Email
syn match txtUrl "\(mailto:\)\?\([a-zA-Z0-9_\-\.]\+\)@\(\([0-9]\{1,3}\.[0-9]\{1,3}\.[0-9]\{1,3}\.\)\|\(\([a-zA-Z0-9\-]\+\.\)\+\)\)\([a-zA-Z]\{2,4}\|[0-9]\{1,3}\)"


"email text:
syn match txtEmailMsg '^\s*\(From\|De\|Sent\|To\|Para\|Date\|Data\|Assunto\|Subject\):.*'
"reference from reply email, quotes, etc.
syn region  txtReference start="^|.*[^a-zA-Z\-]" end="$" contains=@txtNormalContains,@txtAlwaysContains,txtOperator oneline
syn region  txtReference start="^>\+\s\+" end="$" contains=@txtNormalContains,@txtAlwaysContains,txtOperator  oneline
syn region  txtReference matchgroup=txtOperator start="^\s\+:" end="$" contains=@txtNormalContains,@txtAlwaysContains,txtOperator  oneline

" Changelog tags: add, chg, rem, fix
syn match txtChangelogs         "\<add\>\s*:" contains=txtOperator
syn match txtChangelogs         "\<chg\>\s*:" contains=txtOperator
syn match txtChangelogs         "\<rem\>\s*:" contains=txtOperator
syn match txtChangelogs         "\<del\>\s*:" contains=txtOperator
syn match txtChangelogs         "\<fix\>\s*:" contains=txtOperator

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"类html文本
"syn match   txtBold       '\*[^*[:blank:]].\{-}\*'hs=s+1,he=e-1
"syn match txtItalic "^\s\+.\+$" "斜体文本

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color definitions (specific)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version < 508
    command -nargs=+ HiLink hi link <args>
else
    command -nargs=+ HiLink hi def link <args>
endif

"HiLink txtLetters      Normal
HiLink txtCPM          Label
HiLink txtEPM          String
HiLink txtApostrophe   MoreMsg
HiLink txtQuotes       MoreMsg
HiLink txtBlock         Special
HiLink txtBrackets      Special
HiLink txtParentesis    Special
HiLink txtAngleBrackets Special

HiLink  txtNumber      Number
HiLink  txtOperator    Operator
HiLink  txtUrl        Underlined
HiLink  txtTitle       Title
HiLink  txtList        SignColumn
HiLink  txtComment    Comment
HiLink  txtReference   Normal
HiLink  txtError       Error
HiLink  txtTodo        Todo
HiLink  txtDebug       Debug
HiLink  txtChangelogs  Keyword
HiLink  txtEmailMsg    Structure

delcommand HiLink

let b:current_syntax = 'txt'
" vim:tw=0:et
