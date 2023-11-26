#!/bin/bash

source .env
# デバイス名を設定
DEVICE_NAME="Beats Fit Pro"
# .envファイルからデバイスのMACアドレスを取得
DEVICE_ADDRESS=$DEVICE_MAC_ADDRESS
# デバイスのMACアドレスを設定
# 現在のデフォルトのオーディオデバイスを保存
ORIGINAL_DEVICE=$(SwitchAudioSource -c)

if [ -z "$DEVICE_ADDRESS" ]; then
    echo "DEVICEが見つかりませんでした。"
    exit 1
fi

# DEVICEに接続
bluetoothconnector --connect "$DEVICE_ADDRESS"

# DEVICEをデフォルトのオーディオデバイスに設定
SwitchAudioSource -s "$DEVICE_NAME" -t output

# ユーザーにGUIメッセージを表示
osascript -e "display dialog \"${DEVICE_NAME}に接続しました。\" with title \"オーディオの変更\" buttons {\"OK\"} default button \"OK\""

