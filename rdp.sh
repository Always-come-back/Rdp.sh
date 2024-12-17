#!/bin/bash

# Chrome Remote Desktop Kurulumu
clear
echo "======================="
echo "Chrome Remote Desktop Kurulumu"
echo "======================="

# Chrome Remote Desktop için gerekli paketleri yükleme
apt-get update && apt-get install -y wget curl unzip

# Google Chrome'u yükle
if ! command -v google-chrome &>/dev/null; then
    echo "Google Chrome indiriliyor..."
    wget -q -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    dpkg -i chrome.deb || apt-get -f install -y
    rm chrome.deb
fi

# Chrome Remote Desktop kurulumu
if ! command -v chrome-remote-desktop &>/dev/null; then
    echo "Chrome Remote Desktop indiriliyor..."
    wget -q -O crd.deb https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
    dpkg -i crd.deb || apt-get -f install -y
    rm crd.deb
fi

# Masaüstü ortamı (örnek: XFCE) kurulumu
if ! command -v startxfce4 &>/dev/null; then
    echo "XFCE masaüstü ortamı yükleniyor..."
    apt-get install -y xfce4 xfce4-terminal
fi

# CRD yapılandırması için talimatlar
clear
echo "======================="
echo "Chrome Remote Desktop Kurulumu Tamamlandı!"
echo "======================="
echo "1. Google hesabınızla giriş yaparak CRD bağlantınızı yapılandırın."
echo "2. Bu bağlantıya gidin: https://remotedesktop.google.com/headless"
echo "3. 'Setup Remote Access' seçeneğini tıklayın ve aşağıdaki kodu çalıştırın."
echo
echo "Komutu buraya yapıştırın:"
read -p "CRD komutunu yapıştırın ve Enter'a basın: " CRD_CMD
eval "$CRD_CMD"

echo "Kurulum tamamlandı! Chrome Remote Desktop üzerinden bağlanabilirsiniz."
