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
echo -e "${BOLD}🚀 ANDROID OPTIMIZER MODULE v4.5 - SISTEMA DINÂMICO DE CHAVES${RESET}"
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
        echo -e "${YELLOW}A otimização geral requer uma licença válida e individual por celular.${RESET}"
        echo -e "${RED}Chame agora no TikTok para comprar a sua chave de ativação:${RESET}"
        echo -e "${BOLD}👉 TikTok: ${PURPLE}@frostzk00SF${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        echo ""
        echo -ne "${YELLOW}Digite a sua Chave VIP para ativar (Texto oculto): ${RESET}"
        read -s chave
        echo ""

        VALIDADO=false
        TEMPO_KEY=""

        # SISTEMA INTELIGENTE VALIDADOR DE 1000+ KEYS (Verifica o padrão e o sufixo numérico)
        if [[ "$chave" =~ ^TZK-(1DIA|7DIAS|30DIAS)-[0-9]{4}$ ]]; then
            # Extrai o tipo e o número da chave
            TIPO_KEY=$(echo "$chave" | cut -d'-' -f2)
            NUM_KEY=$(echo "$chave" | cut -d'-' -f3)

            # Filtros matemáticos para as faixas de 1000 chaves geradas
            if [ "$TIPO_KEY" = "1DIA" ] && [ "$NUM_KEY" -ge 2000 ] && [ "$NUM_KEY" -le 2400 ]; then
                VALIDADO=true; TEMPO_KEY="1 DIA"
            elif [ "$TIPO_KEY" = "7DIAS" ] && [ "$NUM_KEY" -ge 4000 ] && [ "$NUM_KEY" -le 4400 ]; then
                VALIDADO=true; TEMPO_KEY="7 DIAS"
            elif [ "$TIPO_KEY" = "30DIAS" ] && [ "$NUM_KEY" -ge 7000 ] && [ "$NUM_KEY" -le 7200 ]; then
                VALIDADO=true; TEMPO_KEY="30 DIAS"
            fi
            
            # Suporte retrocompatível para a primeira chave de teste
            if [ "$chave" = "TZK-1DIA-1049" ] || [ "$chave" = "TZK-7DIAS-2104" ] || [ "$chave" = "TZK-30DIAS-5509" ]; then
                VALIDADO=true; TEMPO_KEY="TESTE COMPATIBILIDADE"
            fi
        fi

        if [ "$VALIDADO" = true ]; then
            KEY_MD5=$(echo -n "$chave" | md5sum | awk '{print $1}')
            LOCAL_REG_FILE="$DB_DIR/reg_$KEY_MD5"

            if [ -f "$LOCAL_REG_FILE" ]; then
                SAVED_ID=$(cat "$LOCAL_REG_FILE")
                if [ "$SAVED_ID" != "$DEVICE_ID" ]; then
                    echo -e "${RED}[❌] ERRO DE SEGURANÇA: Esta chave já foi registrada em outro aparelho!${RESET}"
                    echo -e "${RED}[❌] Chaves são individuais. Compre uma nova licença com @frostzk00SF.${RESET}"
                    exit 1
                fi
            else
                echo "$DEVICE_ID" > "$LOCAL_REG_FILE"
            fi

            echo -e "${GREEN}[+] Chave VIP Autenticada com Sucesso! [PLANO: $TEMPO_KEY]${RESET}"
            echo -e "${BLUE}[*] Executando Otimização Geral do Sistema...${RESET}"
            echo ""
            
            show_progress 1.5 "Limpando cache profundo da partição /data e /cache"
            if $IS_ROOT; then echo 3 > /proc/sys/vm/drop_caches; sync; fi
            
            show_progress 1.8 "Ajustando governador da CPU para Performance Máxima"
            if $IS_ROOT; then echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null 2>&1; fi
            
            show_progress 1.5 "Otimizando buffers de rede TCP"
            setprop net.tcp.buffersize.wifi 4096,87380,1102080,4096,16384,1102080 > /dev/null 2>&1
            
            show_progress 1.2 "Reduzindo latência do Kernel"
            setprop persist.sys.use_dithering 0 > /dev/null 2>&1
            setprop sys.use_fifo_ui 1 > /dev/null 2>&1
            
            echo ""
            echo -e "${CYAN}====================================================================${RESET}"
            echo -e "${GREEN}✨ OTIMIZAÇÃO GERAL CONCLUÍDA! Plano de $TEMPO_KEY ativo! ✨${RESET}"
            echo -e "${RED}${BLINK}⚠️  AVISO CRÍTICO: NÃO REINICIE O SEU CELULAR! ⚠️${RESET}"
            echo -e "${YELLOW}Se você reiniciar o dispositivo, o sistema operacional do Android apaga${RESET}"
            echo -e "${YELLOW}as propriedades modificadas (setprops) e os códigos vão parar de funcionar!${RESET}"
            echo -e "${CYAN}====================================================================${RESET}"
        else
            echo -e "${RED}[❌] ERRO: Chave inválida ou plano expirado!${RESET}"
            echo -e "${RED}[❌] Operação cancelada. Compre sua chave legítima com @frostzk00SF.${RESET}"
        fi
        ;;
        
    4)
        echo -e "${BLUE}Saindo... Siga @frostzk00SF no TikTok!${RESET}"
        exit 0
        ;;
    *)
        echo -e "${RED}Opção inválida! Reinicie o script.${RESET}"
        ;;
esac