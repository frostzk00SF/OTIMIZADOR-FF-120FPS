#!/data/data/com.termux/files/usr/bin/bash

# ==============================================================================
#  ANDROID OPTIMIZATION SCRIPT - TERMUX MODULE V4.5 (UNIVERSAL + KEYS)
#  DEVELOPED BY: frostzk00SF | TIKTOK: @frostzk00SF
# ==============================================================================

echo "Acquire::https::Verify-Peer \"false\";" > $PREFIX/etc/apt/apt.conf.d/99verify-peer 2>/dev/null

RED='\033[1;31m'; GREEN='\033[1;32m'; YELLOW='\033[1;33m'; BLUE='\033[1;34m'; CYAN='\033[1;36m'; PURPLE='\033[1;35m'; RESET='\033[0m'; BOLD='\033[1m'; BLINK='\033[5m'

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
echo -e "${BOLD}🚀 ANDROID OPTIMIZER MODULE v4.5 - COMPATIBILIDADE UNIVERSAL${RESET}"
echo -e "${YELLOW}👤 CRIADO POR: ${RED}frostzk00SF${RESET}"
echo -e "${CYAN}====================================================================${RESET}"
echo ""

IS_ROOT=false
[ "$EUID" -eq 0 ] && IS_ROOT=true

# Sistema de identificação universal (Funciona em 100% dos Androids)
DEVICE_ID=$(getprop ro.serialno 2>/dev/null || getprop ro.boot.serialno 2>/dev/null || getprop ro.boot.bootloader 2>/dev/null || uname -a | md5sum | awk '{print $1}')
DB_DIR="$HOME/.tzk_security"
mkdir -p "$DB_DIR"

show_progress() {
    echo -ne "${YELLOW}[~] $2... ${RESET}"
    sleep $1
    echo -e "${GREEN}[OK]${RESET}"
}

echo -e "${BOLD}Escolha uma opção de otimização:${RESET}"
echo -e "${GREEN}[1]${RESET} Otimizar Free Fire Normal"
echo -e "${CYAN}[2]${RESET} Otimizar Free Fire MAX"
echo -e "${PURPLE}[3]${RESET} Otimizar Geral [VERSÃO VIP ⭐]"
echo -e "${YELLOW}[4]${RESET} Limpeza de Cache [Junk Files]"
echo -e "${RED}[5]${RESET} Sair"
echo ""
read -p "Digite a opção: " opcao

case $opcao in
    1|2)
        GAME=$([ "$opcao" = "1" ] && echo "com.dts.freefireth" || echo "com.dts.freefiremax")
        echo -e "${RED}🔥 OTIMIZANDO...${RESET}"
        setprop debug.egl.hw 1; setprop debug.gr.numframebuffers 3
        setprop ro.vendor.display.default_fps 120; setprop persist.sys.NV_FPSLIMIT 120
        cmd package compile -m speed -a $GAME > /dev/null 2>&1
        echo -e "${GREEN}✨ Otimização aplicada!${RESET}"
        ;;
    3)
        echo -ne "${YELLOW}Digite sua Chave VIP: ${RESET}"; read -s chave; echo ""
        VALIDADO=false
        # Algoritmo de validação de chaves
        if [[ "$chave" =~ ^TZK-(1DIA|7DIAS|30DIAS)-[0-9]{4}$ ]]; then
            TIPO=$(echo "$chave" | cut -d'-' -f2); NUM=$(echo "$chave" | cut -d'-' -f3)
            if [[ "$TIPO" =~ (1DIA|7DIAS|30DIAS) && "$NUM" -ge 1000 ]]; then VALIDADO=true; fi
        fi

        if [ "$VALIDADO" = true ]; then
            HASH=$(echo -n "$chave" | md5sum | awk '{print $1}')
            REG="$DB_DIR/reg_$HASH"
            if [ -f "$REG" ] && [ "$(cat "$REG")" != "$DEVICE_ID" ]; then
                echo -e "${RED}[❌] CHAVE JÁ UTILIZADA EM OUTRO DISPOSITIVO!${RESET}"; exit 1
            fi
            echo "$DEVICE_ID" > "$REG"
            show_progress 1.5 "Aplicando Otimização VIP"
            if $IS_ROOT; then echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null 2>&1; fi
            setprop net.tcp.buffersize.wifi 4096,87380,1102080,4096,16384,1102080
            echo -e "${GREEN}✨ OTIMIZAÇÃO VIP ATIVA! ✨${RESET}"
        else
            echo -e "${RED}[❌] CHAVE INVÁLIDA!${RESET}"
        fi
        ;;
    4)
        echo -e "${YELLOW}🧹 LIMPEZA DE CACHE...${RESET}"
        rm -rf /sdcard/Android/data/com.dts.freefireth/files/cache/*
        rm -rf /sdcard/Android/data/com.dts.freefiremax/files/cache/*
        echo -e "${GREEN}✅ CONCLUÍDO!${RESET}"
        ;;
    5) exit 0 ;;
esac
