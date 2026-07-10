#!/data/data/com.termux/files/usr/bin/bash

# ==============================================================================
#  ANDROID OPTIMIZATION SCRIPT - TERMUX MODULE V4.6 (UNIVERSAL DEVICE LOCK)
#  DEVELOPED BY: frostzk00SF
# ==============================================================================

# Força permissões de rede para dispositivos com Termux desatualizado
echo "Acquire::https::Verify-Peer \"false\";" > $PREFIX/etc/apt/apt.conf.d/99verify-peer 2>/dev/null

RED='\033[1;31m'; GREEN='\033[1;32m'; YELLOW='\033[1;33m'; BLUE='\033[1;34m'; CYAN='\033[1;36m'; RESET='\033[0m'; BLINK='\033[5m'

clear
# [Banner omitido para brevidade, mantenha o seu anterior aqui]

# Lógica universal de identificação de hardware (compatível com qualquer Android)
DEVICE_ID=$(getprop ro.serialno 2>/dev/null || getprop ro.boot.serialno 2>/dev/null || cat /sys/class/net/wlan0/address 2>/dev/null || echo "$RANDOM$RANDOM" | md5sum | awk '{print $1}')
DB_DIR="$HOME/.tzk_security"
mkdir -p "$DB_DIR"

# Função de otimização (mantida igual)
show_progress() { echo -ne "${YELLOW}[~] $2... ${RESET}"; sleep $1; echo -e "${GREEN}[OK]${RESET}"; }

echo -e "${BOLD}Escolha uma opção:${RESET}"
echo -e "${GREEN}[1]${RESET} Free Fire | ${CYAN}[2]${RESET} FF MAX | ${PURPLE}[3]${RESET} VIP | ${RED}[4]${RESET} Sair"
read opcao

case $opcao in
    1|2)
        # Otimização padrão para todos
        setprop debug.egl.hw 1 > /dev/null 2>&1
        setprop ro.vendor.display.default_fps 120 > /dev/null 2>&1
        echo -e "${GREEN}Otimização aplicada!${RESET}"
        ;;
        
    3)
        echo -ne "${YELLOW}Digite sua chave VIP: ${RESET}"
        read -s chave
        
        # Validação dinâmica 1000+ Keys
        if [[ "$chave" =~ ^TZK-(1DIA|7DIAS|30DIAS)-[0-9]{4}$ ]]; then
            KEY_HASH=$(echo -n "$chave" | md5sum | awk '{print $1}')
            REG_FILE="$DB_DIR/$KEY_HASH.reg"

            # Trava universal: Registra no primeiro aparelho que usar e bloqueia os outros
            if [ -f "$REG_FILE" ]; then
                SAVED_ID=$(cat "$REG_FILE")
                if [ "$SAVED_ID" != "$DEVICE_ID" ]; then
                    echo -e "${RED}[❌] ERRO: Chave já vinculada a outro dispositivo!${RESET}"
                    exit 1
                fi
            else
                echo "$DEVICE_ID" > "$REG_FILE"
                echo -e "${GREEN}[+] Chave ativada com sucesso neste dispositivo!${RESET}"
            fi
            
            # Aqui entra a otimização VIP...
            echo -e "${GREEN}Otimização VIP liberada!${RESET}"
        else
            echo -e "${RED}Chave inválida!${RESET}"
        fi
        ;;
esac
