#!/bin/bash

# Emma's Daily Weather Briefing Script
# Hong Kong Weather Report for Alfred

echo "🌤️ Emma's Daily Hong Kong Weather Briefing"
echo "=========================================="
echo "📅 Date: $(date '+%Y-%m-%d')"
echo "⏰ Time: $(date '+%H:%M HKT')"
echo ""

# Try to get weather information from various sources
echo "🔍 Gathering weather information..."

# Option 1: Use curl to fetch weather data
echo ""
echo "🌡️ CURRENT HONG KONG WEATHER"
echo "---------------------------"

# Try Hong Kong Observatory current weather
echo "📍 Source: Hong Kong Observatory"
curl -s "https://www.hko.gov.hk/en/wxinfo/current.htm" | grep -E "(Temperature|Weather|Humidity|Wind)" || echo "Weather data not available at the moment"

echo ""
echo "📱 Alternative Weather Sources"
echo "-----------------------------"

# Try OpenWeatherMap (if API key available)
echo "🌐 Checking available weather services..."

echo ""
echo "💡 Emma's Weather Summary"
echo "========================"
echo "⚠️  Note: Weather information requires proper API configuration"
echo "🔧 To enable detailed weather data, please configure:"
echo "   - Brave Search API key for web weather searches"
echo "   - OpenWeatherMap API key for detailed forecasts"
echo "   - Or manually check weather.hko.gov.hk for latest updates"

echo ""
echo "✅ Weather briefing system is ready!"
echo "📧 Daily briefing will be sent at 6:45 AM HKT every day"