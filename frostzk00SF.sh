#!/data/data/com.termux/files/usr/bin/bash

# ==============================================================================
#  ANDROID OPTIMIZATION SCRIPT - TERMUX MODULE V3.5 (SISTEMA DE KEYS)
#  DEVELOPED BY: frostzk00SF
#  TIKTOK: @frostzk00SF
# ==============================================================================

# Cores (ANSI Escape Codes)
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
RESET='\033[0m'
BOLD='\033[1m'

clear

# Giant Red Name (ASCII Art para frostzk00SF)
echo -e "${RED}"
echo "███████╗██████╗  ██████╗ ███████╗████████╗███████╗██╗  ██╗ ██████╗  ██████╗  ███████╗"
echo "██╔════╝██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝╚══███╔╝██║ ██╔╝██╔═████╗██╔═████╗██╔════╝"
echo "█████╗  ██████╔╝██║   ██║███████╗   ██║      ███╔╝ █████╔╝ ██║██╔██║██║██╔██║███████╗"
echo "██╔══╝  ██╔══██╗██║   ██║╚════██║   ██║     ███╔╝  ██╔═██╗ ████╔╝██║████╔╝██║╚════██║"
echo "██║     ██║  ██║╚██████╔╝███████║   ██║    ███████╗██║  ██╗╚██████╔╝╚██████╔╝███████║"
echo "╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝    ╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝"
echo -e "${RESET}"

echo -e "${CYAN}====================================================================${RESET}"
echo -e "${BOLD}🚀 ANDROID OPTIMIZER MODULE v3.5 - SISTEMA DE KEYS ACTIVATED${RESET}"
echo -e "${YELLOW}👤 CRIADO POR: ${RED}frostzk00SF${RESET}"
echo -e "${YELLOW}📱 TIKTOK: ${PURPLE}@frostzk00SF${RESET}"
echo -e "${CYAN}====================================================================${RESET}"
echo ""

IS_ROOT=false
if [ "$EUID" -eq 0 ]; then
    IS_ROOT=true
