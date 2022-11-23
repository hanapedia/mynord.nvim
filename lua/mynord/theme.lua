local theme = {}

function theme.highlights(colors, config)
  local function remove_background(group)
    group["bg"] = colors.none
  end

  local function load_syntax()
    -- Syntax highlight groups

    local syntax = {
      -- int, long, char, etc.
      Type = { fg = colors.yellow },
      -- static, register, volatile, etc.
      StorageClass = { fg = colors.purple },
      -- struct, union, enum, etc.
      Structure = { fg = colors.purple },
      -- any constant
      Constant = { fg = colors.blue },
      -- any character constant: 'c', '\n'
      Character = { fg = colors.green },
      -- a number constant: 5
      Number = { fg = colors.orange },
      -- a boolean constant: TRUE, false
      Boolean = { fg = colors.orange },
      -- a floating point constant: 2.3e10
      Float = { fg = colors.orange },
      -- any statement
      Statement = { fg = colors.purple },
      -- case, default, etc.
      Label = { fg = colors.purple },
      -- sizeof", "+", "*", etc.
      Operator = { fg = colors.purple },
      -- try, catch, throw
      Exception = { fg = colors.purple },
      -- generic Preprocessor
      PreProc = { fg = colors.purple },
      -- preprocessor #include
      Include = { fg = colors.blue },
      -- preprocessor #define
      Define = { fg = colors.red },
      -- same as Define
      Macro = { fg = colors.red },
      -- A typedef
      Typedef = { fg = colors.purple },
      -- preprocessor #if, #else, #endif, etc.
      PreCondit = { fg = colors.purple },
      -- any special symbol
      Special = { fg = colors.light_red },
      -- special character in a constant
      SpecialChar = { fg = colors.light_red },
      -- you can use CTRL-] on this
      Tag = { fg = colors.green },
      -- character that needs attention like , or .
      Delimiter = { fg = colors.dark_blue },
      -- special things inside a comment
      SpecialComment = { fg = colors.light_gray },
      -- debugging statements
      Debug = { fg = colors.yellow },
      -- text that stands out, HTML links
      Underlined = { fg = colors.green, style = "underline" },
      -- left blank, hidden
      Ignore = { fg = colors.cyan, bg = colors.bg, style = "bold" },
      -- any erroneous construct
      Error = { fg = colors.error, bg = colors.none, style = "bold,underline" },
      -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
      Todo = { fg = colors.yellow, bg = colors.none, style = "bold,italic" },
      Comment = { fg = colors.light_gray, style = config.styles.comments }, -- normal comments
      -- normal if, then, else, endif, switch, etc.
      Conditional = { fg = colors.purple, style = config.styles.keywords },
      -- normal for, do, while, etc.
      Keyword = { fg = colors.purple, style = config.styles.keywords },
      -- normal any other keyword
      Repeat = { fg = colors.purple, style = config.styles.keywords },
      -- normal function names
      Function = { fg = colors.blue, style = config.styles.functions },
      -- any variable name
      Identifier = { fg = colors.fg, style = config.styles.variables },
      -- any string
      String = { fg = colors.cyan, config.styles.strings },

      htmlLink = { fg = colors.green, style = "underline" },
      htmlArg = { fg = colors.blue },
      htmlTag = { fg = colors.blue },
      htmlEndTag = { fg = colors.blue },
      htmlTagN = { fg = colors.yellow },
      htmlTagName = { fg = colors.yellow },
      htmlSpecialTagName = { fg = colors.yellow },
      htmlH1 = { fg = colors.cyan, style = "bold" },
      htmlH2 = { fg = colors.red, style = "bold" },
      htmlH3 = { fg = colors.green, style = "bold" },
      htmlH4 = { fg = colors.yellow, style = "bold" },
      htmlH5 = { fg = colors.purple, style = "bold" },

      cssAttributeSelector = { fg = colors.blue },
      cssSelectorOp = { fg = colors.dark_blue },
      cssTagName = { fg = colors.yellow },

      markdownBlockquote = { fg = colors.light_gray },
      markdownBold = { fg = colors.purple, style = "bold" },
      markdownCode = { fg = colors.green },
      markdownCodeBlock = { fg = colors.green },
      markdownCodeDelimiter = { fg = colors.green },
      markdownH1 = { fg = colors.dark_blue, style = "bold" },
      markdownH2 = { fg = colors.blue, style = "bold" },
      markdownH3 = { fg = colors.cyan, style = "bold" },
      markdownH4 = { fg = colors.light_green },
      markdownH5 = { fg = colors.light_green },
      markdownH6 = { fg = colors.light_green },
      markdownH1Delimiter = { fg = colors.dark_blue },
      markdownH2Delimiter = { fg = colors.blue },
      markdownH3Delimiter = { fg = colors.cyan },
      markdownH4Delimiter = { fg = colors.light_green },
      markdownH5Delimiter = { fg = colors.light_green },
      markdownH6Delimiter = { fg = colors.light_green },
      markdownId = { fg = colors.yellow },
      markdownIdDeclaration = { fg = colors.purple },
      markdownIdDelimiter = { fg = colors.light_gray },
      markdownLinkDelimiter = { fg = colors.light_gray },
      markdownItalic = { fg = colors.yellow, style = "italic" },
      markdownLinkText = { fg = colors.purple },
      markdownListMarker = { fg = colors.red },
      markdownOrderedListMarker = { fg = colors.red },
      markdownRule = { fg = colors.purple },
      markdownUrl = { fg = colors.cyan, style = "underline" },
    }

    return syntax
  end

  local function load_editor()
    -- Editor highlight groups

    local editor = {
      -- normal text and background color for floating windows
      NormalFloat = { fg = colors.fg, bg = colors.active },
      -- floating window border
      FloatBorder = { fg = colors.blue, bg = colors.active },
      -- used for the columns set with 'colorcolumn'
      ColorColumn = { fg = colors.none, bg = colors.float },
      -- placeholder characters substituted for concealed text (see 'conceallevel')
      Conceal = { bg = colors.bg },
      -- the character under the cursor
      Cursor = { fg = colors.fg, bg = colors.none, style = "reverse" },
      -- like Cursor, but used when in IME mode
      CursorIM = { fg = colors.fg, bg = colors.none, style = "reverse" },
      -- directory names (and other special names in listings)
      Directory = { fg = colors.blue, bg = colors.none },
      -- diff mode: Added line
      DiffAdd = { fg = colors.none, bg = colors.diff_add_bg },
      -- diff mode: Changed line
      DiffChange = { fg = colors.none, bg = colors.diff_change_bg },
      -- diff mode: Deleted line
      DiffDelete = { fg = colors.none, bg = colors.diff_remove_bg },
      -- diff mode: Changed text within a changed line
      DiffText = { fg = colors.none, bg = colors.diff_text_bg },
      -- error messages
      ErrorMsg = { fg = colors.error },
      -- line used for closed folds
      Folded = { fg = colors.dark_blue, bg = colors.none, style = "italic" },
      -- 'foldcolumn'
      FoldColumn = { fg = colors.light_gray },
      -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      IncSearch = { fg = colors.yellow, bg = colors.selection, style = "bold,underline" },
      -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
      LineNr = { fg = colors.light_gray },
      -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
      CursorLineNr = { fg = colors.fg },
      -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
      MatchParen = { fg = colors.yellow, bg = colors.none, style = "bold" },
      -- 'showmode' message (e.g., "-- INSERT -- ")
      ModeMsg = { fg = colors.blue, style = "bold" },
      -- |more-prompt|
      MoreMsg = { fg = colors.blue, style = "bold" },
      -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist
      -- in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
      -- See also |hl-EndOfBuffer|.
      NonText = { fg = colors.gray },
      -- normal item |hl-Pmenu|
      Pmenu = { fg = colors.fg, bg = colors.float },
      -- selected item |hl-PmenuSel|
      PmenuSel = { bg = colors.selection },
      -- scrollbar |hl-PmenuSbar|
      PmenuSbar = { bg = colors.float },
      -- thumb of the scrollbar  |hl-PmenuThumb|
      PmenuThumb = { bg = colors.fg },
      -- |hit-enter| prompt and yes/no questions
      Question = { fg = colors.green },
      -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
      QuickFixLine = { bg = colors.float, style = "bold,italic" },
      -- Line numbers for quickfix lists
      qfLineNr = { fg = colors.purple },
      -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
      Search = { fg = colors.blue, bg = colors.selection, style = "bold" },
      -- Unprintable characters: text displayed differently from what it really is.
      -- But not 'listchars' whitespace. |hl-Whitespace|
      SpecialKey = { fg = colors.dark_blue },
      -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
      SpellBad = { fg = colors.red, bg = colors.none, style = "italic,underline", sp = colors.red },
      -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
      SpellCap = { fg = colors.yellow, bg = colors.none, style = "italic,underline", sp = colors.yellow },
      -- Word that is recognized by the spellchecker as one that is used in another region.
      -- |spell| Combined with the highlighting used otherwise.
      SpellLocal = { fg = colors.cyan, bg = colors.none, style = "italic,underline", sp = colors.cyan },
      -- Word that is recognized by the spellchecker as one that is hardly ever used.
      -- |spell| Combined with the highlighting used otherwise.
      SpellRare = { fg = colors.purple, bg = colors.none, style = "italic,underline", sp = colors.purple },
      -- status line of current window
      StatusLine = { fg = colors.fg, bg = colors.active },
      -- status lines of not-current windows Note: if this is equal to "StatusLine"
      -- Vim will use "^^^" in the status line of the current window.
      StatusLineNC = { fg = colors.light_gray, bg = colors.active },
      -- status line of current terminal window
      StatusLineTerm = { fg = colors.fg, bg = colors.active },
      -- status lines of not-current terminal windows Note: if this is equal to "StatusLine"
      -- Vim will use "^^^" in the status line of the current window.
      StatusLineTermNC = { fg = colors.light_gray, bg = colors.active },
      -- tab pages line, where there are no labels
      TabLineFill = { fg = colors.light_gray, bg = colors.active },
      -- tab pages line, active tab page label
      TablineSel = { fg = colors.cyan, bg = colors.bg },
      Tabline = { fg = colors.light_gray, bg = colors.active },
      -- titles for output from ":set all", ":autocmd" etc.
      Title = { fg = colors.green, bg = colors.none, style = "bold" },
      -- Visual mode selection
      Visual = { fg = colors.none, bg = colors.highlight },
      -- Visual mode selection when vim is "Not Owning the Selection".
      VisualNOS = { fg = colors.none, bg = colors.highlight },
      -- warning messages
      WarningMsg = { fg = colors.warn },
      -- "nbsp", "space", "tab" and "trail" in 'listchars'
      Whitespace = { fg = colors.gray },
      -- current match in 'wildmenu' completion
      WildMenu = { fg = colors.yellow, bg = colors.none, style = "bold" },
      -- window bar of current window
      WinBar = { fg = colors.fg, bg = colors.bg },
      -- window bar of not-current windows
      WinBarNC = { fg = colors.light_gray, bg = colors.bg },
      -- Screen-column at the cursor, when 'cursorcolumn' is set.
      CursorColumn = { fg = colors.none, bg = colors.float },
      -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
      CursorLine = { fg = colors.none, bg = colors.active },
      -- Normal mode message in the cmdline
      NormalMode = { fg = colors.cyan, bg = colors.none, style = "reverse" },
      -- Insert mode message in the cmdline
      InsertMode = { fg = colors.green, bg = colors.none, style = "reverse" },
      -- Replace mode message in the cmdline
      ReplacelMode = { fg = colors.red, bg = colors.none, style = "reverse" },
      -- Visual mode message in the cmdline
      VisualMode = { fg = colors.purple, bg = colors.none, style = "reverse" },
      -- Command mode message in the cmdline
      CommandMode = { fg = colors.yellow, bg = colors.none, style = "reverse" },
      Warnings = { fg = colors.warn },

      healthError = { fg = colors.error },
      healthSuccess = { fg = colors.green },
      healthWarning = { fg = colors.warn },

      -- Dashboard
      DashboardShortCut = { fg = colors.cyan },
      DashboardHeader = { fg = colors.blue },
      DashboardCenter = { fg = colors.purple },
      DashboardFooter = { fg = colors.green, style = "italic" },

      -- normal text and background color
      Normal = { fg = colors.fg, bg = colors.bg },
      NormalNC = { bg = colors.bg },
      SignColumn = { fg = colors.fg, bg = colors.none },

      -- the column separating vertically split windows
      VertSplit = { fg = colors.bg },

      EndOfBuffer = { fg = colors.gray },
    }

    -- Options:

    -- Set non-current background
    if config.fade_nc then
      editor.NormalNC["bg"] = colors.active
      editor.NormalFloat["bg"] = colors.bg
      editor.FloatBorder["bg"] = colors.bg
    end

    -- Set transparent background
    if config.disable.background then
      remove_background(editor.Normal)
      remove_background(editor.NormalNC)
      remove_background(editor.SignColumn)
    end

    -- Set transparent cursorline
    if config.disable.cursorline then
      remove_background(editor.CursorLine)
    end

    -- Set transparent eob lines
    if config.disable.eob_lines then
      editor.EndOfBuffer["fg"] = colors.bg
    end

    -- Inverse highlighting
    if config.inverse.match_paren then
      editor.MatchParen["style"] = "reverse,bold"
    end

    -- Add window split borders
    if config.borders then
      editor.VertSplit["fg"] = colors.selection
    end

    return editor
  end

  local function load_treesitter()
    -- TreeSitter highlight groups

    local treesitter = {
      -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
      ["@attribute"] = { fg = colors.aurora_orange },
      -- boolean literals: `true` and `false` in python.
      ["@boolean"] = { fg = colors.deep_arctic_water },
      -- character literals: `'a'` in c.
      ["@character"] = { fg = colors.aurora_green },
      -- line comments and block comments.
      ["@comment"] = { fg = colors.pn4, style = config.styles.comments },
      -- keywords related to conditionals: `if`, `when`, `cond`, etc.
      ["@conditional"] = { fg = colors.aurora_purple, style = config.styles.keywords },
      -- constants identifiers. these might not be semantically constant. e.g. uppercase variables in python.
      ["@constant"] = { fg = colors.ss0 },
      -- built-in constant values: `nil` in lua.
      ["@constant.builtin"] = { fg = colors.ss3 },
      -- constants defined by macros: `null` in c.
      ["@constant.macro"] = { fg = colors.aurora_red },
      -- constructor calls and definitions: `{}` in lua, and java constructors.
      ["@constructor"] = { fg = colors.clear_ice },
      -- syntax/parser errors. this might highlight large sections of code while the user is typing
      -- still incomplete code, use a sensible highlight.
      ["@error"] = { fg = colors.error },
      -- exception related keywords: `try`, `except`, `finally` in python.
      ["@exception"] = { fg = colors.aurora_purple },
      -- object and struct fields.
      ["@field"] = { fg = colors.ss0 },
      -- floating-point number literals.
      ["@float"] = { fg = colors.aurora_orange },
      -- function calls and definitions.
      ["@function"] = { fg = colors.clear_ice, style = config.styles.functions },
      -- built-in functions: `print` in lua.
      ["@function.builtin"] = { fg = colors.clear_ice, style = config.styles.functions },
      -- macro defined functions (calls and definitions): each `macro_rules` in rust.
      ["@function.macro"] = { fg = colors.clear_ice },
      -- file or module inclusion keywords: `#include` in c, `use` or `extern crate` in rust.
      ["@include"] = { fg = colors.aurora_purple },
      -- keywords that don't fit into other categories.
      ["@keyword"] = { fg = colors.aurora_purple, style = config.styles.keywords },
      -- keywords used to define a function: `function` in lua, `def` and `lambda` in python.
      ["@keyword.function"] = { fg = colors.aurora_purple, style = config.styles.keywords },
      -- unary and binary operators that are english words: `and`, `or` in python; `sizeof` in c.
      ["@keyword.operator"] = { fg = colors.aurora_purple },
      -- keywords like `return` and `yield`.
      ["@keyword.return"] = { fg = colors.aurora_purple },
      -- goto labels: `label:` in c, and `::label::` in lua.
      ["@label"] = { fg = colors.aurora_purple },
      -- method calls and definitions.
      ["@method"] = { fg = colors.clear_ice, style = config.styles.functions },
      -- identifiers referring to modules and namespaces.
      ["@namespace"] = { fg = colors.arctic_water },
      -- numeric literals that don't fit into other categories.
      ["@number"] = { fg = colors.aurora_orange },
      -- binary or unary operators: `+`, and also `->` and `*` in c.
      ["@operator"] = { fg = colors.aurora_purple },
      -- parameters of a function.
      ["@parameter"] = { fg = colors.ss0 },
      -- references to parameters of a function.
      ["@parameter.reference"] = { fg = colors.ss0 },
      -- same as `["@field`.
      ["@property"] = { fg = colors.ss0 },
      -- punctuation delimiters: periods, commas, semicolons, etc.
      ["@punctuation.delimiter"] = { fg = colors.deep_arctic_water },
      -- brackets, braces, parentheses, etc.
      ["@punctuation.bracket"] = { fg = colors.deep_arctic_water },
      -- special punctuation that doesn't fit into the previous categories.
      ["@punctuation.special"] = { fg = colors.deep_arctic_water },
      -- keywords related to loops: `for`, `while`, etc.
      ["@repeat"] = { fg = colors.aurora_purple, style = config.styles.keywords },
      -- string literals.
      ["@string"] = { fg = colors.aurora_green, style = config.styles.strings },
      -- regular expression literals.
      ["@string.regex"] = { fg = colors.aurora_orange },
      -- escape characters within a string: `\n`, `\t`, etc.
      ["@string.escape"] = { fg = colors.aurora_orange },
      -- identifiers referring to symbols or atoms.
      ["@symbol"] = { fg = colors.clear_ice },
      -- tags like html tag names.
      ["@tag"] = { fg = colors.arctic_water },
      -- html tag attributes.
      ["@tag.attribute"] = { fg = colors.ss3 },
      -- tag delimiters like `<` `>` `/`.
      ["@tag.delimiter"] = { fg = colors.deep_arctic_water },
      -- non-structuaurora_red text. like text in a markup language.
      ["@text"] = { fg = colors.ss3 },
      -- text to be represented in bold.
      ["@text.strong"] = { fg = colors.aurora_purple, style = "bold" },
      -- text to be represented with emphasis.
      ["@text.emphasis"] = { fg = colors.aurora_yellow, style = "italic" },
      -- text to be represented with an underline.
      ["@text.underline"] = { style = "underline" },
      -- text that is part of a title.
      ["@text.title"] = { fg = colors.arctic_water, style = "bold" },
      -- literal or verbatim text.
      ["@text.literal"] = { fg = colors.aurora_green },
      -- uris like hyperlinks or email addresses.
      ["@text.uri"] = { fg = colors.clear_ice, style = "underline" },
      -- math environments like latex's `$ ... $`
      ["@text.math"] = { fg = colors.ss3 },
      -- footnotes, text references, citations, etc.
      ["@text.reference"] = { fg = colors.aurora_purple },
      -- text environments of markup languages.
      ["@text.environment"] = { fg = colors.ss3 },
      -- text/string indicating the type of text environment. like the name of a `\begin` block in latex.
      ["@text.environment.name"] = { fg = colors.ss3 },
      -- text representation of an informational note.
      ["@note"] = { fg = colors.aurora_green, style = "bold" },
      -- text representation of a warning note.
      ["@warning"] = { fg = colors.aurora_yellow, style = "bold" },
      -- text representation of a danger note.
      ["@danger"] = { fg = colors.aurora_red, style = "bold" },
      -- type (and class) definitions and annotations.
      ["@type"] = { fg = colors.frozen_polar_water },
      -- built-in types: `i32` in rust.
      ["@type.builtin"] = { fg = colors.frozen_polar_water },
      -- variable names that don't fit into other categories.
      ["@variable"] = { fg = colors.ss0, style = config.styles.variables },
      -- variable names defined by the language: `this` or `self` in javascript.
      ["@variable.builtin"] = { fg = colors.ss0, style = config.styles.variables },
    }

    return treesitter
  end

  local function load_lsp()
    -- Lsp highlight groups

    local lsp = {
      -- used for "Error" diagnostic virtual text
      LspDiagnosticsDefaultError = { fg = colors.error },
      -- used for "Error" diagnostic signs in sign column
      LspDiagnosticsSignError = { fg = colors.error },
      -- used for "Error" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingError = { fg = colors.error },
      -- Virtual text "Error"
      LspDiagnosticsVirtualTextError = { fg = colors.error },
      -- used to underline "Error" diagnostics.
      LspDiagnosticsUnderlineError = { style = config.styles.diagnostics, sp = colors.error },
      -- used for "Warning" diagnostic signs in sign column
      LspDiagnosticsDefaultWarning = { fg = colors.warn },
      -- used for "Warning" diagnostic signs in sign column
      LspDiagnosticsSignWarning = { fg = colors.warn },
      -- used for "Warning" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingWarning = { fg = colors.warn },
      -- Virtual text "Warning"
      LspDiagnosticsVirtualTextWarning = { fg = colors.warn },
      -- used to underline "Warning" diagnostics.
      LspDiagnosticsUnderlineWarning = { style = config.styles.diagnostics, sp = colors.warn },
      -- used for "Information" diagnostic virtual text
      LspDiagnosticsDefaultInformation = { fg = colors.info },
      -- used for "Information" diagnostic signs in sign column
      LspDiagnosticsSignInformation = { fg = colors.info },
      -- used for "Information" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingInformation = { fg = colors.info },
      -- Virtual text "Information"
      LspDiagnosticsVirtualTextInformation = { fg = colors.info },
      -- used to underline "Information" diagnostics.
      LspDiagnosticsUnderlineInformation = { style = config.styles.diagnostics, sp = colors.info },
      -- used for "Hint" diagnostic virtual text
      LspDiagnosticsDefaultHint = { fg = colors.hint },
      -- used for "Hint" diagnostic signs in sign column
      LspDiagnosticsSignHint = { fg = colors.hint },
      -- used for "Hint" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingHint = { fg = colors.hint },
      -- Virtual text "Hint"
      LspDiagnosticsVirtualTextHint = { fg = colors.hint },
      -- used to underline "Hint" diagnostics.
      LspDiagnosticsUnderlineHint = { style = config.styles.diagnostics, sp = colors.hint },
      -- used for highlighting "text" references
      LspReferenceText = { style = "bold", sp = colors.yellow, fg = colors.yellow, bg = colors.selection },
      -- used for highlighting "read" references
      LspReferenceRead = { style = "bold", sp = colors.yellow, fg = colors.yellow, bg = colors.selection },
      -- used for highlighting "write" references
      LspReferenceWrite = { style = "bold", sp = colors.yellow, fg = colors.yellow, bg = colors.selection },

      LspSignatureActiveParameter = { fg = colors.none, bg = colors.highlight_dark, style = "bold" },
      LspCodeLens = { fg = colors.light_gray },

      DiagnosticError = { link = "LspDiagnosticsDefaultError" },
      DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
      DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
      DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
      DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
      DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
      DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
      DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
      DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
      DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
      DiagnosticSignError = { link = "LspDiagnosticsSignError" },
      DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
      DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
      DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
      DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
      DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
      DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
      DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
      DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
    }

    return lsp
  end

  local function load_plugins()
    -- Plugins highlight groups

    local plugins = {
      -- Cmp
      CmpItemAbbr = { fg = colors.fg },
      CmpItemAbbrDeprecated = { fg = colors.fg },
      CmpItemAbbrMatch = { fg = colors.blue, style = "bold" },
      CmpItemAbbrMatchFuzzy = { fg = colors.blue, underline = true },
      CmpItemMenu = { fg = colors.light_gray },

      CmpItemKindText = { fg = colors.orange },
      CmpItemKindMethod = { fg = colors.blue },
      CmpItemKindFunction = { fg = colors.blue },
      CmpItemKindConstructor = { fg = colors.yellow },
      CmpItemKindField = { fg = colors.blue },
      CmpItemKindClass = { fg = colors.yellow },
      CmpItemKindInterface = { fg = colors.yellow },
      CmpItemKindModule = { fg = colors.blue },
      CmpItemKindProperty = { fg = colors.blue },
      CmpItemKindValue = { fg = colors.orange },
      CmpItemKindEnum = { fg = colors.yellow },
      CmpItemKindKeyword = { fg = colors.purple },
      CmpItemKindSnippet = { fg = colors.green },
      CmpItemKindFile = { fg = colors.blue },
      CmpItemKindEnumMember = { fg = colors.cyan },
      CmpItemKindConstant = { fg = colors.orange },
      CmpItemKindStruct = { fg = colors.yellow },
      CmpItemKindTypeParameter = { fg = colors.yellow },

      -- Notify
      NotifyERRORBorder = { fg = colors.error },
      NotifyWARNBorder = { fg = colors.warn },
      NotifyINFOBorder = { fg = colors.info },
      NotifyDEBUGBorder = { fg = colors.light_gray },
      NotifyTRACEBorder = { fg = colors.hint },
      NotifyERRORIcon = { fg = colors.error },
      NotifyWARNIcon = { fg = colors.warn },
      NotifyINFOIcon = { fg = colors.info },
      NotifyDEBUGIcon = { fg = colors.light_gray },
      NotifyTRACEIcon = { fg = colors.hint },
      NotifyERRORTitle = { fg = colors.error },
      NotifyWARNTitle = { fg = colors.warn },
      NotifyINFOTitle = { fg = colors.info },
      NotifyDEBUGTitle = { fg = colors.light_gray },
      NotifyTRACETitle = { fg = colors.hint },

      -- Trouble
      TroubleCount = { fg = colors.purple },
      TroubleNormal = { fg = colors.fg },
      TroubleText = { fg = colors.fg },

      -- Diff
      diffAdded = { fg = colors.diff_add },
      diffRemoved = { fg = colors.diff_remove },
      diffChanged = { fg = colors.diff_change },
      diffOldFile = { fg = colors.yellow },
      diffNewFile = { fg = colors.orange },
      diffFile = { fg = colors.blue },
      diffLine = { fg = colors.light_gray },
      diffIndexLine = { fg = colors.purple },

      -- Neogit
      NeogitBranch = { fg = colors.purple },
      NeogitRemote = { fg = colors.orange },
      NeogitHunkHeader = { fg = colors.fg, bg = colors.highlight },
      NeogitHunkHeaderHighlight = { fg = colors.yellow, bg = colors.highlight },
      NeogitDiffContextHighlight = { bg = colors.active },
      NeogitDiffDeleteHighlight = { fg = colors.diff_remove, bg = colors.diff_remove_bg },
      NeogitDiffAddHighlight = { fg = colors.diff_add, bg = colors.diff_add_bg },

      NeogitNotificationInfo = { fg = colors.info },
      NeogitNotificationWarning = { fg = colors.warn },
      NeogitNotificationError = { fg = colors.error },

      -- GitGutter
      GitGutterAdd = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitGutterChange = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitGutterDelete = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|

      -- GitSigns
      GitSignsAdd = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitSignsAddNr = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitSignsAddLn = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitSignsChange = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitSignsChangeNr = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitSignsChangeLn = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitSignsDelete = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|
      GitSignsDeleteNr = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|
      GitSignsDeleteLn = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|

      -- Telescope
      TelescopeNormal = { fg = colors.fg, bg = colors.bg },
      TelescopePromptPrefix = { fg = colors.purple },
      TelescopePromptBorder = { fg = colors.blue },
      TelescopeResultsBorder = { fg = colors.blue },
      TelescopePreviewBorder = { fg = colors.blue },
      TelescopeSelectionCaret = { fg = colors.cyan },
      TelescopeSelection = { fg = colors.cyan },
      TelescopeMatching = { fg = colors.yellow, style = "bold" },

      -- NvimTree
      NvimTreeSymlink = { fg = colors.cyan, style = "bold" },
      NvimTreeRootFolder = { fg = colors.green, style = "bold" },
      NvimTreeFolderName = { fg = colors.blue },
      NvimTreeFolderIcon = { fg = colors.dark_blue },
      NvimTreeEmptyFolderName = { fg = colors.light_gray },
      NvimTreeOpenedFolderName = { fg = colors.yellow, style = "italic" },
      NvimTreeIndentMarker = { fg = colors.blue },
      NvimTreeGitDirty = { fg = colors.yellow },
      NvimTreeGitNew = { fg = colors.diff_add },
      NvimTreeGitStaged = { fg = colors.purple },
      NvimTreeGitDeleted = { fg = colors.diff_remove },
      NvimTreeExecFile = { fg = colors.green, style = "bold" },
      NvimTreeOpenedFile = { fg = colors.none },
      NvimTreeSpecialFile = { fg = colors.orange, style = "underline" },
      NvimTreeImageFile = { fg = colors.purple, style = "bold" },
      NvimTreeNormal = { fg = colors.fg, bg = colors.active },
      NvimTreeCursorLine = { bg = colors.float },
      NvimTreeVertSplit = { fg = colors.active, bg = colors.active },
      LspDiagnosticsError = { fg = colors.error },
      LspDiagnosticsWarning = { fg = colors.warn },
      LspDiagnosticsInformation = { fg = colors.info },
      LspDiagnosticsHint = { fg = colors.hint },

      -- WhichKey
      WhichKey = { fg = colors.purple, style = "bold" },
      WhichKeyGroup = { fg = colors.cyan },
      WhichKeyDesc = { fg = colors.blue, style = "italic" },
      WhichKeySeperator = { fg = colors.green },
      WhichKeyFloat = { bg = colors.active },

      -- LspSaga
      LspFloatWinNormal = { fg = colors.fg, bg = colors.bg },
      LspFloatWinBorder = { fg = colors.purple },
      DiagnosticError = { fg = colors.error },
      DiagnosticWarning = { fg = colors.warn },
      DiagnosticInformation = { fg = colors.info },
      DiagnosticHint = { fg = colors.hint },
      LspSagaDiagnosticBorder = { fg = colors.gray },
      LspSagaDiagnosticHeader = { fg = colors.blue },
      LspSagaDiagnosticTruncateLine = { fg = colors.highlight },
      ProviderTruncateLine = { fg = colors.highlight },
      LspSagaShTruncateLine = { fg = colors.highlight },
      LspSagaDocTruncateLine = { fg = colors.highlight },
      LineDiagTruncateLine = { fg = colors.highlight },
      LspSagaBorderTitle = { fg = colors.cyan },
      LspSagaHoverBorder = { fg = colors.blue },
      LspSagaRenameBorder = { fg = colors.green },
      LspSagaDefPreviewBorder = { fg = colors.green },
      LspSagaCodeActionTitle = { fg = colors.blue },
      LspSagaCodeActionContent = { fg = colors.purple },
      LspSagaCodeActionBorder = { fg = colors.blue },
      LspSagaCodeActionTruncateLine = { fg = colors.highlight },
      LspSagaSignatureHelpBorder = { fg = colors.light_red },
      LspSagaFinderSelection = { fg = colors.green },
      LspSagaAutoPreview = { fg = colors.red },
      ReferencesCount = { fg = colors.purple },
      DefinitionCount = { fg = colors.purple },
      DefinitionPreviewTitle = { fg = colors.green },
      DefinitionIcon = { fg = colors.blue },
      ReferencesIcon = { fg = colors.blue },
      TargetWord = { fg = colors.cyan },

      -- BufferLine
      BufferLineIndicatorSelected = { fg = colors.yellow },
      BufferLineFill = { bg = colors.bg },

      -- nvim-treesitter-context
      TreesitterContext = { fg = colors.none, bg = colors.active },

      -- barbar
      BufferCurrent = { fg = colors.fg, bg = colors.bg },
      BufferCurrentIndex = { fg = colors.fg, bg = colors.bg },
      BufferCurrentMod = { fg = colors.yellow, bg = colors.bg, style = "bold" },
      BufferCurrentSign = { fg = colors.cyan, bg = colors.bg },
      BufferCurrentTarget = { fg = colors.red, bg = colors.bg, style = "bold" },
      BufferVisible = { fg = colors.fg, bg = colors.bg },
      BufferVisibleIndex = { fg = colors.fg, bg = colors.bg },
      BufferVisibleMod = { fg = colors.yellow, bg = colors.bg, style = "bold" },
      BufferVisibleSign = { fg = colors.light_gray, bg = colors.bg },
      BufferVisibleTarget = { fg = colors.red, bg = colors.bg, style = "bold" },
      BufferInactive = { fg = colors.light_gray, bg = colors.active },
      BufferInactiveIndex = { fg = colors.light_gray, bg = colors.active },
      BufferInactiveMod = { fg = colors.yellow, bg = colors.active },
      BufferInactiveSign = { fg = colors.light_gray, bg = colors.active },
      BufferInactiveTarget = { fg = colors.red, bg = colors.active, style = "bold" },

      -- Sneak
      Sneak = { fg = colors.bg, bg = colors.fg },
      SneakScope = { bg = colors.selection },

      -- Indent Blankline
      IndentBlanklineChar = { fg = colors.selection, style = "nocombine" },
      IndentBlanklineContextChar = { fg = colors.purple, style = "nocombine" },

      -- Nvim dap
      DapBreakpoint = { fg = colors.red },
      DapStopped = { fg = colors.green },

      -- Illuminate
      illuminatedWord = { bg = colors.highlight },
      illuminatedCurWord = { bg = colors.highlight },

      -- Hop
      HopNextKey = { fg = colors.fg_light, style = "bold" },
      HopNextKey1 = { fg = colors.cyan, style = "bold" },
      HopNextKey2 = { fg = colors.purple },
      HopUnmatched = { fg = colors.light_gray },

      -- Fern
      FernBranchText = { fg = colors.blue },

      -- Lightspeed
      LightspeedLabel = { fg = colors.pink, style = "bold,underline" },
      LightspeedLabelOverlapped = { fg = colors.dark_pink, style = "underline" },
      LightspeedLabelDistant = { fg = colors.cyan, style = "bold,underline" },
      LightspeedLabelDistantOverlapped = { fg = colors.blue, style = "underline" },
      LightspeedShortcut = { fg = "#E5E9F0", bg = colors.pink, style = "bold,underline" },
      LightspeedMaskedChar = { fg = colors.light_purple },
      LightspeedGreyWash = { fg = colors.gray },
      LightspeedUnlabeledMatch = { fg = colors.fg_light, style = "bold" },
      LightspeedOneCharMatch = { fg = colors.yellow, style = "bold,reverse" },

      -- Navic
      NavicIconsFile = { bg = colors.active, fg = colors.blue },
      NavicIconsModule = { bg = colors.active, fg = colors.blue },
      NavicIconsNamespace = { bg = colors.active, fg = colors.yellow },
      NavicIconsPackage = { bg = colors.active, fg = colors.orange },
      NavicIconsClass = { bg = colors.active, fg = colors.yellow },
      NavicIconsMethod = { bg = colors.active, fg = colors.purple },
      NavicIconsProperty = { bg = colors.active, fg = colors.blue },
      NavicIconsField = { bg = colors.active, fg = colors.blue },
      NavicIconsConstructor = { bg = colors.active, fg = colors.yellow },
      NavicIconsEnum = { bg = colors.active, fg = colors.yellow },
      NavicIconsInterface = { bg = colors.active, fg = colors.yellow },
      NavicIconsFunction = { bg = colors.active, fg = colors.purple },
      NavicIconsVariable = { bg = colors.active, fg = colors.blue },
      NavicIconsConstant = { bg = colors.active, fg = colors.orange },
      NavicIconsString = { bg = colors.active, fg = colors.green },
      NavicIconsNumber = { bg = colors.active, fg = colors.orange },
      NavicIconsBoolean = { bg = colors.active, fg = colors.orange },
      NavicIconsArray = { bg = colors.active, fg = colors.yellow },
      NavicIconsObject = { bg = colors.active, fg = colors.orange },
      NavicIconsKey = { bg = colors.active, fg = colors.purple },
      NavicIconsNull = { bg = colors.active, fg = colors.red },
      NavicIconsEnumMember = { bg = colors.active, fg = colors.cyan },
      NavicIconsStruct = { bg = colors.active, fg = colors.yellow },
      NavicIconsEvent = { bg = colors.active, fg = colors.purple },
      NavicIconsOperator = { bg = colors.active, fg = colors.purple },
      NavicIconsTypeParameter = { bg = colors.active, fg = colors.yellow },
      NavicText = { bg = colors.active, fg = colors.fg },
      NavicSeparator = { bg = colors.active, fg = colors.cyan },
    }

    -- Options:

    -- Make telescope look a bit better with alternate non-current background
    if config.fade_nc then
      plugins.TelescopePromptBorder["bg"] = colors.bg
      plugins.TelescopeResultsBorder["bg"] = colors.bg
      plugins.TelescopePreviewBorder["bg"] = colors.bg
    end

    -- Disable nvim-tree background
    if config.disable.background then
      remove_background(plugins.NvimTreeNormal)
    end

    return plugins
  end

  function theme.load_terminal()
    -- dark
    vim.g.terminal_color_0 = colors.float
    vim.g.terminal_color_8 = colors.selection

    -- light
    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_15 = colors.fg_light

    -- colors
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_9 = colors.red

    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_10 = colors.green

    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_11 = colors.yellow

    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_12 = colors.blue

    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_13 = colors.purple

    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_14 = colors.cyan
  end

  return vim.tbl_deep_extend("error", load_syntax(), load_editor(), load_treesitter(), load_lsp(), load_plugins())
end

return theme
