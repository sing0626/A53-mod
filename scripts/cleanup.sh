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

# [
source "$SRC_DIR/scripts/utils/log_utils.sh"

PRINT_USAGE()
{
    LOG "Usage: cleanup <type> (<type>...)" >&2
    LOG " - all ($OUT_DIR)" >&2
    LOG " - kernel ($KERNEL_TMP_DIR)" >&2
    LOG " - odin ($ODIN_DIR)" >&2
    LOG " - fw ($FW_DIR)" >&2
    LOG " - work_dir ($WORK_DIR)" >&2
    LOG " - logs ($OUT_DIR/**.log)" >&2
    LOG " - tools ($TOOLS_DIR)" >&2
}
# ]

if [ "$#" == 0 ]; then
    PRINT_USAGE
    exit 1
fi

while [ "$#" != 0 ]; do
    case "$1" in
        "all")
            LOG "- Cleaning everything..."
            rm -rf "$OUT_DIR"
            break
            ;;
        "kernel")
            LOG "- Cleaning kernel dir(s)..."
            rm -rf "$KERNEL_TMP_DIR"*
            ;;
        "odin")
            LOG "- Cleaning Odin firmwares dir..."
            rm -rf "$ODIN_DIR"
            ;;
        "fw")
            LOG "- Cleaning extracted firmwares dir..."
            rm -rf "$FW_DIR"
            ;;
        "work_dir")
            LOG "- Cleaning ROM work dir..."
            rm -rf "$(dirname "$WORK_DIR")"
            mkdir -p "$(dirname "$WORK_DIR")"
            ;;
        "logs")
            LOG "- Cleaning log files..."
            find "$OUT_DIR" -type f -name "*.log" -delete
            ;;
        "tools")
            LOG "- Cleaning dependencies dir..."
            rm -rf "$TOOLS_DIR"
            git submodule foreach --recursive "git clean -f -d -x" &> /dev/null
            ;;
        *)
            LOGE "\"$1\" is not valid."
            PRINT_USAGE
            exit 1
        ;;
    esac

    shift
done

exit 0
