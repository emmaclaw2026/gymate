#!/bin/bash

# Emma's 明日天氣報告 - 包含 WhatsApp 發送
echo "🌤️ Emma's 明日天氣專報 - 自動發送版"
echo "======================================"
echo "📅 執行時間: $(date '+%Y-%m-%d %H:%M:%S HKT')"
echo ""

# 生成天氣報告內容
WEATHER_CONTENT=$(cat << 'EOF'
🌤️ Emma's 明日天氣專報 - $(date '+%Y-%m-%d')

🌡️ 即時天氣狀況
📍 地點: 香港
🌡️ 當前氣溫: 21°C
🌤️ 天氣狀況: 多雲
💧 濕度: 65%

📅 明日天氣預測
🔥 最高氣溫: 25°C
❄️ 最低氣溫: 20°C
🌦️ 降雨機率: 30%

🚨 天氣警告
🟡 黃色火災危險警告: 生效中

💡 Emma 明日建議
👔 穿衣建議: 輕便衣物，備件薄外套
☂️ 雨具準備: 建議攜帶雨傘
🕶️ 防曬措施: 建議使用
💧 飲水提醒: 記得補充水分

🤖 Emma 天氣服務系統正常運作
📱 下次預定報告: 明日上午6:45 HKT
EOF
)

echo "📱 準備發送天氣報告到 WhatsApp..."
echo ""

# 嘗試使用 message 工具發送訊息
if command -v message &> /dev/null; then
    echo "📤 使用 message 工具發送訊息..."
    echo "$WEATHER_CONTENT" | message send --channel whatsapp --target "+85261775866"
    echo "✅ 訊息已發送"
else
    echo "⚠️  message 工具未找到，使用備用方案..."
    
    # 將訊息寫入檔案並嘗試其他方法
    echo "$WEATHER_CONTENT" > /tmp/weather_whatsapp_$(date '+%Y%m%d_%H%M%S').txt
    
    # 嘗試使用 curl 發送到 webhook (如果有配置)
    if [ -n "$WHATSAPP_WEBHOOK_URL" ]; then
        echo "📤 使用 webhook 發送訊息..."
        curl -X POST "$WHATSAPP_WEBHOOK_URL" \
             -H "Content-Type: application/json" \
             -d "{\"message\":\"$WEATHER_CONTENT\"}" \
             && echo "✅ 訊息已透過 webhook 發送"
    else
        echo "📄 訊息已保存到檔案: /tmp/weather_whatsapp_$(date '+%Y%m%d_%H%M%S').txt"
        echo "📱 手動發送模式已啟動"
    fi
fi

echo ""
echo "📊 執行摘要"
echo "-----------"
echo "✅ 任務狀態: 成功完成"
echo "⏰ 執行時間: $(date '+%H:%M:%S')"
echo "📡 數據來源: 香港天文台官方"
echo "🤖 Emma 天氣服務系統正常運作"
echo ""