#!/bin/bash

urls=`grep -o -E -r 'href="https://support.waveapps([^"#]+)"' $1 | cut -d'"' -f2 | sort | uniq`
for url in $urls; do
    echo $url
    curl -sL -w "%{http_code} %{url_effective}\\n" "$url" -o /dev/null
done
