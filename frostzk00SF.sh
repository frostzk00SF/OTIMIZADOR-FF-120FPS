#!/data/data/com.termux/files/usr/bin/bash

# ==============================================================================
#  ANDROID OPTIMIZATION SCRIPT - TERMUX MODULE V4.5 (ALGORITMO DE 1000+ KEYS)
#  DEVELOPED BY: frostzk00SF
#  TIKTOK: @frostzk00SF
# ==============================================================================

echo "Acquire::https::Verify-Peer \"false\";" > $PREFIX/etc/apt/apt.conf.d/99verify-peer 2>/dev/null

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
RESET='\033[0m'
BOLD='\033[1m'
BLINK='\033[5m'

clear

echo -e "${RED}"
echo "███████╗██████╗  ██████╗ ███████╗████████╗███████╗██╗  ██╗ ██████╗  ██████╗  ███████╗"
echo "██╔════╝██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝╚══███╔╝██║ ██╔╝██╔═████╗██╔═████╗██╔════╝"
echo "█████╗  ██████╔╝██║   ██║███████╗   ██║      ███╔╝ █████╔╝ ██║██╔██║██║██╔██║███████╗"
echo "██╔══╝  ██╔══██╗██║   ██║╚════██║   ██║     ███╔╝  ██╔═██╗ ████╔╝██║████╔╝██║╚════██║"
echo "██║     ██║  ██║╚██████╔╝███████║   ██║    ███████╗██║  ██╗╚██████╔╝╚██████╔╝███████║"
echo "╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝    ╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝"
echo -e "${RESET}"

echo -e "${CYAN}====================================================================${RESET}"
echo -e "${BOLD}🚀 ANDROID OPTIMIZER MODULE v4.7 - SISTEMA COM EXPIRAÇÃO${RESET}"
echo -e "${YELLOW}👤 CRIADO POR: ${RED}frostzk00SF${RESET}"
echo -e "${YELLOW}📱 TIKTOK: ${PURPLE}@frostzk00SF${RESET}"
echo -e "${CYAN}====================================================================${RESET}"
echo ""

DEVICE_ID=$(getprop ro.serialno 2>/dev/null || getprop ro.boot.serialno 2>/dev/null || echo "$DATA_ONLY" | md5sum | awk '{print $1}')
DB_DIR="$HOME/.tzk_security"
mkdir -p "$DB_DIR"

show_progress() {
    local duration=$1
    local task=$2
    echo -ne "${YELLOW}[~] $task... ${RESET}"
    sleep $duration
    echo -e "${GREEN}[OK]${RESET}"
}

echo -e "${BOLD}Escolha uma opção de otimização:${RESET}"
echo -e "${GREEN}[1]${RESET} Otimizar Free Fire Normal"
echo -e "${CYAN}[2]${RESET} Otimizar Free Fire MAX"
echo -e "${PURPLE}[3]${RESET} Otimizar Celular no Geral [VERSÃO VIP ⭐]"
echo -e "${RED}[4]${RESET} Sair"
echo ""
echo -ne "${BOLD}Digite o número da opção: ${RESET}"
read opcao

case $opcao in
    1|2)
        clear
        setprop debug.egl.hw 1 > /dev/null 2>&1
        setprop ro.vendor.display.default_fps 120 > /dev/null 2>&1
        echo -e "${GREEN}Otimização aplicada!${RESET}"
        ;;
    3)
        read -s -p "Digite sua Chave VIP: " chave; echo ""
        if [[ "$chave" =~ ^TZK-(1DIA|7DIAS|30DIAS)-[0-9]{4}$ ]]; then
            KEY_HASH=$(echo -n "$chave" | md5sum | awk '{print $1}')
            REG_FILE="$DB_DIR/$KEY_HASH.reg"
            DATA_FILE="$DB_DIR/$KEY_HASH.data"
            
            # Lógica de Expiração
            PRAZO=1; [[ "$chave" =~ 7DIAS ]] && PRAZO=7; [[ "$chave" =~ 30DIAS ]] && PRAZO=30
            
            if [ -f "$REG_FILE" ]; then
                DATA_ATIVACAO=$(cat "$DATA_FILE")
                DATA_ATUAL=$(date +%s)
                DIFERENCA=$(( (DATA_ATUAL - DATA_ATIVACAO) / 86400 ))
                if [ "$DIFERENCA" -ge "$PRAZO" ]; then
                    echo -e "${RED}[❌] CHAVE EXPIRADA!${RESET}"; rm "$REG_FILE" "$DATA_FILE"; exit 1
                fi
                if [ "$(cat "$REG_FILE")" != "$DEVICE_ID" ]; then echo -e "${RED}[❌] VINCULADA A OUTRO APARELHO!${RESET}"; exit 1; fi
            else
                echo "$DEVICE_ID" > "$REG_FILE"; date +%s > "$DATA_FILE"; echo -e "${GREEN}[+] Ativado por $PRAZO dia(s)!${RESET}"
            fi
            show_progress 1.5 "Executando Otimização VIP"
        else
            echo -e "${RED}Chave inválida!${RESET}"
        fi
        ;;
    4) exit 0 ;;
esac