if [ -f $_FIRST ] ; then
  # remove /etc/apt/sources.list
  if [ -f /etc/apt/sources.list ] ; then
    rm /etc/apt/sources.list
  fi
fi
