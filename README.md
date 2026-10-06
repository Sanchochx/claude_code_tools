# claude-project-template

Plantilla base para proyectos con Claude Code. Incluye estructura de memoria, skills reutilizables y hooks de validación para Python/Flask y Node.js/Express.

## Uso rápido

```bash
# Clonar el template
git clone https://github.com/TU_USUARIO/claude-project-template.git mi-proyecto
cd mi-proyecto

# Desconectar del template y conectar a tu repo
rm -rf .git
git init
git remote add origin https://github.com/TU_USUARIO/mi-proyecto.git

# Hacer el hook ejecutable
chmod +x .claude/hooks/pre-commit.sh
```

Luego edita `.claude/CLAUDE.md` con el contexto de tu proyecto y ya puedes usar Claude Code.

## Qué incluye

```
claude-project-template/
└── .claude/
    ├── CLAUDE.md                      ← memoria principal (editar por proyecto)
    ├── settings.json                  ← configuración compartida (hooks)
    ├── settings.local.json            ← permisos locales, no versionar cambios aquí a la ligera
    ├── docs/
    │   ├── architecture.md            ← plantilla de arquitectura
    │   └── decisions/                 ← registro de decisiones (ADRs)
    ├── context/
    │   ├── IMPLEMENTATION_PLAN.md     ← plantilla de plan por épicas/historias de usuario
    │   └── TASK_EXECUTION.md          ← workflow de ejecución paso a paso para la IA
    ├── hooks/
    │   └── pre-commit.sh              ← tests + linting antes de commitear
    ├── commands/
    │   └── frontend.md                ← comando /frontend para construir UI
    └── skills/
        ├── audit/SKILL.md             ← reporte de estado antes de limpiar
        ├── cleanup/SKILL.md           ← limpieza de archivos y dependencias
        ├── code-review/SKILL.md       ← revisión de código
        ├── dead-code/SKILL.md         ← eliminar código muerto dentro de archivos
        ├── new-endpoint/SKILL.md      ← crear endpoints completos
        ├── write-tests/SKILL.md       ← generar tests
        └── refactor/SKILL.md          ← refactorizar código
```

## Skills disponibles

### Audit
```
Usa el skill audit en el proyecto completo
```
Genera un reporte de estado (código muerto, archivos huérfanos, etc.) sin modificar nada. Correr siempre antes de `dead-code` o `cleanup`.

### Dead code
```
Usa el skill dead-code en src/services/users.py
```
Elimina código que definitivamente no se usa dentro de archivos, basándose en el reporte de `audit`.

### Cleanup
```
Usa el skill cleanup en el proyecto completo
```
Limpia archivos y dependencias completas que ya no se usan. Complementa a `dead-code`.

### Code review
```
Usa el skill code-review en src/api/users.py
```
Revisa seguridad, calidad, tests y estructura. Devuelve APROBADO/RECHAZADO con lista de issues por severidad.

### Nuevo endpoint
```
Usa el skill new-endpoint para crear POST /api/invoices que registre una factura
```
Genera modelo → servicio → ruta → test siguiendo las convenciones del proyecto.

### Escribir tests
```
Usa el skill write-tests para src/services/invoice_service.py
```
Genera casos feliz, datos inválidos, casos límite y mocks para servicios externos.

### Refactorizar
```
Usa el skill refactor en src/api/orders.py
```
Identifica problemas (funciones largas, duplicación, N+1, magic numbers) y refactoriza sin cambiar el comportamiento.

## Comandos disponibles

### /frontend
```
/frontend crea un componente de listado de facturas con paginación
```
Construye un componente o página frontend (Angular/React/Vue) siguiendo estándares de accesibilidad, performance y tipado estricto.

## Hook pre-commit

El hook detecta automáticamente tu stack (Python o Node.js) y corre:
- Tests (pytest / npm test)
- Linting (flake8 / ESLint)
- Detección de credenciales hardcodeadas

Se activa cada vez que Claude intenta hacer un commit.

## Adaptar a tu proyecto

1. **Editar `.claude/CLAUDE.md`** — cambiar nombre, stack, comandos, convenciones específicas
2. **Editar `.claude/docs/architecture.md`** — documentar tu arquitectura real
3. **Completar `.claude/context/IMPLEMENTATION_PLAN.md`** — definir épicas e historias de usuario reales
4. **Agregar skills propios** — crear carpetas en `.claude/skills/tu-skill/SKILL.md`
5. **Ajustar el hook** — modificar `.claude/hooks/pre-commit.sh` según necesites

## Stack soportado

| Tecnología | Code review | Endpoints | Tests | Refactor |
|---|---|---|---|---|
| Python / Flask | ✓ | ✓ | pytest | ✓ |
| Node.js / Express | ✓ | ✓ | Jest | ✓ |
| PostgreSQL | ✓ | ✓ | — | ✓ |
| MySQL | ✓ | ✓ | — | ✓ |

---

Hecho por [Tu nombre] · Basado en la metodología de Claude Code Project Structure
