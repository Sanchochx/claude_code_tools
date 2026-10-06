#!/bin/bash
# .claude/hooks/pre-commit.sh
# Se ejecuta en cada PreToolUse de Bash en Claude Code.
# Solo actúa cuando el comando es un git commit.

# Leer el JSON que Claude Code envía por stdin
INPUT=$(cat)

# Extraer el comando del JSON — salir si no es git commit
COMMAND=$(echo "$INPUT" | grep -o '"command":"[^"]*"' | head -1 | sed 's/"command":"//;s/"//')
if ! echo "$COMMAND" | grep -q "git commit"; then
  exit 0
fi

echo ""
echo "======================================="
echo "  Checks pre-commit"
echo "======================================="

ERRORS=0

# ─── Python / Flask ───────────────────────────────────────────
if [ -f "requirements.txt" ] || [ -f "setup.py" ] || [ -f "pyproject.toml" ]; then
  echo ""
  echo "▶ Stack detectado: Python"

  # Tests con pytest
  if command -v pytest &> /dev/null; then
    echo "  Corriendo tests..."
    pytest tests/ -q --tb=short 2>&1
    if [ $? -ne 0 ]; then
      echo "  ✗ Tests fallando"
      ERRORS=$((ERRORS + 1))
    else
      echo "  ✓ Tests OK"
    fi
  fi

  # Linting con flake8
  if command -v flake8 &> /dev/null; then
    echo "  Revisando estilo..."
    flake8 src/ --max-line-length=100 --exclude=migrations/ 2>&1
    if [ $? -ne 0 ]; then
      echo "  ✗ Errores de estilo encontrados"
      ERRORS=$((ERRORS + 1))
    else
      echo "  ✓ Estilo OK"
    fi
  fi

  # Verificar que no haya credenciales hardcodeadas
  echo "  Buscando credenciales hardcodeadas..."
  if grep -rn "password\s*=\s*['\"][^'\"]\+['\"]" src/ --include="*.py" 2>/dev/null | grep -v "test_\|_test\|conftest"; then
    echo "  ✗ Posibles credenciales hardcodeadas encontradas"
    ERRORS=$((ERRORS + 1))
  else
    echo "  ✓ Sin credenciales hardcodeadas"
  fi
fi

# ─── Node.js / Express ────────────────────────────────────────
if [ -f "package.json" ]; then
  echo ""
  echo "▶ Stack detectado: Node.js"

  # Tests con npm test
  if grep -q '"test"' package.json; then
    echo "  Corriendo tests..."
    npm test -- --passWithNoTests 2>&1
    if [ $? -ne 0 ]; then
      echo "  ✗ Tests fallando"
      ERRORS=$((ERRORS + 1))
    else
      echo "  ✓ Tests OK"
    fi
  fi

  # Linting con eslint
  if [ -f ".eslintrc*" ] || [ -f "eslint.config*" ]; then
    echo "  Revisando estilo..."
    npx eslint src/ 2>&1
    if [ $? -ne 0 ]; then
      echo "  ✗ Errores de ESLint"
      ERRORS=$((ERRORS + 1))
    else
      echo "  ✓ ESLint OK"
    fi
  fi

  # Verificar credenciales hardcodeadas en JS
  echo "  Buscando credenciales hardcodeadas..."
  if grep -rn "password\s*[=:]\s*['\"][^'\"]\+['\"]" src/ --include="*.js" 2>/dev/null | grep -v "test\|spec\|example"; then
    echo "  ✗ Posibles credenciales hardcodeadas"
    ERRORS=$((ERRORS + 1))
  else
    echo "  ✓ Sin credenciales hardcodeadas"
  fi
fi

# ─── Resultado final ──────────────────────────────────────────
echo ""
echo "======================================="
if [ $ERRORS -eq 0 ]; then
  echo "  ✓ Todo OK — procediendo con el commit"
  echo "======================================="
  echo ""
  exit 0
else
  echo "  ✗ $ERRORS problema(s) encontrado(s)"
  echo "  Corrige los errores antes de commitear."
  echo "======================================="
  echo ""
  exit 2
fi
