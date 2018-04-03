pip install --user jupyter jupyterlab
jupyter notebook --generate-config
sudo sed -i "s|#c.NotebookApp.ip = 'localhost'|c.NotebookApp.ip = '*'|g" /home/$USER/.jupyter/jupyter_notebook_config.py
sudo sed -i "s|#c.NotebookApp.port = 8888|c.NotebookApp.port = 8888|g" /home/$USER/.jupyter/jupyter_notebook_config.py
sudo sed -i "s|#c.NotebookApp.open_browser = True|c.NotebookApp.open_browser = False|g" /home/$USER/.jupyter/jupyter_notebook_config.py
