#!/bin/bash

my_name="t_kosuke"

read -p "JiraのチケットNoを入力してください: " jira_ticket_no

read -p "作業内容を入力してください: " task

branch_name="feature/${my_name}_${jira_ticket_no}_${task}"

git checkout -b $branch_name

echo "新しいブランチが作成されました: $branch_name"
