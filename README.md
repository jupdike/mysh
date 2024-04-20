# mysh
My shell scripts I use all the time, available on Github so I can pull them down quickly to multiple machines

# Python3 / mython3 / mip3

After you install Python3 with Homebrew on a fresh install of macOS, trying to
use pip3 results in an error like this:

```
× This environment is externally managed
╰─> To install Python packages system-wide, try brew install
    xyz, where xyz is the package you are trying to
    install.
    
    If you wish to install a Python library that isn't in Homebrew,
    use a virtual environment:

    ...
```

And on and on. So the solution is to symlink the simple scripts
`mython3` and `mip3` into ~/bin/ which should be on your path,
then run this command twice:

$ python3 -m venv ~/pyvenv

Which will make a user-specific virtual environment in ~/pyvenv

Note that for some reason you must run the command twice to get the
`activate` script to appear so the `mython3` and `mip3` scritps work.

After that always use `mython3` and `mip3` intead of `python3` and `pip3`
to have access to user-installed packages, installed with `mip3 install xyz`

Actually, in actual Python scripts, just use

#!/Users/<USERNAME>/pyvenv/bin/python3

and it will use your packages, installed with mip3 (mython3 cannot be used
in #! in Pythons scripts for whatever reason).