fi

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
    1)
        clear
        echo -e "${RED}🔥 INICIANDO OTIMIZAÇÃO EXTRA PARA FREE FIRE NORMAL 🔥${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        echo ""
        show_progress 1.5 "Fechando apps secundários para liberar RAM dedicada"
        show_progress 2.0 "Forçando renderização OpenGLES (Reduzir quedas de FPS)"
        setprop debug.egl.hw 1 > /dev/null 2>&1
        setprop debug.gr.numframebuffers 3 > /dev/null 2>&1
        
        show_progress 1.8 "Ajustando sensibilidade da tela e Touch Response"
        setprop touch.deviceType touchScreen > /dev/null 2>&1
        setprop windowsmgr.max_events_per_sec 150 > /dev/null 2>&1
        
        show_progress 1.2 "Configurando engine gráfica para modo Boost (120Hz/120FPS)"
        setprop ro.vendor.display.default_fps 120 > /dev/null 2>&1
        setprop persist.sys.NV_FPSLIMIT 120 > /dev/null 2>&1
        
        show_progress 1.0 "Aplicando prioridade alta para o processo com.dts.freefireth"
        cmd package compile -m speed -a com.dts.freefireth > /dev/null 2>&1
        
        echo ""
        echo -e "${CYAN}====================================================================${RESET}"
        echo -e "${GREEN}✨ FREE FIRE NORMAL OTIMIZADO! Abra o jogo e sinta a diferença. ✨${RESET}"
        echo -e "${YELLOW}Créditos: @frostzk00SF no TikTok${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        ;;
        
    2)
        clear
        echo -e "${CYAN}🔥 INICIANDO OTIMIZAÇÃO EXTRA PARA FREE FIRE MAX 🔥${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        echo ""
        show_progress 1.5 "Limpando memória cache e otimizando texturas pesadas do MAX"
        show_progress 2.0 "Ativando aceleração por Hardware de GPU dedicada"
        setprop debug.egl.hw 1 > /dev/null 2>&1
        setprop debug.sf.hw 1 > /dev/null 2>&1
        
        show_progress 1.8 "Ajustando estabilidade de quadros por segundo (FPS Stability)"
        setprop debug.gr.numframebuffers 4 > /dev/null 2>&1
        setprop windowsmgr.max_events_per_sec 180 > /dev/null 2>&1
        
        show_progress 1.2 "Forçando taxa máxima do display para 120Hz e Ultra Performance"
        setprop ro.vendor.display.default_fps 120 > /dev/null 2>&1
        setprop persist.sys.NV_FPSLIMIT 120 > /dev/null 2>&1
        
        show_progress 1.0 "Aplicando compilação do pacote em modo Speed para com.dts.freefiremax"
        cmd package compile -m speed -a com.dts.freefiremax > /dev/null 2>&1
        
        echo ""
        echo -e "${CYAN}====================================================================${RESET}"
        echo -e "${GREEN}✨ FREE FIRE MAX OTIMIZADO COM SUCESSO! Entre no jogo agora. ✨${RESET}"
        echo -e "${YELLOW}Créditos: @frostzk00SF no TikTok${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        ;;
        
    3)
        clear
        echo -e "${RED}⚠️ RECURSO BLOQUEADO - VERSÃO VIP ⚠️${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        echo -e "${YELLOW}A otimização geral do sistema requer uma licença válida.${RESET}"
        echo -e "${BOLD}Para liberar o seu acesso permanente, compre sua Key diretamente"
        echo -e "com o criador do script.${RESET}"
        echo ""
        echo -e "${RED}Chame agora no TikTok para comprar a sua chave de ativação:${RESET}"
        echo -e "${BOLD}👉 TikTok: ${PURPLE}@frostzk00SF${RESET}"
        echo -e "${CYAN}====================================================================${RESET}"
        echo ""
        echo -ne "${YELLOW}Digite a sua Chave VIP para ativar: ${RESET}"
        read chave
        echo ""

        if [[ "$chave" =~ ^TZK-VIP-(1049|1382|1599|1744|1823|1950|2104|2391|2558|2710|2884|2913|3022|3115|3240|3391|3455|3512|3608|3741|3890|3954|4022|4159|4311|4402|4481|4510|4719|4921|5033|5122|5270|5394|5411|5509|5612|5740|5822|5913|6024|6110|6299|6341|6415|6520|6617|6704|6811|6852|6901|6973|7014|7055|7128|7199|7241|7306|7419|7452|7520|7591|7614|7669|7730|7785|7812|7894|7922|7991|8034|8129|8233|8310|8399|8442|8519|8622|8740|8815|8903|8947|9011|9154|9188|9233|9304|9451|9499|9512|9577|9630|9685|9714|9752|9811|9840|9892|9921|9974)$ ]]; then
            echo -e "${GREEN}[+] Chave VIP Autenticada com Sucesso!${RESET}"
            echo -e "${BLUE}[*] Executando Otimização Geral do Sistema...${RESET}"
            echo ""
            
            show_progress 1.5 "Limpando cache profundo da partição /data e /cache"
            if $IS_ROOT; then
                echo 3 > /proc/sys/vm/drop_caches
                sync
            fi
            
            show_progress 1.8 "Ajustando governador da CPU para modo Performance Máxima"
            if $IS_ROOT; then
                echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null 2>&1
            fi
            
            show_progress 1.5 "Otimizando buffers de rede TCP para diminuição do ping geral"
            setprop net.tcp.buffersize.wifi 4096,87380,1102080,4096,16384,1102080 > /dev/null 2>&1
            
            show_progress 1.2 "Reduzindo tempo de resposta do Kernel Android (Disabling Dithering)"
            setprop persist.sys.use_dithering 0 > /dev/null 2>&1
            setprop sys.use_fifo_ui 1 > /dev/null 2>&1
            
            echo ""
            echo -e "${CYAN}====================================================================${RESET}"
            echo -e "${GREEN}✨ OTIMIZAÇÃO GERAL CONCLUÍDA! O celular VIP está voando! ✨${RESET}"
            echo -e "${YELLOW}Obrigado por apoiar! Siga no TikTok: @frostzk00SF${RESET}"
            echo -e "${CYAN}====================================================================${RESET}"
        else
            echo -e "${RED}[❌] ERRO: Chave inválida ou pagamento não verificado!${RESET}"
            echo -e "${RED}[❌] Operação cancelada. Compre sua chave legítima com @frostzk00SF.${RESET}"
        fi
        ;;
        
    4)
        echo -e "${BLUE}Saindo... Siga @frostzk00SF no TikTok! Extrema performance te aguarda.${RESET}"
        exit 0
        ;;
        
    *)
        echo -e "${RED}Opção inválida! Reinicie o script e tente novamente.${RESET}"
        ;;
esac