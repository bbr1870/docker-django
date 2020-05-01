#!/usr/bin/env ash
#
# Since: April, 2020
# Author: Bernd Braemer
# Description: Script to build a Docker image for Django
#
# Copyright (c) 2020, Bernd Braemer.
#
# Licensed under the GNU Affero General Public License v3.0 AGPLv3 as shown https://www.gnu.org/licenses/agpl-3.0.html
#

DIR="/code/$PROJECT_NAME"

cd /code

# Run if $DIR is empty
if ! [ "$(ls -A $DIR 2> /dev/null)" ]; then
	# Create project on first run
	/usr/bin/django-admin startproject $PROJECT_NAME .
fi

/usr/bin/python3 manage.py migrate
#&& python3 manage.py collectstatic --noinput

exec "$@";
