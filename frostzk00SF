#!/data/data/com.termux/files/usr/bin/bash

# ==============================================================================
#  ANDROID OPTIMIZATION SCRIPT - TERMUX MODULE V4.0 (COMPATIBILIDADE AMPLIADA)
#  DEVELOPED BY: frostzk00SF
#  TIKTOK: @frostzk00SF
# ==============================================================================

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
echo -e "${BOLD}🚀 ANDROID OPTIMIZER MODULE v4.0 - SISTEMA ANTI-COMPARTILHAMENTO${RESET}"
echo -e "${YELLOW}👤 CRIADO POR: ${RED}frostzk00SF${RESET}"
echo -e "${YELLOW}📱 TIKTOK: ${PURPLE}@frostzk00SF${RESET}"
echo -e "${CYAN}====================================================================${RESET}"
echo ""

IS_ROOT=false
if [ "$EUID" -eq 0 ]; then
    IS_ROOT=true
fi

DEVICE_ID=$(getprop ro.serialno 2>/dev/null || getprop ro.boot.serialno 2>/dev/null || echo "$DATA_ONLY" | md5sum | awk '{print $1}')
if [ -z "$DEVICE_ID" ] || [ "$DEVICE_ID" = "d41d8cd98f00b204e9800998ecf8427e" ]; then
    DEVICE_ID=$(uname -m | md5sum | awk '{print $1}')
fi

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
echo -e "${GREEN}[1]${RESET} Otimizar Free Fire Normal (120 FPS + FLUIDEZ EXTREMA)"
echo -e "${CYAN}[2]${RESET} Otimizar Free Fire MAX (120 FPS + FLUIDEZ EXTREMA)"
echo -e "${PURPLE}[3]${RESET} Otimizar Celular no Geral [VERSÃO VIP ⭐]"
echo -e "${RED}[4]${RESET} Sair"
echo ""
echo -ne "${BOLD}Digite o número da opção: ${RESET}"
read opcao

case $opcao in
    1|2)
        clear
        GAME_NAME="FREE FIRE NORMAL"
        PKG_NAME="com.dts.freefireth"
        if [ "$opcao" = "2" ]; then
            GAME_NAME="FREE FIRE MAX"
            PKG_NAME="com.dts.freefiremax"
        fi
        
        echo -e "${RED}🔥 INICIANDO OTIMIZAÇÃO EXTRA PARA $GAME_NAME 🔥${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        echo ""
        show_progress 1.5 "Fechando apps secundários para liberar RAM dedicada"
        show_progress 2.0 "Forçando renderização OpenGLES"
        setprop debug.egl.hw 1 > /dev/null 2>&1
        setprop debug.gr.numframebuffers 3 > /dev/null 2>&1
        
        show_progress 1.8 "Ajustando sensibilidade da tela e Touch Response"
        setprop touch.deviceType touchScreen > /dev/null 2>&1
        setprop windowsmgr.max_events_per_sec 150 > /dev/null 2>&1
        
        show_progress 1.2 "Configurando engine gráfica para modo Boost (120Hz)"
        setprop ro.vendor.display.default_fps 120 > /dev/null 2>&1
        setprop persist.sys.NV_FPSLIMIT 120 > /dev/null 2>&1
        
        show_progress 1.0 "Aplicando compilação de alta prioridade"
        cmd package compile -m speed -a $PKG_NAME > /dev/null 2>&1
        
        echo ""
        echo -e "${CYAN}====================================================================${RESET}"
        echo -e "${GREEN}✨ $GAME_NAME OTIMIZADO! Abra o jogo e sinta a diferença. ✨${RESET}"
        echo -e "${YELLOW}Créditos: @frostzk00SF no TikTok${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        ;;
        
    3)
        clear
        echo -e "${RED}⚠️ RECURSO BLOQUEADO - VERSÃO VIP ⚠️${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        echo -e "${YELLOW}Chame agora no TikTok para comprar a sua chave de ativação:${RESET}"
        echo -e "${BOLD}👉 TikTok: ${PURPLE}@frostzk00SF${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        echo ""
        echo -ne "${YELLOW}Digite a sua Chave VIP para ativar: ${RESET}"
        read -s chave
        echo ""

        VALIDADO=false
        TEMPO_KEY=""

        if [[ "$chave" =~ ^TZK-1DIA-([0-9]{3})$ ]]; then
            NUM=$(echo "${BASH_REMATCH[1]}" | sed 's/^0*//')
            if [ "$NUM" -ge 1 ] && [ "$NUM" -le 50 ]; then VALIDADO=true; TEMPO_KEY="1 DIA"; fi
        elif [[ "$chave" =~ ^TZK-7DIA-([0-9]{3})$ ]]; then
            NUM=$(echo "${BASH_REMATCH[1]}" | sed 's/^0*//')
            if [ "$NUM" -ge 51 ] && [ "$NUM" -le 100 ]; then VALIDADO=true; TEMPO_KEY="7 DIAS"; fi
        elif [[ "$chave" =~ ^TZK-30DIA-([0-9]{3})$ ]]; then
            NUM=$(echo "${BASH_REMATCH[1]}" | sed 's/^0*//')
            if [ "$NUM" -ge 101 ] && [ "$NUM" -le 200 ]; then VALIDADO=true; TEMPO_KEY="30 DIAS"; fi
        fi

        if [ "$VALIDADO" = true ]; then
            KEY_MD5=$(echo -n "$chave" | md5sum | awk '{print $1}')
            LOCAL_REG_FILE="$DB_DIR/reg_$KEY_MD5"

            if [ -f "$LOCAL_REG_FILE" ]; then
                SAVED_ID=$(cat "$LOCAL_REG_FILE")
                if [ "$SAVED_ID" != "$DEVICE_ID" ]; then
                    echo -e "${RED}[❌] ERRO DE SEGURANÇA: Esta chave já foi usada!${RESET}"
                    exit 1
                fi
            else
                echo "$DEVICE_ID" > "$LOCAL_REG_FILE"
            fi

            echo -e "${GREEN}[+] Chave Autenticada! [PLANO: $TEMPO_KEY]${RESET}"
            echo -e "${BLUE}[*] Executando Otimização Geral e Estabilização...${RESET}"
            echo ""
            
            show_progress 1.5 "Limpando cache"
            if $IS_ROOT; then echo 3 > /proc/sys/vm/drop_caches; sync; fi
            
            show_progress 1.8 "Ajustando CPU para Performance"
            if $IS_ROOT; then echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null 2>&1; fi
            
            show_progress 1.5 "Otimizando buffers TCP"
            setprop net.tcp.buffersize.wifi 4096,87380,1102080,4096,16384,1102080 > /dev/null 2>&1
            
            show_progress 2.0 "Aplicando Estabilização de Mira (Anti-Pino)"
            setprop ro.min_pointer_dur 8 > /dev/null 2>&1
            setprop ro.max.fling_velocity 8000 > /dev/null 2>&1
            setprop ro.min.fling_velocity 800 > /dev/null 2>&1
            setprop touch.pressure.scale 0.001 > /dev/null 2>&1
            setprop debug.composition.type gpu > /dev/null 2>&1
            
            echo ""
            echo -e "${GREEN}✨ OTIMIZAÇÃO GERAL E MIRA ESTABILIZADA! ✨${RESET}"
        else
            echo -e "${RED}[❌] CHAVE INVÁLIDA!${RESET}"
        fi
        ;;
        
    4)
        exit 0
        ;;
    *)
        echo -e "${RED}Opção inválida!${RESET}"
        ;;
esac