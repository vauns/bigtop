#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# postinst script for ranger

set -e

case "$1" in
	configure)
                update-alternatives --install /etc/ranger/conf ranger-conf @etc_ranger@/conf.dist 30
		chown ranger:ranger -R /var/run/ranger /var/log/ranger @var_lib_ranger@
	;;

	abort-upgrade|abort-remove|abort-deconfigure)
	;;

	*)
		echo "postinst called with unknown argument \`$1'" >&2
		exit 1
	;;
esac

#DEBHELPER#
