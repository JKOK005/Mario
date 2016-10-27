#!/bin/sh -x

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

cd "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_driver"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install/lib/python2.7/dist-packages:/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build" \
    "/usr/bin/python" \
    "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_driver/setup.py" \
    build --build-base "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/ur_driver" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install" --install-scripts="/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install/bin"
