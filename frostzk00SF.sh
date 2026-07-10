#!/data/data/com.termux/files/usr/bin/bash

# ==============================================================================
#  ANDROID OPTIMIZATION SCRIPT - TERMUX MODULE V4.7 (EXPIRAÇÃO AUTOMÁTICA)
#  DEVELOPED BY: frostzk00SF
# ==============================================================================

RED='\033[1;31m'; GREEN='\033[1;32m'; YELLOW='\033[1;33m'; BLUE='\033[1;34m'; CYAN='\033[1;36m'; PURPLE='\033[1;35m'; RESET='\033[0m'; BOLD='\033[1m'

DEVICE_ID=$(getprop ro.serialno 2>/dev/null || getprop ro.boot.serialno 2>/dev/null || cat /sys/class/net/wlan0/address 2>/dev/null || echo "$RANDOM$RANDOM" | md5sum | awk '{print $1}')
DB_DIR="$HOME/.tzk_security"
mkdir -p "$DB_DIR"

clear
echo -e "${RED}╔═════════════════════════════════════════════════════════════╗"
echo -e "${RED}║           🔥 OTIMIZADOR FF - frostzk00SF V4.7 🔥            ║"
echo -e "${RED}╚═════════════════════════════════════════════════════════════╝${RESET}"

echo -e "${GREEN}[1]${RESET} FF Normal | ${CYAN}[2]${RESET} FF MAX | ${PURPLE}[3]${RESET} VIP | ${RED}[4]${RESET} Sair"
read -p "Opção: " opcao

case $opcao in
    1|2)
        setprop debug.egl.hw 1 > /dev/null 2>&1
        setprop ro.vendor.display.default_fps 120 > /dev/null 2>&1
        echo -e "${GREEN}Otimização padrão aplicada!${RESET}"
        ;;
    3)
        read -s -p "Digite sua Chave VIP: " chave; echo ""
        if [[ "$chave" =~ ^TZK-(1DIA|7DIAS|30DIAS)-[0-9]{4}$ ]]; then
            KEY_HASH=$(echo -n "$chave" | md5sum | awk '{print $1}')
            REG_FILE="$DB_DIR/$KEY_HASH.reg"
            DATA_FILE="$DB_DIR/$KEY_HASH.data"

            # Determinar prazo
            PRAZO=1; [[ "$chave" =~ 7DIAS ]] && PRAZO=7; [[ "$chave" =~ 30DIAS ]] && PRAZO=30
            
            # Validação de Registro e Expiração
            if [ -f "$REG_FILE" ]; then
                # Verificar se expirou
                DATA_ATIVACAO=$(cat "$DATA_FILE")
                DATA_ATUAL=$(date +%s)
                DIFERENCA=$(( (DATA_ATUAL - DATA_ATIVACAO) / 86400 ))
                
                if [ "$DIFERENCA" -ge "$PRAZO" ]; then
                    echo -e "${RED}[❌] CHAVE EXPIRADA! Entre em contato com @frostzk00SF.${RESET}"
                    rm "$REG_FILE" "$DATA_FILE"
                    exit 1
                fi
                
                if [ "$(cat "$REG_FILE")" != "$DEVICE_ID" ]; then
                    echo -e "${RED}[❌] CHAVE VINCULADA A OUTRO APARELHO!${RESET}"
                    exit 1
                fi
            else
                echo "$DEVICE_ID" > "$REG_FILE"
                date +%s > "$DATA_FILE"
                echo -e "${GREEN}[+] Chave ativada por $PRAZO dia(s)!${RESET}"
            fi
            echo -e "${CYAN}--- OTIMIZAÇÃO VIP ATIVA ---${RESET}"
        else
            echo -e "${RED}Formato de chave inválido.${RESET}"
        fi
        ;;
esac
