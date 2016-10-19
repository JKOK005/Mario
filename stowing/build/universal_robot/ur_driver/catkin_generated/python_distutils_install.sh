#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/universal_robot/ur_driver"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/apc16/apc_2016/mario_catkin_workspace/stowing/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/apc16/apc_2016/mario_catkin_workspace/stowing/install/lib/python2.7/dist-packages:/home/apc16/apc_2016/mario_catkin_workspace/stowing/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/apc16/apc_2016/mario_catkin_workspace/stowing/build" \
    "/usr/bin/python" \
    "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/universal_robot/ur_driver/setup.py" \
    build --build-base "/home/apc16/apc_2016/mario_catkin_workspace/stowing/build/universal_robot/ur_driver" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/apc16/apc_2016/mario_catkin_workspace/stowing/install" --install-scripts="/home/apc16/apc_2016/mario_catkin_workspace/stowing/install/bin"
