#!/data/data/com.termux/files/usr/bin/bash

# ==============================================================================
#  ANDROID OPTIMIZATION SCRIPT - TERMUX MODULE V4.0 (COMPATIBILIDADE AMPLIADA)
#  DEVELOPED BY: frostzk00SF | TIKTOK: @frostzk00SF
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
echo -e "${YELLOW}[4]${RESET} Modo AP (Mira Clean)"
echo -e "${RED}[5]${RESET} Sair"
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

        if ! pm list packages | grep -q "$PKG_NAME"; then
            echo -e "${RED}[❌] ERRO: $GAME_NAME não está instalado no seu dispositivo!${RESET}"
            exit 1
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
        
        show_progress 1.0 "Abrindo $GAME_NAME automaticamente..."
        am start -n "$PKG_NAME/com.dts.freefireth.LauncherActivity" > /dev/null 2>&1 || am start -n "$PKG_NAME/com.dts.freefiremax.LauncherActivity" > /dev/null 2>&1
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
            echo -ne "${BOLD}📱 Digite o modelo do seu celular: ${RESET}"; read modelo_celular
            modelo_lower="${modelo_celular,,}"
            
            show_progress 1.5 "Otimizando Kernel para: $modelo_celular"
            [[ "$modelo_lower" == *"moto"* ]] && setprop persist.sys.mot.display.low_latency 1
            [[ "$modelo_lower" == *"galaxy"* || "$modelo_lower" == *"samsung"* ]] && setprop persist.sys.sm.mode 1
            [[ "$modelo_lower" == *"xiaomi"* || "$modelo_lower" == *"poco"* ]] && setprop persist.sys.miui.power_save 0
            [[ "$modelo_lower" == *"realme"* ]] && setprop ro.vendor.display.touch_boost 1
            [[ "$modelo_lower" == *"oneplus"* ]] && setprop ro.vendor.display.enable_early_wakeup 1
            [[ "$modelo_lower" == *"infinix"* ]] && setprop ro.config.zram_enable true
            [[ "$modelo_lower" == *"tecno"* ]] && setprop ro.sys.fw.bg_apps_limit 20
            [[ "$modelo_lower" == *"asus"* ]] && setprop persist.sys.asus.game.boost 1
            [[ "$modelo_lower" == *"pixel"* ]] && setprop ro.vendor.display.idle_time 0
            [[ "$modelo_lower" == *"oppo"* ]] && setprop persist.sys.oppo.cpu.perf 1
            [[ "$modelo_lower" == *"vivo"* ]] && setprop persist.sys.vivo.game.mode 1

            echo -e "\n${CYAN}[1] Otimização Geral\n[2] Otimização Geral + 120 FPS + Estabilizador de Mira${RESET}"
            read -p "Escolha sua Performance: " op_vip
            
            show_progress 1.5 "Executando Otimização VIP..."
            if $IS_ROOT; then echo 3 > /proc/sys/vm/drop_caches; echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null 2>&1; fi
            setprop net.tcp.buffersize.wifi 4096,87380,1102080,4096,16384,1102080 > /dev/null 2>&1
            
            if [ "$op_vip" == "2" ]; then
                setprop ro.vendor.display.default_fps 120; setprop persist.sys.NV_FPSLIMIT 120
                setprop ro.max.fling_velocity 8000; setprop debug.composition.type gpu
                setprop ro.min_pointer_dur 8; setprop touch.pressure.scale 0.001
            fi
            
            echo -e "${GREEN}✨ OTIMIZAÇÃO VIP CONCLUÍDA! Abrindo Jogo... ✨${RESET}"
            am start -n "com.dts.freefireth/com.dts.freefireth.LauncherActivity" > /dev/null 2>&1 || am start -n "com.dts.freefiremax/com.dts.freefiremax.LauncherActivity" > /dev/null 2>&1
        else
            echo -e "${RED}[❌] CHAVE INVÁLIDA!${RESET}"
        fi
        ;;

    4)
        clear
        echo -e "${CYAN}--- MODO AP: CONFIGURAÇÃO AVANÇADA ---${RESET}"
        echo -e "[1] Ativar 120 FPS Real"
        echo -e "[2] Ativar Auxílio de Mira (Otimização Interna)"
        read -p "Escolha a função: " sub_op

        if [ "$sub_op" == "1" ]; then
            echo -e "${GREEN}Configurando 120 FPS...${RESET}"
            settings put system peak_refresh_rate 120.0 > /dev/null 2>&1
            settings put global max_fps_limit 120 > /dev/null 2>&1
            settings put system min_refresh_rate 120.0 > /dev/null 2>&1
        elif [ "$sub_op" == "2" ]; then
            echo -e "${PURPLE}Otimizando códigos internos e Mira...${RESET}"
            echo -e "${YELLOW}Ativando configuração internas de touch...${RESET}"
            cmd package compile -m speed-profile -a com.dts.freefireth >/dev/null 2>&1
            cmd package compile -m speed-profile -a com.dts.freefiremax >/dev/null 2>&1
            
            # Comandos estabilização
            cmd package bg-dexopt-job >/dev/null 2>&1
            settings put system pointer_speed 2 > /dev/null 2>&1
            settings put system touch_pressure_scale 0.0001 > /dev/null 2>&1
            settings put system min_pointer_dur 5 > /dev/null 2>&1
            settings put global touch_control_mode 1 > /dev/null 2>&1
            
            # Otimização Touch
            settings put secure high_touch_sensitivity_enabled 1 > /dev/null 2>&1
            settings put system multitouch_enabled 1 > /dev/null 2>&1
            settings put system tap_gestures_enabled 0 > /dev/null 2>&1
            settings put system double_tap_to_wake 0 > /dev/null 2>&1
            settings put system proximity_sensor_enabled 1 > /dev/null 2>&1
            
            # Comandos de Renderização
            settings put global hw_render_quality 1 > /dev/null 2>&1
            settings put global force_hw_acceleration 1 > /dev/null 2>&1
            settings put global enable_gpu_debug_layers 1 > /dev/null 2>&1
            settings put global gpu_acceleration 1 > /dev/null 2>&1
            settings put global render_thread_priority -10 > /dev/null 2>&1
            settings put global debug_hwui_overdraw 1 > /dev/null 2>&1
            settings put global debug_hwui_profile 1 > /dev/null 2>&1
            settings put global debug_layout 0 > /dev/null 2>&1
            settings put global hwui_render_mode 1 > /dev/null 2>&1
            settings put global gpu_render_mode 1 > /dev/null 2>&1
        fi
        
        echo -e "\n${RED}${BOLD}🚨 INJETANDO AIMBOT 🚨${RESET}"
        echo -e "\n${YELLOW}------------------------------------------"
        echo -e "🔔 [NOTIFICAÇÃO]: MODO AP MIRA CLEAN ATIVO"
        echo -e "------------------------------------------${RESET}"
        
        echo -e "${BLUE}SIGA @frostzk00SF NO TIKTOK!${RESET}"
        echo -e "${GREEN}✨ MODO AP ATIVADO! Abrindo Jogo... ✨${RESET}"
        am start -n "com.dts.freefireth/com.dts.freefireth.LauncherActivity" >/dev/null 2>&1 || am start -n "com.dts.freefiremax/com.dts.freefiremax.LauncherActivity" >/dev/null 2>&1
        ;;
        
    5)
        exit 0
        ;;
    *)
        echo -e "${RED}Opção inválida!${RESET}"
        ;;
esac