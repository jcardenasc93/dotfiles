# check if python version is set in current dir
if [ -f ".tool-versions" ] ; then
    if [ ! -d ".venv" ] ; then
        echo "Installing virtualenv for $(python -V)"
        # if we didn't install `py2venv` for python 2.x, we would need to use
        # `virtualenv`, which you would have to install separately.
        python -m venv .venv
    fi
    echo "Activating $(python -V) virtualenv"
    source .venv/bin/activate
fi
# announce python version and show the path of the current python in ${PATH}
echo "Virtualenv has been activated for $(python -V)"
echo "$(which python)"

