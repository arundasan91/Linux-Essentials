# Installing and Configuring Jupyter Notebook

* If you are using Anaconda, Ipython and Jupyter Notebook will probably be installed. 

### For `pip` based installation (Python 3)
```
pip3 install --upgrade pip
pip3 install jupyter
```
* For Python 2.7, use `pip` instead of `pip3`.

### Configuring Jupyter Notebook

By default Jupyter notebook points to the local machine on port `8888` (localhost:8888). 
We can configure notebook to listen to any port on the public IP of the instance so that it can be accessed by its user from any web browser. 
Ex: `http:<ip address of instance>:8888/`


To do this, we need to generate Jupyter notebook config file and edit it appropriately. 
We can also add a password to the notebook for better security as we are using the public IP.

```
jupyter notebook --generate-config
```

If you get a `jupyter: command not found` error, do:
```
export PATH=$PATH:.local/bin/
```
or, add `export PATH=$PATH:.local/bin/` to your `~/.bashrc` file.

The following lines will change the jupyter notebook default configurations.


1. It changes notebook ip from localhost to all ip's in system.    
2. It defaults the notebook port to 8888.    
3. It makes sure a browser is not opened when we run jupyter notebook command.    
```
sudo sed -i "s|#c.NotebookApp.ip = 'localhost'|c.NotebookApp.ip = '*'|g" /home/$USER/.jupyter/jupyter_notebook_config.py
sudo sed -i "s|#c.NotebookApp.port = 8888|c.NotebookApp.port = 8888|g" /home/$USER/.jupyter/jupyter_notebook_config.py
sudo sed -i "s|#c.NotebookApp.open_browser = True|c.NotebookApp.open_browser = False|g" /home/$USER/.jupyter/jupyter_notebook_config.py
```


To generate a password,type in a `python` or `IPython` shell:
```
from notebook.auth import passwd; passwd()
```
Once you type your new password in the python console, you will get a similar output:
`'sha1:7a5e4f211234:8b2cd9aec7009ff5db7e045ad68453937ee50137'`.


Copy the string inside the single quotes, exit python and paste it like this in shell:
      
`export NOTE_PWD=sha1:7a5e4f211234:8b2cd9aec7009ff5db7e045ad68453937ee50137`

Now, update the password in the config file.
```
sudo sed -i "s|#c.NotebookApp.password = u''|c.NotebookApp.password = u'$NOTE_PWD'|g" /home/$USER/.jupyter/jupyter_notebook_config.py
```

Now your notebook is configured.
Please fire it up using `jupyter notebook`. You can use your browser and log in to `<IP_ADDRESS_OF_SYSTEM>:8888` to get the notebook interface and use your password to log in.
