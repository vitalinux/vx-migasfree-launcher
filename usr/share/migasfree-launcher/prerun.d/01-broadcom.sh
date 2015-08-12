# Install broadcom 43xx without inet
if [ -f $_FIRST ] ; then
  lspci -n | awk '{print $3}' | grep "14e4:43"
  if [ $? = 0 ] ; then
    echo "----------------------------"
    echo "Instalando broadcom-43XX ..."
    dpkg -i /opt/pkgs/b43-fwcutter_*.deb
    dpkg -i /opt/pkgs/vx-broadcom-43_*.deb
  fi

  # Wait inet connection (3 minutes max.)
  let _retries=0
  until wget -O /tmp/inet_connection $_SERVER &> /dev/null
  do
    if [ $_retries -le 18 ] ; then
      sleep 10 # 18*10" = 3 min.
      let _retries=_retries+1
      echo $_retries
    else
      # No hay conexión al servidor y salimos.
      echo "--------------------------------"
      echo "No hay conexion con $_SERVER_SOURCE_LIST. Se cancela."
      exit 1
    fi
  done
  rm /tmp/inet_connection

fi
