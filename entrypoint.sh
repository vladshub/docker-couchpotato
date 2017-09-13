#!/bin/sh
. /env/bin/activate
pip install lxml
python /couchpotatoserver/CouchPotato.py --console_log --data_dir=/data --config_file=/config/couchpota.ini
