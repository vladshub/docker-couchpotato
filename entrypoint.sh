#!/bin/sh
. /env/bin/activate
python /couchpotatoserver/CouchPotato.py --console_log --data_dir=/data --config_file=/config/couchpota.ini
