#!/bin/bash

echo "🔄 Actualizando todos los submódulos de localización argentina..."

# Asegurarse de estar en la raíz del proyecto
cd "$(dirname "$0")"

# Lista de submódulos
SUBMODULOS=(
  "ingadhoc/odoo-argentina"
  "ingadhoc/odoo-argentina-ee"
  "ingadhoc/account-financial-tools"
  "ingadhoc/aeroo_reports"
  "ingadhoc/account-payment"
)

# Actualizar cada submódulo
for submodulo in "${SUBMODULOS[@]}"; do
  echo "➡️  $submodulo"
  cd "$submodulo" || exit 1
  git checkout 18.0
  git pull origin 18.0
  cd - > /dev/null || exit 1
done

echo "✅ Submódulos actualizados correctamente."
