if !has('pythonx')
    "echoerr "Requires vim compiled with +python or +python3"
    finish
endif

pyx <<END
import os.path
activation_file = os.path.expanduser('~/.virtualenvs/vim/bin/activate_this.py')
if os.path.exists(activation_file):
    execfile(activation_file, dict(__file__=activation_file))
END
