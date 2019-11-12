 #!/bin/sh
 #
 # install station.service and enable
  #so check pre-reqs first - this is a self defined function to return a status when called, as we are going to check four installations
 # saves time!
 
echo "Installing station as a service SaaS :-)..."
 
 # first some defensive programming..
 # check utils/logs  exists
 # then check ~/utils exists
 
if [ -e ~/utils/logs ]
then
    echo "logs exists"
 
else
    if [ -e ~/utils ]
    then
      echo "utils exists"
    else
      echo "utils missing"
      mkdir ~/utils
      echo "created utils"
      mkdir ~/utils/logs
      echo "created logs"
    fi
   echo "created utils and logs"
fi

echo "Copying files from source"

sudo cp station.service /etc/systemd/system/.
echo "Setting permissions on service file"
sudo chmod 755 /etc/systemd/system/station.service
echo "Reloading service daemon"
sudo systemctl daemon-reload
echo "Enabling service"
sudo systemctl enable station
exit_status=$?
if [ $exit_status -eq 1 ]
then
     echo "Error enabling service"
     exit $exit_status
fi
echo "Starting service"
sudo systemctl start station
exit_status=$?
if [ $exit_status -eq 1 ]
then
     echo "Error starting station service"
     exit $exit_status
fi
sudo service station status
 


 
