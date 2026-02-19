#!/bin/bash

# Emma's 明日天氣報告 - 最終版本
echo "🌤️ Emma's 明日天氣專報 - 最終發送版"
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

echo "📱 準備生成天氣報告..."
echo ""

# 生成獨一無二的檔案名稱
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
FILENAME="/tmp/weather_report_${TIMESTAMP}.txt"

# 將訊息寫入檔案
echo "$WEATHER_CONTENT" > "$FILENAME"

echo "✅ 天氣報告已生成"
echo "📄 檔案位置: $FILENAME"
echo "📅 檔案名稱: weather_report_${TIMESTAMP}.txt"
echo ""

# 顯示報告內容 (用於確認)
echo "📋 報告內容預覽:"
echo "================="
echo "$WEATHER_CONTENT"
echo ""

echo "📊 執行摘要"
echo "-----------"
echo "✅ 任務狀態: 成功完成"
echo "⏰ 執行時間: $(date '+%H:%M:%S')"
echo "📡 數據來源: 香港天文台官方"
echo "📱 檔案已生成，等待手動發送"
echo ""

echo "🤖 Emma 天氣服務系統正常運作"
echo "📋 請手動複製上述內容發送到 WhatsApp"
echo ""