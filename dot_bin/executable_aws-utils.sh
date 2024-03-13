#!/usr/bin/env bash

get_all_accounts() {
    AWS_PROFILE=shutterfly-cis-platform \
        aws organizations list-accounts |
        jq -r '.Accounts | sort_by(.Name) | .[] | select(.Name | match("^.*")) | "\(.Name):|\(.Id)"' |
        column -t -s "|"
}

cmd=$1
shift
$cmd $@
