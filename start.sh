#!/bin/bash
JUPYTER_TOKEN="${JUPYTER_TOKEN:=huggingface}"

NOTEBOOK_DIR="/data"

# Disable Jupyter announcements
jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

# Start Jupyter Lab
jupyter-lab \
    --ip 0.0.0.0 \
    --port 7860 \
    --no-browser \
    --allow-root \
    --ServerApp.token="$JUPYTER_TOKEN" \
    --ServerApp.tornado_settings="{'headers': {'Content-Security-Policy': 'frame-ancestors *'}}" \
    --ServerApp.cookie_options="{'SameSite': 'None', 'Secure': True}" \
    --ServerApp.disable_check_xsrf=True \
    --LabApp.news_url=None \
    --LabApp.check_for_updates_class="jupyterlab.NeverCheckForUpdate" \
    --notebook-dir=$NOTEBOOK_DIR &

# Navigate to the bot directory and start the bot
cd bot
npm start
