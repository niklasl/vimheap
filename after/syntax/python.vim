
if exists("python_highlight_all") && python_highlight_all != 0
    let python_highlight_booleans = 1
    let python_highlight_self = 1
    let python_highlight_specials = 1
    let python_highlight_preprocs = 1
    let python_highlight_operators = 1
    let python_highlight_delimiters = 1
    "let python_highlight_blockstart = 1
endif

if exists("python_highlight_booleans")
    syn keyword Boolean    True False
endif

if exists("python_highlight_self")
    syn keyword pythonBuiltinObj self cls
endif

if exists("python_highlight_specials")
    syn match Special "[\\]"
endif

if exists("python_highlight_preprocs")
    syn match PreProc "^\s*@[^(]\+"
    syn keyword PreProc __metaclass__ __slots__
endif

if exists("python_highlight_operators")
    syn match pythonOperator    "[+\-*/.=<>&|^%]"
endif

if exists("python_highlight_delimiters")
    "syn match pythonBuiltin "[][{}()],;"
    "syn match pythonOperator "[][{}(),;]"
    syn match pythonRepeat "[][{}(),;]"
endif

if exists("python_highlight_blockstart")
    syn match pythonStatement ":"
endif

