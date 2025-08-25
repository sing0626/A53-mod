#!/usr/bin/env bash
#
# Copyright (C) 2025 Salvo Giangreco
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

# shellcheck disable=SC2001

set -Ee

source "$SRC_DIR/scripts/utils/log_utils.sh"

# [
GET_LATEST_FIRMWARE()
{
    curl -s --retry 5 --retry-delay 5 "https://fota-cloud-dn.ospserver.net/firmware/$REGION/$MODEL/version.xml" \
        | grep latest | sed 's/^[^>]*>//' | sed 's/<.*//'
}
#]

if [[ "$#" != 1 ]]; then
    LOG "Usage: update_prebuilt_blobs <path>"
    exit 1
fi

if [[ ! -d "$SRC_DIR/$1" ]]; then
    LOGE "Folder not found: \"$SRC_DIR\"/\"$1\""
fi

MODULE="$SRC_DIR/$1"
BLOBS=""
FIRMWARE=""

if [ -d "$MODULE/system" ]; then
    BLOBS+="$(find "$MODULE/system" -type f)"
    BLOBS="${BLOBS//$MODULE/system}"
fi
if [ -d "$MODULE/product" ]; then
    [[ "$BLOBS" ]] && BLOBS+=$'\n'
    BLOBS+="$(find "$MODULE/product" -type f)"
    BLOBS="${BLOBS//$MODULE\//}"
fi
if [ -d "$MODULE/vendor" ]; then
    [[ "$BLOBS" ]] && BLOBS+=$'\n'
    BLOBS+="$(find "$MODULE/vendor" -type f)"
    BLOBS="${BLOBS//$MODULE\//}"
fi
if [ -d "$MODULE/system_ext" ]; then
    [[ "$BLOBS" ]] && BLOBS+=$'\n'
    BLOBS+="$(find "$MODULE/system_ext" -type f)"
    BLOBS="${BLOBS//$MODULE\//}"
fi

case "$1" in
    "prebuilts/samsung/r12sxxx")
        FIRMWARE="SM-S721B/EUX/351273090276500"
        ;;
    "prebuilts/samsung/pa1qxx")
        FIRMWARE="SM-S938B/EUX/356597450035295"
        ;;
    "prebuilts/samsung/dm1qxx")
        FIRMWARE="SM-S9110/TGY/RFCW2198XNF"
        ;;
    "prebuilts/samsung/e1qzcx")
        FIRMWARE="SM-S9210/CHC/356724910402671"
        ;;
    *)
        LOGE "Firmware not set for path $1"
        ;;
esac

MODEL=$(echo -n "$FIRMWARE" | cut -d "/" -f 1)
REGION=$(echo -n "$FIRMWARE" | cut -d "/" -f 2)

[[ -z "$(GET_LATEST_FIRMWARE)" ]] && exit 1
if [[ "$(GET_LATEST_FIRMWARE)" == "$(cat "$MODULE/.current")" ]]; then
    LOG "- Nothing to do."
    exit 0
fi

LOG_STEP_IN "- Updating \"$MODULE\" blobs"

bash "$SRC_DIR/scripts/download_fw.sh" --ignore-target --ignore-source "$FIRMWARE"
bash "$SRC_DIR/scripts/extract_fw.sh" --ignore-target --ignore-source "$FIRMWARE"

for i in $BLOBS; do
    if [[ "$i" == *[0-9] ]]; then
        i="${i%.*}"
    fi
    OUT="$MODULE/${i//system\/system\///system/}"

    [[ -e "$FW_DIR/${MODEL}_${REGION}/$i" ]] || continue

    if [[ "$(wc -c "$FW_DIR/${MODEL}_${REGION}/$i" | cut -d " " -f 1)" -gt "52428800" ]]; then
        rm "$OUT."*
        split -d -b 52428800 "$FW_DIR/${MODEL}_${REGION}/$i" "$OUT."
    else
        cp -ra "$FW_DIR/${MODEL}_${REGION}/$i" "$OUT"
    fi
done

cp -fa "$FW_DIR/${MODEL}_${REGION}/.extracted" "$MODULE/.current"

exit 0
