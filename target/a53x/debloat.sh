#
# Copyright (C) 2025 Fede2782
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Debloat list for Galaxy A53 5G (a53x)
# - Add entries inside the specific partition containing that file (<PARTITION>_DEBLOAT+="")
# - DO NOT add the partition name at the start of any entry (eg. "/system/dpolicy_system")
# - DO NOT add a slash at the start of any entry (eg. "/dpolicy_system")

# system_ext clean-up
SYSTEM_EXT_DEBLOAT+="
framework/org.carconnectivity.android.digitalkey.rangingintent.jar
framework/org.carconnectivity.android.digitalkey.secureelement.jar
framework/oat/arm/org.carconnectivity.android.digitalkey.rangingintent.odex
framework/oat/arm/org.carconnectivity.android.digitalkey.rangingintent.vdex
framework/oat/arm/org.carconnectivity.android.digitalkey.secureelement.odex
framework/oat/arm/org.carconnectivity.android.digitalkey.secureelement.vdex
framework/oat/arm64/org.carconnectivity.android.digitalkey.rangingintent.odex
framework/oat/arm64/org.carconnectivity.android.digitalkey.rangingintent.vdex
framework/oat/arm64/org.carconnectivity.android.digitalkey.secureelement.odex
framework/oat/arm64/org.carconnectivity.android.digitalkey.secureelement.vdex
"

# Camera SDK
SYSTEM_DEBLOAT+="
system/etc/default-permissions/default-permissions-com.samsung.android.globalpostprocmgr.xml
system/etc/permissions/privapp-permissions-com.samsung.android.globalpostprocmgr.xml
system/etc/permissions/sec_camerax_impl.xml
system/etc/permissions/sec_camerax_service.xml
system/framework/sec_camerax_impl.jar
"
