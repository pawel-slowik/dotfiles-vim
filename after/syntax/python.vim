" highlight Python docstrings as comments: https://stackoverflow.com/a/16051080
syn region pythonDocstring start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonSpaceError
hi def link pythonDocstring pythonComment
