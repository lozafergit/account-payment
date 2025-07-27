#!/bin/bash

echo "♻️ Reiniciando submódulos apuntando a tus forks en pmolladynetis..."

rm -rf ingadhoc
mkdir -p ingadhoc

declare -A repos=(
  ["odoo-argentina"]="odoo-argentina"
  ["odoo-argentina-ee"]="odoo-argentina-ee"
  ["account-financial-tools"]="account-financial-tools"
  ["aeroo_reports"]="aeroo_reports"
  ["account-payment"]="account-payment"
)

for name in "${!repos[@]}"; do
  path="ingadhoc/${repos[$name]}"
  url="https://github.com/pmolladynetis/${repos[$name]}.git"
  echo "🔗 Agregando submódulo: $path"
  git submodule add -b 18.0 "$url" "$path"
done

echo "✅ Submódulos reinicializados correctamente."

echo "📦 Instalando submódulos..."
git submodule update --init --recursive
